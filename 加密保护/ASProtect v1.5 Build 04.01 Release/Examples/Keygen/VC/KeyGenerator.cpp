// KeyGenerator.cpp: implementation of the CKeyGenerator class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "KeyGenerator.h"
#include "asp_keygen.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CKeyGenerator::CKeyGenerator()
{
	m_hKeyGenDll = NULL;
	m_pRegKeyGenerate = NULL;
	m_pRegKeySave = NULL;
	m_pCheckHardwareID = NULL;
}

CKeyGenerator::~CKeyGenerator()
{
	if(m_hKeyGenDll != NULL)
		FreeLibrary(m_hKeyGenDll);
}

void CKeyGenerator::InitProject(LPCTSTR lpszKeyA, LPCTSTR lpszKeyE, LPCTSTR lpszKeyN)
{
	m_strKeyA = lpszKeyA;
	m_strKeyE = lpszKeyE;
	m_strKeyN = lpszKeyN;
}

int CKeyGenerator::RegistrationKeyGenerate(LPCTSTR lpszRegInfo, LPCTSTR lpszHardwareID, CTime *pExpirationDate)
{
	PARAMS  P;
	m_strRegKey.Empty();

	if(m_pRegKeyGenerate == NULL)
		return 0;

	memset(&P, 0, sizeof(PARAMS));
	P.RegInfo = (LPBYTE)(LPCTSTR)lpszRegInfo;
	P.RegInfoLen = lstrlen(lpszRegInfo);

	ASSERT(lpszHardwareID != NULL);
	P.HardwareID = (LPTSTR)(LPCTSTR)lpszHardwareID;

	P.A = (LPTSTR)(LPCTSTR)m_strKeyA;
	P.E = (LPTSTR)(LPCTSTR)m_strKeyE;
	P.N = (LPTSTR)(LPCTSTR)m_strKeyN;

	if(pExpirationDate != NULL)
	{
		P.ExpirationDate.Day = (BYTE)pExpirationDate->GetDay();
		P.ExpirationDate.Month = (BYTE)pExpirationDate->GetMonth();
		P.ExpirationDate.Year = (WORD)pExpirationDate->GetYear();
	}

	memset(m_RegKey, 0, sizeof(m_RegKey));
    P.RegKey = (LPBYTE)m_RegKey;
	P.RegKeySize = sizeof(m_RegKey);

	int nKeySize = m_pRegKeyGenerate(&P);
    if(nKeySize <= 0)
		return -(int)P.RegKeySize;

	m_strRegKey = m_RegKey;
	return nKeySize;
}

CString CKeyGenerator::GetRegKey()
{
	return m_strRegKey;
}

void CKeyGenerator::RegistrationKeySave(LPCTSTR lpszFileName, LPCTSTR lpszRegistrySubKey, LPCTSTR lpszRegistryKey)
{
	m_pRegKeySave((LPTSTR)lpszFileName, (LPTSTR)lpszRegistrySubKey, (LPTSTR)lpszRegistryKey, (LPTSTR)(LPCTSTR)m_strRegKey);
}

BOOL CKeyGenerator::CheckHardwareID(LPCTSTR HardwareID)
{
	return m_pCheckHardwareID((LPTSTR)HardwareID);
}

BOOL CKeyGenerator::Init()
{
	m_hKeyGenDll = LoadLibrary(_T("keygen.dll"));
	if(m_hKeyGenDll != NULL)
	{
		m_pRegKeyGenerate = (ASPRegistrationKeyGenerate)GetProcAddress(m_hKeyGenDll, RegistrationKeyGenerateName);
		m_pRegKeySave = (ASPRegistrationKeySave)GetProcAddress(m_hKeyGenDll, RegistrationKeySaveName);
		m_pCheckHardwareID = (ASPCheckHardwareID)GetProcAddress(m_hKeyGenDll, CheckHardwareIDName);
		if((m_pRegKeyGenerate != NULL) && (m_pRegKeySave != NULL))
			return TRUE;
		FreeLibrary(m_hKeyGenDll);
		m_hKeyGenDll = NULL;
	}
	return FALSE;
}
