


DLL Export Viewer v1.00
Copyright (c) 2005 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

This utility displays the list of all exported functions and their
virtual memory addresses for the specified DLL files. You can easily copy
the memory address of the desired function, paste it into your debugger,
and set a breakpoint for this memoery address. When this function is
called, the debugger will stop in the beginning of this function.
For example: If you want to break each time that a message box is going
to be displayed, simply put breakpoints on the memory addresses of
message-box functions: MessageBoxA, MessageBoxExA, and
MessageBoxIndirectA (or MessageBoxW, MessageBoxExW, and
MessageBoxIndirectW in unicode based applications) When one of the
message-box functions is called, your debugger should break in the entry
point of that function, and then you can look at call stack and go
backward into the code that initiated this API call.



Start using DLL Export Viewer
=============================

This utility doesn't require any installation process or additional DLLs,
in order to start using it, just run the executable file - dllexp.exe
When DLL Export Viewer is loaded, you have to choose one of the following
options:
* Load all functions from standard system DLLs: This is the default
  option. If you select it, the exported API functions of standard
  Windows DLLs (kernel32.dll, user32.dll, and so on...) will be displayed.
* Load functions from the specified DLL file: If you select this
  option, you have to specify the DLL file that you want to load in the
  text-box below this option. You can also specify a wildcard for loading
  multiple DLL files. If for some reason, you want to view all API
  functions on your system, you can specify something like
  'c:\windows\system32\*.dll' - but I must warn you... You'll get a very
  long functions list, probably more than 50,000 functions !
* Load functions from the DLL files specified in the following text
  file: If you select this option, the specified text file should contain
  a list of DLL files, separated by Enter characters (CR-LF). All
  exported functions from the specified DLLs will be loaded.
* Load functions from all DLLs attached to the selected process: This
  is the most useful option if you want to use this utility for
  debugging. Select the process that you are currently debugging, and the
  exported functions of all DLLs attached to the selected process will be
  displayed.



System Requirements
===================

This utility works properly on all 32-bit versions of Windows, including
Windows 98/ME, Windows NT, Windows 2000, and Windows XP. If you want to
use it on Windows NT, you should add psapi.dll into your system32 folder.

License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Translating this utility to the languages
=========================================

In order to translate this utility to other language, follow the
instructions below:
1. Run DLL Export Viewer with /savelangfile parameter:
   dllexp.exe /savelangfile
   A file named dllexp_lng.ini will be created in the folder of DLL
   Export Viewer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DLL Export Viewer, and all
   translated strings will be loaded from the language file.
   If you want to run this utility without the translation, simply rename
   the language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
