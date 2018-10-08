Attribute VB_Name = "Declarations"
Option Explicit

Public Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long
Public Declare Function VirtualProtectEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function GetLastError Lib "kernel32" () As Long
Public Declare Function Disassemble Lib "Disasm.dll" Alias "DisAssemble" (DATA As Any, ByVal BaseAddress As Long, DisAsmString As Any, DisAsmS As Any, ByVal DisasmOpt As Long) As Long
Public Declare Function GetTickCount Lib "kernel32" () As Long
Public Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Public Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Public Declare Function EnumProcesses Lib "PSapi.dll" (ByRef lpidProcess As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Public Declare Function EnumProcessModules Lib "PSapi.dll" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Public Declare Function GetModuleFileNameExA Lib "PSapi.dll" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Public Declare Function VirtualQueryEx Lib "kernel32.dll" (ByVal hProcess As Long, lpAddress As Any, lpBuffer As Any, ByVal dwLength As Long) As Long

Public Declare Sub ExternNanomites Lib "Nanolib.dll" Alias "DoNanomites" (ByVal CallbackAddress As Long, ReportStruct As UPDATE_REPORT, ByVal FName As String, ByVal PrID As Long, ByVal TStart As Long, ByVal TLength As Long)
Public Declare Sub ExternPopulate Lib "Nanolib.dll" Alias "Populate" (NanoTableFirstEntry As Nanomite)

Public Const PROCESS_ALL_ACCESS         As Long = &H1F0FFF
Public Const DEBUG_ONLY_THIS_PROCESS    As Long = 2
Public Const fInherit                   As Boolean = False
Public Const PAGE_EXECUTE_READWRITE     As Long = &H40&
Public Const PROCESS_QUERY_INFORMATION  As Long = 1024
Public Const PROCESS_VM_READ            As Long = 16

Public Const CONTEXT_i386 = &H10000
Public Const CONTEXT_i486 = &H10000

Public Const CONTEXT_CONTROL = (CONTEXT_i386 Or 1)              ' SS:ESP, CS:EIP, EFLAGS, EBP
Public Const CONTEXT_INTEGER = (CONTEXT_i386 Or 2)              ' EAX, EBX,..., ESI, EDI
Public Const CONTEXT_SEGMENTS = (CONTEXT_i386 Or 4)             ' DS, ES, FS, GS
Public Const CONTEXT_FLOATING_POINT = (CONTEXT_i386 Or 8)       ' 387 state
Public Const CONTEXT_DEBUG_REGISTERS = (CONTEXT_i386 Or 16)     ' DB 0-3,6,7
Public Const CONTEXT_EXTENDED_REGISTERS = (CONTEXT_i386 Or 32)  ' cpu specific extensions

'Public Const CONTEXT_FULL = (CONTEXT_CONTROL Or CONTEXT_INTEGER Or CONTEXT_SEGMENTS)

Public Enum DebugEventTypes
   EXCEPTION_DEBUG_EVENT = 1&
   CREATE_THREAD_DEBUG_EVENT = 2&
   CREATE_PROCESS_DEBUG_EVENT = 3&
   EXIT_THREAD_DEBUG_EVENT = 4&
   EXIT_PROCESS_DEBUG_EVENT = 5&
   LOAD_DLL_DEBUG_EVENT = 6&
   UNLOAD_DLL_DEBUG_EVENT = 7&
   OUTPUT_DEBUG_STRING_EVENT = 8&
   RIP_EVENT = 9&
End Enum

Public Enum ExceptionCodes
   EXCEPTION_GUARD_PAGE_VIOLATION = &H80000001
   EXCEPTION_DATATYPE_MISALIGNMENT = &H80000002
   EXCEPTION_BREAKPOINT = &H80000003
   EXCEPTION_SINGLE_STEP = &H80000004
   EXCEPTION_ACCESS_VIOLATION = &HC0000005
   EXCEPTION_IN_PAGE_ERROR = &HC0000006
   EXCEPTION_INVALID_HANDLE = &HC0000008
   EXCEPTION_NO_MEMORY = &HC0000017
   EXCEPTION_ILLEGAL_INSTRUCTION = &HC000001D
   EXCEPTION_NONCONTINUABLE_EXCEPTION = &HC0000025
   EXCEPTION_INVALID_DISPOSITION = &HC0000026
   EXCEPTION_ARRAY_BOUNDS_EXCEEDED = &HC000008C
   EXCEPTION_FLOAT_DENORMAL_OPERAND = &HC000008D
   EXCEPTION_FLOAT_DIVIDE_BY_ZERO = &HC000008E
   EXCEPTION_FLOAT_INEXACT_RESULT = &HC000008F
   EXCEPTION_FLOAT_INVALID_OPERATION = &HC0000090
   EXCEPTION_FLOAT_OVERFLOW = &HC0000091
   EXCEPTION_FLOAT_STACK_CHECK = &HC0000092
   EXCEPTION_FLOAT_UNDERFLOW = &HC0000093
   EXCEPTION_INTEGER_DIVIDE_BY_ZERO = &HC0000094
   EXCEPTION_INTEGER_OVERFLOW = &HC0000095
   EXCEPTION_PRIVILEGED_INSTRUCTION = &HC0000096
   EXCEPTION_STACK_OVERFLOW = &HC00000FD
   EXCEPTION_CONTROL_C_EXIT = &HC000013A
End Enum

Public Enum DebugStates
    DBG_CONTINUE = &H10002
    DBG_TERMINATE_THREAD = &H40010003
    DBG_TERMINATE_PROCESS = &H40010004
    DBG_CONTROL_C = &H40010005
    DBG_CONTROL_BREAK = &H40010008
    DBG_EXCEPTION_NOT_HANDLED = &H80010001
End Enum

Public Type MEMORY_BASIC_INFORMATION
    BaseAddress As Long
    AllocationBase As Long
    AllocationProtect As Long
    RegionSize As Long
    State As Long
    Protect As Long
    lType As Long
End Type

Public Type SectionHeader
    Name        As String * 8
    VSize       As Long
    VAddress    As Long
    SizeOfRaw   As Long
    PointerRaw  As Long
    PointReloc  As Long
    PointLineNo As Long
    NumReloc    As Integer
    NumLine     As Integer
    Character   As Long
End Type

Public Type UPDATE_REPORT
    CurrentNano     As Long
    NumDuf          As Long
    NumNanos        As Long
    Inconsistency   As Boolean
End Type

Public Type Nanomite
    Address         As Long
    Destination     As Long
    Size            As Long
    JumpType        As Long
End Type

'Public Type DEBUG_EVENT_BUFFER
'   dwDebugEventCode As DebugEventTypes
'   dwProcessId As Long
'   dwThreadId As Long
'End Type

'Public Type DEBUG_EXCEPTION_DEBUG_INFO
'   Header            As DEBUG_EVENT_BUFFER
'   ExceptionCode     As ExceptionCodes
'   ExceptionFlags    As Long
'   pExceptionRecord  As Long
'   ExceptionAddress  As Long
'   NumberParameters  As Long
'   ExceptionInformation(12)    As Long
'   dwFirstChance     As Long
'End Type

'Public Type DEBUG_CREATE_THREAD_DEBUG_INFO
'   Header As DEBUG_EVENT_BUFFER
'   hThread As Long
'   lpThreadLocalBase As Long
'   lpStartAddress As Long
'End Type

'Public Type DEBUG_EXIT_THREAD_DEBUG_INFO
'   Header As DEBUG_EVENT_BUFFER
'   dwExitCode As Long
'End Type

'Public Type PROCESS_INFORMATION
'    hProcess As Long
'    hThread As Long
'    dwProcessId As Long
'    dwThreadId As Long
'End Type

Public Type STARTUPINFO
    cb As Long
    lpReserved As String
    lpDesktop As String
    lpTitle As String
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Public Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Public Type REGTYPE
    REG_Kind      As Byte  ' ;1=8 bits \ 2=16 bits \ 3=32 bits \ 4=MMX \ 5=XMM \ 6=Float stack \ 7=Segment \ 8=Debug \ 9=Control \ 10=Test
    REG_Ptr_Kind  As Byte  ' ;1=Byte PTR \ 2=Word PTR \ 3=Dword PTR \ 4=Qword PTR \ 5=mmword ptr \ 6=xmmword ptr \ 7=FWord PTR \ 8=tbyte ptr \ 9=null ptr (LEA)
    REG_Type      As Byte  ' ;0-7= direct register index \ 16 register=byte && 7 \ 32 register=(byte && 63)/8 \ 64=[32/16 address only] \ 128=[using x86 relatives]
    REG_BaseAsReg As Byte  ' ;1=Register only (BASE exposed)!
End Type

Public Type REGSTRUCT
    SEG_TYPE            As Long
    Base                As Long
    Index               As Long
    SCALE               As Long
    DISPLACEMENTS       As Long
    DISPLACEMENT_TYPE   As Long
    REG_Kind            As REGTYPE
    PTR_TYPE            As Long
End Type

Public Type IMMSTRUCT
    VALUE_LO            As Long
    VALUE_HI            As Long
    VALUE_TYPE          As Long     ' 1=Byte \ 2=Word \ 4=Dword \ 8=ByteToWord \ 16=ByteToDword \ 32=AbsJump \ 64=ShortJump \ 128=LongJump
End Type

Public Type DisAsmStruct
    Instruction_Prefix  As Long
    Instruction         As Long
    Reg1                As REGSTRUCT
    Reg2                As REGSTRUCT
    Reg_Reg             As Long     ' 1=from ptr
    Imm                 As IMMSTRUCT
    Instruction_Length  As Long
End Type

Public Type Instruction
    Opcode              As String
    Length              As Long
    Bytes(32)           As Byte
    Active              As Boolean
End Type

Public Type DLLCall
    Address         As Long
    Destination     As Long
End Type

Public Type CONTEXT
    FltF0 As Double
    FltF1 As Double
    FltF2 As Double
    FltF3 As Double
    FltF4 As Double
    FltF5 As Double
    FltF6 As Double
    FltF7 As Double
    FltF8 As Double
    FltF9 As Double
    FltF10 As Double
    FltF11 As Double
    FltF12 As Double
    FltF13 As Double
    FltF14 As Double
    FltF15 As Double
    FltF16 As Double
    FltF17 As Double
    FltF18 As Double
    FltF19 As Double
    FltF20 As Double
    FltF21 As Double
    FltF22 As Double
    FltF23 As Double
    FltF24 As Double
    FltF25 As Double
    FltF26 As Double
    FltF27 As Double
    FltF28 As Double
    FltF29 As Double
    FltF30 As Double
    FltF31 As Double

    IntV0 As Double
    IntT0 As Double
    IntT1 As Double
    IntT2 As Double
    IntT3 As Double
    IntT4 As Double
    IntT5 As Double
    IntT6 As Double
    IntT7 As Double
    IntS0 As Double
    IntS1 As Double
    IntS2 As Double
    IntS3 As Double
    IntS4 As Double
    IntS5 As Double
    IntFp As Double
    IntA0 As Double
    IntA1 As Double
    IntA2 As Double
    IntA3 As Double
    IntA4 As Double
    IntA5 As Double
    IntT8 As Double
    IntT9 As Double
    IntT10 As Double
    IntT11 As Double
    IntRa As Double
    IntT12 As Double
    IntAt As Double
    IntGp As Double
    IntSp As Double
    IntZero As Double

    Fpcr As Double
    SoftFpcr As Double

    Fir As Double
    Psr As Long

    ContextFlags As Long
    Fill(4) As Long
End Type


Public hProcess     As Long
Public hWindow      As Long
Public ProcessID    As Long
Public SStart       As Long
Public SLength      As Long
Public TStart       As Long
Public TLength      As Long
Public OldProtect   As Long

Public Spliced()   As Byte
Public Target()    As Byte
Public NumSegments As Long
Public DAStruct    As DisAsmStruct
Public NumBytes    As Long
Public RPMRet      As Long
Public DebugMode   As Boolean

Public NumDLLCalls  As Long

Public BackupTarget()    As Byte

Public Function OpenDialogBox(ByVal frm As Form, ByVal filter As String, ByVal title As String, ByVal OpenSave As Byte) As String
    Dim ofn As OPENFILENAME
    ofn.lStructSize = Len(ofn)
    ofn.hwndOwner = frm.hWnd
    ofn.hInstance = App.hInstance
    ofn.lpstrFilter = filter
    ofn.nFilterIndex = 1
    ofn.lpstrFile = Space$(254)
    ofn.nMaxFile = 255
    ofn.lpstrFileTitle = Space$(254)
    ofn.nMaxFileTitle = 255
    ofn.lpstrInitialDir = CurDir
    ofn.lpstrTitle = title
    ofn.flags = 6
    Dim OpenDialog As Long
    If OpenSave = 1 Then 'Open
        OpenDialog = GetOpenFileName(ofn)
        If (OpenDialog) Then
            If Dir$(Trim$(ofn.lpstrFile)) <> "" Then
                OpenDialogBox = Trim$(ofn.lpstrFile)
            End If
        Else
            OpenDialogBox = "<C>"
        End If
    Else 'Save
        OpenDialog = GetSaveFileName(ofn)
        If OpenDialog > 0 Then
            OpenDialogBox = Trim$(ofn.lpstrFile)
        Else
            OpenDialogBox = "<C>"
        End If
    End If
End Function

Public Function RoundUp(V, M) As Long
    If (V Mod M) = 0 Then
        RoundUp = V
    Else
        RoundUp = ((V \ M) + 1) * M
    End If
End Function
