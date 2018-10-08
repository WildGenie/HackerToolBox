dilloDIE 1.6 - Armadillo 3.xx - 4.xx unpacker
######################################

This Tool can strip Armadillo Protection from protected Exes/Dlls.


Supported Features:
-------------------

Standard Features
Debugblocker
CopyMemII
Nanomites
Import Elimination
Strategic Code Splicing


Rebuilding:
-----------

Dumps are 100% working, but for aesthetic reasons one might want to remove
Armadillo Sections from Section header and its Data physically. This can
be done quite comfortable with the CFF Explorer or any simmilar PE Editor.

Armadillo Sections are usually called:

.text1
.adata
.data1
.pdata


Nanomites:
----------

Some things about Nanomites: dilloDIE will resolve all Nanomites correctly
for most Applications. There _might_ be apps though, which are somehow
obfuscated in some parts and dilloDIE will fail in properly detecting all
Nanomarkers, which are used to except Fake Nanomites. In this case one
should use the "Emulate" Option, which will cause dilloDIE not to resolve
Nanomites at unpacking time, but to inject a handler which resolves them at
execution time. Dumps using this handler will work on Windows XP and above
only though.

If Nanomites arent processed correcty, try to activate "high priority".
This should fix some windows internal timing issues.


Options:
--------

If a Dump ain't working correctly, you can try to change some Options.

Deactivate the Disassembler for any protection feature if not everything gets
fixed properly (e.g. there are not all import references/nanomites/spliced
jumps fixed/resolved due to code obfuscation which will make the disassmbler
fuck things up).
Decrease or set the Max. Size for Spliced Code sections to 0 if a section
gets wrongly detected as spliced (just in case...;) or increase it to make
a bigger Spliced Code section to be detected properly.

You should not need to change the number of threads used in the hook
engine. 1 should be the best choice in most of the cases.


"Give a man a fish, he'll eat for a day. Teach a man how to fish, he'll eat
for a lifetime."

Think about it


(c) 2005-2006 mr_magic