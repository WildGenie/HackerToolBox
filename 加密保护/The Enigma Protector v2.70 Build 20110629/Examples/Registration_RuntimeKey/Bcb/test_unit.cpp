//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "test_unit.h"

// Enigma API ---------------------------------------------------------------
#include "../../../EnigmaSDK/Bcb/enigma_ide.h"
#pragma link "../../../EnigmaSDK/Bcb/enigma_ide.lib"
// --------------------------------------------------------------------------

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
void __fastcall TForm1::btnCloseClick(TObject *Sender)
{
  Timer1->Enabled = false;
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnRegisterClick(TObject *Sender)
{
  if (EP_RegCheckAndSaveKey(eName->Text.c_str(), eKey->Text.c_str()))
  {
    ShowMessage("New license is valid and installed!");
  } else {
    ShowMessage("License is invalid!");
  }
}

void __fastcall TForm1::ShowOurMessage(AnsiString AMessage)
{
  lbMessages->Items->Add(AnsiString().Format("[%s] %s", ARRAYOFCONST((TimeToStr(Now()), AMessage))));
  lbMessages->ItemIndex = lbMessages->Items->Count - 1;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
  if (EP_RegLoadAndCheckKey())
  {
    int Total = 0;
    int Left = 0;
    if (EP_RegKeyRuntime(&Total, &Left))
    {
      ShowOurMessage(AnsiString().Format("Valid license, total runtime minute(s) %d, left %d", ARRAYOFCONST((Total, Left))));
    } else {
      ShowOurMessage("License is valid, but not runtime limited!");
    }
  } else {
    ShowOurMessage("License is invalid!");
  }
}
//---------------------------------------------------------------------------

