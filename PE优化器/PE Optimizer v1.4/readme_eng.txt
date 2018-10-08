PE Optimizer v1.4

This program is for optimization of Win32 PE files.

I. Algorithm of this program is simple:
---------------------------------------
1) All relocations are cut, THEY ARE NOT NEEDED IN EXE FILES.
2) Alignment  of  PE  header  is  reduced  to the minimal secure  value (16
bytes), all rubbish is deleted from the header as well.
3) Alignment  of  header and  all sections is reduced to its minimal secure
value  (200h  bytes),  this  way  -  all  empty  sections  are erased. Only
presense  of  sections  is  deleted,  records about them in headers are not
deleted,  so  after  loading of file into the memory it will be the same as
the one before optimization.

II. Settings.
-------------
1) BackUp.
   BackUp  copy  is  made  if  this option is set. Backed Up file has *.bak
   extension.  If  this  file  exists,  program will ask your permission to
   overwrite it.

2) Kill Relocations.
   All Relocations will be cut if this file is not a dll.

3) ... in Dll.
   Relocations  are  cut  out  from  dll's  (!!!  MAKE  SURE  you set "Kill
   Relocations" setting ON !!!). To make a optimized working version of the
   library,  it  is  needed  to make sure that its loading address will not
   conflict  with  programs  tha use this library. I recommend to recompile
   the library for work at 10000000h address.

4) Wipe Junk.
   All rubbish is removed from file, e.g. BoundImport records from header.

5) Copy Overlay.
   Overlay  will  be saved and rejoined to processed file. Usually overlays
   are  used  to  store some "rubbish" like path to Debugging info etc, but
   sometimes  overlay is used to store necessary info for the program, e.g.
   in installers overlays are used for storing compressed data.

6) Save.
   Settings  will  be  saved after exiting the program, and recovered after
   next start of the program.

III. Things to note.
--------------------
1) Recount of alignments in file is done in any case.
2) Optimization of header is done in any case.
3) You  can use this program from the command line (although GUI  will load
anyway). Use name of file to process as the first parameter.
For example: peoptim.exe my_file.exe

IV. Version History.
--------------------
 - v1.4 + Slightly rewritten file mapper. Now PE Optimizer correctly process
          files compiled with Watcom C and Ada GNAT.

 - v1.3 + Bug that happened when opening PE files was fixed (thx. Alexey V.
          Tatarinov).
        + Core of the program was fully re-written.
        + New features added:
           - Wipe Junk
           - Copy Overlay
           - Save Settings
        + Sources are now given away with the binaries.

 - v1.2 + HUGE Bug was fixed. I really don't understand  how  this  program
          worked with it. :)
        + Extra "fool" protection was added.

 - v1.1 * First public release. GUI application.
        + Core of the program is completely re-written.
        - All known bugs are fixed, new ones are added :-)
        + Warning about file re-writing is added.
        + Detection of overlays in files is added.
        + Checkup and recalculation of header size is added.
        * A lot of vodka is drunk.

 - v1.0 * It was a console version, very buggy, was not distributed.

== by Dr.Golova [mailto: dr_golova@pisem.net] ================ 15.10.01 ===
== [c] Underground Information Center [ http://www.uinc.ru ]===============
