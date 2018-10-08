//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

// Enigma API respondence ---------------------------------------------------
#include "../../../EnigmaSDK/Bcb/enigma_ide.h"
#pragma link "../../../EnigmaSDK/Bcb/enigma_ide.lib"
// --------------------------------------------------------------------------

#include "mainformunit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;
unsigned int dwCounter;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::tmTimerTimer(TObject *Sender)
{
  _SYSTEMTIME lpSystemTime;
  unsigned long dwTotal;
  unsigned long dwLeft;
  // Show global time
  GetSystemTime(&lpSystemTime);
  eGlobalTime->Text = Format("%.2d:%.2d:%.2d", ARRAYOFCONST((lpSystemTime.wHour, lpSystemTime.wMinute, lpSystemTime.wSecond)));
  // Show execution time
  dwCounter += tmTimer->Interval;
  eExecutionTime->Text = Format("%.2d:%.2d:%.2d",
                                ARRAYOFCONST((
                                        dwCounter / (60 * 60 * 1000) % 24,
                                        dwCounter / (60 * 1000) % 60,
                                        dwCounter / 1000 % 60
                                )));

  // Get trial status
  if (EP_TrialExecutionTime(&dwTotal, &dwLeft))
  {
    // Set total and left minutes values to labels
    Label2->Caption = Format("%d", ARRAYOFCONST(((int)dwTotal)));
    Label3->Caption = Format("%d", ARRAYOFCONST(((int)dwLeft)));
    // Set maximal value to ProgressBar
    pbTrial->Max = (int)dwTotal;
    pbTrial->Position = (int)dwLeft;
    // Set trial status
    eStatus->Text = "OK";
    eStatus->Color = clGreen;
  } else
  {
    eStatus->Text = "UNUSED";
    eStatus->Color = clRed;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::FormCreate(TObject *Sender)
{
  dwCounter = 0;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::btnCloseClick(TObject *Sender)
{
  Application->Terminate();
}
//---------------------------------------------------------------------------

