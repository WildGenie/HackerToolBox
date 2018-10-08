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
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
        Close();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
        TKeyInformation ki;
        memset(&ki, 0, sizeof(ki));
        
        if (EP_RegKeyInformation(eName->Text.c_str(), mKey->Text.c_str(), &ki))
        {
                AnsiString res = Format("\nCreation date: %d.%d.%d", ARRAYOFCONST(((int)ki.CreationYear, (int)ki.CreationMonth, (int)ki.CreationDay)));
                if (ki.UseKeyExpiration)
                {
                        res += Format("\nExpiration date: %d.%d.%d", ARRAYOFCONST(((int)ki.ExpirationYear, (int)ki.ExpirationMonth, (int)ki.ExpirationDay)));
                }
                if (ki.UseHardwareLocking)
                {
                        res += "\nKey is Hardware Locked";
                }
                if (ki.UseExecutionsLimit)
                {
                        res += Format("\nExecutions number: %d", ARRAYOFCONST(((int)ki.ExecutionsCount)));
                }
                if (ki.UseDaysLimit)
                {
                        res += Format("\nDays number: %d", ARRAYOFCONST(((int)ki.DaysCount)));
                }
                if (ki.UseRunTimeLimit)
                {
                        res += Format("\nRun-time minutes: %d", ARRAYOFCONST(((int)ki.RunTimeMinutes)));
                }
                if (ki.UseGlobalTimeLimit)
                {
                        res += Format("\nGlobal time minutes: %d", ARRAYOFCONST(((int)ki.GlobalTimeMinutes)));
                }
                if (ki.UseCountyLimit)
                {
                        for (int i = 0; i < ARRAYSIZE(KEY_COUNTRIES); i++)
                        {
                                if (ki.CountryCode == KEY_COUNTRIES[i].Code)
                                {
                                        res += Format("\nCountry Lock: %s", ARRAYOFCONST((KEY_COUNTRIES[i].Name)));
                                        break;
                                }
                        }
                }
                if (ki.UseRegisterAfter)
                {
                        res += Format("\nRegister After date: %d.%d.%d", ARRAYOFCONST(((int)ki.RegisterAfterYear, (int)ki.RegisterAfterMonth, (int)ki.RegisterAfterDay)));
                }
                if (ki.UseRegisterBefore)
                {
                        res += Format("\nRegister Before date: %d.%d.%d", ARRAYOFCONST(((int)ki.RegisterBeforeYear, (int)ki.RegisterBeforeMonth, (int)ki.RegisterBeforeDay)));
                }
                for (int i = 0; i < NUMBER_OF_CRYPTED_SECTIONS; i++)
                {
                        if (ki.EncryptedSections[i])
                        {
                                res += Format("\nlocked section #%d", ARRAYOFCONST((i + 1)));
                        }
                }
                MessageDlg("Registration Information is valid and contains the following information:" + res, mtInformation, TMsgDlgButtons() << mbOK, 0);
        } else
        {
                MessageDlg("Registration Information is invalid", mtError, TMsgDlgButtons() << mbOK, 0);
        }
}
//---------------------------------------------------------------------------
