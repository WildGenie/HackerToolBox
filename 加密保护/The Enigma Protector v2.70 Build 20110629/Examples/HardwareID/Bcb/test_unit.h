//---------------------------------------------------------------------------

#ifndef test_unitH
#define test_unitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmRegistration : public TForm
{
__published:	// IDE-managed Components
        TEdit *eHardware;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *eUserInfo;
        TLabel *Label3;
        TEdit *eKey;
        TButton *btnRegister;
        TButton *btnExit;
        TBevel *Bevel1;
        TButton *btnDeleteKey;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *lbUserInfo;
        TMemo *mKey;
        void __fastcall btnExitClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall btnRegisterClick(TObject *Sender);
        void __fastcall btnDeleteKeyClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmRegistration(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmRegistration *frmRegistration;
//---------------------------------------------------------------------------
#endif
