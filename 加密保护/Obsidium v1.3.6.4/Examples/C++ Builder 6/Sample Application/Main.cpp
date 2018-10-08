/*
How to compile:

- Use the IMPLIB tool (included with C++ Builder) to create the library files:
  implib dummy.lib dummy.dll
  or
  implib keygen.lib keygen.dll
  and copy the resulting .lib files to the application directory
- The library and header files have already been added to the example projects
*/

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Main.h"
#include "..\..\..\sdk\c\api\obsidium.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
    : TForm(Owner)
{
    if (isRegistered())
    {
        lblInfo->Caption = "Registered, but no advanced key used";
        // the following code will only be executed if a valid advanced
        // key is present
        PATTERN_REG_START;
        char licInfo[128];
        getRegInfo(0, licInfo);
        lblInfo->Caption = "Registered to " + AnsiString(licInfo);
        gbRegistration->Enabled = false;
        PATTERN_REG_END;
    }
    else
    {
        // the following code will be decrypted when executed
        PATTERN_ENC_START;
        lblInfo->Caption = "Unregistered, please enter your registration " \
            "information below";
        PATTERN_ENC_END;
    }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnOKClick(TObject *Sender)
{
    if (edtLicInfo->Text.Length() == 0 || edtLicKey->Text.Length() == 0)
        return;
    if (setLicenseShort(edtLicInfo->Text.c_str(), edtLicKey->Text.c_str()))
        ShowMessage("Please restart the application");
    else
        ShowMessage("Invalid registration information!");
}
//---------------------------------------------------------------------------
