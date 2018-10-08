//---------------------------------------------------------------------------

#ifndef MainUnitH
#define MainUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include "CSPIN.h"
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *lbUserInfo;
        TEdit *eUserInfo;
        TGroupBox *gbSections;
        TCheckBox *cbSection1;
        TCheckBox *cbSection2;
        TCheckBox *cbSection3;
        TCheckBox *cbSection4;
        TCheckBox *cbSection5;
        TCheckBox *cbSection6;
        TCheckBox *cbSection7;
        TCheckBox *cbSection8;
        TCheckBox *cbSection9;
        TCheckBox *cbSection10;
        TCheckBox *cbSection11;
        TCheckBox *cbSection12;
        TCheckBox *cbSection13;
        TCheckBox *cbSection14;
        TCheckBox *cbSection15;
        TCheckBox *cbSection16;
        TButton *bGen;
        TButton *bGenFP;
        TButton *bClose;
        TMemo *mKey;
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TLabel *Label2;
        TComboBox *cbKeyMode;
        TComboBox *cbKeyBase;
        TCheckBox *cbHyphens;
        TButton *btnVerify;
        TButton *btnVerifyFP;
        TGroupBox *GroupBox2;
        TCheckBox *cbRegisterAfter;
        TCheckBox *cbExpiration;
        TDateTimePicker *dtpExpiration;
        TDateTimePicker *dtpRegisterAfter;
        TCheckBox *cbRegisterBefore;
        TDateTimePicker *dtpRegisterBefore;
        TCheckBox *cbExecutions;
        TCheckBox *cbDays;
        TCheckBox *cbRuntime;
        TCheckBox *cbGlobalTime;
        TCSpinEdit *seExecutions;
        TCSpinEdit *seDays;
        TCSpinEdit *seRuntime;
        TCSpinEdit *seGlobalTime;
        TEdit *eHardware;
        TCheckBox *cbHardware;
        TCheckBox *cbCountry;
        TComboBox *comCountry;
        void __fastcall cbHardwareClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall cbExpirationClick(TObject *Sender);
        void __fastcall bCloseClick(TObject *Sender);
        void __fastcall bGenClick(TObject *Sender);
        void __fastcall bGenFPClick(TObject *Sender);
        void __fastcall btnVerifyClick(TObject *Sender);
        void __fastcall btnVerifyFPClick(TObject *Sender);
        void __fastcall cbRegisterAfterClick(TObject *Sender);
        void __fastcall cbRegisterBeforeClick(TObject *Sender);
        void __fastcall cbCountryClick(TObject *Sender);
        void __fastcall cbExecutionsClick(TObject *Sender);
        void __fastcall cbDaysClick(TObject *Sender);
        void __fastcall cbRuntimeClick(TObject *Sender);
        void __fastcall cbGlobalTimeClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
