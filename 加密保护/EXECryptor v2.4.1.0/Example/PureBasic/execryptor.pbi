; Include file for EXECryptor 2.3

!public _EXECryptor_AntiDebug
!public _EXECryptor_ProtectImport
!public _EXECryptor_IsAppProtected
!public _EXECryptor_GetEXECryptorVersion
!public _EXECryptor_GetReleaseDate
!public _EXECryptor_GetDate
!public _EXECryptor_GetHardwareID
!public _EXECryptor_VerifySerialNumber
!public _EXECryptor_DecodeSerialNumber
!public _EXECryptor_EncryptStr
!public _EXECryptor_DecryptStr
!public _EXECryptor_SecureWrite
!public _EXECryptor_SecureRead
!public _EXECryptor_GetTrialDaysLeft
!public _EXECryptor_GetTrialRunsLeft
!public _EXECryptor_MessageBox
!public _EXECryptor_IsRegistered
!public _EXECryptor_RegConst_0
!public _EXECryptor_RegConst_1
!public _EXECryptor_RegConst_2
!public _EXECryptor_RegConst_3
!public _EXECryptor_RegConst_4
!public _EXECryptor_RegConst_5
!public _EXECryptor_RegConst_6
!public _EXECryptor_RegConst_7

!macro CRYPT_START {DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F8h}
!macro CRYPT_END {DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FFh}
!macro CRYPT_REG {DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0F9h}
!macro CRYPT_UNREG {DB 0EBh, 006h, 0EBh, 0FCh, 0EBh, 0FCh, 0FFh, 0FAh}
!macro RESERVE_SPACE {DB 090h, 090h, 090h, 090h, 090h}

Enumeration
  #vrInvalid
  #vrExpired
  #vrStolen
  #vrOK
EndEnumeration

Global TestKeyPath.s
TestKeyPath = "Software\EXECryptorTestKeys"

Structure TSerialNumberInfo
  LicType.l     ; 0..15 (license type)
  UserParam.l   ; 0..1023
  ExpiryMonth.l ; 1..12
  ExpiryYear.l  ; 2004..2024
  F1.b
  F2.b
  F3.b
  F4.b
  F5.b
  F6.b
EndStructure

ProcedureDLL EXECryptor_AntiDebug()
  ! RESERVE_SPACE
EndProcedure

ProcedureDLL EXECryptor_ProtectImport()
  ! RESERVE_SPACE
EndProcedure

ProcedureDLL EXECryptor_GetHardwareID()
  ! RESERVE_SPACE
  ProcedureReturn 0
EndProcedure

Procedure.s GetHardwareID()
  ProcedureReturn RSet(Hex(EXECryptor_GetHardwareID()),8,"0")
EndProcedure

ProcedureDLL EXECryptor_IsAppProtected()
  ! RESERVE_SPACE
  ProcedureReturn 0
EndProcedure

ProcedureDLL.s EXECryptor_GetEXECryptorVersion()
  ! RESERVE_SPACE
  ProcedureReturn "UNREGISTERED"
EndProcedure

ProcedureDLL EXECryptor_GetDate()
  t1.FILETIME
  t2.FILETIME
  datedt.l
  tt.l
  GetSystemTimeAsFileTime_(@t1)
  FileTimeToLocalFileTime_(@t1,@t2)
  FileTimeToDosDateTime_(@t2,@datedt,@tt)
  ProcedureReturn datedt
EndProcedure

Procedure SafeGetDate(*DateDay.LONG, *DateMonth.LONG, *DateYear.LONG)
  ! CRYPT_START
  datedt = EXECryptor_GetDate()
  *DateDay\l = datedt & $1F
  *DateMonth\l = (datedt >> 5) & $F
  *DateYear\l = (datedt >> 9) + 1980
  ! CRYPT_END
EndProcedure

ProcedureDLL EXECryptor_GetReleaseDate()
  t1.FILETIME
  t2.FILETIME
  datedt.l
  tt.l
  GetSystemTimeAsFileTime_(@t1)
  FileTimeToLocalFileTime_(@t1,@t2)
  FileTimeToDosDateTime_(@t2,@datedt,@tt)
  ProcedureReturn datedt
EndProcedure

Procedure GetReleaseDate(*DateDay.LONG, *DateMonth.LONG, *DateYear.LONG)
  ! CRYPT_START
  datedt = EXECryptor_GetReleaseDate()
  *DateDay\l = datedt & $1F
  *DateMonth\l = (datedt >> 5) & $F
  *DateYear\l = (datedt >> 9) + 1980
  ! CRYPT_END
EndProcedure

ProcedureDLL.l EXECryptor_GetTrialDaysLeft(TrialPeriod.l)
  ! RESERVE_SPACE
  ProcedureReturn TrialPeriod
EndProcedure

ProcedureDLL.l EXECryptor_GetTrialRunsLeft(TrialRuns.l)
  ! RESERVE_SPACE
  ProcedureReturn TrialRuns
EndProcedure

ProcedureDLL.l EXECryptor_VerifySerialNumber(RegistrationName.s, SerialNumber.s, sn.l, HardwareID.s)
  ! RESERVE_SPACE
  ProcedureReturn #vrOK
EndProcedure

Procedure.l VerifySerialNumber(RegistrationName.s, SerialNumber.s)
    ! CRYPT_START
  SNInfo.TSerialNumberInfo
  ProcedureReturn EXECryptor_VerifySerialNumber(RegistrationName, SerialNumber, SNInfo, GetHardwareID())
  ! CRYPT_END
EndProcedure

Procedure.l VerifySerialNumberEx(RegistrationName.s, SerialNumber.s, SNInfo.l)
    ! CRYPT_START
  ProcedureReturn EXECryptor_VerifySerialNumber(RegistrationName, SerialNumber, SNInfo, GetHardwareID())
  ! CRYPT_END
EndProcedure

ProcedureDLL.l EXECryptor_DecodeSerialNumber(RegistrationName.s, SerialNumber.s, sn.l, HardwareID.s)
  ! RESERVE_SPACE
  ProcedureReturn #vrOK
EndProcedure

Procedure.l DecodeSerialNumber(RegistrationName.s, SerialNumber.s, SNInfo.l)
    ! CRYPT_START
  ProcedureReturn EXECryptor_DecodeSerialNumber(RegistrationName, SerialNumber, SNInfo, GetHardwareID())
  ! CRYPT_END
EndProcedure

ProcedureDLL EXECryptor_EncryptStr(Src, Dst)
  PokeS(Dst,PeekS(Src))
EndProcedure

ProcedureDLL EXECryptor_DecryptStr(Src, Dst)
  PokeS(Dst,PeekS(Src))
EndProcedure

Procedure.s EncryptStr(Src.s)
    ! CRYPT_START
    Result.s = Space(Len(Src) * 2)
    EXECryptor_EncryptStr(@Src, @Result)
  ProcedureReturn Result
    ! CRYPT_END
EndProcedure

Procedure.s DecryptStr(Src.s)
    ! CRYPT_START
    Result.s = Space(Len(Src))
    EXECryptor_DecryptStr(@Src, @Result)
  ProcedureReturn Result
    ! CRYPT_END
EndProcedure

ProcedureDLL EXECryptor_SecureWrite(Name, Value)
  Disposition.l
  KeyHandle.l
  If RegCreateKeyEx_(#HKEY_CURRENT_USER, TestKeyPath, 0, #NULL, #REG_OPTION_NON_VOLATILE, #KEY_SET_VALUE, #NULL, @KeyHandle, @Disposition) = #ERROR_SUCCESS
    RegSetValueEx_(KeyHandle, *Name, 0, #REG_BINARY, Value, Len(PeekS(Value))+1)
    RegCloseKey_(KeyHandle)
    ProcedureReturn #True
  Else
    ProcedureReturn #False
  EndIf
EndProcedure

ProcedureDLL EXECryptor_SecureRead(Name, Value)
  KeyHandle.l
  sz.l
  tp.l
  Result.b = #False
  If RegOpenKeyEx_(#HKEY_CURRENT_USER, TestKeyPath, 0, #KEY_QUERY_VALUE, @KeyHandle) = #ERROR_SUCCESS
    tp = #REG_BINARY
    If RegQueryValueEx_(KeyHandle, Name, #NULL, @tp, #NULL, @sz) = #ERROR_SUCCESS
      RegQueryValueEx_(KeyHandle, Name, #NULL, @tp, Value, @sz)
      Result = #True
    EndIf
    RegCloseKey_(KeyHandle)
  EndIf
  ProcedureReturn Result
EndProcedure

Procedure SecureWrite(Name.s, Value.s)
    ! CRYPT_START
    EXECryptor_SecureWrite(@Name,@Value)
    ! CRYPT_END
EndProcedure

Procedure.s SecureRead(Name.s)
    ! CRYPT_START
    Result.s = Space(4096)
    EXECryptor_SecureRead(@Name,@Result)
    ProcedureReturn Result
    ! CRYPT_END
EndProcedure

ProcedureDLL EXECryptor_MessageBox(hWnd, lpText.s, lpCaption.s, uType)
  ProcedureReturn MessageBox_(hWnd, lpText, lpCaption, uType)
EndProcedure

ProcedureDLL EXECryptor_IsRegistered()
  ! RESERVE_SPACE
  ProcedureReturn #vrOK
EndProcedure

ProcedureDLL EXECryptor_RegConst_0()
  ! RESERVE_SPACE
  ProcedureReturn 0
EndProcedure

ProcedureDLL EXECryptor_RegConst_1()
  ! RESERVE_SPACE
  ProcedureReturn 1
EndProcedure

ProcedureDLL EXECryptor_RegConst_2()
  ! RESERVE_SPACE
  ProcedureReturn 2
EndProcedure

ProcedureDLL EXECryptor_RegConst_3()
  ! RESERVE_SPACE
  ProcedureReturn 3
EndProcedure

ProcedureDLL EXECryptor_RegConst_4()
  ! RESERVE_SPACE
  ProcedureReturn 4
EndProcedure

ProcedureDLL EXECryptor_RegConst_5()
  ! RESERVE_SPACE
  ProcedureReturn 5
EndProcedure

ProcedureDLL EXECryptor_RegConst_6()
  ! RESERVE_SPACE
  ProcedureReturn 6
EndProcedure

ProcedureDLL EXECryptor_RegConst_7()
  ! RESERVE_SPACE
  ProcedureReturn 7
EndProcedure
; ExecutableFormat=
; EOF