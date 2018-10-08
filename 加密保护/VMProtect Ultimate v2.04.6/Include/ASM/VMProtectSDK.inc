; ===================================================
; VMProtectSDK.inc 
;
; Copyright VMProtect Software 2009
; ===================================================

; ===================================================
; code markers
; ===================================================

VMProtectBegin PROTO :DWORD
VMProtectBeginVirtualization PROTO :DWORD
VMProtectBeginMutation PROTO :DWORD
VMProtectBeginUltra PROTO :DWORD
VMProtectEnd PROTO

; ===================================================
; utils
; ===================================================

VMProtectIsDebuggerPresent PROTO :DWORD
VMProtectIsVirtualMachinePresent PROTO
VMProtectIsDebuggerPresent PROTO :DWORD
VMProtectDecryptStringA PROTO :DWORD
VMProtectDecryptStringW PROTO :DWORD

; ===================================================
; licensing
; ===================================================

;typedef enum VMProtectSerialStateFlags
	SERIAL_STATE_FLAG_CORRUPTED			equ	0x00000001
	SERIAL_STATE_FLAG_INVALID			equ	0x00000002
	SERIAL_STATE_FLAG_BLACKLISTED		equ	0x00000004
	SERIAL_STATE_FLAG_DATE_EXPIRED		equ	0x00000008
	SERIAL_STATE_FLAG_RUNNING_TIME_OVER	equ	0x00000010
	SERIAL_STATE_FLAG_BAD_HWID			equ	0x00000020
	SERIAL_STATE_FLAG_MAX_BUILD_EXPIRED	equ	0x00000040
	
VMProtectDate STRUCT 	
	wYear			WORD	?
	bMonth			BYTE	?
	bDay			BYTE	?
VMProtectDate ENDS	

VMProtectSerialNumberData STRUCT
	nState			DWORD			?	; VMProtectSerialStateFlags
	wUserName		WCHAR[256]			; user name
	wEMail			WCHAR[256]			; email
	dtExpire		VMProtectDate	<>	; date of serial number expiration
	dtMaxBuild		VMProtectDate	<>	; max date of build, that will accept this key
	bRunningTime	DWORD			?	; running time in minutes
	nUserDataLength	BYTE			?	; length of user data in bUserData
	bUserData		BYTE[255]		?	; up to 255 bytes of user data
VMProtectSerialNumberData ENDS

VMProtectSetSerialNumber PROTO :DWORD
VMProtectGetSerialNumberState PROTO
VMProtectGetSerialNumberData PROTO :DWORD
VMProtectGetCurrentHWID PROTO :DWORD

; ===================================================
; libs
; ===================================================

includelib VMProtectSDK32.lib