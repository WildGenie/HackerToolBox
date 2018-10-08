
PEC2_HOOKS_VERSION equ 2

PEC2_HOOKS_FLAG_MANDATE_LAST_IN_ORDER equ 1
PEC2_HOOKS_FLAG_MANDATE_FIRST_IN_ORDER equ 2

HOOK_DATA_INFO equ HookDataInfo

HOOK_CHAIN_INFO struct 1
	pLoadLibrary dd ?
	pGetProcAddressWithHint dd ?
	pTranslateAPIAddressToHookAddress dd ?
HOOK_CHAIN_INFO ENDS

HookDataInfo STRUCT 1
	dwVersion dw ?
	dwStructSize dw ?
	dwOffsetInitialize dd ?
	dwOffsetInitializeEx dd ?
	dwOffsetLoadLibraryA dd ?	
	dwOffsetGetProcAddressWithHint dd ?
	dwOffsetTranslateAPIAddressToHookAddress dd ?
HookDataInfo ENDS
