//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("trial.res");
USEFORM("main.cpp", frmApp);
USEFORM("regkey.cpp", frmRegKey);
USELIB("include\aspr_ide_bcb.lib");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TfrmApp), &frmApp);
                 Application->CreateForm(__classid(TfrmRegKey), &frmRegKey);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
