//---------------------------------------------------------------------------

#ifndef test_unitH
#define test_unitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TfrmTrial : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TButton *btnClose;
        TLabel *lbDays;
        TLabel *lbDaysLeft;
        TLabel *lbExecs;
        TLabel *lbExecsLeft;
        TLabel *lbDate;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall btnCloseClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmTrial(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmTrial *frmTrial;
//---------------------------------------------------------------------------
#endif
