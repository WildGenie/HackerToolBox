FAST_MOV MACRO
	mov eax,ecx
	sar	ecx,2
    rep	movsd
    add	ecx,eax
    and	ecx,3
    rep	movsb	
ENDM

FAST_STOS MACRO
	push edx
	mov edx,ecx
	sar ecx,2
	rep stosd
	add ecx,edx
	and ecx,3
	rep stosb	
	pop edx
ENDM

GET_DELTA MACRO reg
        LOCAL   delta_call
        call    delta_call
 delta_call:
        pop     reg
        sub     reg,offset delta_call
ENDM

ISDEBUGGERPRESENT MACRO
	;LOCAL nopelbl
	;push eax
	;xor eax,eax
	;add eax,fs:[20h]	
	;jz nopelbl	
	;dec esi
 ;nopelbl:
	;pop eax
ENDM

; virtual alloc shiznit
MEM_COMMIT                equ 1000h
MEM_RESERVE               equ 2000h
MEM_DECOMMIT              equ 4000h
MEM_RELEASE               equ 8000h
MEM_FREE                  equ 10000h
MEM_PRIVATE               equ 20000h
MEM_MAPPED                equ 40000h
MEM_RESET                 equ 80000h     
MEM_TOP_DOWN              equ 100000h
PAGE_READWRITE            equ 04h
PAGE_EXECUTE              equ 10h
PAGE_EXECUTE_READ         equ 20h
PAGE_EXECUTE_READWRITE    equ 40h
PAGE_EXECUTE_WRITECOPY    equ 80h
PAGE_GUARD                equ 100h
PAGE_NOCACHE              equ 200h

EXCEPTION_RECORD struct 4
	dwExceptionCode dd ?
	dwExceptionFlags dd ?
	pChainedRecord dd ?
	pExceptionAddress dd ?
	dwNumberOfParams dd ?
	dwExceptionInformation dd 32 dup(?)
EXCEPTION_RECORD ends

EXCEPTION_CONTINUE_EXECUTION equ 0

SetExceptionHandler MACRO reg
	push 	reg
	assume fs:nothing
	push 	dword ptr fs:[0]
	mov  	fs:[0],esp	
ENDM

UnsetExceptionHandler MACRO 
	assume fs:nothing
	pop	dword ptr fs:[0]
	add	esp,4
ENDM	

ImportDescriptor STRUCT    
   iOriginalThunkTable	    dd ?
   iTimeDateStamp   dd ?
   iForwarderChain  dd ?
   iNameRva	    dd ?   
   iThunkTable	    dd ?
ImportDescriptor ENDS

  ;  DWORD   Characteristics;
  ;  DWORD   TimeDateStamp;
  ;  WORD    MajorVersion;
  ;  WORD    MinorVersion;
  ;  DWORD   Name;
  ;  DWORD   Base;
  ;  DWORD   NumberOfFunctions;
  ;  DWORD   NumberOfNames;
  ;  DWORD   AddressOfFunctions;     // RVA from base of image
 ;   DWORD   AddressOfNames;         // RVA from base of image
;    DWORD   AddressOfNameOrdinals;  // RVA from base of image

ExportDirectory STRUCT 4
	Characteristics dd ?
    TimeDateStamp dd ?
    MajorVersion dd ? 
    MinorVersion dd ?
    Name dd ?
    Base dd ?
    NumberOfFunctions dd ?
    NumberOfNames dd ?
    AddressOfFunctions dd ?
    AddressOfNames dd ?
    AddressOfNameOrdinals dd ?
ExportDirectory ENDS

IMAGE_DOS_HEADER STRUCT
    e_magic dw ?
    e_cblp dw ?
    e_cp dw ?
    e_crlc dw ?
    e_cparhdr dw ?
    e_minalloc dw ?
    e_maxalloc dw ?
    e_ss dw ?
    e_sp dw ?
    e_csum dw ?
    e_ip dw ?
    e_cs dw ?
    e_lfarlc dw ?
    e_ovno dw ?
    e_res dw ?,?,?,?
    e_oemid dw ?
    e_oeminfo dw ?
    e_res2 dw ?,?,?,?,?,?,?,?,?,?
    e_lfanew dd ?
IMAGE_DOS_HEADER ENDS

IMAGE_NT_HEADER STRUCT
    Signature dd ?
    ;IMAGE_FILE_HEADER FileHeader;
    Machine dw ?
    NumberOfSections dw ?
    TimeDateStamp dd ?
    PointerToSymbolTable dd ?
    NumberOfSymbols dd ?
    SizeOfOptionalHeader dw ?
    Characteristics dw ?
    ;IMAGE_OPTIONAL_HEADER32 OptionalHeader;
    Magic dw ?
    MajorLinkerVersion db ? 
    MinorLinkerVersion db ?
    SizeOfCode dd ?
    SizeOfInitializedData dd ?
    SizeOfUninitializedData dd ?
    AddressOfEntryPoint dd ?
    BaseOfCode dd ?
    BaseOfData dd ?
    ImageBase dd ?
    SectionAlignment dd ?
    FileAlignment dd ?
    MajorOperatingSystemVersion dw ?
    MinorOperatingSystemVersion dw ?
    MajorImageVersion dw ?
    MinorImageVersion dw ?
    MajorSubsystemVersion dw ?
    MinorSubsystemVersion dw ?
    Win32VersionValue dd ?
    SizeOfImage dd ?
    SizeOfHeaders dd ?
    CheckSum dd ?
    Subsystem dw ?
    DllCharacteristics dw ?
    SizeOfStackReserve dd ?
    SizeOfStackCommit dd ?
    SizeOfHeapReserve dd ?
    SizeOfHeapCommit dd ?
    LoaderFlags dd ?
    NumberOfRvaAndSizes dd ?
    DataDirectories dd ?
    ;IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
IMAGE_NT_HEADER ENDS

IMAGE_SECTION_HEADER STRUCT 1
    iName dd	?				; @0		DO NOT name 'Name'
    iName2 dd ?					; @0
    VirtualSize dd ?			; 8
    VirtualAddress dd ?			; 12
    SizeOfRawData dd ?			; 16
    PointerToRawData dd ?		; 20
    PointerToRelocations dd ?	; 24
    PointerToLinenumbers dd ?	; 28
    NumberOfRelocations dw ?	; 30
    NumberOfLinenumbers dw ?	; 32
    Characteristics dd ?		; 36	
IMAGE_SECTION_HEADER ENDS

IMAGE_SECTION_HEADER_SIZE equ 28h
