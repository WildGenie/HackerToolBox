
Public Class Form1

    Public Declare Function GetEnvironmentVariable Lib "kernel32" Alias "GetEnvironmentVariableA" (ByVal lpName As String, ByVal lpBuffer As System.Text.StringBuilder, ByVal nSize As Integer) As Integer

    Public Declare Sub WLLoadWinlicenseDll Lib "WinlicenseSDK" Alias "WLLoadWinlicenseDll" ()

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Dim SmartKeyInfo As New System.Text.StringBuilder(100)

        ' NOTE: Have a look to the following call to WLLoadWinlicenseDll. This call will initialize the values
        ' for GetEnvironmentVariables when you are running in a unprotected state. The values returned by WinLicense for
        ' each function can be found in the file "WinlicenseSDK.ini", you can modify the return values for your tests

        ' WHEN YOU ARE GOING TO PROTECT YOUR APPLICATION WITH WINLICENSE, YOU MUST REMOVE THE "WLLoadWinLicenseDll" CALL!!!

        WLLoadWinlicenseDll()

        ' Check if the application is registered

        GetEnvironmentVariable("WLRegGetStatus", SmartKeyInfo, 500)

        ' if application registered, we display a messagebox and exit

        If System.Convert.ToInt32(SmartKeyInfo.ToString()) = 1 Then
            MsgBox("The application is already REGISTERED", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "SmartKeys")
            Me.Close()
        End If



    End Sub

    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim sRegistrationData As String

        sRegistrationData = txtName.Text.ToString & "," & txtCompanyName.Text.ToString & "," & txtCustomData.Text.ToString & "," & txtActivationKey.Text.ToString

        Dim SmartKeyInfo As New System.Text.StringBuilder(sRegistrationData, 500)

        GetEnvironmentVariable("WLRegSmartKeyCheck", SmartKeyInfo, 500)

        If SmartKeyInfo.ToString = "0" Then

            MsgBox("Activation code is INVALID", MsgBoxStyle.Exclamation + MsgBoxStyle.OkOnly, "ERROR")

        Else

            ' activation data is correct. Now, we are going to install the smart key as File key (via WLRegSmartKeyInstallToFile)
            '
            '
            ' NOTE: The above call to "GetEnvironmentVariable("WLRegSmartKeyCheck", SmartKeyInfo, 500)" DESTROYED the 
            ' SmartKeyInfo with the return value from WinLicense in that same buffer. So, we have to set up the SmartKeyInfo again

            SmartKeyInfo.Length = 0
            SmartKeyInfo.Append(txtName.Text.ToString & "," & txtCompanyName.Text.ToString & "," & txtCustomData.Text.ToString & "," & txtActivationKey.Text.ToString)

            GetEnvironmentVariable("WLRegSmartKeyInstallToFile", SmartKeyInfo, 500)

            MsgBox("Activation code is correct. Product registered." & Chr(13) & Chr(10) & "You must RESTART the application to finish the registration", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "SmartKeys")

        End If

    End Sub
End Class


