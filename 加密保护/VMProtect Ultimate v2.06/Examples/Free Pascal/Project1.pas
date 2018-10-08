program Project1;

uses Windows, Messages, Sysutils, VMProtectSDK;

{$R Resource.res}

const
  IDD_DIALOG = 101;
  IDC_BUTTON_CHECKPASSWORD = 102;
  IDC_EDIT = 1000;

function MainHandler(hDlg: HWND; Msg: LongWord; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var Buf: array [0..99] of Char;
begin
  VMProtectBegin('Test marker');
  Result:=0;
  case Msg of
   WM_INITDIALOG: Result:=1;
   WM_COMMAND:
    begin
     if LoWord(wParam) = IDCANCEL then
      begin
       EndDialog(hDlg, LoWord(wParam));
       Result:=1;
      end
     else
     if LoWord(wParam) = IDC_BUTTON_CHECKPASSWORD then
      begin
       GetDlgItemText(hDlg, IDC_EDIT, Buf, SizeOf(Buf));
       if (StrToIntDef(Buf,0) mod 17 = 13) then
        MessageBox(hDlg, VMProtectDecryptStringA('Correct password'), 'Information', MB_ICONINFORMATION + MB_OK)
       else
        begin
         MessageBox(hDlg, VMProtectDecryptStringA('Incorrect password'), 'Error', MB_ICONERROR + MB_OK);
	 SetFocus(GetDlgItem(hDlg, IDC_EDIT));
        end;
      end;
    end;
  end;
  VMProtectEnd;
end;

begin
  DialogBox(GetModuleHandle(nil),PChar(IDD_DIALOG),0,@MainHandler);
end.
