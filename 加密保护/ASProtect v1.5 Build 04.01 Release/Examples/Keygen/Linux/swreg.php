<?
    // Description: SWREG PHP example for Linux keygenerator 
    // Author     : Vitaliy Shittz <swrus@shittz.ru>	
    
    // All constants get from data from ASProtect example, see linux_binary.zip/readme.txt

    // Constant initialization. Put your own data
    $A = "SahqUZft3hfIzx7XhMLr/A==";
    $E = "iex+hjO8FQcdxCAqVjvW20dKIBeqZDWYgW8sXAKBhxaewHwc3m3e5Wkykzt9yRX1tkK/0V2jy42o2oKULp0unkf31JTfL+TsCQWTIATt9IjrbdK/mJv0HsYAhbdJr+QQh20CVwrwocxP9foUrkUedZijKtRE8/NuOEijp5EXPH0=";
    $N = "7/bjxkM0GGdnj7zMFMbN/PvBhQ5RyTNOxtoApRc3fs4qRA4EUVqbipB3LxzEChBz7CR4UWc9rvCOqsveEM53t4zdMPAGZE/9Uelt96byKlT22azRFXQvbvLF2wbAXJrEkvKoaTS9uib7e5RRRdiEyZeMnrm4vjbbGIE+7562XoE=";

    // Where is keygen hosting? Put your own data
    $host = "aspr.vdll.com";
    $path = "/cgi-bin/keygen";

    // Getting key data from swreg. (see http://usd.swreg.org/pages/strings.htm for details)
    // In this realization keygen generates for string "User Name (User email)"
    $name = (array_key_exists("name", $HTTP_GET_VARS)?$HTTP_GET_VARS["name"]:"");
    $email = (array_key_exists("email", $HTTP_GET_VARS)?$HTTP_GET_VARS["email"]:"");
 

    $fp = fsockopen ($host, 80, $errno, $errstr, 30);
    if (!$fp) {
        echo "$errstr ($errno)<br>\n";
    } else {
        $request = "$path?A=$A&E=$E&N=$N&Data=".urlencode("$name($email)");

        fputs ($fp, "GET $request HTTP/1.0\r\nHost: $host\r\n\r\n");
        $content = "";
        while (!feof($fp)) {
            $content .= fgets ($fp,128);
        }
        fclose ($fp);       
        $keycode = trim(strstr($content,"\r\n\r\n"));
        echo "<softshop>".$keycode."</softshop>";
    } 
?>
