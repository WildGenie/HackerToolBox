Attribute VB_Name = "Module1"
Public Declare Function GetEnvironmentVariable Lib "kernel32.dll" Alias "GetEnvironmentVariableA" (ByVal _
    lpName As String, ByVal lpBuffer As String, ByVal nSize As Long) As Long

Public Declare Function WLLoadWinlicenseDll Lib "WinlicenseSDK.dll" () As Integer



