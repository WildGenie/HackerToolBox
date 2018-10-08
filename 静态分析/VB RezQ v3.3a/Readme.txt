
VB RezQ - Source Recovery for Visual Basic
==========================================

Lost your Visual Basic source files?... 

...Call VB RezQ to your rescue! 
VB RezQ saves you time and effort. Let VB RezQ help you re-write your 
program by re-creating your source files from the data that's hidden 
inside the compiled file. 


RELEASE NOTES - Version 3.3a
============================

VB RezQ provides an accurate framework on which you can rebuild your 
VB application. It identifies all the source files, recovers the 
project file, the graphical design of each form including the 
graphics themselves, references to custom controls and declarations 
for API calls. It also identifies all events and subroutines and 
embedded resources. 

VB RezQ can recover source from all types of 32-bit Visual Basic 
executables i.e .exe, .ocx and .dll files created by VB4(32), VB5 
and VB6.  

Please see the licence agreement (licence.txt) for limitations on the 
duplication and distribution of this software and other important 
information.


KNOWN LIMITATIONS

VB RezQ produces empty subroutines - it does not recover the source 
code within subroutines. For native compiled executables, it can 
provide a disassembly of the native x86 code.

The operation of VB RezQ relies on an understanding of the internal 
format of compiled Visual Basic executable files. There is no 
publicly available definition of this format. A tedious process of 
compiling test programs and inspecting the result has allowed much 
of it to be deduced. It is unlikely, however, that this testing has 
covered every possible aspect and it is to be expected that the 
occasional executable will cause problems for VB RezQ.


INSTALLATION

First unZip the distribution file to a temporary folder. 
Then run the Setup program which will carry out the installation.


CHANGES IN VB RezQ v3.3a  25-Jun-07
Added full recovery of properties for this commonly used custom control:-
   TabbedDialog  (TABCTL32.OCX)
Corrected recovery of long/complex string properties in embedded instances of UserControls
Corrected occassional corruption of recovered subroutine names.
Added trapping of any attempt to open a file with an Unicode filename which would cause a runtime error 52.

CHANGES IN PREVIOUS VERSIONS OF VB RezQ

v3.2a  1-Nov-06
Added full recovery of the properties and events for these 2 
commonly used custom controls:- 
     MSFlexGrid  (MSFLXGRD.OCX)
     SysInfo  (SYSINFO.OCX)
Added recovery of Event names only for these custom controls:-
     ADO Data  (MSADODC.OCX)
     Animation, UpDown  (COMCT232.OCX)
     Animation, DTPicker, FlatScrollBar, MonthView, UpDown  (MSCOMCT2.OCX)
     CoolBar  (COMCT332.OCX)
     DataCombo, DataList  (MSDATLST.OCX)
     DataGrid  (MSDATGRD.OCX)
     DataRepeater  (MSDATREP.OCX)
     Gauge  (GAUGE32.OCX)
     Graph  (GRAPH32.OCX)
     Grid  (GRID32.OCX)
     Hierarchical FlexGrid  (MSHFLXGD.OCX)
     KeyState  (KEYSTA32.OCX)
     ListView, ProgressBar, Slider, StatusBar, TabStrip, Toolbar, TreeView  (COMCTL32.OCX)
     Multimedia MCI  (MCI32.OCX)
     Outline  (MSOUTL32.OCX)
     Remote Data Connector  (MSRDC20.OCX)
     SSCheck, SSCommand, SSFrame, SSOption, SSPanel, SSRibbon  (THREED32.OCX)
     TabbedDialog  (TABCTL32.OCX)
     WebBrowser  (SHDOCVW.DLL)
Added full XP style support.
Corrected Object reference in forms using controls from Forms 2.0.
Corrected poor recovery of MouseIcon property in original VB5 version of these controls:-
     DBList, DBCombo, MaskEdBox, RichText
Corrected poor recovery of Font property in original VB5 version of the RichText control

v3.1c  19-Jun-06 
Fixed missing text when saving some very large form files with native code disassembly.

v3.1b  4-May-06
Fixed an out-of-range error when saving a recovered resource file.

v3.1a  2-Feb-06
Provided these improvements to the x86 disassembly of native code:- 
     added identification of blocks of data bytes within the code (computed jump tables); 
     fixed a failure to comment VB Runtime references for some VB5 projects; 
     fixed an occasional failure to comment VB Runtime references in projects using APIs. 
Corrected the occasional poor recovery of the Font property in VB5 for these controls:-
     DBList, DBCombo and MaskEdBox

v3.0a  29-Nov-05
Added x86 disassembly of native code with comments for :-
     calls to VB runtime functions
     jump destinations
     calls to other routines within the application
     calls to API routines within DLLs
     text strings
Added full recovery of properties and events for these 2 
commonly used custom controls:-
     PictureClip (PICCLP32.OCX)
     RichText (RICHTX32.OCX)
Added reporting of compiler build and locale data, and VB RezQ 
Option menu settings to the Progress log.
Added the VB internal name to each filename written to the Progess log.
Added a status bar to the main form.
Improved the recovery of non-english strings for all controls.
Fixed the incomplete recovery of properties of Tabstrip & Toolbar 
controls (MSCOMCTL.OCX).

v2.6a  15-Nov-04
Added the saving of Resources direct to a .res file (it no 
longer required a helper program).
Added full recovery of the properties and events for these 2 
commonly used custom controls:- 
   MaskEdBox (MSMASK32.OCX) 
   DBGrid (DBGRID32.OCX) 
and also extended recovery for all 22 supported common custom 
controls to VB4. 
Added separation of Sub declarations for VB4 .bas modules into 
their respective modules, improved the recovery of some .vbp settings 
and the recovery of custom properties of embedded UserControls.
Added recovery of sufficient properties for WebClass and DataReport 
designers to avoid errors when loading into the VB IDE.

v2.5c  10-May-04
Restored the recovery of VB4 code module subroutine declarations 
(missing since v2.5a) and corrected the recovery of the parameter 
list for the Inet_StateChanged event, the Data parameter for custom 
control OLE... events, the .vbp VersionInfo when running under 
Windows XP and zero length Menu Captions in VB4.
Improved the accuracy of recovery of the VB_Creatable, VB_Exposed 
and VB_PredeclaredID attributes, and added the identification of a 
Sub Main routine for VB5/6 Native code and for VB4.

v2.5b  27-Feb-04
Corrected the recovered parameter list for Validate events for a 
number of standard controls in VB6.

v2.5a  29-Jan-04
Added full recovery of the properties and events for these 6 
commonly used custom controls in VB5 & VB6 :- 
  AniPushButton (ANIBTN32.OCX), 
  AutoFill (AUTOFILL.DLL), 
  Inet (MSINET.OCX), 
  MSChart (MSCHART.OCX & MSCHART20.OCX versions), 
  SpinButton (SPIN32.OCX)
Added recovery of subroutine names for control events in VB4.
Minor improvements to the recovery of event names - mainly in 
VB5/6 classes - and to the recovery of the Bindings property for 
custom controls.

v2.4a  12-May-03
Added full recovery of the properties and events for these 4 
commonly used custom controls in VB5 & VB6 :- 
  MSComm (MSCOMM32.OCX),
  Winsock (MSWINSCK.OCX),
  DBList and DBCombo (DBLIST32.OCX).
Added full recovery of properties and events for the Forms Designer.
Added recovery of events for other commonly used Designers (.DSR).

v2.3g  28-Apr-03
Increased the number of .FRX references that can be recovered per form.

v2.3f  01-Apr-03
Fixed recovery of DBCS text (e.g. Big 5) when run under Asian language 
versions of Windows.

v2.3d  06-Mar-03
Added recovery of all files for very large projects. VB RezQ will 
now display a group of up to 125 recovered files at a time. These 
files can be saved and then the next group of files recovered.
Added facility to Copy selected text to the Windows clipboard.
Improved recovery of common properties used by Designers (.DSR).
Improved recovery of parameter lists for events having the same name 
used by different controls.
Improved detection of subroutines for VB4/32 and VB5/6 p-code projects.
 
v2.3b  10-Jan-03
Improved robustness to unexpected form encodings.
Improved recovery of DataFormat property of built-in controls.

v2.3a  02-Jan-03
Added full recovery of the properties and events for these 10 
commonly used custom controls in VB5 & VB6 :- 
  Common Dialog (COMDLG32.OCX), 
  ImageCombo, ImageList, ListView, ProgressBar, Slider, StatusBar, 
  TabStrip, Toolbar and TreeView (MSCOMCTL.OCX). 
Added an Options menu which enables the full recovery of custom 
controls to be suppressed. 
Improved recovery of control properties with long text values, 
and the DataFormat and Bindings properties of custom controls. 

v2.1d	22-Aug-02
Greatly improved speed of rebuilding forms containing ComboBoxes. 
(Earlier versions could appear to 'hang' on these forms.)
Negative values of ScrollBar Min and Max properties now correctly 
recovered.

v2.1c   6-Aug-02
Fixed an out-of-range error in handling large projects with more 
than 60 forms, classes and modules.
Added recovery of event names for MSCOMCTL.OCX controls.

v2.1a  18-Jun-01
Added creation of a script to extract additional resources.
Improved identification of Designers (.dsr files)
Improved recovery of VB6 subroutine names.


CONTACT
If you encounter problems with VB RezQ please contact us. We will 
do our best to help resolve them.

email : support@vbrezq.com
http://www.vbrezq.com/


Copyright © 2007 ThunderPeek Software, England
All Rights Reserved.
