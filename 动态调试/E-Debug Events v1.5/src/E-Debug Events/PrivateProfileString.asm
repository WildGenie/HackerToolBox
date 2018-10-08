.code

;读配置项
;lpAppName:节名称
;lpKeyName:配置项名称
;lpDefault:默认文本
;lpReturnedString: 保存指定配置文件中指定项目的文本内容。
;nSize:大小
;lpFileName:配置文件名

GetKeyText proc lpAppName:DWORD,lpKeyName:DWORD,lpDefault:DWORD,lpReturnedString:DWORD,nSize:DWORD,lpFileName:DWORD
     invoke GetPrivateProfileString,lpAppName,lpKeyName,lpDefault,lpReturnedString,nSize,lpFileName
     ret
     
GetKeyText endp

;写配置项
;lpString:欲写入值

SetKeyText proc lpAppName:DWORD,lpKeyName:DWORD,lpString:DWORD,lpFileName:DWORD
	invoke WritePrivateProfileString,lpAppName,lpKeyName,lpString,lpFileName
	
	ret

SetKeyText endp