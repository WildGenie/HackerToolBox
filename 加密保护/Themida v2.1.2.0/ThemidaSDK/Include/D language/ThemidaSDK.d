module ThemidaSDK;

// Writen by Bryan Power
// Placed into Public Domain

version (D_InlineAsm_X86)
{

const CODEREPLACE_START = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
const CODEREPLACE_END   = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x01, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
                                    
const ENCODE_START      = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x04, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
const ENCODE_END        = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x05, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
                                    
const CLEAR_START       = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x06, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
const CLEAR_END         = "asm { db 0xEB, 0x15, 0x57, 0x4C, 0x20, 0x20, 0x07, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20, 0x00, 0x00, 
                                    0x00, 0x00, 0x00;}";

const VM_START          = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x0C, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
const VM_END            = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x0D, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";

template VM_START_WITHLEVEL(string x)
{
	const VM_START_WITHLEVEL = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x0C, 0x00, 0x00, 0x00, 
                                           0x00, " ~ x ~ ",  0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
}

const UNPROTECTED_START = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
const UNPROTECTED_END   = "asm { db 0xEB, 0x10, 0x57, 0x4C, 0x20, 0x20, 0x21, 0x00, 0x00, 0x00, 
                                    0x00, 0x00, 0x00, 0x00, 0x57, 0x4C, 0x20, 0x20;}";
                                    
}
 
/*
 * Example:
 *
 * mixin(ENCODE_START);
 *
 * for (int i = 0; i < 100; i++)
 * {
 *     value += value * i + 3;
 * }
 *
 * mixin(ENCODE_END);
 *
 * Example:
 *
 * mixin(VM_START_WITH_LEVEL!("3"));
 *
 * for (int i = 0; i < 100; i++)
 * {
 *     value += value * i + 3;
 * }
 *
 * mixin(VM_END);
 *
 */
