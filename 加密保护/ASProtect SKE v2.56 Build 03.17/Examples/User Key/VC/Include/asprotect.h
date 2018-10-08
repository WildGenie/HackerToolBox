#ifndef ASPROTECT_H
#define ASPROTECT_H

#ifdef __BORLANDC__

 #define REG_CRYPT_BEGIN1 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x01);
 #define REG_CRYPT_END1   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x01);

 #define REG_CRYPT_BEGIN2 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x02);
 #define REG_CRYPT_END2   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x02);

 #define REG_CRYPT_BEGIN3 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x03);
 #define REG_CRYPT_END3   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x03);

 #define REG_CRYPT_BEGIN4 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x04);
 #define REG_CRYPT_END4   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x04);

 #define REG_CRYPT_BEGIN5 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x05);
 #define REG_CRYPT_END5   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x05);

 #define REG_CRYPT_BEGIN6 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x06);
 #define REG_CRYPT_END6   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x06);

 #define REG_CRYPT_BEGIN7 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x07);
 #define REG_CRYPT_END7   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x07);

 #define REG_CRYPT_BEGIN8 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x08);
 #define REG_CRYPT_END8   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x08);

 #define REG_CRYPT_BEGIN9 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x09);
 #define REG_CRYPT_END9   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x09);

 #define REG_CRYPT_BEGIN10 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0A);
 #define REG_CRYPT_END10   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0A);

 #define REG_CRYPT_BEGIN11 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0B);
 #define REG_CRYPT_END11   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0B);

 #define REG_CRYPT_BEGIN12 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0C);
 #define REG_CRYPT_END12   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0C);

 #define REG_CRYPT_BEGIN13 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0D);
 #define REG_CRYPT_END13   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0D);

 #define REG_CRYPT_BEGIN14 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0E);
 #define REG_CRYPT_END14   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0E);

 #define REG_CRYPT_BEGIN15 __emit__ (0xEB,0x04,0xEB,0x05,0x89,0x0F);
 #define REG_CRYPT_END15   __emit__ (0xEB,0x04,0xEB,0x05,0x99,0x0F);

#else

 #define REG_CRYPT_BEGIN1 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x01		

 #define REG_CRYPT_END1 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x01

 #define REG_CRYPT_BEGIN2 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x02

 #define REG_CRYPT_END2 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x02

 #define REG_CRYPT_BEGIN3 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x03

 #define REG_CRYPT_END3 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x03

 #define REG_CRYPT_BEGIN4 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x04

 #define REG_CRYPT_END4 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x04

 #define REG_CRYPT_BEGIN5 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x05

 #define REG_CRYPT_END5 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x05

 #define REG_CRYPT_BEGIN6 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x06

 #define REG_CRYPT_END6 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x06

 #define REG_CRYPT_BEGIN7 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x07

 #define REG_CRYPT_END7 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x07

 #define REG_CRYPT_BEGIN8 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x08

 #define REG_CRYPT_END8 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x08

 #define REG_CRYPT_BEGIN9 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x09

 #define REG_CRYPT_END9 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x09 

 #define REG_CRYPT_BEGIN10 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0A

 #define REG_CRYPT_END10 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0A

 #define REG_CRYPT_BEGIN11 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0B

 #define REG_CRYPT_END11 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0B

 #define REG_CRYPT_BEGIN12 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0C

 #define REG_CRYPT_END12 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0C

 #define REG_CRYPT_BEGIN13 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0D

 #define REG_CRYPT_END13 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0D

 #define REG_CRYPT_BEGIN14 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0E

 #define REG_CRYPT_END14 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0E

 #define REG_CRYPT_BEGIN15 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x89 \
 __asm _emit 0x0F

 #define REG_CRYPT_END15 \
 __asm _emit 0xEB \
 __asm _emit 0x04 \
 __asm _emit 0xEB \
 __asm _emit 0x05 \
 __asm _emit 0x99 \
 __asm _emit 0x0F

#endif

#endif