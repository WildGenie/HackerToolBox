Attribute VB_Name = "Module1"
'Please specify exactly the position of the DLL , otherwise the defualt directory
'is your Windows System Directory , this means you must put the XProtSDK.DLL inside this
'Directory

Public Declare Function IsRegistered Lib "XProtSDK.dll" () As Boolean
Public Declare Function GetLicenseInfo Lib "XProtSDK.dll" (ByVal lpName As String, ByVal lpOrganization As String, ByVal lpMemo As String) As Boolean
Public Declare Function DemoGetDaysToExpire Lib "XProtSDK.dll" () As Integer
Public Declare Function DemoGetExecutionsToExpire Lib "XProtSDK.dll" () As Integer
Public Declare Function RegisteredGetDaysToExpire Lib "XProtSDK.dll" () As Integer
Public Declare Function RegisteredGetExecutionsToExpire Lib "XProtSDK.dll" () As Integer
Public Declare Function GetHardwareID Lib "XProtSDK.dll" (ByVal lpHwId As String) As Boolean
Public Declare Function ValidateHardwareID Lib "XProtSDK.dll" (ByVal lpHwId As String) As Boolean



Global HwIdBuff As String * 200
Global TempBuffer As String * 512

