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
#include "stdio.h"
#include "..\..\..\sdk\c\keygen\keygen.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnProjectClick(TObject *Sender)
{
    OpenDialog->Filter = "Project files|*.opf";
    if (OpenDialog->Execute())
        edtProject->Text = OpenDialog->FileName;        
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnGenerateClick(TObject *Sender)
{
    if (edtInfo->Text.IsEmpty())
    {
        ShowMessage("No license information entered.");
        return;
    }
    if (!FileExists(edtProject->Text))
    {
        ShowMessage("No project file selected or project file not found.");
        return;
    }
// initialise SHORTKEY_INFO structure
    SHORTKEY_INFO info;
    info.dwSize = sizeof(SHORTKEY_INFO);
    char sInfo[128];
    lstrcpy(sInfo, edtInfo->Text.c_str());
    info.lpInfo = sInfo;
    char project[MAX_PATH];
    lstrcpy(project, edtProject->Text.c_str());
    info.lpProjectFile = project;
    info.lpSystemID = NULL;
    info.lpExpDate = NULL;
    info.dwFlags = 0;
    info.dwCustom = 0;
    char key[80];
    info.lpBuffer = key;
// generate license key
    int result = GenerateShortKey(&info);
    if (result > 0)
        edtKey->Text = key;
    else
        ShowMessage("Error generating license key, error code " + \
            IntToStr(result));
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnVerifyClick(TObject *Sender)
{
    if (edtInfo->Text.IsEmpty())
    {
        ShowMessage("No license information entered.");
        return;
    }
    if (!FileExists(edtProject->Text))
    {
        ShowMessage("No project file selected or project file not found.");
        return;
    }
// initialise SHORTKEY_INFO structure
    SHORTKEY_INFO info;
    info.dwSize = sizeof(SHORTKEY_INFO);
    char sInfo[128];
    lstrcpy(sInfo, edtInfo->Text.c_str());
    info.lpInfo = sInfo;
    char project[MAX_PATH];
    lstrcpy(project, edtProject->Text.c_str());
    info.lpProjectFile = project;
    info.lpSystemID = NULL;
    info.lpExpDate = NULL;
    info.dwFlags = 0;
    info.dwCustom = 0;
    char key[80];
    lstrcpy(key, edtKey->Text.c_str());
    info.lpBuffer = key;
// verify license key
    int result = VerifyShortKey(&info);
    if (result == KEYFILE_VER_OK)
        ShowMessage("License key is valid");
    else
        ShowMessage("License key seems to be invalid, error code " + \
            IntToStr(result));
}
//---------------------------------------------------------------------------

