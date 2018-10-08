=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
=-=  		            -=-
-=-  ArmInline v0.96 Final  =-=
=-=     Admiral, 2005/6     -=-
-=-	                    =-=
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


Introduction & Disclaimer:
---------------------------

ArmInline is an Armadillo unpacking tool designed specifically to deal with the many antidump features available with private builds of Armadillo v3.5-4.4. Features:

* Code Splicing:
ArmInline 'revirgin's code protected by 'Strategic Code Splicing' by recursively identifying and removing the redundant opcodes, rather than dumping and patching in a VirtualAlloc. It is very clean and adds nothing to the size of your dump. 

* Import Elimination:
ArmInline is capable of consolidating DLL imports that have been shuffled by Armadillo's 'Import Elimination' and can generate a new IAT, which can then be used by ImpRec (or any other import table reconstructor). Any references to the old IAT are automatically redirected to the newly created, sorted IAT. Note that ArmInline cannot retrieve Armadillo's stolen imports, so you will have to fix this prior to rebasing the IAT if you want a working dump.

* Nanomites:
Locates all of the Nanomites in a dump and uses the packed exe to analyse them, generating a Nanomite table containing all the necessary information to produce a working dump. ArmInline can patch a small piece of vector exception handling code into your dump which will deal with the Nanomites on the fly.


It's not the fastest tool you're ever going to see - it can take a few seconds to work a large 'Dillo (due to the recursive nature of its Code Splicing redundancy algorithm, the brute-force Nanomite debugging and the fact that I took the liberty of using Visual Basic to write much of it) and although it hasn't failed me yet (much), ArmInline has certainly not been thoroughly tested and is provided without any guarantees whatsoever. So use this software at your own risk.

Requirements:
--------------

Windows XP SP1/SP2/2000.


What it does and how to use it:
--------------------------------

ArmInline's Code-Splicing and Import-Elimination tools work on a live process's memory and are intended to be used prior to dumping. 
The Nanomite recovery requires access to the packed exe (on disk) and an unpacked process (in memory and on disk) containing the Nanomites needing attention. It can be used before or after ImpRec, but shouldn't be used before dealing with CopyMem-II and Code-Splicing. I recommend using this tool last of all, when the only hurdle remaining is the Nanomites.

Depending the state of the process, some of the fields in the left panel may need to be filled in manually. ArmInline will try to take care of as many fields as possible, but sometimes it will need some help. You are free to override the defaults as you see fit. Either way, it's worth checking all the values as ArmInline's heuristic are not fail-safe.

------ Common Fields:

Process ID:
The process-ID of the (slave process) Armadilloed exe or the process containing the Armadilloed DLL.

Start Of Target Code:
The absolute virtual address of the start of the memory containing the code which causes the dump to fail. Typically, this can be set to the address of the '.text' section page (e.g. 0x401000 for an exe).

Length Of Target Code:
This needs only be large enough so that the 'Target Code' chunk spans all of the code in question (JMP instructions wanting replacing, references to a remote IAT and unresolved INT3s) but keeping this value as small as possible will reduce the time required to process the splices and also minimise the chances of misidentifying an antidump (which is unlikely but not impossible). Typically, this can be set to the size of the '.text' section.

------ Code Splicing Specific:

Start Of Spliced Code:
Armadillo (as of version 4.1) 'VirtualAlloc's a page containing exclusively the spliced code segments. It is generally the last (or occasionally second-to-last) memory page before the PE header of the DLL at the lowest memory location (the 'first' DLL), and is typically of the form 'xxx0000'. This parameter is the absolute virtual address of that page.

Length Of Spliced Code:
As you'd expect, this is the size of the 'spliced code' page.

USAGE:

Once ArmInline knows all of this information, hit the 'Remove Splices' button. If the parameters are correct, it should display the running total of fixed splices. Once ArmInline has identified a splice, it will remove the redundant instructions, reassemble it, and patch directly into where it should be (over the redirecting JMP). Once ArmInline says it's done (which can take a good few seconds for large programs), the resulting 'Target Code' memory is (in theory) identical to what it would be if the app was built without code-splicing. Hence the 'splices' segment is now redundant and need not be retained. The module may now be dumped and 'ImpRec'ed as usual.

If ArmInline reports splices with no apparent end, the remaining splices are patched in, but the process is probably invalid. This is usually indicative that one of the 'Spliced Code' parameters is incorrect. In this case, you are advised to 'Undo' the patch and double-check your parameters.

------ Import Elimination Specific:

Note: The auto-analysis entries for these fields are currently very unreliable. You're advised to check them carefully.

Base Of Existing IAT:
ArmInline needs to know where the program thinks its imports are so that it can differentiate between local calls and API calls. This value is an absolute virtual address.

Length Of Existing IAT:
In bytes. Must be a multiple of four. It doesn't matter whether you include trailing null entries.

New Base VA Of IAT:
This can be set to whatever you like, but it is advisable to put it in a different location from the existing IAT, so that ImpRec doesn't get confused. If you're confident that you know where the IAT was originally located, you should use that address. However, in general, recycling the old .text1 section is perfectly safe and is recommended if you plan on getting ImpRec to create a new imports section.

USAGE:

If your program has a fully working IAT that is in the wrong order and/or location, use this tool to put it where you want it. It is designed to recover Armadillo's import shuffling (so that ImpRec retrieves a bunch of valid thunks), but it cannot fix the eighty or so API functions that Armadillo redirects to its own code, so you'll need to patch this yourself before attempting to dump. This is generally done by patching what everyone is calling the 'magic jump' (I think Ricardo's to blame for that one) during the IAT generation routine. You can then, at any point (e.g. at the OEP) click 'Rebase IAT' and that should be the end of the story. This should leave no references to the old IAT. You will now be able to use ImpRec without having to mess about with any of the thunks (all thunks should be 'Valid: YES' from the get go).

------ Nanomites Specific:

Note: A 'repaired' dump will still spit out INT3 exceptions, but they will be handled by the first VEH in the chain. This means that although your dump will appear to still contain Nanomites under a debugger, it should work fine when run on its own. If you need to debug the repaired dump, you'll probably want to tell your debugger to pass INT3 exceptions to the program.

Before you can fix the Nanomites, you need to produce a table of them. Click 'Locate' and, if necessary, navigate to the Armadilloed executable file. Click past any nag screens that come up.

ArmInline will first scan the target code for any 0xCCs and produce a table of all their addresses. Next it launches the file as a debugged process, waiting patiently until the master process attempts to fix a Nanomite in the slave. Once the slave has reached its OEP, ArmInline takes over and spoofs INT3 after INT3 at every appropriate location with the EFlags register set to a variety of different values, all the time monitoring how the master process responds. 

It will generally take ten seconds or so to power through all of the potential Nanomite situations but once ArmInline's done, it will terminate the process and the table will be ready. It is recommended that you now save this table for future use. ArmInline can attempt to load any *.nan file so you can avoid having to analyse the Nanomites each time you attempt to fix a dump.

Once ArmInline has a table in memory (either from a new analysis or from an existing .nan file) you can use it to fix a dump. Click 'Repair Dump' and navigate to the corresponding dumped file (with no remaining code splices or encrypted pages) preferably after using ImpRec. ArmInline will now add a new section containing the Nanomite table and a (1.6k) lump of code to deal with the Nanomites on the fly.
For the inquisitive amongst you, here's how the dump-fix works:

ArmInline redirects the OEP to its own code so that the first thing that is done (after some boilerplate location code to find the necessary API functions) is to install a vector exception handler to catch any INT3 exceptions before the program can get its SEH chain to the matter. It also hooks the RtlAddVectoredExceptionHandler API function to ensure that no application-defined vector handlers get placed in front of the injected handler (the new VEH gets installed just behind the injected VEH, so this shouldn't interfere with existing exception handling). The handler will look up the address of the exception in its Nanomite table and patch in the appropriate jump (so each Nanomite will fire at most once). If the exception can't be identified as a Nanomite then the exception is passed along the chain as usual. 

If ArmInline reports a success, you'll find a new file has been created 'xxxx NanoFix.exe" in the source directory that should run just fine if the dump process was performed correctly. If further reversing is necessary, bear in mind that the EP lies outside of the 'Code Section', so you may want to place a hardware breakpoint at the jump to OEP (which is a couple of dozen instructions after the new EP).

Check 'Manually locate target' if you don't want ArmInline to to attempt to automatically locate the packed file.

If you need to specify parameters at load-time, you can use the 'Edit command-line' checkbox.


Nanomite File Format (*.nan)
-----------------------------

I include this specification so that should you choose not to use my (hacky) inline patch to fix your dump, you can still use the information extracted by ArmInline.
The format is dead simple. Essentially, it's nothing more than a load of unsigned longs.
Each Nanomite is described by the following structure:

struct Nanomite {
    long Address
    long Destination
    long Size
    long JumpType
}

The first dword in the file is the number of Nanomites described in the rest of the file. It is immediately followed by an array (with that number of elements) of the above structure. Once you've extracted this array you should be at EOF. Here are the details on the structure:

Address:     The virtual address of the Nanomite. Each one of these should point to a 0xCC in your dump.

Destination: The virtual address to which the Jcc jumps (if the jump is taken).

Size:        The size of the instruction in bytes (including the Jcc opcode and the relative/absolute address). I'm not entirely sure how this made it into the structure, if it's useful or even valid. On examining a few .nan files, this field seems to contain some strange-looking values. You shouldn't need to use this field, but if you choose to, be careful.

JumpType:    An enumeration that describes what type of Jcc you're looking at. The values are:

JUnknown = 0
NotNanomite = 1
JMP = 2
JNZ = 3
JZ = 4
JB = 5
JBE = 6
JA = 7
JNB = 8
JG = 9
JGE = 10
JL = 11
JLE = 12
JP = 13
JPE = 14
JNP = 15
JPO = 16
JS = 17
JNS = 18
JCXZ = 19
JNCXZ = 20
JC = 21
JNC = 22
JO = 23
JNO = 24

A word of warning: Don't be tempted to iterate through the array, assemble the jumps and patch them into the dump. Although this will fix all the Nanomites, it will also destroy some other instructions (namely 0xCCs that weren't put there by Armadillo). This is because the array contains information for every occurrence of the 0xCC byte, not only ones which are Nanomites. Unfortunately it is impossible to determine (from a dead-listing) which Nanomites are genuine, so you're gonna have to either use a loader or dabble in VEH (unless you can think of a better way).
I'm aware that this file format could have been made a lot cleaner and smaller, but I had my reasons for sticking to unsigned longs.


Credit where credit is due:
----------------------------

I owe a lot to Hiei for solving the 'No Nanomites Found' nightmare. Here's a shout from the UK.
Thanks to Vanja Fuckar for the excellent disassembly engine. 
To Ricardo for his somewhat cryptic, but nonetheless invaluable descriptions of Armadillo's inner workings.
To the good people at Woodmann's RCE message board for guiding me through this (occasionally frustrating) project.
To Silicon Realms Toolworks. You are good people and Armadillo is an excellent product. 

Known Issues:
--------------

General:

One for the VB6 gurus: If anybody knows a good way to put icons into a ListBox (or similar) without having to use a ListView control (or equivalently without having to carry MSCOMCTL about - it's huge) then let me know. I'd like to make the process viewer a bit prettier.


Code Splicing:

Occasionally the Code Splicing engine will fail when supplied with some code that contained a redundant opcode before Armadillo even got to it (and hence it doesn't know how much dead code to remove). Often (but not always) you will be alerted of any such failures, so make sure you check the console window before assuming everything went okay. Very occasionally ArmInline will think everything has gone okay when one or more code splices is incorrect. In either case, the number of remaining problem splices should be small and manual repair shouldn't take much effort.
The location of any such residues can usually be found by running the process after ArmInline has worked on it (after you're finished dumping it) and checking for any exceptions that don't otherwise occur.


Import Elimination:

This seems to be working 100%


Nanomites:

Version 0.9 fixed the 'Process didn't attempt to repair Nanomites' problem for many users, but if you're still getting that (after thoroughly reading the instructions) I'd like to hear from you.


Contact:
---------

This software hasn't been tested very thoroughly, so I'm sure there are still bugs. It seems like the newest Armadilloed targets are getting resistant, an unfortunately that's the way it will stay. The project is now officially discontinued (but source is available if you fancy it) so don't expect any updates.
If you're feeling very lucky, you may try me on admirallo@gmail.com, but don't expect much.


Version History:
-----------------

23/07/06 - v0.96f
Final release: Freedom.

24/04/06
Bugfix: (Nanomites) Fixed a rare error where JNZ was identified as JZ.
NanoViewer now takes a command-line parameter and displays in hex by default.
Useless Nanomites are no longer stored (so patched filesizes are smaller).

21/04/06
Bugfix: Nanomites command-buttons now behave.
Bugfix: The minimise button is back.
Bugfix: ArmInline will now close properly during autoanalysis.

17/04/06
Added more heuristics to detect Code Splicing and IAT locations. These are currently untested so expect bugs.
General UI upgrades.

15/04/06
Bugfix: Removed the crippling Code-Splicing safety feature that was doing more harm than good.
Bugfix: The final VirtualProtect will no longer overflow into the .data section.

14/04/06
Process list now preserves case.
BugFix: The [System] process doesn't cause a crash when selected.

13/04/06 - v0.9
Readme revised

09/04/06
Process-viewer finally added, along with some automatic address filling-in.

05/04/06
Bugfix: Nanolib.dll has been heavily revised and is now compatible with many variants of kernel32.dll. This should resolve the 'process didn't attempt...' error that is getting ever popular.
Also, ArmInline is now backwards-compatible with SP1, and possibly 2600.

03/04/06
Bugfix: Imports 'New Base VA' box was incorrectly labeled 'RVA'.

31/03/06
Bugfix: (Import Elimination) Cleaned up a rare bounds error on the last function of the last DLL.

26/02/06
Added separate Nanomite-tree (.nan file) viewer and documented the file format.

11/10/05 - v0.7
Bugfix: (Code Splicing) Added a routine to identify genuine 'MOV EDI, EDI' opcodes. This fixes the problems some people have been having with the 'non-contiguous code' error.

18/9/05 - v0.6
Added Nanomite support. Albeit a bit of a pain to use.
Bugfix: 'Process ID' field now accepts up to 8 digits.

06/9/05 - v0.5
Added preliminary Nanomite functionality.

05/9/05 - v0.4
Added implementation of the 'Import Elimination' feature.
Bugfix: (Code Splicing) 'False alarm' return jumps from code-splices can no longer cause an overflow when they point to a crazy memory location.
Bugfix: (Code Splicing) ArmInline now recognises extended registers to be dependent on their word counterparts (so the Code-Splicing engine is more reliable).

29/8/05 - v0.3
Added placeholder interface for IAT rebasing and Nanomite recovery.
Bugfix: (Code Splicing) No longer removes (legitimate) register-preserving PUSH/POP combos surrounding redundant code.

28/8/05 - v0.2
Bugfix: (Code Splicing) Fixed a bug where it didn't locate a splice redirect JMP that is within four bytes of another instruction containing 0xE9.

23/8/05 - Initial release v0.1
