Is not possible use RSA encrypted blocks in Visual Basic 
applications now. There is one possible way how protect
these applications without these blocks. 

Protect file:
1. Check box "Use registration keys" in "Key protection" menu
2. Check box "Hardware ID" in "Key protection" menu
3. Check box "Lock application with registration key (without
   correct license key is not possible run it)" in "Special Option" menu
4. Select file for protection 
5. Select other options 
6. Save project
6. Protect file
Note: Do not distribute special.dll file with protected application.


Generate correct license for computer:
1. Run "Get_hw.exe" 
2. Run SVKP
3. Load project
4. Fill "Registration information"
5. Paste hardware ID number to "Hardware ID"
6. Save license with same name as "Name of registration key"

