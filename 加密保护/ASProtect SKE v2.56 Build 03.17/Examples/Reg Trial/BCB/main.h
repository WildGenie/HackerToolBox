//---------------------------------------------------------------------------

#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmApp : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TLabel *lStatus;
        TBevel *Bevel1;
        TButton *btnClose;
        TButton *btnBuy;
        TButton *btnRegistration;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall btnCloseClick(TObject *Sender);
        void __fastcall btnBuyClick(TObject *Sender);
        void __fastcall btnRegistrationClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmApp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmApp *frmApp;
//---------------------------------------------------------------------------
#endif
