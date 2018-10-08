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
  if (edtInfo1->Text.IsEmpty() && edtInfo2->Text.IsEmpty() && edtInfo3->Text.IsEmpty())
  {
    ShowMessage("No license information entered.");
    return;
  }
  if (!FileExists(edtProject->Text))
  {
    ShowMessage("No project file selected or project file not found.");
    return;
  }
  void *buffer = malloc(1024);
  char info1[32];
  char info2[32];
  char info3[32];
  char project[MAX_PATH];
  // initialise KEYFILE_INFO structure
  KEYFILE_INFO info;
  memset(&info, 0, sizeof(info));
  info.dwSize = sizeof(KEYFILE_INFO);
  // set license information
  lstrcpy(info1, edtInfo1->Text.c_str());
  info.lpInfo1 = info1;
  lstrcpy(info2, edtInfo2->Text.c_str());
  info.lpInfo2 = info2;
  lstrcpy(info3, edtInfo3->Text.c_str());
  info.lpInfo3 = info3;
  lstrcpy(project, edtProject->Text.c_str());
  info.lpProjectFile = project;
  info.lpBuffer = buffer;
  // generate license key
  int size = GenerateKeyfile(&info);
  if (size <= 0)
    ShowMessage("Could not create license file, error " + IntToStr(size));
  else
    if (SaveDialog->Execute())
    {
      // write license key to file
      FILE *keyfile = fopen(SaveDialog->FileName.c_str(), "wb");
      if (keyfile)
      {
        fseek(keyfile, 0, SEEK_SET);
        fwrite(buffer, 1, size, keyfile);
        fclose(keyfile);
      }
    }
  free(buffer);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnVerifyClick(TObject *Sender)
{
  if (!FileExists(edtProject->Text))
  {
    ShowMessage("No project file selected or project file not found.");
    return;
  }
  OpenDialog->Filter = "License files|*.key";
  if (OpenDialog->Execute())
  {
    FILE *keyfile = fopen(OpenDialog->FileName.c_str(), "rb");
    if (keyfile)
    {
      // read keyfile
      fseek(keyfile, 0, SEEK_END);
      long fsize = ftell(keyfile);
      fseek(keyfile, 0, SEEK_SET);
      void *buffer = malloc(fsize);
      fread(buffer,1,fsize,keyfile);
      fclose(keyfile);
      // initialise KEYFILE_INFO structure
      KEYFILE_INFO info;
      info.dwSize = sizeof(KEYFILE_INFO);
      info.lpInfo1 = NULL;
      info.lpInfo2 = NULL;
      info.lpInfo3 = NULL;
      info.lpSystemID = NULL;
      info.lpExtInfo = NULL;
      info.lpExpDate = NULL;
      info.lpBuffer = buffer;
      char project[MAX_PATH];
      lstrcpy(project, edtProject->Text.c_str());
      info.lpProjectFile = project;
      // verify keyfile
      if (VerifyKeyfile(&info) == KEYFILE_VER_OK)
        ShowMessage("Valid license.");
      else
        ShowMessage("Invalid license.");
      free(buffer);
    }
    else ShowMessage("Can't open the selected file.");
  }
}
//---------------------------------------------------------------------------

