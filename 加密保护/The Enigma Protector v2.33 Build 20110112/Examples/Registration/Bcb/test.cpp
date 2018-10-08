//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("test.res");
USEFORM("test_unit.cpp", frmRegistration);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TfrmRegistration), &frmRegistration);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
