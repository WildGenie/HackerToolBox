// keygenDlg.cpp : implementation file
//

#include <stdio.h>
#include <commctrl.h>
#include <windows.h>
#include <strings.h>

#include "stdafx.h"
#include "keygen.h"
#include "keygenDlg.h"

#include "../../../EnigmaSDK/VCx64/enigma_keygen_ide64.h"
#pragma comment (lib,"../../../EnigmaSDK/VCx64/keygen64.lib")

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeygenDlg dialog

CKeygenDlg::CKeygenDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CKeygenDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CKeygenDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CKeygenDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CKeygenDlg)
	// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
	DDX_Control(pDX, IDC_COMBOKMODE, com_key_mode);
	DDX_Control(pDX, IDC_COMBOKBASE, com_key_base);
	DDX_Control(pDX, IDC_COMBOCOUNTRIES, com_counties);
}

BEGIN_MESSAGE_MAP(CKeygenDlg, CDialog)
	//{{AFX_MSG_MAP(CKeygenDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTONCLOSE, &CKeygenDlg::OnBnClickedButtonclose)
	ON_BN_CLICKED(IDC_CHECKEXPIRATION, &CKeygenDlg::OnBnClickedCheckexpiration)
	ON_BN_CLICKED(IDC_CHECKHD, &CKeygenDlg::OnBnClickedCheckhd)
	ON_BN_CLICKED(IDC_CHECKREGAFTER, &CKeygenDlg::OnBnClickedCheckregafter)
	ON_BN_CLICKED(IDC_CHECKREGBEFORE, &CKeygenDlg::OnBnClickedCheckregbefore)
	ON_BN_CLICKED(IDC_CHECKCOUNTRY, &CKeygenDlg::OnBnClickedCheckcountry)
	ON_BN_CLICKED(IDC_CHECKEXECS, &CKeygenDlg::OnBnClickedCheckexecs)
	ON_BN_CLICKED(IDC_CHECKDAYS, &CKeygenDlg::OnBnClickedCheckdays)
	ON_BN_CLICKED(IDC_CHECKRTIME, &CKeygenDlg::OnBnClickedCheckrtime)
	ON_BN_CLICKED(IDC_CHECKGTIME, &CKeygenDlg::OnBnClickedCheckgtime)
	ON_BN_CLICKED(IDC_BUTTONGEN, &CKeygenDlg::OnBnClickedButtongen)
	ON_BN_CLICKED(IDC_BUTTONGENFP, &CKeygenDlg::OnBnClickedButtongenfp)
	ON_BN_CLICKED(IDC_BUTTONVER, &CKeygenDlg::OnBnClickedButtonver)
	ON_BN_CLICKED(IDC_BUTTONVERFP, &CKeygenDlg::OnBnClickedButtonverfp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeygenDlg message handlers

BOOL CKeygenDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	SetDlgItemTextA(IDC_EDITEXECS, "100");
	SetDlgItemTextA(IDC_EDITDAYS, "30");
	SetDlgItemTextA(IDC_EDITRTIME, "10");
	SetDlgItemTextA(IDC_EDITGTIME, "60");

	com_key_mode.SetCurSel(0);
	com_key_base.SetCurSel(3);

	for (int i = 0; i < ARRAYSIZE(KEY_COUNTRIES); i++)
	{
		com_counties.AddString(KEY_COUNTRIES[i].Name);
	}
	com_counties.SetCurSel(0);

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CKeygenDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CKeygenDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CKeygenDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CKeygenDlg::OnButtonClose() 
{
	// Close button was pressed
	ExitProcess(0);	
}

void CKeygenDlg::OnBnClickedButtonclose()
{
	// TODO: Add your control notification handler code here
	ExitProcess(0);
}

void CKeygenDlg::OnBnClickedCheckexpiration()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_DTPEXPIRATION);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKEXPIRATION));
}

void CKeygenDlg::OnBnClickedCheckhd()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_EDITHD);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKHD));
}

void CKeygenDlg::OnBnClickedCheckregafter()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_DTPREGAFTER);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKREGAFTER));
}

void CKeygenDlg::OnBnClickedCheckregbefore()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_DTPREGBEFORE);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKREGBEFORE));
}

void CKeygenDlg::OnBnClickedCheckcountry()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_COMBOCOUNTRIES);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKCOUNTRY));
}

void CKeygenDlg::OnBnClickedCheckexecs()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_EDITEXECS);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKEXECS));
}

void CKeygenDlg::OnBnClickedCheckdays()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_EDITDAYS);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKDAYS));
}

void CKeygenDlg::OnBnClickedCheckrtime()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_EDITRTIME);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKRTIME));
}

void CKeygenDlg::OnBnClickedCheckgtime()
{
	// TODO: Add your control notification handler code here
	CWnd* wnd;
	wnd = GetDlgItem(IDC_EDITGTIME);
	wnd->EnableWindow(IsDlgButtonChecked(IDC_CHECKGTIME));
}

void CKeygenDlg::OnBnClickedButtongen()
{
	// TODO: Add your control notification handler code here
  TKeyGenParams kp;
  char keybuffer[2048];
  char tmp[255];
  char username[255];
  char hardwareid[255];
  SYSTEMTIME lpDate;
  DWORD dwResult;

  // Clear params buffer
  memset(&kp, 0, sizeof(kp));
  // Clear key buffer
  memset(&keybuffer, 0, sizeof(keybuffer));

  kp.Key = (char*) keybuffer;
  kp.KeyLen = sizeof(keybuffer);

  // Fill User Info
  memset(&username, 0, sizeof(username));
  GetDlgItemText(IDC_EDITNAME, (char*)&username, sizeof(username));
  kp.RegInfo = (char*)&username;
  kp.RegInfoLen = strlen(kp.RegInfo);

  // Key expiration info
  if (IsDlgButtonChecked(IDC_CHECKEXPIRATION) != 0)
  {
	  kp.UseKeyExpiration = true;
      SendDlgItemMessage(IDC_DTPEXPIRATION, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
      kp.ExpirationYear = lpDate.wYear;
      kp.ExpirationMonth = lpDate.wMonth;
      kp.ExpirationDay = lpDate.wDay;
  }

  // Register After
  if (IsDlgButtonChecked(IDC_CHECKREGAFTER) != 0)
  {
	  kp.UseRegisterAfter = true;
      SendDlgItemMessage(IDC_DTPREGAFTER, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
	  kp.RegisterAfterYear = lpDate.wYear;
      kp.RegisterAfterMonth = lpDate.wMonth;
      kp.RegisterAfterDay = lpDate.wDay;
  }

  // Register Before
  if (IsDlgButtonChecked(IDC_CHECKREGBEFORE) != 0)
  {
	  kp.UseRegisterBefore = true;
      SendDlgItemMessage(IDC_DTPREGBEFORE, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
	  kp.RegisterBeforeYear = lpDate.wYear;
      kp.RegisterBeforeMonth = lpDate.wMonth;
      kp.RegisterBeforeDay = lpDate.wDay;
  }

  // Executions
  if (IsDlgButtonChecked(IDC_CHECKEXECS) != 0)
  {
	  kp.UseExecutionsLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITEXECS, (char*)&tmp, sizeof(tmp));
	  kp.ExecutionsCount = atoi((char*)&tmp);
  }

  // Days
  if (IsDlgButtonChecked(IDC_CHECKDAYS) != 0)
  {
	  kp.UseDaysLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITDAYS, (char*)&tmp, sizeof(tmp));
	  kp.DaysCount = atoi((char*)&tmp);
  }

  // Run-time
  if (IsDlgButtonChecked(IDC_CHECKRTIME) != 0)
  {
	  kp.UseRunTimeLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITRTIME, (char*)&tmp, sizeof(tmp));
	  kp.RunTimeMinutes = atoi((char*)&tmp);
  }

  // Global time
  if (IsDlgButtonChecked(IDC_CHECKGTIME) != 0)
  {
	  kp.UseGlobalTimeLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITGTIME, (char*)&tmp, sizeof(tmp));
	  kp.GlobalTimeMinutes = atoi((char*)&tmp);
  }

  // Country Lock
  if (IsDlgButtonChecked(IDC_CHECKCOUNTRY) != 0)
  {
	  kp.UseCountyLimit = true;
	  kp.CountryCode = KEY_COUNTRIES[com_counties.GetCurSel()].Code;
  }

  // Hardware ID
  if (IsDlgButtonChecked(IDC_CHECKHD) != 0)
  {
	  kp.UseHardwareLocking = true;
      memset(&hardwareid, 0, sizeof(hardwareid));
      GetDlgItemText(IDC_EDITHD, (char*)&hardwareid, sizeof(hardwareid));
      kp.HardwareID = (char*)&hardwareid;
  }

  // Crypt Sections
  if (IsDlgButtonChecked(IDC_CHECKS1) != 0) { kp.EncryptedSections[0] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS2) != 0) { kp.EncryptedSections[1] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS3) != 0) { kp.EncryptedSections[2] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS4) != 0) { kp.EncryptedSections[3] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS5) != 0) { kp.EncryptedSections[4] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS6) != 0) { kp.EncryptedSections[5] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS7) != 0) { kp.EncryptedSections[6] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS8) != 0) { kp.EncryptedSections[7] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS9) != 0) { kp.EncryptedSections[8] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS10) != 0) { kp.EncryptedSections[9] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS11) != 0) { kp.EncryptedSections[10] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS12) != 0) { kp.EncryptedSections[11] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS13) != 0) { kp.EncryptedSections[12] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS14) != 0) { kp.EncryptedSections[13] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS15) != 0) { kp.EncryptedSections[14] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS16) != 0) { kp.EncryptedSections[15] = true; }

  kp.KeyMode = com_key_mode.GetCurSel();
  kp.KeyBase = com_key_base.GetCurSel();

  kp.KeyWithHyphens = IsDlgButtonChecked(IDC_CHECKHYPHENS) != 0;

  kp.EncryptedConstant = 2113444489;

  switch (kp.KeyMode)
  {
    case RM_512:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" \
			"P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" \
			"WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" \
			"CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" \
			"HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" \
			"SRGDQ742B4742XF4MACRR747YDP5FZZ9D";
		char pr[] = "00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y" \
			"72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ" \
			"675JTTTNEK00DLFJ675JTTTNEK";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
    case RM_768:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E" \
			"2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF" \
			"4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG" \
			"DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ" \
			"PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ" \
			"LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ" \
			"WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2" \
			"YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4" \
			"ACSFEN4DR6TJR95";
		char pr[] = "019VRB95TKY456YC48LBS9FK34YN080VVPDJPPKU6XA9EPLX7HTVN3VST" \
			"TNJZFPH4HQAFY58R593KFKSNZ7WEZBA9AZ6PGN735EWEFUAEM3G8XVUFN" \
			"L2ZFRPXA4V8KVXE4M8GACUJAT7H3TTWZT9ZDE43ZF46HC01AHFR85MVR2" \
			"UP7K3N53M8MTNWBUP01AHFR85MVR2UP7K3N53M8MTNWBUP";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
    case RM_1024:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" \
			"TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" \
			"WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" \
			"5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" \
			"QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" \
			"NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" \
			"LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" \
			"U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" \
			"29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" \
			"2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" \
			"X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479";
		char pr[] = "020MLJ7XTRVLBDNUVMKGUFHCU8XBGMHHVRA0ADSHPBC7NVSZ82AM867XC" \
			"BELNKMR7CZ56C4SW8KKRD9WZLE5X992GZVSZXS5J6JG9SLDW3Y696TU4D" \
			"QZP778LVFKVRKANQD6FUGN2ACWUJM9ZK6ME7WXWDZ88LTWHME52RKUDKX" \
			"STT7RGWP7HFUJDGWEUG4ZHQ25DCQJ644CLEXRR3G020SAAREJB4WXZ4H2" \
			"JEH4AB4U8FGFTA4CAF020SAAREJB4WXZ4H2JEH4AB4U8FGFTA4CAF";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
    case RM_2048:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" \
			"PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" \
			"CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" \
			"C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" \
			"Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" \
			"QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" \
			"DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" \
			"SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" \
			"ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" \
			"YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" \
			"YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" \
			"RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" \
			"5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" \
			"L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" \
			"RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" \
			"6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" \
			"A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" \
			"LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" \
			"P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" \
			"5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" \
			"6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" \
			"XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V";
		char pr[] = "02DB825DUDFYHA88AG49NMM742HCQEJDKQQGDR6G3GL7MCED16DU9KTVE" \
			"47XQ3M92FFKX8FU9ZXT7AK7VTGGJSYQERCZBR8J2DE2CFE3VUU4W7JEQJ" \
			"L49HDUXBW7SNPCV8MHXM7EQHYPQK3GSPQYV5VWESQE4AYWFZHXN2UX7Z3" \
			"T3CV52XURB3YFKLUCY6CJTRACRVVDD568F6F28U74ABWCZ2ZMC32E83V3" \
			"4JZZPDBF3KEYQWREETGKQT6NANCMAD4XDEXW5LCYBJ3GMDJBM3E7FNK98" \
			"7JEUYEV7QNKGKNTDVMRG3G5L8NC9CNHQS8AVDMDBEGCG3DHGJUGPG2244" \
			"2C9LCD8FJ2LSDMQXLHCGCLP7ZSYQT2UJ4QFGU2CH3BTT3UADZMQSBAV33" \
			"B3Z2Y8Y8RRD9J754G02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGP" \
			"KEZ6PX2D02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGPKEZ6PX2D";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
    case RM_3072:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" \
			"6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" \
			"UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" \
			"9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" \
			"AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" \
			"7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" \
			"7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" \
			"A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" \
			"VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" \
			"4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" \
			"36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" \
			"GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" \
			"QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" \
			"SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" \
			"FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" \
			"4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" \
			"DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" \
			"8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" \
			"BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" \
			"2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" \
			"WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" \
			"55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" \
			"V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" \
			"C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK" \
			"UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" \
			"UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" \
			"BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" \
			"PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" \
			"LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" \
			"DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" \
			"X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" \
			"6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" \
			"JE94A8EP3Q6A2QTYKEE62MV4VJB2AB";
		char pr[] = "04DMQBFL5GKK4RXWEZYPEY8QB5GHBBGW3EY766DFF2Q6PLFLR4SSRWXBN" \
			"W5CFGFC84UJ8PKRDQQYWN9921AH8AGZAQRWJYZ7C3QUJJCJAAGGT5P5GG" \
			"LY6K5W4JZJDW7Y8EWS6SSYCS2MCR93MY9DG6VXLBRYVZWDX6XNFU286HM" \
			"AM9E82KJVZNYGC8RXRW43SFFWDLR8C96R58A42F3TGLXPVWLGMNPPAWS4" \
			"S2SSMNQLUPBAQMP7AUKAGV5CKL342W6UKQY3TUPXKGFXFES725PEX93UX" \
			"X4K8JRY3MPQ5S94VNPBXQ5N6LDBLWB67LBLDCGNQS3JEKW667UF8LA8Q6" \
			"B3AF4XGZKYB7BVVHF49DJUHSFJZRD63S4GMMAPQ8Q87HKN9G3J3575JEL" \
			"5C29NZLWQW6MSYWJ7S3NKLKPWGU75ZJXKEL6Z9V97HAMDYHM6ARCH58EP" \
			"WRPZUXN8RRWGCDFM6BH6XUTRTFE3VMAAZAUUKHKL6AFC2PCPXFRDWLVYP" \
			"ZKUGY8QDEZNECK9K5Y5MET9SRWQ36JF77XJ6NUKSMZ6DKUPEH4W43YQAE" \
			"CV7XVFWJ7ZTRVFQJZFU5BS8AL77YLCXDCR5VPFFZ9NP7EBBQ2AA04DP3S" \
			"86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87RUM4EV63GKPBRGSN3VX63FCS" \
			"646DLWSH86B542U3F04DP3S86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87R" \
			"UM4EV63GKPBRGSN3VX63FCS646DLWSH86B542U3F";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
    case RM_4096:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" \
			"RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" \
			"WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" \
			"ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" \
			"WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" \
			"Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" \
			"YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" \
			"JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" \
			"UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" \
			"HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" \
			"ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" \
			"4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" \
			"DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" \
			"4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" \
			"HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" \
			"VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" \
			"UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" \
			"RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" \
			"F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" \
			"HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" \
			"PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" \
			"MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" \
			"PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" \
			"RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM" \
			"477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" \
			"Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" \
			"3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" \
			"Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" \
			"N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" \
			"JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" \
			"R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" \
			"6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" \
			"FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" \
			"3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" \
			"4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" \
			"KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" \
			"QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" \
			"G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" \
			"F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" \
			"WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" \
			"SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" \
			"EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" \
			"4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" \
			"92SCV4DDJJ5EXMVBF";
		char pr[] = "067DN6F8YFBTWF5QH8MHJB39Z7VNN2P56HS8RPBURAWB8KPL8FQWX4HSP" \
			"RTY4HWFMFXAVX2YUY99G2U2KKK56CBE4BCPZWS3KJ98XRW4PY2CDQ3ALF" \
			"Y3HGJG42NRY9ZVGZZB59TE29KGC825BYBX3FRFMYBVN2VTHM8YM2KULXM" \
			"H24XSHNVK4HEQ9L5264844DMBFUUXSBA9PT9LEXT6449TMAMF7RL6KU6C" \
			"GP6FU9DNMJCNTUREF2U9WUMJBMXMMHWKWDG4VU5JQNFFNNWCP2YE2DGFD" \
			"N3H27NTNR58GBNTTZBRK66BKWNVMF8H59KALB6K93Y8UWDUWV5HJZGV8X" \
			"3AS5EG982DYV4W9CQ3GRRFRR8NABQC98FTAG465SXQ3JPN7X7VULQZX4X" \
			"UK68URBFPGCW2UPBYH6CRG6C7YBRAURM2KMGN5L8XH4AUQN8WM4P454WN" \
			"NWRE5SQEC78FK3LHHQU5VLXLYYN8F2NXGG7CCQ92EEC63ZE6S7CC7RTML" \
			"UMM3PAXPL5CJZFL26JNNYPVLAHM75NDL8AS8JR48PFXK49D4A6TY2ZU9Y" \
			"XX2Y2TLA3J8T56EPY236FEDGZEHTQR73NE2Y7LKL7423FFKGGPWYL8PB5" \
			"VWD54PG328ACE6V8VLSGVP9VJMMWS2VDVU459C8K5XK869Z5KM4JWHAVE" \
			"G56ZESC6HHJ423N6SAH2DW2UQZDQHSMKWUCHPUKZZPJXCQXF55Q3BJW6Z" \
			"QYK4HM4Q8XWU8NT844E8YM96EGHSYEUKAJ3QDXANN2DELSGARH7LR2XH9" \
			"UQBQNXGPZGB6JTEQP8HAQK5ZZYJE067DWX6C2JJ7L2HE4NGVXZV5XH9RD" \
			"P9SNG4WZTC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGL" \
			"U5EMNMBREQN5MYTYHGYK067DWX6C2JJ7L2HE4NGVXZV5XH9RDP9SNG4WZ" \
			"TC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGLU5EMNMBR" \
			"EQN5MYTYHGYK";
		kp.PublicKey = pl;
		kp.PrivateKey = pr;
      break;
    }
  }

  // Generate reg. key
  dwResult = KG_GenerateRegistrationKey(&kp);

  if (dwResult == EP_NO_ERROR)
  {
    SetDlgItemText(IDC_EDITKEY, kp.Key);
  } else
  {
	char* sError;
    switch (dwResult)
    {
      case EP_ERROR_UNKNOWN:
        sError = "EP_ERROR_UNKNOWN";
        break;
      case EP_ERROR_KEYBUFFEREMPTY:
        sError = "EP_ERROR_KEYBUFFEREMPTY";
        break;
      case EP_ERROR_KEYBUFFERISLESS:
        sError = "EP_ERROR_KEYBUFFERISLESS";
        break;
      case EP_ERROR_REGINFOEMPTY:
        sError = "EP_ERROR_REGINFOEMPTY";
        break;
      case EP_ERROR_REGINFOTOOLARGE:
        sError = "EP_ERROR_REGINFOTOOLARGE";
        break;
      case EP_ERROR_PRIVATEKEYISNOTSET:
        sError = "EP_ERROR_PRIVATEKEYISNOTSET";
        break;
      case EP_ERROR_PUBLICKEYISNOTSET:
        sError = "EP_ERROR_PUBLICKEYISNOTSET";
        break;
      case EP_ERROR_PRIVATEKEYISINVALID:
        sError = "EP_ERROR_PRIVATEKEYISINVALID";
        break;
      case EP_ERROR_PUBLICKEYISINVALID:
        sError = "EP_ERROR_PUBLICKEYISINVALID";
        break;
      case EP_ERROR_KEYMODEISINVALID:
        sError = "EP_ERROR_KEYMODEISINVALID";
        break;
      case EP_ERROR_KEYBASEISINVALID:
        sError = "EP_ERROR_KEYBASEISINVALID";
        break;
      case EP_ERROR_CURRENTDATEISINVALID:
        sError = "EP_ERROR_CURRENTDATEISINVALID";
        break;
      case EP_ERROR_EXPIRATIONDATEISINVALID:
        sError = "EP_ERROR_EXPIRATIONDATEISINVALID";
        break;
      case EP_ERROR_KEYISINVALID:
        sError = "EP_ERROR_KEYISINVALID";
        break;
      case EP_ERROR_HARDWAREID:
        sError = "EP_ERROR_HARDWAREID";
        break;
      case EP_ERROR_HARDWAREBUFFEREMPTY:
        sError = "EP_ERROR_HARDWAREBUFFEREMPTY";
        break;
      case EP_ERROR_HARDWAREIDINVALIDFORKEY:
        sError = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
        break;
      case EP_ERROR_PROJECTFILENOTFOUND:
        sError = "EP_ERROR_PROJECTFILENOTFOUND";
        break;
      case EP_ERROR_INVALIDPROJECTFILE:
        sError = "EP_ERROR_INVALIDPROJECTFILE";
        break;
      case EP_ERROR_EXECUTIONSNUMBERINVALID:
        sError = "EP_ERROR_EXECUTIONSNUMBERINVALID";
        break;
      case EP_ERROR_DAYSNUMBERINVALID:
        sError = "EP_ERROR_DAYSNUMBERINVALID";
        break;
      case EP_ERROR_COUNTRYCODEINVALID:
        sError = "EP_ERROR_COUNTRYCODEINVALID";
        break;
      case EP_ERROR_RUNTIMEINVALID:
        sError = "EP_ERROR_RUNTIMEINVALID";
        break;
      case EP_ERROR_GLOBALTIMEINVALID:
        sError = "EP_ERROR_GLOBALTIMEINVALID";
        break;
      case EP_ERROR_INSTALLBEFOREINVALID:
        sError = "EP_ERROR_INSTALLBEFOREINVALID";
        break;
      case EP_ERROR_INSTALLAFTERINVALID:
        sError = "EP_ERROR_INSTALLAFTERINVALID";
        break;
      default:
        sError = "Unknown error";
        break;
    }
	SetDlgItemText(IDC_EDITKEY, sError);
  }
}

void CKeygenDlg::OnBnClickedButtongenfp()
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
  TKeyGenParams kp;
  char keybuffer[2048];
  char tmp[255];
  char username[255];
  char hardwareid[255];
  SYSTEMTIME lpDate;
  DWORD dwResult;

  // Clear params buffer
  memset(&kp, 0, sizeof(kp));
  // Clear key buffer
  memset(&keybuffer, 0, sizeof(keybuffer));

  kp.Key = (char*) keybuffer;
  kp.KeyLen = sizeof(keybuffer);

  // Fill User Info
  memset(&username, 0, sizeof(username));
  GetDlgItemText(IDC_EDITNAME, (char*)&username, sizeof(username));
  kp.RegInfo = (char*)&username;
  kp.RegInfoLen = strlen(kp.RegInfo);

  // Key expiration info
  if (IsDlgButtonChecked(IDC_CHECKEXPIRATION) != 0)
  {
	  kp.UseKeyExpiration = true;
      SendDlgItemMessage(IDC_DTPEXPIRATION, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
      kp.ExpirationYear = lpDate.wYear;
      kp.ExpirationMonth = lpDate.wMonth;
      kp.ExpirationDay = lpDate.wDay;
  }

  // Register After
  if (IsDlgButtonChecked(IDC_CHECKREGAFTER) != 0)
  {
	  kp.UseRegisterAfter = true;
      SendDlgItemMessage(IDC_DTPREGAFTER, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
	  kp.RegisterAfterYear = lpDate.wYear;
      kp.RegisterAfterMonth = lpDate.wMonth;
      kp.RegisterAfterDay = lpDate.wDay;
  }

  // Register Before
  if (IsDlgButtonChecked(IDC_CHECKREGBEFORE) != 0)
  {
	  kp.UseRegisterBefore = true;
      SendDlgItemMessage(IDC_DTPREGBEFORE, DTM_GETSYSTEMTIME, GDT_VALID, (LPARAM)&lpDate);
	  kp.RegisterBeforeYear = lpDate.wYear;
      kp.RegisterBeforeMonth = lpDate.wMonth;
      kp.RegisterBeforeDay = lpDate.wDay;
  }

  // Executions
  if (IsDlgButtonChecked(IDC_CHECKEXECS) != 0)
  {
	  kp.UseExecutionsLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITEXECS, (char*)&tmp, sizeof(tmp));
	  kp.ExecutionsCount = atoi((char*)&tmp);
  }

  // Days
  if (IsDlgButtonChecked(IDC_CHECKDAYS) != 0)
  {
	  kp.UseDaysLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITDAYS, (char*)&tmp, sizeof(tmp));
	  kp.DaysCount = atoi((char*)&tmp);
  }

  // Run-time
  if (IsDlgButtonChecked(IDC_CHECKRTIME) != 0)
  {
	  kp.UseRunTimeLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITRTIME, (char*)&tmp, sizeof(tmp));
	  kp.RunTimeMinutes = atoi((char*)&tmp);
  }

  // Global time
  if (IsDlgButtonChecked(IDC_CHECKGTIME) != 0)
  {
	  kp.UseGlobalTimeLimit = true;
      memset(&tmp, 0, sizeof(tmp));
      GetDlgItemText(IDC_EDITGTIME, (char*)&tmp, sizeof(tmp));
	  kp.GlobalTimeMinutes = atoi((char*)&tmp);
  }

  // Country Lock
  if (IsDlgButtonChecked(IDC_CHECKCOUNTRY) != 0)
  {
	  kp.UseCountyLimit = true;
	  kp.CountryCode = KEY_COUNTRIES[com_counties.GetCurSel()].Code;
  }

  // Hardware ID
  if (IsDlgButtonChecked(IDC_CHECKHD) != 0)
  {
	  kp.UseHardwareLocking = true;
      memset(&hardwareid, 0, sizeof(hardwareid));
      GetDlgItemText(IDC_EDITHD, (char*)&hardwareid, sizeof(hardwareid));
      kp.HardwareID = (char*)&hardwareid;
  }

  // Crypt Sections
  if (IsDlgButtonChecked(IDC_CHECKS1) != 0) { kp.EncryptedSections[0] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS2) != 0) { kp.EncryptedSections[1] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS3) != 0) { kp.EncryptedSections[2] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS4) != 0) { kp.EncryptedSections[3] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS5) != 0) { kp.EncryptedSections[4] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS6) != 0) { kp.EncryptedSections[5] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS7) != 0) { kp.EncryptedSections[6] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS8) != 0) { kp.EncryptedSections[7] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS9) != 0) { kp.EncryptedSections[8] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS10) != 0) { kp.EncryptedSections[9] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS11) != 0) { kp.EncryptedSections[10] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS12) != 0) { kp.EncryptedSections[11] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS13) != 0) { kp.EncryptedSections[12] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS14) != 0) { kp.EncryptedSections[13] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS15) != 0) { kp.EncryptedSections[14] = true; }
  if (IsDlgButtonChecked(IDC_CHECKS16) != 0) { kp.EncryptedSections[15] = true; }

  kp.KeyWithHyphens = IsDlgButtonChecked(IDC_CHECKHYPHENS) != 0;

  // Generate reg. key
  dwResult = KG_GenerateRegistrationKeyFromProject("default64.enigma", &kp);

  if (dwResult == EP_NO_ERROR)
  {
    SetDlgItemText(IDC_EDITKEY, kp.Key);
  } else
  {
	char* sError;
    switch (dwResult)
    {
      case EP_ERROR_UNKNOWN:
        sError = "EP_ERROR_UNKNOWN";
        break;
      case EP_ERROR_KEYBUFFEREMPTY:
        sError = "EP_ERROR_KEYBUFFEREMPTY";
        break;
      case EP_ERROR_KEYBUFFERISLESS:
        sError = "EP_ERROR_KEYBUFFERISLESS";
        break;
      case EP_ERROR_REGINFOEMPTY:
        sError = "EP_ERROR_REGINFOEMPTY";
        break;
      case EP_ERROR_REGINFOTOOLARGE:
        sError = "EP_ERROR_REGINFOTOOLARGE";
        break;
      case EP_ERROR_PRIVATEKEYISNOTSET:
        sError = "EP_ERROR_PRIVATEKEYISNOTSET";
        break;
      case EP_ERROR_PUBLICKEYISNOTSET:
        sError = "EP_ERROR_PUBLICKEYISNOTSET";
        break;
      case EP_ERROR_PRIVATEKEYISINVALID:
        sError = "EP_ERROR_PRIVATEKEYISINVALID";
        break;
      case EP_ERROR_PUBLICKEYISINVALID:
        sError = "EP_ERROR_PUBLICKEYISINVALID";
        break;
      case EP_ERROR_KEYMODEISINVALID:
        sError = "EP_ERROR_KEYMODEISINVALID";
        break;
      case EP_ERROR_KEYBASEISINVALID:
        sError = "EP_ERROR_KEYBASEISINVALID";
        break;
      case EP_ERROR_CURRENTDATEISINVALID:
        sError = "EP_ERROR_CURRENTDATEISINVALID";
        break;
      case EP_ERROR_EXPIRATIONDATEISINVALID:
        sError = "EP_ERROR_EXPIRATIONDATEISINVALID";
        break;
      case EP_ERROR_KEYISINVALID:
        sError = "EP_ERROR_KEYISINVALID";
        break;
      case EP_ERROR_HARDWAREID:
        sError = "EP_ERROR_HARDWAREID";
        break;
      case EP_ERROR_HARDWAREBUFFEREMPTY:
        sError = "EP_ERROR_HARDWAREBUFFEREMPTY";
        break;
      case EP_ERROR_HARDWAREIDINVALIDFORKEY:
        sError = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
        break;
      case EP_ERROR_PROJECTFILENOTFOUND:
        sError = "EP_ERROR_PROJECTFILENOTFOUND";
        break;
      case EP_ERROR_INVALIDPROJECTFILE:
        sError = "EP_ERROR_INVALIDPROJECTFILE";
        break;
      case EP_ERROR_EXECUTIONSNUMBERINVALID:
        sError = "EP_ERROR_EXECUTIONSNUMBERINVALID";
        break;
      case EP_ERROR_DAYSNUMBERINVALID:
        sError = "EP_ERROR_DAYSNUMBERINVALID";
        break;
      case EP_ERROR_COUNTRYCODEINVALID:
        sError = "EP_ERROR_COUNTRYCODEINVALID";
        break;
      case EP_ERROR_RUNTIMEINVALID:
        sError = "EP_ERROR_RUNTIMEINVALID";
        break;
      case EP_ERROR_GLOBALTIMEINVALID:
        sError = "EP_ERROR_GLOBALTIMEINVALID";
        break;
      case EP_ERROR_INSTALLBEFOREINVALID:
        sError = "EP_ERROR_INSTALLBEFOREINVALID";
        break;
      case EP_ERROR_INSTALLAFTERINVALID:
        sError = "EP_ERROR_INSTALLAFTERINVALID";
        break;
      default:
        sError = "Unknown error";
        break;
    }
	SetDlgItemText(IDC_EDITKEY, sError);
  }
}

void CKeygenDlg::OnBnClickedButtonver()
{
	// TODO: Add your control notification handler code here
  TKeyVerifyParams kv;
  char keybuffer[2048];
  char username[255];
  char hardwareid[255];
  DWORD dwResult;

  // Clear params buffer
  memset(&kv, 0, sizeof(kv));
  // Clear key buffer
  memset(&keybuffer, 0, sizeof(keybuffer));
  GetDlgItemText(IDC_EDITKEY, (char*)&keybuffer, sizeof(keybuffer));
  kv.Key = (char*) keybuffer;
  kv.KeyLen = strlen(kv.Key);

  // Fill User Info
  memset(&username, 0, sizeof(username));
  GetDlgItemText(IDC_EDITNAME, (char*)&username, sizeof(username));
  kv.RegInfo = (char*)&username;
  kv.RegInfoLen = strlen(kv.RegInfo);

  // Hardware ID
  if (IsDlgButtonChecked(IDC_CHECKHD) != 0)
  {
	  kv.UseHardwareLocking = true;
      memset(&hardwareid, 0, sizeof(hardwareid));
      GetDlgItemText(IDC_EDITHD, (char*)&hardwareid, sizeof(hardwareid));
      kv.HardwareID = (char*)&hardwareid;
  }

  kv.KeyMode = com_key_mode.GetCurSel();
  kv.KeyBase = com_key_base.GetCurSel();

  kv.EncryptedConstant = 2113444489;

  switch (kv.KeyMode)
  {
    case RM_512:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" \
			"P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" \
			"WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" \
			"CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" \
			"HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" \
			"SRGDQ742B4742XF4MACRR747YDP5FZZ9D";
		kv.PublicKey = pl;
      break;
    }
    case RM_768:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E" \
			"2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF" \
			"4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG" \
			"DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ" \
			"PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ" \
			"LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ" \
			"WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2" \
			"YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4" \
			"ACSFEN4DR6TJR95";
		kv.PublicKey = pl;
      break;
    }
    case RM_1024:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" \
			"TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" \
			"WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" \
			"5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" \
			"QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" \
			"NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" \
			"LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" \
			"U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" \
			"29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" \
			"2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" \
			"X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479";
		kv.PublicKey = pl;
      break;
    }
    case RM_2048:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" \
			"PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" \
			"CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" \
			"C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" \
			"Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" \
			"QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" \
			"DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" \
			"SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" \
			"ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" \
			"YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" \
			"YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" \
			"RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" \
			"5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" \
			"L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" \
			"RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" \
			"6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" \
			"A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" \
			"LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" \
			"P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" \
			"5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" \
			"6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" \
			"XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V";
		kv.PublicKey = pl;
      break;
    }
    case RM_3072:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" \
			"6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" \
			"UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" \
			"9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" \
			"AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" \
			"7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" \
			"7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" \
			"A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" \
			"VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" \
			"4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" \
			"36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" \
			"GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" \
			"QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" \
			"SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" \
			"FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" \
			"4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" \
			"DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" \
			"8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" \
			"BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" \
			"2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" \
			"WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" \
			"55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" \
			"V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" \
			"C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK" \
			"UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" \
			"UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" \
			"BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" \
			"PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" \
			"LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" \
			"DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" \
			"X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" \
			"6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" \
			"JE94A8EP3Q6A2QTYKEE62MV4VJB2AB";
		kv.PublicKey = pl;
      break;
    }
    case RM_4096:
    {
		char pl[] = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" \
			"RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" \
			"WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" \
			"ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" \
			"WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" \
			"Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" \
			"YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" \
			"JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" \
			"UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" \
			"HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" \
			"ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" \
			"4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" \
			"DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" \
			"4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" \
			"HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" \
			"VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" \
			"UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" \
			"RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" \
			"F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" \
			"HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" \
			"PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" \
			"MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" \
			"PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" \
			"RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM" \
			"477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" \
			"Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" \
			"3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" \
			"Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" \
			"N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" \
			"JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" \
			"R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" \
			"6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" \
			"FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" \
			"3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" \
			"4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" \
			"KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" \
			"QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" \
			"G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" \
			"F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" \
			"WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" \
			"SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" \
			"EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" \
			"4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" \
			"92SCV4DDJJ5EXMVBF";
		kv.PublicKey = pl;
      break;
    }
  }

  // Generate reg. key
  dwResult = KG_VerifyRegistrationInfo(&kv);

  if (dwResult == EP_NO_ERROR)
  {
	  char tmp[255];
	  // Creation date
	  char mes[2048] = "Valid Registration Key!\n";
	  sprintf(tmp, "Creation date: %d/%d/%d\n", kv.CreationDay, kv.CreationMonth, kv.CreationYear);
	  strcat(mes, tmp);
	  // Expiration date
	  if (kv.UseKeyExpiration)
	  {
		  sprintf(tmp, "Expiration date: %d/%d/%d\n", kv.ExpirationDay, kv.ExpirationMonth, kv.ExpirationYear);
		  strcat(mes, tmp);
	  }
	  // Register After date
	  if (kv.UseRegisterAfter)
	  {
		  sprintf(tmp, "Register After date: %d/%d/%d\n", kv.RegisterAfterDay, kv.RegisterAfterMonth, kv.RegisterAfterYear);
		  strcat(mes, tmp);
	  }
	  // Register Before date
	  if (kv.UseRegisterBefore)
	  {
		  sprintf(tmp, "Register Before date: %d/%d/%d\n", kv.RegisterBeforeDay, kv.RegisterBeforeMonth, kv.RegisterBeforeYear);
		  strcat(mes, tmp);
	  }
	  // Executions
	  if (kv.UseExecutionsLimit)
	  {
		  sprintf(tmp, "Executions: %d\n", kv.ExecutionsCount);
		  strcat(mes, tmp);
	  }
	  // Days
	  if (kv.UseDaysLimit)
	  {
		  sprintf(tmp, "Days: %d\n", kv.DaysCount);
		  strcat(mes, tmp);
	  }
	  // Run-time
	  if (kv.UseRunTimeLimit)
	  {
		  sprintf(tmp, "Run-time: %d minutes\n", kv.RunTimeMinutes);
		  strcat(mes, tmp);
	  }
	  // Global Time
	  if (kv.UseGlobalTimeLimit)
	  {
		  sprintf(tmp, "Global Time: %d minutes\n", kv.GlobalTimeMinutes);
		  strcat(mes, tmp);
	  }
	  // Country
	  if (kv.UseCountyLimit)
	  {
		  for (int i = 0; i < ARRAYSIZE(KEY_COUNTRIES); i++)
		  {
			  if (kv.CountryCode == KEY_COUNTRIES[i].Code)
			  {
				  sprintf(tmp, "Country Lock: %s\n", KEY_COUNTRIES[i].Name);
				  strcat(mes, tmp);
				  break;
			  }
		  }
	  }
	  for (int i = 0; i < NUMBER_OF_CRYPTED_SECTIONS; i++)
	  {
		  if (kv.EncryptedSections[i])
		  {
			  sprintf(tmp, "Unlocked section: #%d\n", i + 1);
			  strcat(mes, tmp);
		  }
	  }
	  MessageBox(mes);
  } else
  {
	char* sError;
    switch (dwResult)
    {
      case EP_ERROR_UNKNOWN:
        sError = "EP_ERROR_UNKNOWN";
        break;
      case EP_ERROR_KEYBUFFEREMPTY:
        sError = "EP_ERROR_KEYBUFFEREMPTY";
        break;
      case EP_ERROR_KEYBUFFERISLESS:
        sError = "EP_ERROR_KEYBUFFERISLESS";
        break;
      case EP_ERROR_REGINFOEMPTY:
        sError = "EP_ERROR_REGINFOEMPTY";
        break;
      case EP_ERROR_REGINFOTOOLARGE:
        sError = "EP_ERROR_REGINFOTOOLARGE";
        break;
      case EP_ERROR_PRIVATEKEYISNOTSET:
        sError = "EP_ERROR_PRIVATEKEYISNOTSET";
        break;
      case EP_ERROR_PUBLICKEYISNOTSET:
        sError = "EP_ERROR_PUBLICKEYISNOTSET";
        break;
      case EP_ERROR_PRIVATEKEYISINVALID:
        sError = "EP_ERROR_PRIVATEKEYISINVALID";
        break;
      case EP_ERROR_PUBLICKEYISINVALID:
        sError = "EP_ERROR_PUBLICKEYISINVALID";
        break;
      case EP_ERROR_KEYMODEISINVALID:
        sError = "EP_ERROR_KEYMODEISINVALID";
        break;
      case EP_ERROR_KEYBASEISINVALID:
        sError = "EP_ERROR_KEYBASEISINVALID";
        break;
      case EP_ERROR_CURRENTDATEISINVALID:
        sError = "EP_ERROR_CURRENTDATEISINVALID";
        break;
      case EP_ERROR_EXPIRATIONDATEISINVALID:
        sError = "EP_ERROR_EXPIRATIONDATEISINVALID";
        break;
      case EP_ERROR_KEYISINVALID:
        sError = "EP_ERROR_KEYISINVALID";
        break;
      case EP_ERROR_HARDWAREID:
        sError = "EP_ERROR_HARDWAREID";
        break;
      case EP_ERROR_HARDWAREBUFFEREMPTY:
        sError = "EP_ERROR_HARDWAREBUFFEREMPTY";
        break;
      case EP_ERROR_HARDWAREIDINVALIDFORKEY:
        sError = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
        break;
      case EP_ERROR_PROJECTFILENOTFOUND:
        sError = "EP_ERROR_PROJECTFILENOTFOUND";
        break;
      case EP_ERROR_INVALIDPROJECTFILE:
        sError = "EP_ERROR_INVALIDPROJECTFILE";
        break;
      case EP_ERROR_EXECUTIONSNUMBERINVALID:
        sError = "EP_ERROR_EXECUTIONSNUMBERINVALID";
        break;
      case EP_ERROR_DAYSNUMBERINVALID:
        sError = "EP_ERROR_DAYSNUMBERINVALID";
        break;
      case EP_ERROR_COUNTRYCODEINVALID:
        sError = "EP_ERROR_COUNTRYCODEINVALID";
        break;
      case EP_ERROR_RUNTIMEINVALID:
        sError = "EP_ERROR_RUNTIMEINVALID";
        break;
      case EP_ERROR_GLOBALTIMEINVALID:
        sError = "EP_ERROR_GLOBALTIMEINVALID";
        break;
      case EP_ERROR_INSTALLBEFOREINVALID:
        sError = "EP_ERROR_INSTALLBEFOREINVALID";
        break;
      case EP_ERROR_INSTALLAFTERINVALID:
        sError = "EP_ERROR_INSTALLAFTERINVALID";
        break;
      default:
        sError = "Unknown error";
        break;
    }
	MessageBox(sError);
  }
}

void CKeygenDlg::OnBnClickedButtonverfp()
{
	// TODO: Add your control notification handler code here
  TKeyVerifyParams kv;
  char keybuffer[2048];
  char username[255];
  char hardwareid[255];
  DWORD dwResult;

  // Clear params buffer
  memset(&kv, 0, sizeof(kv));
  // Clear key buffer
  memset(&keybuffer, 0, sizeof(keybuffer));
  GetDlgItemText(IDC_EDITKEY, (char*)&keybuffer, sizeof(keybuffer));
  kv.Key = (char*) keybuffer;
  kv.KeyLen = strlen(kv.Key);

  // Fill User Info
  memset(&username, 0, sizeof(username));
  GetDlgItemText(IDC_EDITNAME, (char*)&username, sizeof(username));
  kv.RegInfo = (char*)&username;
  kv.RegInfoLen = strlen(kv.RegInfo);

  // Hardware ID
  if (IsDlgButtonChecked(IDC_CHECKHD) != 0)
  {
	  kv.UseHardwareLocking = true;
      memset(&hardwareid, 0, sizeof(hardwareid));
      GetDlgItemText(IDC_EDITHD, (char*)&hardwareid, sizeof(hardwareid));
      kv.HardwareID = (char*)&hardwareid;
  }

  // Generate reg. key
  dwResult = KG_VerifyRegistrationInfoFromProject("default64.enigma", &kv);

  if (dwResult == EP_NO_ERROR)
  {
	  char tmp[255];
	  // Creation date
	  char mes[2048] = "Valid Registration Key!\n";
	  sprintf(tmp, "Creation date: %d/%d/%d\n", kv.CreationDay, kv.CreationMonth, kv.CreationYear);
	  strcat(mes, tmp);
	  // Expiration date
	  if (kv.UseKeyExpiration)
	  {
		  sprintf(tmp, "Expiration date: %d/%d/%d\n", kv.ExpirationDay, kv.ExpirationMonth, kv.ExpirationYear);
		  strcat(mes, tmp);
	  }
	  // Register After date
	  if (kv.UseRegisterAfter)
	  {
		  sprintf(tmp, "Register After date: %d/%d/%d\n", kv.RegisterAfterDay, kv.RegisterAfterMonth, kv.RegisterAfterYear);
		  strcat(mes, tmp);
	  }
	  // Register Before date
	  if (kv.UseRegisterBefore)
	  {
		  sprintf(tmp, "Register Before date: %d/%d/%d\n", kv.RegisterBeforeDay, kv.RegisterBeforeMonth, kv.RegisterBeforeYear);
		  strcat(mes, tmp);
	  }
	  // Executions
	  if (kv.UseExecutionsLimit)
	  {
		  sprintf(tmp, "Executions: %d\n", kv.ExecutionsCount);
		  strcat(mes, tmp);
	  }
	  // Days
	  if (kv.UseDaysLimit)
	  {
		  sprintf(tmp, "Days: %d\n", kv.DaysCount);
		  strcat(mes, tmp);
	  }
	  // Run-time
	  if (kv.UseRunTimeLimit)
	  {
		  sprintf(tmp, "Run-time: %d minutes\n", kv.RunTimeMinutes);
		  strcat(mes, tmp);
	  }
	  // Global Time
	  if (kv.UseGlobalTimeLimit)
	  {
		  sprintf(tmp, "Global Time: %d minutes\n", kv.GlobalTimeMinutes);
		  strcat(mes, tmp);
	  }
	  // Country
	  if (kv.UseCountyLimit)
	  {
		  for (int i = 0; i < ARRAYSIZE(KEY_COUNTRIES); i++)
		  {
			  if (kv.CountryCode == KEY_COUNTRIES[i].Code)
			  {
				  sprintf(tmp, "Country Lock: %s\n", KEY_COUNTRIES[i].Name);
				  strcat(mes, tmp);
				  break;
			  }
		  }
	  }
	  for (int i = 0; i < NUMBER_OF_CRYPTED_SECTIONS; i++)
	  {
		  if (kv.EncryptedSections[i])
		  {
			  sprintf(tmp, "Unlocked section: #%d\n", i + 1);
			  strcat(mes, tmp);
		  }
	  }
	  MessageBox(mes);
  } else
  {
	char* sError;
    switch (dwResult)
    {
      case EP_ERROR_UNKNOWN:
        sError = "EP_ERROR_UNKNOWN";
        break;
      case EP_ERROR_KEYBUFFEREMPTY:
        sError = "EP_ERROR_KEYBUFFEREMPTY";
        break;
      case EP_ERROR_KEYBUFFERISLESS:
        sError = "EP_ERROR_KEYBUFFERISLESS";
        break;
      case EP_ERROR_REGINFOEMPTY:
        sError = "EP_ERROR_REGINFOEMPTY";
        break;
      case EP_ERROR_REGINFOTOOLARGE:
        sError = "EP_ERROR_REGINFOTOOLARGE";
        break;
      case EP_ERROR_PRIVATEKEYISNOTSET:
        sError = "EP_ERROR_PRIVATEKEYISNOTSET";
        break;
      case EP_ERROR_PUBLICKEYISNOTSET:
        sError = "EP_ERROR_PUBLICKEYISNOTSET";
        break;
      case EP_ERROR_PRIVATEKEYISINVALID:
        sError = "EP_ERROR_PRIVATEKEYISINVALID";
        break;
      case EP_ERROR_PUBLICKEYISINVALID:
        sError = "EP_ERROR_PUBLICKEYISINVALID";
        break;
      case EP_ERROR_KEYMODEISINVALID:
        sError = "EP_ERROR_KEYMODEISINVALID";
        break;
      case EP_ERROR_KEYBASEISINVALID:
        sError = "EP_ERROR_KEYBASEISINVALID";
        break;
      case EP_ERROR_CURRENTDATEISINVALID:
        sError = "EP_ERROR_CURRENTDATEISINVALID";
        break;
      case EP_ERROR_EXPIRATIONDATEISINVALID:
        sError = "EP_ERROR_EXPIRATIONDATEISINVALID";
        break;
      case EP_ERROR_KEYISINVALID:
        sError = "EP_ERROR_KEYISINVALID";
        break;
      case EP_ERROR_HARDWAREID:
        sError = "EP_ERROR_HARDWAREID";
        break;
      case EP_ERROR_HARDWAREBUFFEREMPTY:
        sError = "EP_ERROR_HARDWAREBUFFEREMPTY";
        break;
      case EP_ERROR_HARDWAREIDINVALIDFORKEY:
        sError = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
        break;
      case EP_ERROR_PROJECTFILENOTFOUND:
        sError = "EP_ERROR_PROJECTFILENOTFOUND";
        break;
      case EP_ERROR_INVALIDPROJECTFILE:
        sError = "EP_ERROR_INVALIDPROJECTFILE";
        break;
      case EP_ERROR_EXECUTIONSNUMBERINVALID:
        sError = "EP_ERROR_EXECUTIONSNUMBERINVALID";
        break;
      case EP_ERROR_DAYSNUMBERINVALID:
        sError = "EP_ERROR_DAYSNUMBERINVALID";
        break;
      case EP_ERROR_COUNTRYCODEINVALID:
        sError = "EP_ERROR_COUNTRYCODEINVALID";
        break;
      case EP_ERROR_RUNTIMEINVALID:
        sError = "EP_ERROR_RUNTIMEINVALID";
        break;
      case EP_ERROR_GLOBALTIMEINVALID:
        sError = "EP_ERROR_GLOBALTIMEINVALID";
        break;
      case EP_ERROR_INSTALLBEFOREINVALID:
        sError = "EP_ERROR_INSTALLBEFOREINVALID";
        break;
      case EP_ERROR_INSTALLAFTERINVALID:
        sError = "EP_ERROR_INSTALLAFTERINVALID";
        break;
      default:
        sError = "Unknown error";
        break;
    }
	MessageBox(sError);
  }
}
