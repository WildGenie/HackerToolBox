REM ===========================================================================
REM Armadillo.inc
REM
REM This include file is For use With the PowerBasic v7 compiler (see
REM http://www.powerbasic.com).
REM
REM Include In your source code module With:
REM     #Include "Armadillo.inc"
REM ===========================================================================

Macro   SECUREBEGIN     =   !DB &hEB,&h03,&hD6,&hD6,&h00
Macro   SECUREEND       =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_A   =   !DB &hEB,&h03,&hD6,&hD6,&h01
Macro   SECUREEND_A     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_B   =   !DB &hEB,&h03,&hD6,&hD6,&h02
Macro   SECUREEND_B     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_C   =   !DB &hEB,&h03,&hD6,&hD6,&h03
Macro   SECUREEND_C     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_D   =   !DB &hEB,&h03,&hD6,&hD6,&h04
Macro   SECUREEND_D     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_E   =   !DB &hEB,&h03,&hD6,&hD6,&h05
Macro   SECUREEND_E     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_F   =   !DB &hEB,&h03,&hD6,&hD6,&h06
Macro   SECUREEND_F     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_G   =   !DB &hEB,&h03,&hD6,&hD6,&h07
Macro   SECUREEND_G     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_H   =   !DB &hEB,&h03,&hD6,&hD6,&h08
Macro   SECUREEND_H     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_I   =   !DB &hEB,&h03,&hD6,&hD6,&h09
Macro   SECUREEND_I     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_J   =   !DB &hEB,&h03,&hD6,&hD6,&h0A
Macro   SECUREEND_J     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   SECUREBEGIN_K   =   !DB &hEB,&h03,&hD6,&hD6,&h0B
Macro   SECUREEND_K     =   !DB &hEB,&h03,&hD6,&hD6,&hFF
Macro   NANOBEGIN       =   !DB &hEB,&h03,&hD6,&hD7,&h01
Macro   NANOEND         =   !DB &hEB,&h03,&hD6,&hD7,&h00

Declare Function CheckCode Lib "ArmAccess.DLL" (UserName$, KeyCode$) As Byte
Declare Function VerifyKey Lib "ArmAccess.DLL" (UserName$, KeyCode$) As Byte
Declare Function InstallKey Lib "ArmAccess.DLL" (UserName$, KeyCode$) As Byte
Declare Function InstallKeyLater Lib "ArmAccess.DLL" (UserName$, KeyCode$) As Byte
Declare Function UninstallKey Lib "ArmAccess.DLL" () As Byte
Declare Function SetDefaultKey Lib "ArmAccess.DLL" () As Byte
Declare Function UpdateEnvironment Lib "ArmAccess.DLL" () As Byte
Declare Function IncrementCounter Lib "ArmAccess.DLL" () As Byte
Declare Function CopiesRunning Lib "ArmAccess.DLL" () As Long
Declare Function ChangeHardwareLock Lib "ArmAccess.DLL" () As Byte
Declare Function GetShellProcessID Lib "ArmAccess.DLL" () As Long
