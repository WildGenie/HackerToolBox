Unpacker ExeCryptor 2.x.x v1.0 RC2, by RSI [tPORt]


Options:

Clear pointer GetModuleHandleA
------------------------------
When checked, unpacker will search for pointer to dword that stores address
of GetModuleHandle function in internal EC’s import and:

1. Display "Type1" for files protected with old version of EC (2.2.5 or lower).
   In this case you need to manually fix pointer, so it will point
   to GetModuleHandle function in unpacked file’s import.

2. Display "Type2" and automatically clear pointer for files protected
   with EC 2.2.6-2.3.9.

3. Display "Not Found pointers" – for files protected with EC 2.4.x, where
   bug with GetModuleHandle was finally fixed.

[!] When file is protected with EC 2.3.9 or lower – this pointer should be
    cleared/fixed, or unpacked file won’t run on other PC, where address
    of GetModuleHandle function is different.

Patch message "Debugger Detected"
---------------------------------
When checked, unpacker will search for beginning of EC’s internal procedure,
that displays "[305] Debugger Detected" message and closes program, and
disable it using selected methods:

1. Method 1 – use dynamic search
2. Method 2 – use static search

[*] When unpacker displays "Method 3" – it means that procedure was
    successfully disabled too.

Patch CRC Check
---------------
When checked, unpacker will search for EC’s file CRC check procedure
and disable it.

Patch Memory CRC Check
----------------------
When checked, unpacker will search for EC’s memory CRC check procedure
and disable it.

[!] Use this option at you own risk, because unpacker adds infinite loop
    to memory CRC check procedure and it can lead to high cpu load.

Remove trash
------------
When checked, unpacker will clear space between PE header and first section,
where packed data was stored before.

Fix Relocs
----------
When checked, unpacker will automatically rebuild relocation table,
paste it to new section in dump and correct relocation table’s address
and size in PE header.

When unchecked, unpacker will create 2 dumps with different image bases,
named "_reloc1.dll" and "_reloc2.dll", and display 2nd image base
for restoring relocations manually with ReloX.

[*] This option is enabled only for dll files.
[*] Rebuilding big relocation tables takes some time, so be patient.

Cut last sections
-----------------
When checked, unpacker will delete unnecessary sections with packed data
(usually two last EC’s sections).

[*] This option is enabled only for exe files.

Reconstruct Dynamic Import
--------------------------
When checked, unpacker will automatically find start and end of IAT 
and rebuild protected functions.

[*] When unpacker can’t find protected import, it will automatically 
    disable import rebuilding option and restart unpack process.

Fix IAT in dump
---------------
When checked, unpacker will automatically paste rebuilt import to new section
in dump and correct import’s address and size in PE header.

When unchecked, unpacker will display message box with IAT address and size
for pasting import manually with ImpRec.

[!] Don’t close message box, until you’ll paste import with ImpRec.

Copy/Paste original IAT in dump
-------------------------------
When checked, unpacker will copy original import from file and paste it
to dump.

Save log
--------
When checked, unpacker will create log file, named "_u.log".

Find OEP
--------
When checked, unpacker will search OEP using dynamic and static methods
(tracing and signatures) and fix OEP address in PE header (if found).

[*] For exe files unpacker uses dynamic method firstly and then static,
    for dll files – static and then dynamic.
[*] When unpacker can’t find OEP, it will ask to manually correct it.


What's new:

v1.0 release candidate 2
------------------------
* Fixed bug in import rebuilding
* Added dynamic OEP search method
* Added manifest and file version information
* Added support for unpacking dll files with stripped relocations
* Fixed other minor bugs

v1.0 release candidate 1
------------------------
* Replaced ap0x's engine with own method of adding restored import to dump
* Fixed bug with import rebuilding for Win XP SP0/SP1
* Fixed minor bugs in OEP search and compiler identification

v1.0 beta 4
-----------
* Fixed bugs in OEP search for VC++ and Delphi files
* Added new OEP signatures for VB, MASM and TASM
* Added two different methods for disabling EXECryptor's "305 Debugger 
  detected" message

v1.0 beta 3
-----------
* Fixed bug with unpacking files protected with EXECryptor 2.4.1
* Added "Disable memory CRC check" feature - to locate and disable EC's 
  memory CRC check
* Added "Remove sign detected by Kaspersky" feature - to prevent Kaspersky
  antivirus from identifying files protected with cracked version of EC as
  viruses
* Added new OEP signatures for C++
* Added option to keep unpacker's window on top

v1.0 beta 2
-----------
* Fixed minor bugs with rebuilding protected import
* Added check whether import is protected or not
* Added ap0x's engine for adding restored import to dump
* Fixed OEP search for Delphi files
* Added manual OEP correction (when unpacker can't find it)
* Added display of selected options in log
* Added drag'n'drop support
* Renamed options to more understandable