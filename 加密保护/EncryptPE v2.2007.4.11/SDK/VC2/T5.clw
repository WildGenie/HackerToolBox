; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CT5View
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "T5.h"
LastPage=0

ClassCount=6
Class1=CT5App
Class2=CT5Doc
Class3=CT5View
Class4=CMainFrame

ResourceCount=2
Resource1=IDR_MAINFRAME
Class5=CLeftView
Class6=CAboutDlg
Resource2=IDD_ABOUTBOX

[CLS:CT5App]
Type=0
HeaderFile=T5.h
ImplementationFile=T5.cpp
Filter=N

[CLS:CT5Doc]
Type=0
HeaderFile=T5Doc.h
ImplementationFile=T5Doc.cpp
Filter=N

[CLS:CT5View]
Type=0
HeaderFile=T5View.h
ImplementationFile=T5View.cpp
Filter=W
BaseClass=CEditView
VirtualFilter=VWC
LastObject=CT5View


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T



[CLS:CLeftView]
Type=0
HeaderFile=LeftView.h
ImplementationFile=LeftView.cpp
Filter=T
BaseClass=CTreeView
VirtualFilter=VWC
LastObject=CLeftView

[CLS:CAboutDlg]
Type=0
HeaderFile=T5.cpp
ImplementationFile=T5.cpp
Filter=D
LastObject=CAboutDlg

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_APP_EXIT
Command2=ID_APP_ABOUT
CommandCount=2

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

