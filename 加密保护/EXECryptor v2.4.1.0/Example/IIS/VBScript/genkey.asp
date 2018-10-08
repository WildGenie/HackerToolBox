<%@ LANGUAGE="VBSCRIPT" %>
<html>
<head>
<title>EXECryptor KeyGen Demo (VBScript)</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%
dim obj
dim KeyFileName
dim RegCode
dim RegCode2
dim RegCode3
dim RegName
dim HardwareID

' change this key for really used
' path may be relative from eckeygen.dll placement
KeyFileName = "Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2"

RegName = Request("RegName")
RegCode = ""
RegCode2 = ""
RegCode3 = ""
HardwareID = ""

Set obj = Server.CreateObject("eckeygen.ExeCryptorKeyGen")

call obj.CreateSerialNumber(KeyFileName, RegName, HardwareID, RegCode)

call obj.CreateSerialNumberTimeLimit(KeyFileName, RegName, HardwareID, true,true,true,true,true,true,1,4,2005,RegCode2)

call obj.CreateSerialNumberEx(KeyFileName, RegName, HardwareID, true,true,true,true,true,true,5,541,RegCode3)

Set obj = Nothing ' release object
%> 

<h4 align="left">Registration Name: <%=RegName %> </h4>
<h4 align="left">Short serial number: <%=RegCode%> </h4>
<h4 align="left">Time limited serial number: <%=RegCode2%> </h4>
<h4 align="left">Ex serial number: <%=RegCode3%> </h4>
<p>&nbsp;</p>
</body>
</html>
