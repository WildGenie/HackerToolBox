include Junk Code.inc
include FileName.asm
include EjReadme.asm

DelE proto

.code

DialogProc proc hwndDlg:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
	
	mov eax,uMsg
	.if eax==WM_INITDIALOG
	        invoke GetKeyText,Text('Junk Code'),Text('Address'),NULL,addr lpEjAddrorSize,256,addr lpConfigName
	        invoke SetDlgItemText,hwndDlg,IDC_EDT_Address,addr lpEjAddrorSize
	        invoke GetKeyText,Text('Junk Code'),Text('Size'),NULL,addr lpEjAddrorSize,256,addr lpConfigName
	        invoke SetDlgItemText,hwndDlg,IDC_EDT_Size,addr lpEjAddrorSize
	        CMov hMain,hwndDlg
	        invoke SetMainICO,hwndDlg,MAIN_ICO
	        invoke GetDlgItem,hwndDlg,IDC_EDT_LOG
                mov hEdit,eax
                invoke GetDlgItem,hwndDlg,IDC_EDT_Address
                mov hEjEditAddress,eax
                invoke GetDlgItem,hwndDlg,IDC_EDT_Size
                mov hEjEditSize,eax
                invoke CheckRadio,hwndDlg,IDC_RBN_Static,TRUE
                invoke SetWindowText,hEdit,addr szEjReadme
	.elseif eax==WM_COMMAND
		mov eax,wParam
		.if eax==IDC_BTN_OPEN ;打开文件
                	invoke OpenFileName,addr strFile,addr szExeFileAll
                	.if eax==TRUE
                	        mov hSelectFile,TRUE
                	        invoke SelectFile
                	.else
                		mov hSelectFile,FALSE	
                	.endif
                .endif
                .if eax==IDC_BTN_ClearLog ;清除Log
                	invoke ClearEdit,hEdit
                .endif
                .if eax==IDC_CHK_TopMostWindow ;TopMostWindow
                	invoke IsCheckedBox,hwndDlg,IDC_CHK_TopMostWindow
                	.if eax==TRUE
                		invoke TopMostWindow,hwndDlg,TRUE
                	.else
                		invoke TopMostWindow,hwndDlg,FALSE
                	.endif
                .endif
                .if eax==IDC_BTN_Start  ;开始处理
                        .if hSelectFile==TRUE
                                invoke IsEditNULL,hEjEditAddress
                                .if eax==TRUE
                                        invoke AppendTextNewline,hEdit,addr szEditNUll
                                .else
                                	invoke IsEditNULL,hEjEditSize
                                	.if eax==TRUE
                                	        invoke AppendTextNewline,hEdit,addr szEditNUll
                                	.else
                                		invoke GetDlgItemText,hwndDlg,IDC_EDT_Address,addr lpEjAddrorSize,256
                                		invoke SetKeyText,Text('Junk Code'),Text('Address'),addr lpEjAddrorSize,addr lpConfigName
                                		invoke GetDlgItemText,hwndDlg,IDC_EDT_Size,addr lpEjAddrorSize,256
                                		invoke SetKeyText,Text('Junk Code'),Text('Size'),addr lpEjAddrorSize,addr lpConfigName
                                		invoke GetHexEdit,hEjEditAddress
                                		mov DWORD ptr lpEjAddress[0],eax
                                		invoke GetHexEdit,hEjEditSize
                                		mov DWORD ptr lpEjSize[0],eax
                                		invoke CThread,addr DelE
                                	.endif
                                .endif
                        .else
                        	invoke AppendTextNewline,hEdit,Text('错误:  文件未找到!')
                        .endif
                .endif
	.elseif eax==WM_CLOSE
	        invoke EndDialog,hwndDlg,0
	.else
		
		Return FALSE
	.endif
	Return TRUE

DialogProc endp

DelE proc  ;清除花指令代码
	LOCAL l_Number:DWORD
	mov l_Number,0
	invoke ReadFileMapping,addr strFile,addr hMappMemory
	.if eax!=-1
	        invoke ValidPE,hMappMemory
	        .if eax==TRUE
	                mov eax,dword ptr lpEjSize[0]
	                mov ecx,hMappSize
	                .if eax>ecx
	                       invoke AppendTextNewline,hEdit,Text('错误:  你设置的大小，超过了文件大小!')
	                .else
	                	invoke AppendTextNewline,hEdit,Text('Start......')
	        ;############code
	                        invoke IsCheckedRadio,hMain,IDC_RBN_VA
	                        .if eax==TRUE
	                        	invoke VAToOffset,hMappMemory,dword ptr lpEjAddress[0]
	                        	mov dword ptr lpEjAddress[0],eax
	                        .endif
	                        invoke IsCheckedRadio,hMain,IDC_RBN_RVA
	                        .if eax==TRUE
	                        	invoke RVAToOffset,hMappMemory,dword ptr lpEjAddress[0]
	                        	mov dword ptr lpEjAddress[0],eax
	                        .endif
	                        mov eax,hMappMemory
	                        mov ecx,dword ptr lpEjAddress[0]
	                        add eax,ecx
	                        mov dword ptr lpEjAddress[0],eax
	                        ;Next
	                        mov ecx,0FFH
	                        .while ecx!=0
	                        	mov byte ptr szJC1[3],cl
		                        invoke RpBin,dword ptr lpEjAddress[0],DWORD ptr lpEjSize[0],addr szJC1,addr szRp,4
					.if eax!=-1
						add l_Number,eax
					.endif
					dec ecx
	                        .endw
	                        mov eax,l_Number
	                        mov l_Number,0
	                        invoke wsprintf,addr lpEjBuffer,Text('清除%d 组'),eax
	                        invoke AppendTextNewline,hEdit,Text('花指令1 (特征码0F9H,72H,01H,00-FF):')
	                        invoke AppendTextNewline,hEdit,addr lpEjBuffer
	                        
	                        mov ecx,0FFH
	                        .while ecx!=0
				mov byte ptr szJC2[3],cl
		                invoke RpBin,dword ptr lpEjAddress[0],DWORD ptr lpEjSize[0],addr szJC2,addr szRp,4
		                .if eax!=-1
					add l_Number,eax
				.endif
				dec ecx
			       .endw
	                        mov eax,l_Number
	                        mov l_Number,0
	                        invoke wsprintf,addr lpEjBuffer,Text('清除%d 组'),eax
	                        invoke AppendTextNewline,hEdit,Text('花指令2(特征码 0F8H,73H,01H,00-FF):')
	                        invoke AppendTextNewline,hEdit,addr lpEjBuffer
	                        
	                        mov ecx,0FFH
				.while ecx!=0
			                mov byte ptr szJC3[10],cl
				        invoke RpBin,dword ptr lpEjAddress[0],DWORD ptr lpEjSize[0],addr szJC3,addr szRp,11
				        .if eax!=-1
						add l_Number,eax
					.endif
					dec ecx
				 .endw
				mov eax,l_Number
	                        mov l_Number,0
	                        invoke wsprintf,addr lpEjBuffer,Text('清除%d 组'),eax
	                        invoke AppendTextNewline,hEdit,Text('花指令3(特征码0E8H,00H,00H,00H,00H,83H,04H,24H,06H,0C3H,00-FF):')
	                        invoke AppendTextNewline,hEdit,addr lpEjBuffer
	                        
	                        	 mov ecx,0FFH
				.while ecx!=0
			        	mov byte ptr szJC4[2],cl
			        	invoke RpBin,dword ptr lpEjAddress[0],DWORD ptr lpEjSize[0],addr szJC4,addr szRp,3
			        	.if eax!=-1
						add l_Number,eax
					.endif
					dec ecx
			        .endw
			        mov eax,l_Number
	                        mov l_Number,0
	                        invoke wsprintf,addr lpEjBuffer,Text('清除%d 组'),eax
	                        invoke AppendTextNewline,hEdit,Text('花指令4(特征码0EBH,01H,00-FF):')
	                        invoke AppendTextNewline,hEdit,addr lpEjBuffer
	                        
	        ;############code End
	                        invoke CWriteFile,addr strFile,hMappMemory,hMappSize
	                        .if eax!=INVALID_HANDLE_VALUE
	                                invoke AppendTextNewline,hEdit,Text('修改保存文件成功!')
	                        .else
	                        	invoke AppendTextNewline,hEdit,Text('修改保存文件失败!')
	                        	invoke AppendTextNewline,hEdit,Text('尝试新的文件名(File_)...')
	                        	invoke PRenameInsertFileName,addr strFile,addr lpEjBuffer,Text('_')
	                        	invoke CWriteFile,addr lpEjBuffer,hMappMemory,hMappSize
	                        	.if eax!=INVALID_HANDLE_VALUE
	                        		invoke AppendTextNewline,hEdit,Text('修改保存文件成功!')
	                        	.else
	                        		invoke AppendTextNewline,hEdit,Text('修改保存文件失败!')
	                        	.endif
	                        .endif
	                	invoke AppendTextNewline,hEdit,Text('......End')
	                .endif
	        .else
	        	invoke AppendTextNewline,hEdit,Text('错误:  无效的PE文件!')
	        .endif
	         invoke FreeReadFile,hMappMemory
	.else
		invoke AppendTextNewline,hEdit,Text('错误:  读取文件错误!')	
	.endif
	
	ret

DelE endp