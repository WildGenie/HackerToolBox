//---------------------------------------------------------------------------

#ifndef mainformunitH
#define mainformunitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *lbGlobalTime;
        TEdit *eGlobalTime;
        TLabel *lbExecutionTime;
        TEdit *eExecutionTime;
        TBevel *Bevel1;
        TEdit *eStatus;
        TProgressBar *pbTrial;
        TButton *btnClose;
        TLabel *Label1;
        TLabel *Label2;
        TTimer *tmTimer;
        TLabel *Label3;
        void __fastcall tmTimerTimer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall btnCloseClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
