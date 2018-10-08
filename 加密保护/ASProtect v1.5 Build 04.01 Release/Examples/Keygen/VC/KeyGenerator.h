// KeyGenerator.h: interface for the CKeyGenerator class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_KEYGENERATOR_H__5A25AB8F_E262_4103_9130_6A306CE22BC0__INCLUDED_)
#define AFX_KEYGENERATOR_H__5A25AB8F_E262_4103_9130_6A306CE22BC0__INCLUDED_

#include "asp_keygen.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CKeyGenerator : public CObject  
{
public:
	CKeyGenerator();
	virtual ~CKeyGenerator();

	BOOL Init();
	void InitProject(LPCTSTR KeyA, LPCTSTR KeyE, LPCTSTR KeyN);

	int RegistrationKeyGenerate(LPCTSTR lpszRegInfo, LPCTSTR lpszHardwareID, CTime *pExpirationDate = NULL);
	void RegistrationKeySave(LPCTSTR lpszFileName, LPCTSTR RegistryKey, LPCTSTR lpszlpszRegistryKey);
	BOOL CheckHardwareID(LPCTSTR HardwareID);
	CString GetRegKey();

protected:
	char m_RegKey[1024];
	CString m_strRegKey;
	CString m_strKeyA, m_strKeyE, m_strKeyN;
	ASPCheckHardwareID m_pCheckHardwareID;
	ASPRegistrationKeySave m_pRegKeySave;
	ASPRegistrationKeyGenerate m_pRegKeyGenerate;
	HINSTANCE m_hKeyGenDll;
};

#endif // !defined(AFX_KEYGENERATOR_H__5A25AB8F_E262_4103_9130_6A306CE22BC0__INCLUDED_)
