//---------------------------------------------------------------------------

#ifndef regkeyH
#define regkeyH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TfrmRegKey : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label2;
        TEdit *Edit1;
        TButton *Button4;
        TLabel *lCode;
        TEdit *eCode;
        TLabel *lName;
        TEdit *eName;
        TButton *btnRegOk;
        TButton *btnRegCancel;
        TButton *btnRegPaste;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall btnRegOkClick(TObject *Sender);
        void __fastcall btnRegPasteClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmRegKey(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmRegKey *frmRegKey;
//---------------------------------------------------------------------------
#endif
