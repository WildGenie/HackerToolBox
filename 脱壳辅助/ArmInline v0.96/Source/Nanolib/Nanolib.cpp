// Nanolib.cpp

#include "stdafx.h"
#include "Nanolib.h"

BOOL Debug = TRUE;		// Produces more verbose debug information
BOOL IsDLL = TRUE;		// Residual debug flag from when this module was an exe

const LONG TF_BIT = 0x100;			// Trap Flag

INT NumDLLsLoaded = 0;				// Number of DLLs loaded by the debugged process
BOOL FirstException = TRUE;			// The first exception needs to be handled
BOOL FirstWFDE = TRUE;				// WFDE = WaitForDebugEvent
BOOL StartedNanomites = FALSE;		// Whether the target process is ready to deal with Nanomites or not
BOOL ThreadsPatched = FALSE;		// Whether Get/SetThreadContext has been hooked
char *sbuf = (char*) malloc(256);	// Temporary char buffer
std::string FileName("");			// Name of the target file
STARTUPINFO sInfo;
PROCESS_INFORMATION pInfo;
BOOL running = TRUE;				// When running == false, the DLL returns control to ArmInline.exe
DEBUG_EVENT DBE;
BOOL NeedToContinue = FALSE;		// If a ContinueDebugEvent fails, this value will ensure that it is later 
									// called successfully before the debug script resumes
CONTEXT Context;
DWORD ContinueCode = DBG_EXCEPTION_NOT_HANDLED;
LPVOID pRemoteDBE = NULL;			// Pointer in the debugged process address space to the DEBUGEVENT structure
DEBUG_EVENT RemoteDBE;				// Local copy of the remote structure
DEBUG_EVENT TemplateDBE;			// Stored copy of the DEBUGEVENT structure pertaining to a Nanomite exception
LPVOID pRemoteContext = NULL;		// " with the CONTEXT structure
CONTEXT RemoteContext;
LPVOID ReturnAddress = NULL;		// Address to which a hooked function should return
LONG CNano = 0;						// Index of the current Nanomite being tested
CONTEXT PreContext;					// CONTEXT structure before Armadillo deals with the Nanomite (in GetThreadContext)
CONTEXT PostContext;				// CONTEXT structure after Armadillo deals with the Nanomite (in SetThreadContext)
LONG ConditionTable[64];			// Used to brute-force process each Nanomite. One entry per (relevant) combination of EFlags
SHORT CTIndex = 0;					// Which index of ConditionTable is being worked on
LONG ConsecutiveGTCs = 0;			// Number of GetThreadContexts called consecutively without a SetThreadContext
									// This is used to determine whether Armadillo thinks it sees a Nanomite or some other INT3
LONG FalseCCs = 0;					// The count of INT3s processed that turned out not to be Nanomites
LONG lTimer = 0;					// Used with GetTickCount to time certain events.
LONG LastUpdate = 0;				// As lTimer
BOOL Inconsistent = FALSE;			// Is set TRUE if a Nanomite produces a ConditionTable that contradicts the possible conditional jumps.
Nanomite *pFinalTable = NULL;		// The result table that is passed to ArmInline.exe, containing all the (actual) Nanomites' summaries.

typedef void (__stdcall *FNPTR)(UpdateReport *pUR);	
FNPTR VBCallback = NULL;			// Callback to ArmInline.exe to keep track of the progress				

LONG NumNanos = 0;					// Number of potential Nanomites
std::vector<Nanomite> Nano;			// Contains the data of all the potential Nanomites

HMODULE hKernel32 = NULL;			// Addresses of API functions needing to be hooked or patched
LONG AddIsDebuggerPresent = 0x00;
LONG AddDebugActiveProcess = 0x00;
LONG AddGetThreadContextR = 0x00;
LONG AddSetThreadContextR = 0x00;
LONG AddWaitForDebugEvent = 0x00;
LONG AddContinueDebugEvent = 0x00;

BYTE BPBDAP = 0x00;
BYTE BPBWFDE = 0x00;
BYTE BPBCDE = 0x00;

void DoUpdate() {
	if (IsDLL) {
		UpdateReport UR;
		UR.CurrentNano = CNano;
		UR.TotalINT3 = NumNanos;
		if (Inconsistent) {
			UR.Inconsistency = true;
		}
		else {
			UR.Inconsistency = false;
		}
		UR.NumDuf = FalseCCs;
		VBCallback(&UR);
	}
	return;
} // Callback to ArmInline.exe to keep track of the progress
void Report(LPCSTR Msg){
	if (!IsDLL) return;
	//std::cout << Msg;
	//OutputDebugStringA(Msg);
	return;
} // Wrapper for OutputDebugStringA
void GetAddresses(){
	hKernel32 = GetModuleHandle("Kernel32");
	AddIsDebuggerPresent = (LONG)(LONG64) GetProcAddress(hKernel32, "IsDebuggerPresent");
	AddDebugActiveProcess = (LONG)(LONG64) GetProcAddress(hKernel32, "DebugActiveProcess");
	AddWaitForDebugEvent = (LONG)(LONG64) GetProcAddress(hKernel32, "WaitForDebugEvent");
	AddContinueDebugEvent = (LONG)(LONG64) GetProcAddress(hKernel32, "ContinueDebugEvent");
	AddGetThreadContextR = (LONG)(LONG64) GetProcAddress(hKernel32, "GetThreadContext");
	AddSetThreadContextR = (LONG)(LONG64) GetProcAddress(hKernel32, "SetThreadContext");
	
	INT i = 0;
	BYTE s = 0x00;
	for (i=1; i<256; i++){
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) (AddGetThreadContextR + i), &s, 1, (SIZE_T*) sbuf);
		if (s == 0xC2) {
			AddGetThreadContextR += i;
			break;
		}
	}
	if (i > 255) {
		Report("Failed to find end of GetThreadContext.\n");
		running = false;
	}
	for (i=1; i<256; i++){
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) (AddSetThreadContextR + i), &s, 1, (SIZE_T*) sbuf);
		if (s == 0xC2) {
			AddSetThreadContextR += i;
			break;
		}
	}
	if (i > 255) {
		Report("Failed to find end of SetThreadContext.\n");
		running = false;
	}

	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddDebugActiveProcess, &BPBDAP, 1, (SIZE_T*) sbuf);
	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddWaitForDebugEvent, &BPBWFDE, 1, (SIZE_T*) sbuf);
	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddContinueDebugEvent, &BPBCDE, 1, (SIZE_T*) sbuf);
	return;
} // Fills the values of all the Address holding variables. It is assumed that these APIs will reside at the same
  // RVA in the this process and the debugged one
void PatchIsDebuggerPresent(){
	CONTEXT BackupContext;
	byte IDPBackup[14];
	byte IDPPatch[14] = {0x64, 0xA1, 0x18, 0x00, 0x00, 0x00, 0x8B, 0x40, 0x30, 0xC6, 0x40, 0x02, 0x00, 0xCC};

	Context.ContextFlags = CONTEXT_FULL;
	if (!GetThreadContext(pInfo.hThread, &Context)) {
		Report ("Failed to fix IsDebuggerPresent.");
		running = FALSE;
		return;
	}
	memcpy(&BackupContext, &Context, sizeof(CONTEXT));
	Context.Eip = AddIsDebuggerPresent;
	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddIsDebuggerPresent, IDPBackup, 14, NULL);
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddIsDebuggerPresent, IDPPatch, 14, NULL);
	SetThreadContext(pInfo.hThread, &Context);
	ContinueDebugEvent(DBE.dwProcessId, DBE.dwThreadId, DBG_CONTINUE);
	WaitForDebugEvent(&DBE, 1000);
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddIsDebuggerPresent, IDPBackup, 14, NULL);
	SetThreadContext(pInfo.hThread, &BackupContext);
	NeedToContinue = (!ContinueDebugEvent(DBE.dwProcessId, DBE.dwThreadId, DBG_CONTINUE));
	return;
} // 'Undetectable' patch - inverts the main thread data block's debug bit */

void PatchDebugActiveProcess(){
	byte P = 0xCC;
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddDebugActiveProcess, &P, 1, NULL);
	return;
} // Sets a breakpoint on DebugActiveProcess
void PatchWaitForDebugEvent(){
	byte P = 0xCC;
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddDebugActiveProcess, &P, 1, NULL);
	return;
} // Sets a breakpoint on WaitForDebugEvent
void PatchThreadContext(){
	DWORD P = 0x0008C2CC;
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddGetThreadContextR, &P, 4, NULL);
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddSetThreadContextR, &P, 4, NULL);
	BYTE CDE[6] = {0x33, 0xC0, 0x40, 0xC2, 0x0C, 0x00};
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddContinueDebugEvent, CDE, 6, NULL);
	return;
} //  Sets a breakpoint on Get/SetThreadContext, patches ContinueDebugEvent so it does nothing but returns true
void DecrementEIP(){
	Context.ContextFlags = CONTEXT_CONTROL;
	GetThreadContext(pInfo.hThread, &Context);
	Context.Eip--;
	SetThreadContext(pInfo.hThread, &Context);
	return;
} // For use when removing breakpoints
void IncrementEIP(){
	Context.ContextFlags = CONTEXT_CONTROL;
	GetThreadContext(pInfo.hThread, &Context);
	Context.Eip++;
	SetThreadContext(pInfo.hThread, &Context);
	return;
} // For use when stepping past 2 byte (MOV EDI, EDI) breakpoint

void HaltProgram(){
	BYTE Buffer[2];
	BYTE Patch[2] = {0xEB, 0xFE};
	Context.ContextFlags = CONTEXT_CONTROL;
	GetThreadContext(pInfo.hThread, &Context);
	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) Context.Eip, Buffer, 2, NULL);
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) Context.Eip, Patch, 2, NULL);
	SetThreadPriority(pInfo.hThread, THREAD_PRIORITY_LOWEST);
	ContinueDebugEvent(pInfo.dwProcessId, pInfo.dwThreadId, DBG_CONTINUE);
	DebugActiveProcessStop(pInfo.dwProcessId);
	Report ("Execution halted.\n");
	return;
}
// Crashes the target and detaches so it can be investigated by a debugger. For debugging purposes only
void SpoofDebugEvent(){
	ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) (Context.Esp + 4), &pRemoteDBE, 4, NULL);
	Context.ContextFlags = CONTEXT_CONTROL | CONTEXT_INTEGER;
	GetThreadContext(pInfo.hThread, &Context);
	if (StartedNanomites) {
		if (!ThreadsPatched) {
			PatchThreadContext();
			ThreadsPatched = TRUE;
		}
		memcpy(&RemoteDBE, &TemplateDBE, sizeof(DEBUG_EVENT));
		RemoteDBE.u.Exception.ExceptionRecord.ExceptionAddress = Nano[CNano].Address;
		WriteProcessMemory(pInfo.hProcess, pRemoteDBE, &RemoteDBE, sizeof(DEBUG_EVENT), NULL);
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) Context.Esp, &ReturnAddress, 4, NULL);
		Context.Eax = 1;
		Context.Esp += 0x0C;
		Context.Eip = (DWORD)(LONG64) ReturnAddress;
		Context.ContextFlags = CONTEXT_CONTROL | CONTEXT_INTEGER;
		SetThreadContext(pInfo.hThread, &Context);
		return;
	}
	ReadProcessMemory(pInfo.hProcess, pRemoteDBE, &RemoteDBE, sizeof(DEBUG_EVENT), NULL);
	if (RemoteDBE.dwDebugEventCode == EXCEPTION_DEBUG_EVENT) {
		if (RemoteDBE.u.Exception.ExceptionRecord.ExceptionCode == EXCEPTION_BREAKPOINT) {
			if ((LONG64) RemoteDBE.u.Exception.ExceptionRecord.ExceptionAddress < 0x70000000) {
				memcpy(&TemplateDBE, &RemoteDBE, sizeof(DEBUG_EVENT));
				DWORD dwOne = 1;
				memcpy((BYTE*)(&TemplateDBE) + 0x50, &dwOne, 4);
				StartedNanomites = TRUE;
				lTimer = GetTickCount();
			}
		}
	}
	// Continue Execution (WaitForDebugEvent):
	BYTE BPCC = 0xCC;
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddWaitForDebugEvent, &BPBWFDE, 1, (SIZE_T*) sbuf);
	Context.EFlags |= TF_BIT;
	Context.Eip--;
	SetThreadContext(pInfo.hThread, &Context);
	ContinueDebugEvent(DBE.dwProcessId, DBE.dwThreadId, DBG_CONTINUE);
	WaitForDebugEvent(&DBE, 1000);
	WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddWaitForDebugEvent, &BPCC, 1, (SIZE_T*) sbuf);
	return;
} // Turns remote DEBUGEVENT into one representing a Nanomite at a given address
BOOL CompareJumpTable(INT Type, LONG Destination) {
	BOOL Goes = FALSE;
	BYTE fOF = 0;
	BYTE fSF = 0;
	BYTE fZF = 0;
	BYTE fPF = 0;
	BYTE fCF = 0;
	BYTE fCX = 0;
	
	for (INT i = 0; i < 64; i++) {
		fCX = (i & 1);	//  CX (low order word)
		fPF = (i & 2) / 2;	//  PF (parity flag)
		fOF = (i & 4) / 4;	//  OF (overflow flag)
		fSF = (i & 8) / 8;	//  SF (sign flag)
		fZF = (i & 16) / 16;	//  ZF (zero flag)
		fCF = (i & 32) / 32;	//  CF (carry flag)
		switch (Type) {
			case JA:
				Goes = (fCF == 0 && fZF == 0);
				break;
			case JB:
				Goes = (fCF == 1);
				break;
			case JBE:
				Goes = (fCF == 1 || fZF == 1);
				break;
			case JC:
				Goes = (fCF == 1);
				break;
			case JCXZ:
				Goes = (fCX == 0);
				break;
			case JNCXZ:
				Goes = (fCX != 0);
				break;
			case JG:
				Goes = (fZF == 0 && fSF == fOF);
				break;
			case JGE:
				Goes = (fSF == fOF);
				break;
			case JL:
				Goes = (fSF != fOF);
				break;
			case JLE:
				Goes = (fZF == 1 || fSF != fOF);
				break;
			case JNB:
				Goes = (fCF == 0);
				break;
			case JNC:
				Goes = (fCF == 0);
				break;
			case JNO:
				Goes = (fOF == 0);
				break;
			case JNP:
				Goes = (fPF == 0);
				break;
			case JNS:
				Goes = (fSF == 0);
				break;
			case JNZ:
				Goes = (fZF == 0);
				break;
			case JO:
				Goes = (fOF == 1);
				break;
			case JP:
				Goes = (fPF == 1);
				break;
			case JPE:
				Goes = (fPF == 1);
				break;
			case JPO:
				Goes = (fPF == 0);
				break;
			case JS:
				Goes = (fSF == 1);
				break;
			case JZ:
				Goes = (fZF == 1);
				break;
		}
		if (Goes != (ConditionTable[i] == Destination)){
			return FALSE;
		}
	}
	return TRUE;
} // Compares the derived 'jump table' to that of the suspected Jcc
void IdentifyNano(){
	LONG Offset = 0;
	INT i = 0;
	BOOL IsJMP = TRUE;
	std::string Result("");

	// Calculate jump size:
	Nano[CNano].Size = ConditionTable[0];
	for (i = 1; i < 64; i++){
		Offset = ConditionTable[i];
		if (Offset > 0) {
			if (Offset != Nano[CNano].Size) {
				IsJMP = FALSE;
				if ((Offset < Nano[CNano].Size) || (Nano[CNano].Size < 0)) {
					Nano[CNano].Size = Offset;
					break;
				}
			}
		}
	}
	// Calculate jump destination & consistency
	for (i = 0; i < 64; i++){
		Offset = ConditionTable[i];
		if (Offset == Nano[CNano].Size) {
			// No Jump
		}
		else {
			if (Nano[CNano].Destination == 0) {
				Nano[CNano].Destination = (PVOID)((LONG64)(Nano[CNano].Address) + (LONG64)(Offset));
			}
			else {
				if (Nano[CNano].Destination != (PVOID)((LONG64)ConditionTable[i] + (LONG64)Nano[CNano].Address)) {
					Inconsistent = TRUE;
					Report("Error: Inconsistent jump address.");
				}
			}
		}
	}

	if (IsJMP) {
		if (Nano[CNano].Size < 0) Nano[CNano].Size = -Nano[CNano].Size;
		Nano[CNano].JumpType = JMP;
		Nano[CNano].Destination = (PVOID)((LONG64)(Nano[CNano].Address) + ConditionTable[0]);
		Result = ltoa(CNano, sbuf, 10);
		Result.append (" - Nanomite at ");
		Result.append(ltoa((LONG)(LONG64) Nano[CNano].Address, sbuf, 16));
		Result.append(" is unconditional; length ");
		Result.append(ltoa(Nano[CNano].Size, sbuf, 16));
		Result.append("h and destination ");
		Result.append(ltoa((LONG)(LONG64) Nano[CNano].Destination, sbuf, 16));
		Result.append(".\n");
		//Report(Result.c_str());
		return;
	}
	/*
	// Fill Alt variables
	for (i = 0; i < 64; i++){
		if (i > 0){
			if (ConditionTable[i] == ConditionTable[i-1]) Alt1 = FALSE;
		}
		if (i > 1){
			if (ConditionTable[i] == ConditionTable[i-2]) Alt2 = FALSE;
		}
		if (i > 3){
			if (ConditionTable[i] == ConditionTable[i-4]) Alt4 = FALSE;
		}
		if (i > 7){
			if (ConditionTable[i] == ConditionTable[i-8]) Alt8 = FALSE;
		}
		if (i > 15){
			if (ConditionTable[i] == ConditionTable[i-16]) Alt16 = FALSE;
		}
		if (i > 31){
			if (ConditionTable[i] == ConditionTable[i-32]) Alt32 = FALSE;
		}
	} 
	*/
	Offset = (LONG)((LONG64)Nano[CNano].Destination - (LONG64)Nano[CNano].Address);
	for (INT CompType = JNZ; CompType <= JNO; CompType++) {
		if (CompareJumpTable(CompType, Offset)) {
			Nano[CNano].JumpType = CompType;
			Result = ltoa(CNano, sbuf, 10);
			Result.append (" - Nanomite at ");
			Result.append(ltoa((LONG)(LONG64) Nano[CNano].Address, sbuf, 16));
			Result.append(" has type ");
			Result.append(itoa(Nano[CNano].JumpType, sbuf, 10));
			Result.append(", length ");
			Result.append(ltoa(Nano[CNano].Size, sbuf, 16));
			Result.append("h and destination ");
			Result.append(ltoa((LONG)(LONG64) Nano[CNano].Destination, sbuf, 16));
			Result.append(".\n");
			//Report(Result.c_str());
			return;
		}
	}
	Result = ltoa(CNano, sbuf, 10);
	Result.append(" - Unable to identify jump type at ");
	Result.append(ltoa((LONG)(LONG64) Nano[CNano].Address, sbuf, 16));
	Result.append(".\n");
	//Report(Result.c_str());
	return;
} // Analyses the jump table to determine the Jcc type (calculates the instruction being emulated by Armadillo)
void CompareContexts(){
	INT i = 0;

	ConditionTable[CTIndex] = (LONG)(LONG64) (PostContext.Eip - PreContext.Eip + 1);
	CTIndex++;
	if (CTIndex >= 64) {
		IdentifyNano();
		if (Nano[CNano].JumpType == JUnknown) Nano[CNano].JumpType = NotNanomite;
		CNano++;
		CTIndex = 0;
		if (CNano >= (LONG) NumNanos) {
			Report("Completed Nanomites\n");
			running = FALSE;
			return;
		}
	}
	return;
} // Compares the 'Pre' & 'Post' thread contexts to decide whether Armadillo believes there is a Nanomite at the address.
  // Fills out the entry in the Nano vector and increments CNano accordingly
void DoBreakpoints(){
	LONG Address = 0x00;
	LONG ReturnAddress = 0x00;
	byte P = 0x00;
	
	if (GetTickCount() - LastUpdate > 100) {
		LastUpdate = GetTickCount();
		DoUpdate();
	}

	Address = (LONG)(LONG64) DBE.u.Exception.ExceptionRecord.ExceptionAddress;

	ContinueCode = DBG_CONTINUE;
	if (Address == AddDebugActiveProcess){
		WriteProcessMemory(pInfo.hProcess, DBE.u.Exception.ExceptionRecord.ExceptionAddress, &BPBDAP, 1, NULL);
		P = 0xCC;
		WriteProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) AddWaitForDebugEvent , &P, 1, NULL);
		DecrementEIP();
	}
	else if (Address == AddWaitForDebugEvent){
		SpoofDebugEvent();
	}
	else if (Address == AddGetThreadContextR){
		ConsecutiveGTCs++;
		if (ConsecutiveGTCs > 1) {
			// Duff nanomite
			FalseCCs++;
			CNano++;
			CTIndex = 0;
			Nano[CNano].JumpType = NotNanomite;
			if (CNano >= (LONG) NumNanos) {
				Report("Completed Nanomites\n");
				running = FALSE;
				return;
			}
		}
		Context.ContextFlags = CONTEXT_CONTROL | CONTEXT_INTEGER;
		GetThreadContext(pInfo.hThread, &Context);
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) (Context.Esp + 8), &pRemoteContext, 4, NULL);
		ReadProcessMemory(pInfo.hProcess, pRemoteContext, &RemoteContext, sizeof(CONTEXT), NULL);

		RemoteContext.EFlags = 0;
		(CTIndex & CX) ? RemoteContext.Ecx = 1 : RemoteContext.Ecx = 0;
		RemoteContext.Ecx = 1 & (CTIndex & CX);				//  CX (low order word)
		RemoteContext.EFlags |= (0x00000800 & -(INT)((CTIndex & OF) != 0));	//  OF (overflow flag)
		RemoteContext.EFlags |= (0x00000080 & -(INT)((CTIndex & SF) != 0));	//  SF (sign flag)
		RemoteContext.EFlags |= (0x00000040 & -(INT)((CTIndex & ZF) != 0));	//  ZF (zero flag)
		RemoteContext.EFlags |= (0x00000004 & -(INT)((CTIndex & PF) != 0));	//  PF (parity flag)
		RemoteContext.EFlags |= (0x00000001 & -(INT)((CTIndex & CF) != 0));	//  CF (carry flag)

		RemoteContext.Eip = (DWORD)(LONG64) Nano[CNano].Address;
		RemoteContext.Eip++;
		memcpy(&PreContext, &RemoteContext, sizeof(CONTEXT));
		WriteProcessMemory(pInfo.hProcess, pRemoteContext, &RemoteContext, sizeof(CONTEXT), NULL);
		// Continue Exectution:
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) Context.Esp, &Context.Eip, 4, (SIZE_T*) sbuf);
		Context.Esp += 12;
		Context.Eax = 1;
		SetThreadContext(pInfo.hThread, &Context);
	}
	else if (Address == AddSetThreadContextR){
		ConsecutiveGTCs = 0;
		Context.ContextFlags = CONTEXT_CONTROL | CONTEXT_INTEGER;
		GetThreadContext(pInfo.hThread, &Context);
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) (Context.Esp + 8), &pRemoteContext, 4, NULL);
		ReadProcessMemory(pInfo.hProcess, pRemoteContext, &PostContext, sizeof(CONTEXT), NULL);
		CompareContexts();
		// Continue Execution:
		ReadProcessMemory(pInfo.hProcess, (LPVOID)(LONG64) Context.Esp, &Context.Eip, 4, (SIZE_T*) sbuf);
		Context.Esp += 12;
		Context.Eax = 1;
		SetThreadContext(pInfo.hThread, &Context);
	}
	return;
} // The heart of the debug loop. It finds out which breakpoint has triggered and calls the appropriate function to deal with it
void DebugLoop() {
	GetStartupInfo(&sInfo);
	if (!CreateProcess(NULL, (LPSTR) FileName.c_str(), NULL, NULL, FALSE, DEBUG_ONLY_THIS_PROCESS, NULL, NULL, &sInfo, &pInfo)) {
		Report("Failed to open process.\0");
		return;
	}
	while (running) {
		if (WaitForDebugEvent(&DBE, 1000)) {
			ContinueCode = DBG_EXCEPTION_NOT_HANDLED;
			switch (DBE.dwDebugEventCode) {
				case CREATE_PROCESS_DEBUG_EVENT:
					CloseHandle(DBE.u.CreateProcessInfo.hFile);
					//if (Debug) Report ("Create Process\n");
					break;
				case EXIT_PROCESS_DEBUG_EVENT:
					//Report ("Exit Process\n");
					running = false;
					break;
				case CREATE_THREAD_DEBUG_EVENT:
					//Report ("Create Thread\n");
					break;
				case EXIT_THREAD_DEBUG_EVENT:
					//Report ("Exit Thread\n");
					break;
				case LOAD_DLL_DEBUG_EVENT:
					//Report ("Load DLL\n");
					CloseHandle(DBE.u.LoadDll.hFile);
					NumDLLsLoaded++;
					if (NumDLLsLoaded == 3) {
						GetAddresses();
					}
					break;
				case UNLOAD_DLL_DEBUG_EVENT:
					//Report ("Unload DLL\n");
					break;
				case EXCEPTION_DEBUG_EVENT:
					//if (DBE.u.Exception.ExceptionRecord.ExceptionCode == EXCEPTION_ACCESS_VIOLATION) {Report ("Access Violation\n")}
					//if (DBE.u.Exception.ExceptionRecord.ExceptionCode == EXCEPTION_ILLEGAL_INSTRUCTION) Report ("Illegal Instruction\n");
					//if (DBE.u.Exception.ExceptionRecord.ExceptionCode == EXCEPTION_BREAKPOINT) Report ("Breakpoint\n");
					if (FirstException) {
						PatchIsDebuggerPresent();
						PatchDebugActiveProcess();
						ContinueCode = DBG_CONTINUE;
						FirstException = FALSE;
					}
					else if (DBE.u.Exception.ExceptionRecord.ExceptionCode == EXCEPTION_BREAKPOINT) {
						DoBreakpoints();
					}
					break;
				case OUTPUT_DEBUG_STRING_EVENT:
					//Report ("Debug String\n");
					break;
				case RIP_EVENT:
					Report ("Rip\n");
					break;
			}
			NeedToContinue = (!ContinueDebugEvent(DBE.dwProcessId, DBE.dwThreadId, ContinueCode));
		}
	}
	//TerminateProcess(pInfo.hProcess, 0);
	DebugActiveProcessStop(pInfo.dwProcessId);
	return;
} // Creates the target process (debugged) and deals with any DEBUGEVENTs that occur
void CleanUp(){
	TerminateProcess(pInfo.hProcess, 0);
	CloseHandle(pInfo.hProcess);
	pInfo.hProcess = NULL;
	CloseHandle(pInfo.hThread);
	pInfo.hThread = NULL;

	hKernel32 = NULL;
	return;
}
 // Closes handles and frees memory
void ResetVariables(){
	NumDLLsLoaded = 0;
	FirstException = TRUE;
	FirstWFDE = TRUE;
	StartedNanomites = FALSE;
	ThreadsPatched = FALSE;
	running = TRUE;
	NeedToContinue = FALSE;
	ContinueCode = DBG_EXCEPTION_NOT_HANDLED;
	pRemoteDBE = NULL;
	pRemoteContext = NULL;
	ReturnAddress = NULL;
	CNano = 0;
	CTIndex = 0;
	ConsecutiveGTCs = 0;
	NumNanos = 0;
	FalseCCs = 0;
	Inconsistent = FALSE;
	free(pFinalTable);
	Nano.clear();
	FileName = "";

	memset(&sInfo, 0, sizeof(STARTUPINFO));
	memset(&pInfo, 0, sizeof(PROCESS_INFORMATION));
	memset(&DBE, 0, sizeof(DEBUG_EVENT));
	memset(&Context, 0, sizeof(CONTEXT));
	memset(&RemoteDBE, 0, sizeof(DEBUG_EVENT));
	memset(&RemoteContext, 0, sizeof(CONTEXT));

	hKernel32 = NULL;
	AddIsDebuggerPresent = 0x00;
	AddDebugActiveProcess = 0x00;
	AddGetThreadContextR = 0x00;
	AddSetThreadContextR = 0x00;
	AddWaitForDebugEvent = 0x00;
	AddContinueDebugEvent = 0x00;
	return;
} // Cleans up all variables so that ArmInline can call DoNanomites more than once per instance
void GetNanosFromProcess(DWORD PID, long TStart, long TLength){
	HANDLE hP;
	Nanomite TNano;
	BYTE* pTextSection = (BYTE*) malloc(TLength);
	TNano.Address = (PVOID) 0x00;
	TNano.Destination = 0x00;
	TNano.JumpType = JUnknown;
	TNano.Size = 0x00;
	
	hP = OpenProcess(PROCESS_ALL_ACCESS, FALSE, PID);

	if (FileName.size() == 0) {
		DWORD BytesNeeded = 0;
		HMODULE aModuleArray[1024];
		EnumProcessModules(hP, aModuleArray, sizeof(aModuleArray), &BytesNeeded);
		FileName.resize(512);
		GetModuleFileNameEx(hP, aModuleArray[0], (LPSTR) FileName.c_str(), 512);
	}

	ReadProcessMemory(hP, (LPVOID)(LONG64) TStart, pTextSection, TLength, NULL);
	for (LONG i = 0; i < TLength; i++) {
		if (pTextSection[i] == 0xCC) {
			TNano.Address = (PVOID)(LONG64)(i + TStart);
			Nano.push_back(TNano);
		}
	}
	std::string NanoCount("");
	NumNanos = (LONG) Nano.size();
	NanoCount = ltoa(NumNanos, sbuf, 10);
	NanoCount.append(" Nanomites found.\n");
	Report(NanoCount.c_str());
	free(pTextSection);
	CloseHandle(hP);
	return;
} // Scans process memory for 0xCC and generates a table of the addresses of potential Nanomites
void __declspec(dllexport) CALLBACK DoNanomites(long UpdateCallback, UpdateReport *pReport, LPSTR FName, long PID, long TStart, long TLength){
	VBCallback = (FNPTR)(LONG64) UpdateCallback;
	ResetVariables();
	FileName = FName;
	GetNanosFromProcess(PID, TStart, TLength);
	if (Nano.size() == 0) {
		Report("No nanomites to process.");
	}
	else {
		DebugLoop();
		std::string Summary("");
		Summary = ltoa(NumNanos - FalseCCs, sbuf, 10);
		Summary += " successfully processed, ";
		Summary += ltoa(FalseCCs, sbuf, 10);
		Summary += " failed.\n";
		Report(Summary.c_str());
		Summary = "Took ";
		Summary += ltoa(GetTickCount() - lTimer, sbuf, 10);
		Summary += " milliseconds.";
		Report(Summary.c_str());
	}
	DoUpdate();
	CleanUp();
	return;
} // The main interface with ArmInline.exe.
void __declspec(dllexport) CALLBACK Populate(VBNano *pVBTable){
	for (int i = 0; i < CNano; i++) {
		pVBTable[i].Address = (LONG)(LONG64) Nano[i].Address;
		pVBTable[i].Destination = (LONG)(LONG64) Nano[i].Destination;
		pVBTable[i].JumpType = (LONG) Nano[i].JumpType;
		pVBTable[i].Size = (LONG) Nano[i].Size;
	}
	return;
} // Fills out the finalised table for ArmInline.exe. This only gets called after DoNanomites has returned control to the exe