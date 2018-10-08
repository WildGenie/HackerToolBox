Armadillo Nanomites Fixer v1.2

Introduction:
ArmNF is a tool designed to deal with Nanomites on Armadillo
protected program.This tool can find all Nanomites and patch them
directly to a dumped file or to a Child process [ for who wants to execute
Child process].

This tool is based on Admirals ArmInline::Nanomites Search Engine.

=================================================
How To Use:
1-Select Search Type:
-If you have a child proccess loaded in ollydbg,
you can use "Select From Process" then select the Child ProcessID
[Before using this Part you have to fix all current protection in the child
process(like code-splicing , ...)].

-If you have a Dumped file , you can use "Select From Dumped Process",
(in this case there is no need to have a child process)then select the dumped 
and original exe file in the correct position[ i don't check the select file position , so this may causes crash ArmNF].

2-Select Compiler Option:
-After selecting the type of search you have to select the compiler for
optimization . Its important to select the right compiler.
Becuase there is 2 type of optimization for compilers.
if you select wrong compiler , the resultant of this search have many error.
if you dont know the compiler ,use OtherCompiler or check your dump file with PE scanner!!
If your compiler is MSVC , you have to enter the Correct OEP selected Child proccess.
OEP of dumped file read from itself.

3-Start Search:
Select the search button and be patient.this may take a few minute.
There are some error can be occurred in this case:
1-If you use the child process and armadillo fake the PE header
in memory you give an error message ,in this case you have to fix 
the PE header the try again.
2-you selected the child process which encrypted .
in this case you may give error message like :
"There is no Nanomites found" or etc...
you have to select the right Process.
3-maybe some error found.
in this case close ArmNF and try again.

After Search finished , you can save the current Nanomites by 2 type:
anf:Armadillo Nanomites Fixer file.
txt:create a log of all current Nanomites in this file
Or you can select 2 type for patching by selecting:
1-"Apply Patch To Dumped_":in this case Nanomites
Patch directly to selected dump file.
A file copied with suffix x_ArmNF.exe .
2-"Apply Patch To Memory":apply Patch to a child process Memory.
[i make a simple check to match the Loaded anf file and selected process]
you can backup the CodeSection of Child process and restore it on any time.


=================================================

Tested on:
windows xp sp1 & sp2 .
Armadillo Protected program v4.xx to 7.

=================================================

For suggestion,bug report , or any reason :
NeVaDa@UnREal-RCE.net

=================================================

Special Thanks To:
Admiral For Nanomites Search Engine Source Code.
Oleh Yuschuk For 32-bit  Assembler And Disassembler  Source Code.
To All of My Teammate For their suggestions.
To ARTeam,SND,and All who Provide a Place for Learning RE community.

NeVaDa
UnReal-RCE
Persian Crackers






