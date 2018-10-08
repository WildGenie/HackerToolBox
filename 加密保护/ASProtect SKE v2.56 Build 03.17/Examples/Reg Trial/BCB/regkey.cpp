//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <windows.h>
#include "regkey.h"
#include "include\aspr_api.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmRegKey *frmRegKey;
char* LocalHardwareID = NULL;
//---------------------------------------------------------------------------
__fastcall TfrmRegKey::TfrmRegKey(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmRegKey::FormCreate(TObject *Sender)
{
  LocalHardwareID = GetHardwareID();
  Edit1->Text     = StrPas( LocalHardwareID );
}
//---------------------------------------------------------------------------

void __fastcall TfrmRegKey::Button4Click(TObject *Sender)
{
  char buffer[256];
  memset( (char*)buffer, 0, sizeof(buffer));
  lstrcat(buffer,"mailto:support@aspack.com?subject=Hardware%20ID%20for%20Advanced%20Application%201.0&body=Hardware%20ID is%20:%20");
  lstrcat(buffer,LocalHardwareID);
  lstrcat(buffer,"%0d%0aRegistration%20information%20:");
  ShellExecute(GetDesktopWindow(), "open", buffer, NULL, NULL, SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------

void __fastcall TfrmRegKey::btnRegOkClick(TObject *Sender)
{

  if (CheckKeyAndDecrypt( eCode->Text.c_str(), eName->Text.c_str(), TRUE ) == TRUE)
  {
    MessageBox(Handle, "Thank you for your registration!", "Registration", MB_ICONINFORMATION);
    Close();
  } else
    MessageBox(Handle, "Key is not valid, please contact manufacture!","Registration", MB_ICONWARNING);

}
//---------------------------------------------------------------------------

void __fastcall TfrmRegKey::btnRegPasteClick(TObject *Sender)
{
  eCode->Clear();
  eCode->PasteFromClipboard();
}
//---------------------------------------------------------------------------
