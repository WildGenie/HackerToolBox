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
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TTimer *Timer1;
        TListBox *lbMessages;
        TLabel *Label2;
        TLabel *Label1;
        TGroupBox *GroupBox1;
        TLabel *Label4;
        TLabel *Label5;
        TButton *btnRegister;
        TEdit *eKey;
        TEdit *eName;
        TButton *btnClose;
        void __fastcall btnCloseClick(TObject *Sender);
        void __fastcall btnRegisterClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
        void __fastcall ShowOurMessage(AnsiString AMessage);
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
