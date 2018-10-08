==========================================================================
nPack v2.0.100.2008, by NEOx
Copyright [c] 2008 Underground InformatioN Center
==========================================================================

Contents:

1. The description of the program.
2. Features.
3. Options.
4. History.
5. Credits.

1. The description of the program.
-----------------------------------
nPack is a Win32 executable file compressor.



2. Features.
-----------------------------------
Features: 

 - Support for all types of PE files (exe, dll, ocx)
 - Compression of program code, data, and resources
 - Section naming support
 - Fast decompression routines
 - Save overlay support
 - Relocation support
 - TLS support
 - File rebuilding
 - Strip relocation
 - Strip debug informaion


3. Options.
-----------------------------------
[ Compression Options ]

"Compress resources" - Compress resource section
"Create backup copy (.bak-file)" - Create  backup copy to restore original
file (if the compressed application would be failed after run).

"Strip Relocations" - Strip relocations.
"Rebuild File" - Rebuild File.
"Save overlay" - Save overlay. This option should be turned  on for  files 
which have overlay data at their end (installation packages, etc.)

"Loader section name" - Section name for decompressor data included in the
                        compressed PE file.
"Skip Shared Section" - Skip shared-sections.

[ Program Options ]
"Always on top" - Above all windows
"Register Shell Extension" - Put  "Compress  with   nPack"   into  Windows
                             context menu.


4. History.
------------------------------------
 - v2.0.100.2008 - [03.03.2008]
   + aPlib updated to 0.44

 - v1.1.800.2008 - [03.03.2008]
   + Option "Save overlay" added

 - v1.1.700.2008 Beta - [21.02.2008]
   - COM DLL bugs fixed

 - v1.1.500.2008 Beta - [12.02.2008]
   - Several small bugs fixed

 - v1.1.300.2006 Beta - [22.08.2006]
   - Several small bugs fixed
   - Interface bugs corrected
   + Compress ratio improved 
   + Option "Skip Shared Section" added

 - v1.1.250.2006 Beta - [20.04.2006]
   * First public release


5. Credits.
-----------------------------------
sanniassin,  Ale}{,  d1v0x,   Johnson  Finger,  sER, UsAr,  Smon,  Serega,
YDS,  cadet,  di-2,  FF, NEOPEX,  damned,  rC,  Jupiter,  NeoTall, YoriCH,
bloom, RaiN, Keo...



--
Your improvements, suggestions and bugfixes are welcomed.
Best regards, NEOx


=== by NEOx [E-Mail: neox@petools.org.ru] ========== 16.10.08 ============
=== [c] Underground Information Center [ http://www.uinc.ru ] ============