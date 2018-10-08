.code

;判断选择框的选中状态
;返回TRUE 选中
IsCheckedBox proc hMain:DWORD,IDCheckButton:DWORD
        invoke IsDlgButtonChecked,hMain,IDCheckButton
        ret
IsCheckedBox endp