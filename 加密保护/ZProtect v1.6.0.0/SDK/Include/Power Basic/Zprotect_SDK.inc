
' include this file to use Zprotect macros in PowerBasic applications


MACRO Code_Confusion_START = ! DB &HEB, &H08, &H53, &H54, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Code_Confusion_END = ! DB &HEB, &H08, &H53, &H54, &H5F, &H53, &H54, &H45, &H4E, &H44

MACRO Code_Elimination_START = ! DB &HEB, &H08, &H4F, &H43, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Code_Elimination_END = ! DB &HEB, &H08, &H4F, &H43, &H5F, &H4F, &H43, &H45, &H4E, &H44

MACRO Decode_onExec_START = ! DB &HEB, &H08, &H44, &H59, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Decode_onExec_END = ! DB &HEB, &H08, &H44, &H59, &H5F, &H44, &H59, &H45, &H4E, &H44

MACRO Decode_onReg_START = ! DB &HEB, &H08, &H52, &H44, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Decode_onReg_END = ! DB &HEB, &H08, &H52, &H44, &H5F, &H52, &H44, &H45, &H4E, &H44

MACRO Decode_Section_A_START = ! DB &HEB, &H08, &H52, &H31, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Decode_Section_A_END = ! DB &HEB, &H08, &H52, &H31, &H5F, &H52, &H44, &H45, &H4E, &H44

MACRO Decode_Section_B_START = ! DB &HEB, &H08, &H52, &H32, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Decode_Section_B_END = ! DB &HEB, &H08, &H52, &H32, &H5F, &H52, &H44, &H45, &H4E, &H44

MACRO Decode_Section_C_START = ! DB &HEB, &H08, &H52, &H33, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO Decode_Section_C_END = ! DB &HEB, &H08, &H52, &H33, &H5F, &H52, &H44, &H45, &H4E, &H44

MACRO ZProtect_VM_START = ! DB &HEB, &H08, &H56, &H4D, &H5F, &H53, &H54, &H41, &H52, &H54
MACRO ZProtect_VM_END = ! DB &HEB, &H08, &H56, &H4D, &H5F, &H56, &H4D, &H45, &H4E, &H44
