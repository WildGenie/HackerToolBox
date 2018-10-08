<?php

// Description: PHP example for Linux keygenerator 
// Author     : Konstantin Rybalkin <support@leadmind.com>
// Usage      : http://www.myhost.com/keygen.php?fname=Vasya&lname=Pupkin&email=vasya@pupkin.com&quantity=1&company=PupKinInc.


// ASProtect constants
$A = "wu9cM/3YXJMYpJL3Q7IzAg==";
$E = "bY2/ZQmjLfEZkmSLSxxj4klRZq5RMNCWr1+46zhgc0wEVRqzxH7tls4iD6xwMTfNykCHlsHVKE4KGQTXRdVspnw4dxC8MQn2caE+SODQcp16iWiwtCdFnyvHBibE/mS0Tl2CXJ2qWpjGd5FRLKNDdokAq2dAGOo/1P2E3X9KNAs=";
$N = "JztTf9fLZibddrqohWYezhacCkvahTa+MrVEdooZfY74iWruTvQJP/u660EJxUWFAgxMpfhmveQWqYA6jKm0l3Jw3Li4cI0QGf/Z/Cj86OMHbkR0cECBKbcdTRNSTEtGWHCmjr6+rLgWNeV4MEl2hVPbR5mHWedELLoTakBmuoY=";


// Allow execution only from this IPs
$LocalAddress   = "192.168.0" ;
$RegNowSubIP    = "208.248.77";


// e-mails
$AlarmEmail     = "info@myhost.com";
$KeyGenEmail    = "info@mehost.com";

$fname    = $_GET['fname'];
$lname    = $_GET['lname'];
$email    = $_GET['email'];
$quantity = $_GET['quantity'];
$company  = $_GET['company'];

$CRLF     = "\r\n";


// function to format key by 30 characters in a string
function _FormatKey ($Key)
{
      $WrapLength = 30;
      $result = "--- KEY BEGIN KEY ------------\n\n";

	while (strlen($Key) <> 0)        
	  {
         $result .= substr($Key, 0, $WrapLength);
	   $result .= "\n";
         $Key = substr($Key, $WrapLength, strlen($Key)-1);
        } 

      $result .= "--- KEY END KEY --------------\n\n";

	return $result;
}
$ip = getenv("REMOTE_ADDR");
$subip = substr($ip, 0, strrpos($ip, "."));

if (($subip == $LocalAddress) or ($subip == $RegNowSubIP)
	{
       $PrivateInfo = "IP: " . $ip . "\r\n" . $fname . " " . $lname . "\r\n" . "License IDs:" . "\r\n";
       if ($quantity > 0)
		{
		      $UserKey = "Registration name: " . $fname . " " . $lname . "\r\n";
			$UserKey .= $company . "\r\n\r\n\r\n";

			for ($i = 1; $i <= $quantity; $i++)	  {
			   $UserKey = $UserKey . "> Your personal registration key for License " . $i . "\n";
		         $RndNum = rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9);
		         $PrivateInfo .= $RndNum . "\r\n";
		         $LicenseID = "License ID: " . $RndNum;
			   if (strlen($company) <= 0) 
 				{ 
					$RegData  = $fname . " " . $lname  . $CRLF . $LicenseID; 
				}
			     else 
				{ 
					$RegData  = $fname . " " . $lname  . $CRLF . $company . $CRLF . $LicenseID;
				}
			
			   $RegData = rawurlencode($RegData);	
		         $KeyGenURL = "http://www.myhost.com/cgi-bin/keygen";
		         $URL = $KeyGenURL . "?A=" . $A . "&E=" . $E . "&N=" . $N . "&Data=" . $RegData;

			   $OneKey = "";	

			   $file = fopen ($URL, "rb");
			   if (!$file) {
				   print ("<p>Unable to open remote file.\n");
				   exit;
	   		   }

			   while (!feof ($file)) {
				   $OneKey .= fgets ($file, 1024);
			   }
			   fclose($file);

		
			   $UserKey .= _FormatKey($OneKey) . $CRLF;
			}
		} 

      print ($UserKey);
    
      mail($KeyGenEmail, $fname . " " . $lname, $PrivateInfo,  "From: *** KEYS GENERATED *** <$KeyGenEmail>\r\n");

	}
  else
	{
      mail($AlarmEmail, "ALERT! WRONG IP!", $ip,  "From: *** ALERTER *** <$AlarmEmail>\r\n");
	}

?>