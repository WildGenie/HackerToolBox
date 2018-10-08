//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "dialogs.hpp"
#include "Unit1.h"
#include "VMProtectSDK.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
 VMProtectBegin("Test marker");
 if (StrToIntDef(Edit1->Text, 0) % 17==13)
  MessageDlg(VMProtectDecryptStringA("Correct password"), mtInformation, TMsgDlgButtons() << mbOK, 0);
 else
  {
   MessageDlg(VMProtectDecryptStringA("Incorrect password"), mtError, TMsgDlgButtons() << mbOK, 0);
   Edit1->SetFocus();
  }
 VMProtectEnd();
}
//---------------------------------------------------------------------------
