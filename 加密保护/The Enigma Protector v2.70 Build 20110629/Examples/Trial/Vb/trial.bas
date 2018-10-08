Attribute VB_Name = "trial"
Function ExpirationExecutions(Total As Long, Left As Long) As Boolean
    ExpirationExecutions = EP_TrialExecutions(Total, Left)
End Function

Function ExpirationDays(Total As Long, Left As Long) As Boolean
    ExpirationDays = EP_TrialDays(Total, Left)
End Function

Function ExpirationDate(Year As Long, Month As Long, Day As Long) As Boolean
    ExpirationDate = EP_TrialExpirationDate(Year, Month, Day)
End Function
