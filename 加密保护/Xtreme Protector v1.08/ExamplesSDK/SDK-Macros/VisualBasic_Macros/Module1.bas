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

Global Regname As String * 200
Global RegOrg As String * 200
Global RegMemo As String * 200
Global TempBuffer As String * 512
Global XprotMacro As String * 32

Public Const PatchStart = "PATCH_START"
Public Const PatchEnd = "PATCH_END"


