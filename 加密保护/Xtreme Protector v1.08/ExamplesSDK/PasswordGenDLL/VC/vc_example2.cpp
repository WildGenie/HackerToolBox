//==================================
// OBJHELP - Matt Pietrek 1996
// FILE: OBJHELP.CPP
//==================================
#include <windows.h>
#include <shellapi.h>
#include <commdlg.h>
#include <stdarg.h>
#pragma hdrstop
#include "OBJHELP.H"
#include "dumpobj.h"

// Helper functions
void Handle_WM_COMMAND(HWND hDlg, WPARAM wParam, LPARAM lParam);
void Handle_WM_INITDIALOG(HWND hDlg);
void Handle_WM_CLOSE( HWND hDlg );
void Handle_WM_DROPFILES( HWND hDlg, WPARAM wParam );
BOOL Handle_Browse( HWND hWndDlg );
BOOL CALLBACK ObjHelpDlgProc( HWND, UINT, WPARAM, LPARAM );
void GetSetPositionInfoFromRegistry( BOOL fSave, POINT *lppt );
void ProcessNewFile( void );

BOOL fProcessingLib = FALSE;
HWND g_hDlg = 0;
HWND g_hPublicsListBox = 0;
HWND g_hExternsListBox = 0;
unsigned g_cAveLBCharWidth = 0;
unsigned cbMaxPublics=0;        // longest string in publics listbox
unsigned cbMaxExterns=0;        // longest string in externs listbox

// ======================= String literals ===============================
char gszRegistryKey[] = "Software\\WheatyProductions\\ObjHelp";

char g_AboutMsgTxt[] =
"OBJHELP displays the public and external symbols in OBJ and LIB files."
"It works with both COFF and Intel OMF format files.\r\n\r\n"
"Files can be displayed via the Browse button, or by dragging a file onto "
"the program's window.\r\n\r\n"
"For more information about OBJHELP, refer to the July 1996 Microsoft "
"Systems Journal, or the Microsoft Developer Network CD.";

char g_AboutTitleTxt[] = "OBJHELP - Matt Pietrek 1996, for MSJ";

// ======================= Start of code ===============================

int PASCAL WinMain( HANDLE hInstance, HANDLE hPrevInstance,
                    PSTR lpszCmdLine, int nCmdShow )
{
    // Bring up the user interface (A dialog box?  What a surprise!)
    DialogBox(hInstance, "ObjHelpDlg", 0, (DLGPROC)ObjHelpDlgProc);
    return 0;
}

BOOL CALLBACK ObjHelpDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam)
{
    switch ( msg )
    {
        case WM_COMMAND:
            Handle_WM_COMMAND( hDlg, wParam, lParam ); return TRUE;
        case WM_INITDIALOG:
            Handle_WM_INITDIALOG( hDlg ); return TRUE;
        case WM_DROPFILES:
            Handle_WM_DROPFILES( hDlg, wParam ); return 0;
        case WM_CLOSE:
            Handle_WM_CLOSE( hDlg ); break;
        // let everything else fall through
    }
    return FALSE;
}

void Handle_WM_COMMAND( HWND hDlg, WPARAM wParam, LPARAM lParam )
{
    switch ( LOWORD(wParam) )
    {
        case IDC_BUTTON_BROWSE:
            if ( Handle_Browse( hDlg ) )
                ProcessNewFile();
            break;
        case IDC_BUTTON_HELP:
            MessageBox( hDlg, g_AboutMsgTxt, g_AboutTitleTxt, MB_OK );
            break;
        case IDOK:
            if ( GetFocus() == GetDlgItem(hDlg, IDC_EDIT_FILENAME) )
                ProcessNewFile();
            break;
    }
    
    return;
}

void Handle_WM_INITDIALOG(HWND hDlg)
{
    // Get the window coordinates where ObjHelp.EXE was last running,
    // and move the window to that spot.
    POINT pt;
    GetSetPositionInfoFromRegistry( FALSE, &pt );
    SetWindowPos(hDlg, 0, pt.x, pt.y, 0, 0,
                 SWP_NOSIZE | SWP_NOREDRAW | SWP_NOZORDER | SWP_NOACTIVATE);

    // Set us up to accept dropped filenames
    DragAcceptFiles( hDlg, TRUE );

    g_hDlg = hDlg;      // Save off the hDlg in a global variable
    g_hPublicsListBox = GetDlgItem( hDlg, IDC_LIST_PUBLIC_SYMBOLS );
    g_hExternsListBox = GetDlgItem( hDlg, IDC_LIST_EXTERN_SYMBOLS );
    
    // Figure out how wide characters in the listboxes will be
    HDC hDCLB = GetDC( g_hPublicsListBox );
    if ( hDCLB )
    {
        TEXTMETRIC tm;
        if ( GetTextMetrics(hDCLB, &tm) )
            g_cAveLBCharWidth = tm.tmAveCharWidth;
        ReleaseDC( g_hPublicsListBox, hDCLB );
    }
}

void Handle_WM_CLOSE( HWND hDlg )
{
    // Stop accepting dropped filenames
    DragAcceptFiles( hDlg, TRUE );

    // Save off the window's X,Y coordinates for next time
    RECT rect;
    GetWindowRect( hDlg, &rect );
    GetSetPositionInfoFromRegistry( TRUE, (LPPOINT)&rect );
    EndDialog(hDlg, 0);
}

void Handle_WM_DROPFILES( HWND hDlg, WPARAM wParam )
{
    char szFileName[MAX_PATH];
    UINT cbFileName;

    // Get the name of the file that was dropped on us, the release the HDROP
    cbFileName = DragQueryFile((HDROP)wParam,0,szFileName,sizeof(szFileName));
    DragFinish( (HDROP)wParam );
        
    if ( fProcessingLib )   // If we're already processing, don't bother
        return;

    SetDlgItemText( hDlg, IDC_EDIT_FILENAME, szFileName );
    
    ProcessNewFile();
}

BOOL Handle_Browse( HWND hDlg )
{
    OPENFILENAME ofn;
    char szFilename[512] = "";
    static char szFilter1[] = "OBJS (*.OBJ)\0*.OBJ\0LIBS (*.LIB)\0*.LIB\0";

    memset(&ofn, 0, sizeof(OPENFILENAME));

    ofn.lStructSize = sizeof(OPENFILENAME);
    ofn.hwndOwner = hDlg;
    ofn.lpstrFilter = szFilter1;
    ofn.nFilterIndex = 1;
    ofn.lpstrFile = szFilename;
    ofn.nMaxFile = sizeof(szFilename);
    ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;

    if ( GetOpenFileName(&ofn) )
    {
        SetDlgItemText( hDlg, IDC_EDIT_FILENAME, szFilename );
        return TRUE;
    }

    return FALSE;
}

void GetSetPositionInfoFromRegistry( BOOL fSave, POINT *lppt )
{
    HKEY hKey;
    DWORD dataSize, err, disposition;
    char szKeyName[] = "DlgCoordinates";
    
    if ( !fSave )               // In case the key's not there yet, we'll
        lppt->x = lppt->y = 0;  // return 0,0 for the coordinates

    // Open the registry key (or create it if the first time being used)
    err = RegCreateKeyEx( HKEY_CURRENT_USER, gszRegistryKey, 0, 0,
                         REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS,
                         0, &hKey, &disposition );
    if ( ERROR_SUCCESS != err )
        return;

    if ( fSave )            // Save out coordinates
    {
        RegSetValueEx( hKey, szKeyName, 0, REG_BINARY,
                       (PBYTE)lppt, sizeof(*lppt) );
    }
    else                    // read in coordinates
    {
        dataSize = sizeof(*lppt);
        RegQueryValueEx( hKey, szKeyName, 0, 0, (PBYTE)lppt, &dataSize );
    }
}

#define PREFIX_SKIP 8   // Skip first 8 characters of output

int output( char *format, ... )
{
    va_list argptr;
    va_start( argptr, format );
    char szBuffer[1024];
    
    int result = wvsprintf(szBuffer, format, argptr);   // Format the string
    
    unsigned cbOutput = 0;
    if ( result > PREFIX_SKIP)
        cbOutput = result - PREFIX_SKIP;
    
    // Decide which listbox this output is going to
    HWND hWndDest = 0;
    if ( 0 == strnicmp(szBuffer, "public: ", PREFIX_SKIP) )
    {
        hWndDest = g_hPublicsListBox;
        cbMaxPublics = (cbOutput > cbMaxPublics) ? cbOutput : cbMaxPublics;
    }
    else if ( 0 == strnicmp(szBuffer, "extern: ", PREFIX_SKIP) )
    {
        hWndDest = g_hExternsListBox;
        cbMaxExterns = (cbOutput > cbMaxExterns) ? cbOutput : cbMaxExterns;
    }
    
    // Add the string to the appropriate listbox
    if ( hWndDest )
        SendMessage(hWndDest, LB_ADDSTRING, 0, (LPARAM)(szBuffer+PREFIX_SKIP));

    va_end( argptr );
    return result;
}

void ProcessNewFile( void )
{
    char szFileName[MAX_PATH];

    fProcessingLib = TRUE;
    
    GetDlgItemText( g_hDlg, IDC_EDIT_FILENAME, szFileName,
                    sizeof(szFileName) );

    HCURSOR hOldCursor = SetCursor( LoadCursor(0,IDC_WAIT) );

    // Clear out the listboxes
    SendMessage( g_hPublicsListBox, LB_RESETCONTENT, 0, 0 );
    SendMessage( g_hExternsListBox, LB_RESETCONTENT, 0, 0 );

    // Turn off listbox updating
    SendMessage( g_hPublicsListBox, WM_SETREDRAW, 0, 0 );
    SendMessage( g_hExternsListBox, WM_SETREDRAW, 0, 0 );
        
    cbMaxPublics = cbMaxExterns = 0;
        
    // Fill with new information
    OBJ_FILE_TYPE fileType = DisplayObjectFile( szFileName );


    // Set the horizontal width of the listboxes so they scroll if necessary
    SendMessage( g_hPublicsListBox, LB_SETHORIZONTALEXTENT,
                    (g_cAveLBCharWidth * (cbMaxPublics+4)), 0 );
    SendMessage( g_hExternsListBox, LB_SETHORIZONTALEXTENT,
                    (g_cAveLBCharWidth * (cbMaxExterns+4)), 0 );
                
    // Turn listbox updating back on
    SendMessage( g_hPublicsListBox, WM_SETREDRAW, TRUE, 0 );
    SendMessage( g_hExternsListBox, WM_SETREDRAW, TRUE, 0 );
    
    PSTR pszFileType;
    
    switch ( fileType )
    {
        case OBJ_COFF_OBJ: pszFileType = "COFF OBJ"; break;
        case OBJ_COFF_LIB: pszFileType = "COFF LIB"; break;
        case OBJ_OMF_OBJ: pszFileType = "OMF OBJ"; break;
        case OBJ_OMF_LIB: pszFileType = "OMF LIB"; break;
        case OBJ_OMF_IMPLIB: pszFileType = "OMF IMPORT LIB"; break;
        default: pszFileType = "UNKNOWN FILE TYPE"; break;
    }
    
    SetDlgItemText( g_hDlg, IDC_STATIC_DESCRIPTION, pszFileType );
    
    SetCursor( hOldCursor );

    fProcessingLib = FALSE;
}

