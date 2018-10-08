Attribute VB_Name = "Module1"
Public Declare Function CreateLicenseKey Lib "LicenseGenDLL.DLL" (ByVal lpName As String, ByVal lpOrganization As String, ByVal lpMemo As String, ByVal lpHwID As String, ByVal iNumDays As Integer, ByVal iNumExec As Integer, ByVal lpCaption As String, ByVal lpDaysBody As String, ByVal lpExecBody As String, ByVal lpBufferOut As String) As Integer
Global KeyAux As String * 4096



