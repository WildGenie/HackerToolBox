//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include <windows.h>
#include "regkey.h"
#include "include\aspr_api.h"
#include "include\asprotect.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmApp *frmApp;

//---------------------------------------------------------------------------

  char* UserKey  = NULL;
  char* UserName = NULL;

  char* ModeName       = NULL;

  ULONG TrialDaysTotal = -1;
  ULONG TrialDaysLeft  = -1;

//---------------------------------------------------------------------------
__fastcall TfrmApp::TfrmApp(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmApp::FormShow(TObject *Sender)
{
  char buffer[256];
  MODE_STATUS mode_status;

  lStatus->Caption = "123";

  GetRegistrationInformation( 0, &UserKey, &UserName );

  if ((UserKey != NULL) && (strlen(UserKey) > 0))
  {

    // Trial doesn't expire
    // Application was registered

    REG_CRYPT_BEGIN1

    GetModeInformation( 0, &ModeName, &mode_status );

    btnBuy->Visible = FALSE;

    wsprintf( buffer,"Registered version:\n\nKey: %s\n\nName: \t\t%s\nMode Name: \t%s",
              UserKey, UserName, ModeName );

    lStatus->Caption = buffer;

    REG_CRYPT_END1

  }
   else
  {

    if (GetTrialDays( 0, &TrialDaysTotal, &TrialDaysLeft ))
    {

      if (TrialDaysLeft == 0)
      {
        btnBuy->Visible = TRUE;
        lStatus->Caption = "TRIAL EXPIRED!";
      }
       else
      {
        wsprintf( buffer,"Unregistered trial version\n\nYou have %i day(s) left",
                  TrialDaysLeft );

        lStatus->Caption = buffer;
      }
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TfrmApp::btnCloseClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TfrmApp::btnBuyClick(TObject *Sender)
{
  ShellExecute(GetDesktopWindow(), "open", "http://www.aspack.com/register.htm", NULL, NULL, SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------

void __fastcall TfrmApp::btnRegistrationClick(TObject *Sender)
{
  Hide();

//frmRegKey->ShowModal();

  TfrmRegKey* frmRegKey = new TfrmRegKey(Application);
  try{
    frmRegKey->ShowModal();
  }
  catch(...){
    frmRegKey->Free();
    throw;
  }
  frmRegKey->Free();

  Show();
}
//---------------------------------------------------------------------------
