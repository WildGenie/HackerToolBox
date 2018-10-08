if you'd like to write an example program of D programming language, please contact with us at:
support@peguard.com

thank you
/*-----------------------------------
1. How to use Zprotect VM marker

  asm
  {
   db 0xEB, 0x08, 0x56, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54;
  }//Zprotect VM Start marker

  ... you key code here to be virtulized ...

  asm
  {
   db 0xEB, 0x08, 0x56, 0x4D, 0x5F, 0x56, 0x4D, 0x45, 0x4E, 0x44;
  }//Zprotect VM End marker



2. How to use Zprotect Code Confusion marker

  asm
  {
   db 0xEB, 0x08, 0x53, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54;
  }//Zprotect Code Confusion Start marker

  ... you key code here to be confused ...

  asm
  {
   db 0xEB, 0x08, 0x53, 0x54, 0x5F, 0x53, 0x54, 0x45, 0x4E, 0x44;
  }//Zprotect Code Confusion End marker