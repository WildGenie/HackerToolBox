=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
~                        ReloX v1.0 * by MackT/uCF2000 in 2003                        ~
=                                                                                     =
~                       - *for Windows 9x, ME, NT, 2K and XP* -                       ~
=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=

Disclaimer:
-----------
This program may crash, or in a worse case it may even reboot your computer, so please use
it with caution. (Do not run it 3 hours into an unsaved coding session for example)

I am *NOT* responsible for any damage caused by the use of it.


Purpose:
--------
ReloX is a Win32 relocations rebuilder. It will create a .reloc section from different
based images.


What does it need?
------------------
- At least 2 different based images of a module. The more you have images, the more
  your relocations will be reliable.


How does it work?
-----------------
1) - Select the first based image with the "..." button on the "Original" line.

     The imagebase will be put automatically. If it is not right, modify it.

2) - Select the second based image with the "..." button on the "Compare to" line.

     The imagebase will be put automatically. If it is not right, modify it.

3) - Click on "Select Sections" to select all sections which contain code for
     comparison (default is all).

4) - Click on "Compare" to start comparison between the modules.

     The result will be in the list control.

5) - If you have other based images, redo the same thing from 2) for all of them

6) - Click on "Fix PE Module" to select a pe file and fix with the new ".reloc" section.

     (no backup needed just like ImpREC(tm))


Limitations
-----------
- It will only support 32 bits relocations of type (3).
  (IMAGE_REL_BASED_HIGHLOW : The fixup applies the delta to the 32-bit field at Offset)


Thanks to
---------
Muffin and Snacker for testing.


Greetings to
------------
Michelle Branch, Jackie Chan and Jet Li.

