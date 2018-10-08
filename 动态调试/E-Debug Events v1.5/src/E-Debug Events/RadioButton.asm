;RadioButton

.code

;设置单选框的选中状态
;hMain 主窗口句柄
;nIDDlgItem 控件标识符
;IsChecked 选中状态
CheckRadio proc hMain:DWORD,nIDDlgItem:DWORD,IsChecked:DWORD
        invoke CheckDlgButton,hMain,nIDDlgItem,IsChecked
        ret
CheckRadio endp

;判断单选框的选中状态
;返回TRUE 选中
IsCheckedRadio proc hMain:DWORD,IDCheckButton:DWORD
        invoke IsDlgButtonChecked,hMain,IDCheckButton
        ret
IsCheckedRadio endp