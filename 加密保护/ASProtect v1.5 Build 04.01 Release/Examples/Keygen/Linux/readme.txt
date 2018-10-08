
   Linux keygenerator for ASProtect
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   There are two executables in this package:

   1. keygen - CGI-BIN keygenerator - you can just put in on your cgi-bin directory and
   use it immediately (don't forget to execute the command 'chmod 755 keygen' )!

   It has few input parameters:
   
   A    \ 
   E    - Constants from your project (.aspr file, Keys section)
   N    / 

   ID   - HardwareID
   Days - Key expires in N day later  
   Data - Registration information

   Working examples is located here (it uses constants from ASProtect project from \examples\ directory ):

   http://www.aspack.com/cgi-bin/keygen?A=SahqUZft3hfIzx7XhMLr/A==&E=iex+hjO8FQcdxCAqVjvW20dKIBeqZDWYgW8sXAKBhxaewHwc3m3e5Wkykzt9yRX1tkK/0V2jy42o2oKULp0unkf31JTfL+TsCQWTIATt9IjrbdK/mJv0HsYAhbdJr+QQh20CVwrwocxP9foUrkUedZijKtRE8/NuOEijp5EXPH0=&N=7/bjxkM0GGdnj7zMFMbN/PvBhQ5RyTNOxtoApRc3fs4qRA4EUVqbipB3LxzEChBz7CR4UWc9rvCOqsveEM53t4zdMPAGZE/9Uelt96byKlT22azRFXQvbvLF2wbAXJrEkvKoaTS9uib7e5RRRdiEyZeMnrm4vjbbGIE+7562XoE=&Data=test

   Note: if you want to use special symbols in registration information like CRLF, ' ' use the following symbols for
         the parameter Data:

	 CFLF  = %0D%0A
         ' '   = %20	  

	 Example: ...&Data=Registered%20User%0D%0A-%20developer%20license%20-
   
   2. libkeygen.so - keygenerator library. You can use it in your own key generators 
   (its functions and parameters are described in the ASProtect Help file 
   "Example of Usage - User registration key generation") if you have enought permissions 
   on your Linux server in order to setup this library.

   There are few examples of using this keygenerator with php scripts:

   swreg.php  
   keygen.php 


