//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "test_unit.h"

// Enigma API respondence ---------------------------------------------------
#include "../../../EnigmaSDK/Bcb/enigma_ide.h"
#pragma link "../../../EnigmaSDK/Bcb/enigma_ide.lib"
// --------------------------------------------------------------------------

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmRegistration *frmRegistration;

  char* pcUserInfo = NULL;
  char* pcKey = NULL;

//---------------------------------------------------------------------------
__fastcall TfrmRegistration::TfrmRegistration(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TfrmRegistration::btnExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TfrmRegistration::FormShow(TObject *Sender)
{
  char	buffer[1024];

  eHardware->Text = EP_RegHardwareID();
  if (EP_RegLoadAndCheckKey())
  {
    if (EP_RegLoadKey(&pcUserInfo, &pcKey))
    {
      lbUserInfo->Caption = pcUserInfo;
      mKey->Text = pcKey;
    }
  } else
  {
    buffer[0] = 0;
    lstrcat(buffer, "*************   Reminder window   *************\n\n\n");
    lstrcat(buffer, "   Register software to remove this message!   \n");
    lstrcat(buffer, "    For registration visit www.YourProduct.com \n\n");
    ShowMessage(buffer);
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmRegistration::btnRegisterClick(TObject *Sender)
{
  char Key[255];
  char UserInfo[255];

  StrPCopy(UserInfo, eUserInfo->Text);
  StrPCopy(Key, eKey->Text);

  if (EP_RegCheckAndSaveKey((char*)UserInfo, (char*)Key))
  {
    lbUserInfo->Caption = eUserInfo->Text;
    mKey->Text = eKey->Text;
    ShowMessage("Thanks for registration");
  } else
  {
    ShowMessage("Invalid key");
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmRegistration::btnDeleteKeyClick(TObject *Sender)
{
  EP_RegDeleteKey();
}
//---------------------------------------------------------------------------

