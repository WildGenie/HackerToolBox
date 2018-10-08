<%@ LANGUAGE="JScript" %>
<html>
<head>
<title>EXECryptor KeyGen Demo (JScript)</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%
var obj,KeyFileName,RegCode,RegCode2,RegCode3,RegName,HardwareID;

// change this key for really used
// path may be relative from eckeygen.dll placement
KeyFileName = "Example\Delphi\SerialsAPI\SerialsAPIDemo.ep2";

RegName = Request("RegName");
RegCode = "";
RegCode2 = "";
RegCode3 = "";
HardwareID = "";

obj = Server.CreateObject("eckeygen.ExeCryptorKeyGen");

RegCode = obj.CreateSerialNumber(KeyFileName, RegName, HardwareID, RegCode);

RegCode2 = obj.CreateSerialNumberTimeLimit(KeyFileName, RegName, HardwareID, true,true,true,true,true,true,1,4,2005,RegCode2);

RegCode3 = obj.CreateSerialNumberEx(KeyFileName, RegName, HardwareID, true,true,true,true,true,true,5,541,RegCode3);

%> 

<h4 align="left">Registration Name: <%=RegName %> </h4>
<h4 align="left">Short serial number: <%=RegCode%> </h4>
<h4 align="left">Time limited serial number: <%=RegCode2%> </h4>
<h4 align="left">Ex serial number: <%=RegCode3%> </h4>
<p>&nbsp;</p>
</body>
</html>
