 version 24  Updated on 6/7/2009


Thanks for taking the time to read this.

    Remarks ,you should be aware off:
1- Keep the norm for naming a variable;variable shouldn't start with a number, as it will
   be considered a number.

2- Start hex number with 0,otherwise , it will be consider a variable.

3- For mru please right click on the empty portion of the toolbar.

4- Right click on tray icon to exit.

For the color picker:
any color in the output window; the window  between the largest window
and add  custom color button; is transformed to the object to be hilited
by a click on the small ok button below the object breviation.once finshed
close the picker by a click on the large ok button.

KRD=KEYWORDS
REG=REGISTERS
OPR=OPERATORS
CMT=COMMENTs
STR=STRINGS
NUM=NUMBERS
OPC=OPCODES


VarToAuto menu:
VarToAuto menu is for adding variable declared by var when you create script.
choose Enable AddNewScript Var to add any declared var to autocomplete while
typing,choose Enable AddSavedFile Var to extract any var from the loaded file 
through mru or OpenFile button,choose Set SavedFileVar On to add extract var
from loaded file to autocomplete.

TestMe menu:
TestMe menu is for excuting script in focused childwindow througth ODdgScript
in ollydbg.Just move "OSWrite.dll" to your plugin folder,and make sure that 
the script dll is named "ODdgScript.dll"; the original name for it; if not rename
it to that.no need to modify the "OSWrite.dll" plugin , it will sense any 
modification and adjust its self to it. also "oswrite.exe" is smart enough to
sense presence  of ollydbg whether hidden or not, and will enable relevant menu
item,or disable it  accordingly.

version 15-16:

version 15 mainly added dbugscript option and modify plugin menu,for patching
a plugin, which can be found by either right click on the cpu pane or through
the plugin menu.
version 16 minor bug fix for tips reported by SubBeam.

version 18:
1-add ability to lunch exe in ollydbg by dragging a short cut or an execute into oswrite
2-restricted oswrite, it is now except script files only; that is file with extension .txt or osc.
3- add option in testme menu to clear default oswrite debugger.

verion 19:
1-added skin. 
2- setting menu (now you can set oswrite to exit on closing).

version 20:
1-some menu names are changed as suggested by SunBeam to more meaningful names.
2-have oswrite sets scriptwindow always on top.
version 21:
1- no popups in comments or in strings while they are active.
2- no need for space before comments; only for readability.(in var exctract).
3- var menu is  slightly changed.

version 22:
added win32help file for api help.
To use, please  position cursor on api name and press  F1 key.

vserion 23:
added patterns paste "PtrnPaste" function to ease testing and using code patterns
to use it, select code in ollydbg cpu pane then use copy to clipboard to copy patterns.
position cursor where you want to paste, then right click in the OSWrite mdi childwindow
select PtrnPaste,done.

I revived some internal code of both OSWrite.exe and OSWrite.dll, you can use the OSWrite.dll
to patch almost any ollydbg plugin to work with your current modified ollydbg, for OSWrite.dll
it doesn't need any modifications, it will ajust it's self to any ollydbg that it uses it.  

Version 24:
1-Added selection to languages that require two bytes to display char.
2-Added ability to run untitled script without the need to save it.
3-Added ability to tile and cascade windows.
4-Added ability to clear Mru.
5-Added ability to clear one file from mru.
6-Added ability to set script folder path.
7-Added ability to store size, position,style,font ect...
8-Added font requester
9-Added ability to restore to default size.

I imposed a limit to window's max size to fix a bug from my skin engine.

 
britedream
 


