//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("test.res");
USEFORM("test_unit.cpp", frmTrial);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TfrmTrial), &frmTrial);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
