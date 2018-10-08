include Exception.inc

.code

;窗口处理
ExceptionDialogProc proc hwndDlg:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
	mov eax,uMsg
	.if eax==WM_INITDIALOG
	        invoke SetMainICO,hwndDlg,MAIN_ICO
	        invoke SetDlgItemText,hwndDlg,IDC_EDT_Exception,addr lpException
	.elseif eax==WM_COMMAND
		mov eax,wParam
		.if eax==IDC_BTN_Cancel ;退出
		       invoke SendMessage,hwndDlg,WM_CLOSE,NULL,NULL
		.endif
		.if eax==IDC_BTN_Application ;应用
			invoke GetDlgItemText,hwndDlg,IDC_EDT_Exception,addr lpException,6000
			invoke SetKeyText,Text('Exceptions'),Text('Address'),addr lpException,addr lpConfigName
		.endif
	.elseif eax==WM_CLOSE
	        invoke DestroyWindow,hwndDlg
	.else
		
		Return FALSE
	.endif
	Return TRUE

ExceptionDialogProc endp

;消息处理
ExceptionMainPro  proc
       invoke CreateDialogParam,hInstance,IDD_Exception,hMainhWin,addr ExceptionDialogProc,addr dwInitParam
       mov hExwnd,eax
       .if eax!=0
       	     invoke ShowWindow,hExwnd,SW_SHOWNORMAL
       	     invoke UpdateWindow,hExwnd
       	     .WHILE TRUE
       	     	   invoke GetMessage, ADDR msg,NULL,0,0 
       	     	   .BREAK .IF (!eax)
       	     	   	invoke TranslateMessage, ADDR msg
       	     	   	invoke DispatchMessage, ADDR msg 
       	     .endw
       	     mov  eax,msg.wParam
       .endif
       ret
ExceptionMainPro  endp

GetConfigName proc  ;取配置项名
        invoke GetRunPath,addr lpConfigName,256
        invoke lstrcat,addr lpConfigName,Text('\Config.ed')
        ret
GetConfigName endp

;传递一个地址,判断是否在设定的缓冲区内，如果在的话返回TRUE
IsException proc  hAddr:DWORD
         invoke FindWindow,NULL,NULL
         invoke lstrlen,addr lpException
         .if eax!=0
                invoke wsprintf,addr lphAddr,Text('%08X'),hAddr
                invoke lstrcpyn,addr lpExceptionAddress,addr lpException,9
        	invoke lstrcmp,addr lpExceptionAddress,addr lphAddr
        	.if eax==0
        	        mov eax,TRUE
        	        jmp IsEnd
        	.else
        		mov edi,offset lpException
	                mov eax,','
	                mov ecx,6000
	                repnz scasb
	                .if ZERO?
	                	invoke lstrcpyn,addr lpExceptionAddress,edi,9
	                	invoke lstrcmp,addr lpExceptionAddress,addr lphAddr
	                	.if eax==0
	                		mov eax,TRUE
	                		jmp IsEnd
	                	.else
	                		mov eax,','
	                		repnz scasb
	                		.while ZERO?
	                	             invoke lstrcpyn,addr lpExceptionAddress,edi,9
	                	             invoke lstrcmp,addr lpExceptionAddress,addr lphAddr
	                	             .if eax==0
	                	             	   mov eax,TRUE
	                	             	   jmp IsEnd
	                	             .endif
	                	             invoke lstrlen,edi
	                	             .if eax==0
	                	             	   .break
	                	             .endif
	                	             mov eax,','
	                	             repnz scasb
	                		.endw
	                		jmp IseFALSE
	                	.endif
	                .else
	                	jmp IseFALSE
	                .endif
	                
        	.endif
               
         .else
IseFALSE:
         	mov eax,FALSE
         .endif
IsEnd:
         ret
IsException endp