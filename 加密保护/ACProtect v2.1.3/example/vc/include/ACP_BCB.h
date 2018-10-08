/* ACProtect header for Borland C++ Builder 5 and 6 */
#define GetRegistrationName(szRegistrationName)  ::MessageBox(HWND(-1),szRegistrationName,NULL,0);
#define GetTrialUsageTimes(lpUsageTime)          ::MessageBox(HWND(-1),lpUsageTime       ,NULL,1);
#define ACPGetMachineID(lpMachineID)          ::MessageBox(HWND(-1),lpUsageTime       ,NULL,6);

#define fourzero \
  __asm {db 0,0,0,0}

#define twentyzero \
    fourzero\
    fourzero\
    fourzero\
    fourzero\
    fourzero

#define hundredzero \
  twentyzero\
  twentyzero\
  twentyzero\
  twentyzero\
  twentyzero

#define kilozero \
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero

#define wanzero \
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero\
  kilozero

#define embedded_hole \
  wanzero\
  kilozero\
  kilozero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero


#define EMBEDDED_BEGIN \
  __asm {db 0xe9,0x10,0x02,0,0}
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  twentyzero\
  fourzero \
  fourzero \  
  __asm {db 0x60,0xe9,0x1c,0x32,0 ,0,'peetles__header'}\
  embedded_hole\
  __asm {db 'peetles_begin',0x61}

 #define EMBEDDED_END \
  __asm {db 0x60}\
  __asm {db 235, 30 ,'peetles_end'}\
  fourzero\
  fourzero\
  fourzero\
  fourzero\
  __asm {db 0}\
  __asm {db 0}\
  __asm {db 0}\
  __asm {db 0x61}\
  __asm {db 0xe9,0x10,0x02,0,0}\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  twentyzero\
  fourzero \
  fourzero   
  
 #define RSALOCK_BEGIN \
  __asm {db 0x60,0x6a,0x02,0x6a,0x00,0x6a,0x00,0x6a,0xff} \
  __asm {call RegisterHotKey}\
  __asm {db 0xeb,0x0d,'RegOnly_begin',0x61}

  #define RSALOCK_END\
  __asm {db
0x60,0xeb,0x0b,'RegOnly_end',0x6a,0x03,0x6a,0x00,0x6a,0x00,0x6a,0xff} \
  __asm {call RegisterHotKey}\
  __asm db 0x61

   #define DYNAMIC_BEGIN \
  __asm { db 0x60,0xe9,0xaa,0x01,0,0,'dymlck__header'}\
  hundredzero\
  hundredzero\
  hundredzero\
  hundredzero\
  __asm { db 'dymlck_begin',0x61}

 #define DYNAMIC_END \
  __asm {db 0x60,0xeb,58,'dymlck_end'}\
  twentyzero\
  twentyzero\
  fourzero \
  fourzero \
  __asm {db 0x61}