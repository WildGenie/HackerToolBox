//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "test_unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

// Enigma API respondence ---------------------------------------------------
#include "../../../EnigmaSDK/Bcb/enigma_ide.h"
#pragma link "../../../EnigmaSDK/Bcb/enigma_ide.lib"
// --------------------------------------------------------------------------

TfrmTrial *frmTrial;
//---------------------------------------------------------------------------
__fastcall TfrmTrial::TfrmTrial(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmTrial::FormShow(TObject *Sender)
{
  DWORD Total = 0;
  DWORD Left = 0;
  WORD Day = 0;
  WORD Month = 0;
  WORD Year = 0;
  char buffer[255];

  if (EP_TrialDays(&Total, &Left))
  {
    lbDays->Caption = IntToStr(Total);
    lbDaysLeft->Caption = IntToStr(Left);
  }
  if (EP_TrialExecutions(&Total, &Left))
  {
    lbExecs->Caption = IntToStr(Total);
    lbExecsLeft->Caption = IntToStr(Left);
  }

  if (EP_TrialExpirationDate(&Year, &Month, &Day))
  {
    lbDate->Caption = Format("%d-%d-%d", ARRAYOFCONST((Day, Month, Year)));
  }
}


void __fastcall TfrmTrial::btnCloseClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

