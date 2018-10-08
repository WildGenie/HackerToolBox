DLL Rebaser v1.0

This program is for changing "loading address" of Win32 PE files.

I. How this program works:
--------------------------
All  relocations in a file are recounted to make it possible to load a file
under a different address,  therefore  ImageBase  is  changed, check-sum is
clearedin the header.

II. What is this all for?:
--------------------------
Very  often,  compilers allocate the same preferred loading address for all
DLLs,  if there is more than one DLLs compiled - their loading address will
conflict  with  each  other.  This  is  why Operating System has to recount
relocations during each loading to let each module load in an emty address.
This  slowes  down  process of loading the program. Using this tool you can
change  preferred  addresses of loading in DLLs to different ones and if in
this case DLLs are not conflicting during loading, then relocation sections
can be removed completely, thus reducing the size of a module.

III. How to use:
----------------
1) load the program :)
2) Open  desired  file  using  the  appropriate  dialog.  If  format is not
   supported  -  the  program  will  inform  you, otherwise fields Original
   ImageBase and New ImageBase will fill in automatically.
3) Input a deisred address into New ImageBase and press "Process" button.
4) That's all, most likely, the file will rebase correctly (I hope).

IV. Options:
------------
1) Back Up - make a backup copy of a file that is being processed.
2) Save Overlay - save overlays, if they are present in a file.
3) Save - save settings on exit.

V. Things to note:
------------------
1) Rebasement  can also be used in the "research" of a DLL - it is not nice
   to  see  one address in Debugger and a different one in Disassembler and
   therefore  different  relocations. This was the main reason for creating
   this  program,  because  this  dirty  trick  os  only  good  when  using
   someonelses  modules  (otherwise,  it  is just as easy to change loading
   address in preferences of compiler and recompile the module).
2) Program  was specifically written to process DLLs, but it will work fine
   for EXE and other files that contain relocations.
3) For  Win9x  loading address must lie beteween 0õ400000 and 0õ800000, for
   NT, lowest limit is - 0õ10000.
4) Configurator  of  relocations  is  ripped  from ASPack 2.11 (big thanks,
   A.Solodovnikov).
5) Obviously,  required condition for rebasement is presence of relocations
   in  a file. If relocations don't exist in a file - my program cen not do
   anything with that file.

VI. History:
------------
 - v1.0 + First public version. It seems like everything is working fine.

== by Dr.Golova [mailto: dr_golova@pisem.net] ================ 03.08.01 ===
== [c] Underground Information Center [ http://www.uinc.ru ]===============
