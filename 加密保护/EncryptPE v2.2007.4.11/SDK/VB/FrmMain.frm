VERSION 5.00
Begin VB.Form FrmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "EncryptPE(EPE_SDK For VisualBasic Sample)"
   ClientHeight    =   7065
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9030
   Icon            =   "FrmMain.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7065
   ScaleWidth      =   9030
   ShowInTaskbar   =   0   'False
   Begin VB.Frame FraOther 
      Caption         =   "其它测试"
      Height          =   2490
      Left            =   75
      TabIndex        =   23
      Top             =   3285
      Width           =   8910
      Begin VB.TextBox TxtHwnd 
         Height          =   270
         Left            =   5235
         TabIndex        =   69
         Top             =   630
         Width           =   945
      End
      Begin VB.TextBox TxtIndex 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   8430
         Locked          =   -1  'True
         TabIndex        =   67
         Text            =   "5"
         Top             =   615
         Width           =   375
      End
      Begin VB.ComboBox ComHwnd 
         Height          =   300
         ItemData        =   "FrmMain.frx":0E42
         Left            =   6255
         List            =   "FrmMain.frx":0E67
         Style           =   2  'Dropdown List
         TabIndex        =   66
         Top             =   615
         Width           =   2130
      End
      Begin VB.CommandButton SetWindow 
         Caption         =   "窗口句柄参数(&H)"
         Height          =   285
         Left            =   3045
         TabIndex        =   65
         Top             =   600
         Width           =   1650
      End
      Begin VB.Frame FraExp 
         Caption         =   "过期提示"
         Height          =   1440
         Left            =   3030
         TabIndex        =   47
         Top             =   945
         Width           =   5775
         Begin VB.CommandButton CmdSetTest 
            Caption         =   "设置(&M)"
            Height          =   1125
            Left            =   5250
            TabIndex        =   64
            Top             =   210
            Width           =   420
         End
         Begin VB.TextBox TxtEMail 
            BackColor       =   &H00FFFFC0&
            Height          =   270
            Left            =   1710
            TabIndex        =   60
            Text            =   "sales@yesite.com"
            Top             =   1065
            Width           =   3480
         End
         Begin VB.TextBox TxtWebSite 
            BackColor       =   &H00C0FFC0&
            Height          =   270
            Left            =   1710
            TabIndex        =   59
            Text            =   "www.yesite.com"
            Top             =   735
            Width           =   3480
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H00FF0000&
            Height          =   250
            Index           =   8
            Left            =   720
            Style           =   1  'Graphical
            TabIndex        =   58
            Top             =   1095
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H0000C000&
            Height          =   250
            Index           =   7
            Left            =   420
            Style           =   1  'Graphical
            TabIndex        =   57
            Top             =   1095
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H0000FFFF&
            Height          =   250
            Index           =   6
            Left            =   105
            Style           =   1  'Graphical
            TabIndex        =   56
            Top             =   1095
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H00FF00FF&
            Height          =   250
            Index           =   5
            Left            =   720
            Style           =   1  'Graphical
            TabIndex        =   55
            Top             =   780
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H000080FF&
            Height          =   250
            Index           =   4
            Left            =   420
            Style           =   1  'Graphical
            TabIndex        =   54
            Top             =   780
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H00C0C000&
            Height          =   250
            Index           =   3
            Left            =   720
            Style           =   1  'Graphical
            TabIndex        =   53
            Top             =   465
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H00404080&
            Height          =   250
            Index           =   2
            Left            =   420
            Style           =   1  'Graphical
            TabIndex        =   52
            Top             =   465
            Width           =   250
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H000000FF&
            Height          =   250
            Index           =   1
            Left            =   105
            Style           =   1  'Graphical
            TabIndex        =   51
            Top             =   780
            Value           =   -1  'True
            Width           =   250
         End
         Begin VB.TextBox TxtInfo 
            BackColor       =   &H00C0E0FF&
            Height          =   450
            Left            =   1710
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   50
            Text            =   "FrmMain.frx":0F05
            Top             =   210
            Width           =   3480
         End
         Begin VB.OptionButton OptColor 
            BackColor       =   &H00000000&
            Height          =   250
            Index           =   0
            Left            =   105
            Style           =   1  'Graphical
            TabIndex        =   49
            Top             =   465
            Width           =   250
         End
         Begin VB.Label LblInfo 
            AutoSize        =   -1  'True
            Caption         =   "邮箱："
            Height          =   180
            Index           =   2
            Left            =   1200
            TabIndex        =   63
            Top             =   795
            Width           =   540
         End
         Begin VB.Label LblInfo 
            AutoSize        =   -1  'True
            Caption         =   "网址："
            Height          =   180
            Index           =   1
            Left            =   1200
            TabIndex        =   62
            Top             =   1110
            Width           =   540
         End
         Begin VB.Label LblInfo 
            AutoSize        =   -1  'True
            Caption         =   "信息："
            Height          =   180
            Index           =   0
            Left            =   1185
            TabIndex        =   61
            Top             =   465
            Width           =   540
         End
         Begin VB.Label LblColor 
            AutoSize        =   -1  'True
            Caption         =   "字体颜色 255"
            Height          =   180
            Left            =   120
            TabIndex        =   48
            Top             =   240
            Width           =   1080
         End
      End
      Begin VB.CommandButton CmdProcess 
         Caption         =   "杀掉进程(&K)"
         Height          =   285
         Left            =   3030
         TabIndex        =   46
         Top             =   180
         Width           =   1650
      End
      Begin VB.TextBox TxtProcess 
         Height          =   270
         Left            =   4755
         TabIndex        =   45
         Text            =   "ProcDump,LordPe"
         Top             =   195
         Width           =   4035
      End
      Begin VB.Frame FrmOperate 
         Caption         =   "运算符号"
         Height          =   2130
         Left            =   90
         TabIndex        =   25
         Top             =   255
         Width           =   2880
         Begin VB.CommandButton CmdCalc 
            Caption         =   "计算(&V)"
            Height          =   285
            Left            =   75
            TabIndex        =   44
            Top             =   1740
            Width           =   930
         End
         Begin VB.TextBox TxtValue 
            BackColor       =   &H00000000&
            ForeColor       =   &H0000FFFF&
            Height          =   270
            Index           =   3
            Left            =   1065
            Locked          =   -1  'True
            TabIndex        =   43
            Top             =   1755
            Width           =   1740
         End
         Begin VB.TextBox TxtValue 
            Height          =   270
            Index           =   0
            Left            =   90
            TabIndex        =   42
            Text            =   "9876"
            Top             =   570
            Width           =   1110
         End
         Begin VB.TextBox TxtValue 
            Height          =   270
            Index           =   1
            Left            =   1275
            TabIndex        =   41
            Text            =   "5432"
            Top             =   570
            Width           =   1110
         End
         Begin VB.TextBox TxtValue 
            Height          =   270
            Index           =   2
            Left            =   2445
            TabIndex        =   40
            Text            =   "0"
            Top             =   570
            Width           =   300
         End
         Begin VB.OptionButton OptCalc 
            Caption         =   "计算值"
            Height          =   225
            Index           =   0
            Left            =   90
            TabIndex        =   39
            Top             =   255
            Value           =   -1  'True
            Width           =   840
         End
         Begin VB.OptionButton OptCalc 
            Caption         =   "随机数"
            Height          =   225
            Index           =   1
            Left            =   990
            TabIndex        =   38
            Top             =   255
            Width           =   885
         End
         Begin VB.OptionButton OptCalc 
            Caption         =   "指定值"
            Height          =   225
            Index           =   2
            Left            =   1890
            TabIndex        =   37
            Top             =   255
            Width           =   840
         End
         Begin VB.PictureBox PicOperate 
            Height          =   765
            Left            =   60
            ScaleHeight     =   705
            ScaleWidth      =   2685
            TabIndex        =   26
            Top             =   915
            Width           =   2745
            Begin VB.OptionButton OptOperate 
               Caption         =   "shr"
               Height          =   250
               Index           =   9
               Left            =   2205
               Style           =   1  'Graphical
               TabIndex        =   36
               Top             =   390
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "shl"
               Height          =   250
               Index           =   8
               Left            =   2205
               Style           =   1  'Graphical
               TabIndex        =   35
               Top             =   75
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "xor"
               Height          =   250
               Index           =   7
               Left            =   1680
               Style           =   1  'Graphical
               TabIndex        =   34
               Top             =   390
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "or"
               Height          =   250
               Index           =   6
               Left            =   1155
               Style           =   1  'Graphical
               TabIndex        =   33
               Top             =   390
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "and"
               Height          =   250
               Index           =   5
               Left            =   630
               Style           =   1  'Graphical
               TabIndex        =   32
               Top             =   390
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "mod"
               Height          =   250
               Index           =   4
               Left            =   105
               Style           =   1  'Graphical
               TabIndex        =   31
               Top             =   405
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "÷"
               Height          =   250
               Index           =   3
               Left            =   1680
               Style           =   1  'Graphical
               TabIndex        =   30
               Top             =   75
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "×"
               Height          =   250
               Index           =   2
               Left            =   1155
               Style           =   1  'Graphical
               TabIndex        =   29
               Top             =   75
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "-"
               Height          =   250
               Index           =   1
               Left            =   630
               Style           =   1  'Graphical
               TabIndex        =   28
               Top             =   75
               Width           =   435
            End
            Begin VB.OptionButton OptOperate 
               Caption         =   "+"
               Height          =   250
               Index           =   0
               Left            =   90
               Style           =   1  'Graphical
               TabIndex        =   27
               Top             =   75
               Value           =   -1  'True
               Width           =   435
            End
         End
      End
      Begin VB.Label LblHwnd 
         AutoSize        =   -1  'True
         Caption         =   "句柄"
         Height          =   180
         Left            =   4800
         TabIndex        =   68
         Top             =   675
         Width           =   360
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H80000011&
         Index           =   7
         X1              =   3045
         X2              =   12955
         Y1              =   540
         Y2              =   540
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H00FFFFFF&
         Index           =   6
         X1              =   3030
         X2              =   12940
         Y1              =   525
         Y2              =   525
      End
   End
   Begin VB.TextBox TxtResult 
      Height          =   1140
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   11
      Text            =   "FrmMain.frx":0F2E
      Top             =   5850
      Width           =   8895
   End
   Begin VB.Frame FraGen 
      Caption         =   "一般功能(&G)"
      Height          =   1425
      Left            =   60
      TabIndex        =   8
      Top             =   105
      Width           =   4140
      Begin VB.CommandButton CmdGetSysInfo 
         Caption         =   "获取系统目录信息(&I)"
         Height          =   285
         Left            =   120
         TabIndex        =   12
         Top             =   1020
         Width           =   1965
      End
      Begin VB.CommandButton CmdInitEngine 
         Caption         =   "初始化SDK引擎(&E)"
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Top             =   300
         Width           =   1965
      End
      Begin VB.CommandButton CmdShowRegForm 
         Caption         =   "显示注册窗口(&W)"
         Height          =   285
         Left            =   120
         TabIndex        =   9
         Top             =   660
         Width           =   1965
      End
   End
   Begin VB.Frame FraReg 
      Caption         =   "注册信息(&R)"
      Height          =   1575
      Left            =   60
      TabIndex        =   1
      Top             =   1635
      Width           =   4125
      Begin VB.CommandButton CmdRegUser 
         Caption         =   "取注册者名称"
         Height          =   705
         Left            =   3360
         TabIndex        =   24
         Top             =   270
         Width           =   630
      End
      Begin VB.CommandButton CmdSetRegInfo 
         Caption         =   "设置注册信息(&S)"
         Height          =   285
         Left            =   2115
         TabIndex        =   7
         Top             =   1170
         Width           =   1845
      End
      Begin VB.CommandButton CmdGetRegInfo 
         Caption         =   "获取注册信息(&G)"
         Height          =   285
         Left            =   135
         TabIndex        =   6
         Top             =   1170
         Width           =   1845
      End
      Begin VB.TextBox TxtRegInfo 
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Left            =   1095
         TabIndex        =   5
         Text            =   "回家的感觉"
         Top             =   645
         Width           =   2190
      End
      Begin VB.TextBox TxtUserName 
         BackColor       =   &H00FFC0FF&
         Height          =   270
         Left            =   1095
         TabIndex        =   3
         Text            =   "阿明和琳丫头"
         Top             =   315
         Width           =   2190
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H00FFFFFF&
         Index           =   1
         X1              =   15
         X2              =   4125
         Y1              =   1065
         Y2              =   1065
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H80000011&
         Index           =   0
         X1              =   0
         X2              =   4110
         Y1              =   1050
         Y2              =   1050
      End
      Begin VB.Label LblRegInfo 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "注册信息："
         Height          =   180
         Left            =   150
         TabIndex        =   4
         Top             =   720
         Width           =   900
      End
      Begin VB.Label LblUserName 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "注册用户："
         Height          =   180
         Left            =   150
         TabIndex        =   2
         Top             =   375
         Width           =   900
      End
   End
   Begin VB.Frame FraStr 
      Caption         =   "字符串操作"
      Height          =   3105
      Left            =   4260
      TabIndex        =   0
      Top             =   105
      Width           =   4695
      Begin VB.CommandButton CmdMemory 
         Caption         =   "测试EPEFillMemory、EPECopyMemory等"
         Height          =   285
         Left            =   105
         TabIndex        =   22
         Top             =   1980
         Width           =   4485
      End
      Begin VB.TextBox TxtPassword 
         Height          =   585
         Left            =   3420
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   21
         Text            =   "FrmMain.frx":0FC5
         Top             =   1170
         Width           =   1170
      End
      Begin VB.CommandButton CmdString 
         Caption         =   "解压字符(&3)"
         Enabled         =   0   'False
         Height          =   285
         Index           =   3
         Left            =   1425
         TabIndex        =   19
         Top             =   1485
         Width           =   1260
      End
      Begin VB.CommandButton CmdString 
         Caption         =   "压缩字符(&2)"
         Height          =   285
         Index           =   2
         Left            =   1425
         TabIndex        =   18
         Top             =   1155
         Width           =   1260
      End
      Begin VB.CommandButton CmdString 
         Caption         =   "解密字符(&1)"
         Enabled         =   0   'False
         Height          =   285
         Index           =   1
         Left            =   105
         TabIndex        =   17
         Top             =   1485
         Width           =   1260
      End
      Begin VB.CommandButton CmdString 
         Caption         =   "加密字符(&0)"
         Height          =   285
         Index           =   0
         Left            =   105
         TabIndex        =   16
         Top             =   1155
         Width           =   1260
      End
      Begin VB.TextBox TxtString 
         BackColor       =   &H00C0C0FF&
         Height          =   705
         Left            =   90
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Text            =   "FrmMain.frx":0FCE
         Top             =   255
         Width           =   4530
      End
      Begin VB.CommandButton CmdStringFunction 
         Caption         =   "字符串加/解密、压缩/解压缩(&C)"
         Height          =   285
         Left            =   105
         TabIndex        =   14
         Top             =   2340
         Width           =   4485
      End
      Begin VB.CommandButton CmdFileFunction 
         Caption         =   "文件加/解密、压缩/解压缩(&D)"
         Height          =   285
         Left            =   105
         TabIndex        =   13
         Top             =   2685
         Width           =   4485
      End
      Begin VB.Label LblPassword 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "密码："
         Height          =   180
         Left            =   2850
         TabIndex        =   20
         Top             =   1350
         Width           =   540
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H00FFFFFF&
         Index           =   5
         X1              =   45
         X2              =   4955
         Y1              =   1875
         Y2              =   1875
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H80000011&
         Index           =   4
         X1              =   30
         X2              =   4940
         Y1              =   1860
         Y2              =   1860
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H80000011&
         Index           =   3
         X1              =   0
         X2              =   4910
         Y1              =   1050
         Y2              =   1050
      End
      Begin VB.Line Line3D 
         BorderColor     =   &H00FFFFFF&
         Index           =   2
         X1              =   15
         X2              =   4925
         Y1              =   1065
         Y2              =   1065
      End
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function LockWindowUpdate Lib "user32" (ByVal hwndLock As Long) As Long
'----------------------------------------------------------------------------------------------------------------------------------------
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Const SWP_NOMOVE = &H2
Const SWP_NOSIZE = &H1
Private Const GWL_EXSTYLE = (-20)
Private Const WS_EX_CLIENTEDGE = &H200
Private Const WS_EX_STATICEDGE = &H20000
Private Const SWP_FRAMECHANGED = &H20
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_NOZORDER = &H4

Public Sub FlatBorder(ByVal hWnd As Long)
    Dim tFlat As Long
    tFlat = GetWindowLong(hWnd, GWL_EXSTYLE)
    tFlat = tFlat And Not WS_EX_CLIENTEDGE Or WS_EX_STATICEDGE
    SetWindowLong hWnd, GWL_EXSTYLE, tFlat
    SetWindowPos hWnd, 0, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOZORDER Or SWP_FRAMECHANGED Or SWP_NOSIZE Or SWP_NOMOVE
End Sub
Public Sub Flatten(ByVal Frm As Form)
    Dim Ctl As Control
    For Each Ctl In Frm.Controls
        Select Case TypeName(Ctl)
            Case "CommandButton", "TextBox", "ListBox", "FileTree", "TreeView", "ProgressBar", "ListView", "VScrollBar", "PictureBox"
            FlatBorder Ctl.hWnd
        End Select
    Next
End Sub             '此间的代码是让窗体的控件具有VC++的风格
'----------------------------------------------------------------------------------------------------------------------------------------

Private Sub ShowInfo(Info As String, Optional Action As Integer = 1)
    LockWindowUpdate TxtResult.hWnd '防止刷新文本框的时候产生抖动
    Select Case Action
        Case 0
           TxtResult.Text = TxtResult.Text & vbCrLf & Time() & " 开始测试 SDK 函数： " & Info
        Case 1
            TxtResult.Text = TxtResult.Text & vbCrLf & Time() & " " & Info
        Case 2
            TxtResult.Text = TxtResult.Text & vbCrLf & vbCrLf & Info & vbCrLf
        Case 10
            Exit Sub
        Case Else
            TxtResult.Text = TxtResult.Text & vbCrLf & Time() & " 返回结果： " & Info
            TxtResult.Text = TxtResult.Text & vbCrLf & "**************************************************************************"
    End Select
    TxtResult.SelStart = Length(TxtResult.Text)
    LockWindowUpdate 0&
    
End Sub
Private Sub CmdCalc_Click()
    Dim Result As Long
    Dim Index As Integer
    Dim I As Integer
    
    For I = 0 To 2
        If OptCalc(I).Value = True Then Index = I: Exit For
    Next I
    
    
    Select Case Index
        Case 0
            ShowInfo "EPECaclResult", 0
            Result = EPECaclResult(Val(TxtValue(0).Text), Val(TxtValue(1).Text), Val(TxtValue(2).Text))
            If Result Then
                ShowInfo TxtValue(0).Text & " " & OptOperate(Val(TxtValue(2).Text)).Caption & " " & TxtValue(1).Text & " " & _
                "SDK运算成功！返回值为： " & CStr(Result), 3
            Else
                ShowInfo TxtValue(0).Text & " " & OptOperate(Val(TxtValue(2).Text)).Caption & " " & TxtValue(1).Text & " " & _
                "SDK运算失败！", 3
            End If
        Case 1
            ShowInfo "EPERandom", 0
            Result = EPERandom(Val(TxtValue(0).Text))
            If Result Then
                ShowInfo "SDK运算成功！返回值为： " & CStr(Result), 3
            Else
                ShowInfo "SDK运算失败！", 3
            End If
        Case 2
            ShowInfo "EPECustomValue", 0
            Dim TempString As String
            TempString = "VER_PLATFORM_WIN32S(0) VER_PLATFORM_WIN32_WINDOWS(1) VER_PLATFORM_WIN32_NT(2), " + _
                         "GetTickCount, GetCurrentProcess, GetCurrentProcessID, GetCurrentThread, " + _
                         "GetCurrentThreadID, GetActiveWindow , GetFocus, GetForegroundWindow, GetDesktopWindow"
            Dim StrArray() As String
            StrArray = Split(TempString, ", ")
            
            Dim Values As Long
            Values = Val(TxtValue(0).Text)
            If Values < 0 Or Values > 9 Then Values = 0: TxtValue(0).Text = CStr(Values)
                
            Result = EPECustomValue(Values)
            If Result Then
                ShowInfo "SDK运算成功！返回值为： " & CStr(Result) & " = " & StrArray(Values), 3
            Else
                ShowInfo "SDK运算失败！", 3
            End If
     
    End Select
    
    TxtValue(3).Text = CStr(Result)
                
            
End Sub

Private Sub CmdGetRegInfo_Click()
    
    ShowInfo "取注册信息函数 GetRegisterInfo", 0
    Dim QueryRegisterInfo As String
    QueryRegisterInfo = "是否注册,机器信息,注册用户,注册信息,软件名称（注册窗口标题）," + _
                        "已运行多少分钟,每隔多少分钟要求注册,每次限制运行多少分钟," + _
                        "第一次使用软件的日期（格式是YYYYMMDD，如20030518）,限制试用日期," + _
                        "限制试用天数,软件已运行次数,限制运行次数,特征整数"
    Dim RegInfo() As String
    RegInfo = Split(QueryRegisterInfo, ",")
    ReDim Preserve RegInfo(13)


    Dim I As Long
    For I = 0 To 13
        ShowInfo RegInfo(I) & "： " & GetRegisterInfo(I)
    Next I
    ShowInfo "------------------------------------------------------", 3

End Sub

Private Sub CmdGetSysInfo_Click()
    'GetCurrentDirectory, GetWindowsDirectory, GetSystemDirectory,
    'GetTempPath, GetComputerName, GetUserName
    
    ShowInfo "获取系统目录 EPESystemStr", 0
    Dim TempString As String
    
    TempString = "当前目录,Windows工作目录,Windows系统目录,临时文件目录,计算机名,当前用户名"
    Dim Dirs() As String
    Dirs = Split(TempString, ",")
    
    Dim I As Long
    For I = 0 To 5
        ShowInfo Dirs(I) & " - " & PointerToStringA(EPESystemStr(I)), 3
    Next I

End Sub

Private Sub CmdInitEngine_Click()
    ShowInfo "初始化SDK引擎函数 GetRegisterHandle", 0
    
    GetRegisterHandle
    
    ShowInfo "------------------------------------------------------", 3

End Sub

Private Sub CmdProcess_Click()
    ShowInfo "KillProcess/NotKillProcess", 0
    If CmdProcess.Caption = "杀掉进程(&K)" Then
        If KillProcess(TxtProcess.Text) Then
            CmdProcess.Caption = "唤醒进程(&W)"
            ShowInfo "成功杀掉名称中含有 " & TxtProcess.Text & " 的进程！", 3
        Else
            ShowInfo "尝试杀掉名称中含有 " & TxtProcess.Text & " 的进程失败！", 3
        End If
    Else
        If NotKillProcess(TxtProcess.Text) Then
            CmdProcess.Caption = "杀掉进程(&K)"
            ShowInfo "成功唤醒名称中含有 " & TxtProcess.Text & " 的进程！", 3
        Else
            ShowInfo "尝试唤醒名称中含有 " & TxtProcess.Text & " 的进程失败！", 3
        End If
    End If

End Sub

Private Sub CmdRegUser_Click()
    ShowInfo "GetRegisterUser", 0
    Dim Result As String
    Result = GetRegisterUser
    If Len(Result) > 0 Then
        TxtUserName.Text = Result
        ShowInfo "取用户名称成功！", 3
    Else
        ShowInfo "取用户名称失败！", 3
    End If
    
End Sub

Private Sub CmdSetRegInfo_Click()
    ShowInfo "SetRegisterInfo", 0
    If SetRegisterInfo(TxtUserName.Text, TxtRegInfo.Text) Then
        ShowInfo "设置注册信息成功！", 3
        Call GetRegisterHandle
        Call ShowRegisterForm
    Else
        ShowInfo "设置注册信息失败！", 3
    End If
    
End Sub

Private Sub CmdSetTest_Click()
    ShowInfo "设置注册提示窗口信息 SetRegisterHint", 0
    Dim RegHint As String
    RegHint = LongToHex(Val(Mid(LblColor.Caption, 5)), 8) + Chr$(0) + TxtInfo.Text + Chr$(0) _
            + TxtWebSite.Text + Chr$(0) + TxtEMail.Text + Chr$(0)
    Dim RegHintArray() As Byte
    RegHintArray = StrConv(RegHint, vbFromUnicode)

    If SetRegisterHint(VarPtr(RegHintArray(0))) Then
        ShowInfo "设置注册提示窗口信息成功！", 3
        Call ShowRegisterForm
    Else
        ShowInfo "设置注册提示窗口信息失败！", 3
    End If
    
    Erase RegHintArray
    

End Sub

Private Sub CmdShowRegForm_Click()
    ShowInfo "ShowRegisterForm", 0
    
    If ShowRegisterForm = True Then
        ShowInfo "显示注册提示窗口成功！", 3
    Else
        ShowInfo "显示注册提示窗口失败！", 3
    End If

End Sub

Private Sub CmdString_Click(Index As Integer)
    Dim Result As String
    
    Select Case Index
        Case 0
            Result = StringEncrypt(TxtString.Text, TxtPassword.Text)
            If Len(Result) > 0 Then
                EnabledB 1, -1
                TxtString = Result
            End If
        Case 1
            Result = StringDecrypt(TxtString.Text, TxtPassword.Text)
            If Len(Result) > 0 Then
                EnabledB 0, 2
                TxtString = Result
            End If
        Case 2
            Result = StringCompress(TxtString.Text, TxtPassword.Text)
            If Len(Result) > 0 Then
                EnabledB 3, -1
                TxtString = Result
            End If
        Case 3
            Result = StringDecompress(TxtString.Text, TxtPassword.Text)
            If Len(Result) > 0 Then
                EnabledB 0, 2
                TxtString = Result
            End If
    End Select
            
        
End Sub
Function EnabledB(Optional Index1 As Integer, Optional Index2 As Integer)
    Dim M As Long

    For M = 0 To 3
        CmdString(M).Enabled = False
    Next M
    If Index1 > -1 Then CmdString(Index1).Enabled = True
    If Index2 > -1 Then CmdString(Index2).Enabled = True
End Function
Private Sub CmdStringFunction_Click()

    ShowInfo "EncryptString、DecryptString、Compress、Decompress", 0
    Dim AA$, BB$

    ShowInfo "加密前字符串： "
    AA = "2002的那一场大雪，曾令你我都陶醉。如今想来，恍如昨日......" & _
         "Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn .Aming & Lynn "
    ShowInfo AA, 2
    ShowInfo "加密后字符串，加密密码 ABCD ： "
    AA = StringEncrypt(AA, "ABCD")
    ShowInfo AA, 2

    ShowInfo "解密后字符串，解密密码 ABCD ： "
    AA = StringDecrypt(AA, "ABCD")
    ShowInfo AA, 2

    ShowInfo "压缩前字符长度： " & CStr(Length(AA))

    AA = StringCompress(AA)
    ShowInfo AA, 2
    ShowInfo "压缩后字符长度： " & CStr(Length(AA))

    AA = StringDecompress(AA)
    ShowInfo AA, 2
    ShowInfo "解压缩后字符长度： " & CStr(Length(AA))
    ShowInfo "------------------------------------------------------", 3

End Sub


Private Sub ComHwnd_Click()
    TxtIndex.Text = ComHwnd.ListIndex
End Sub

Private Sub CmdMemory_Click()

    Dim Address As Long
    MsgBox "准备测试申请内存的函数，将申请4096字节的内存！", vbInformation, "信息提示"
    Address = EPEGetMem(4096)
    If Address > 0 And Assigned(Address) Then
        MsgBox "申请内存成功！所申请到的内存地址为： 0x" & LongToHex(Address, 8), vbExclamation, "成功"
        
        
    Else
        MsgBox "申请内存失败！", vbCritical, "失败了"
    End If
    
    Dim TempString As String
    TempString = "Aming ============== 2004 07"
    Dim I As Long
    MsgBox "原字符： " & TempString & vbCrLf & vbCrLf & "准备以 0 Chr$(48) 填充前5个字符..."
    
    
    For I = 0 To 8 Step 2
        Call EPEFillMemory(StrPtr(TempString) + I, 1, 48)
    Next I
    
    MsgBox "填充后结果： " & TempString
    
    Dim PtrA As Long
    Dim PtrB As Long
    Dim PtrC As Long

    Dim StringA As String
    Dim StringB As String

    StringA = "This Is A EPE'S VB SDK Sample!"
    StringB = "Welcome To Use EPE'S SDK!"

    MsgBox "StringA: " & StringA & vbCrLf & vbCrLf & "StringB: " & StringB, vbInformation, "利用EPECopyMemory交换字符指针，转换前"
    PtrA = VarPtr(StringA)
    PtrB = VarPtr(StringB)
    PtrC = PtrA

    Call EPECopyMemory(PtrA, PtrB, 4)
    PtrB = VarPtr(StringB)

    Call EPECopyMemory(PtrB, PtrC, 4)

    MsgBox "StringA: " & StringA & vbCrLf & vbCrLf & "StringB: " & StringB, vbInformation, "利用EPECopyMemory交换字符指针，转换后"
    
    

End Sub

Private Sub CmdFileFunction_Click()

    Dim aByte() As Byte, bByte() As Byte '数组，分别用来储存加密前后文件数据流

    Dim aFile As String, bFile As String, cFile As String
    Dim dFile As String, eFile As String

    Dim PassWord As String   '加密所用密码[注意：不使用密码可以得到高的压缩率]

    aFile = "NotePad.Exe"    '原文件

    bFile = "NotePad.C"      '压缩后文件
    cFile = "NotePad.D"      '解压缩后文件

    dFile = "NotePad.Enc"    '加密后文件
    eFile = "NotePad.Dec"    '解密后文件

    PassWord = aFile         '设置密码为原文件名称

    ReDim aByte(FileLen(aFile) - 1) '重新定义数组大小
    
    Dim FF As Integer
    FF = FreeFile
    Open aFile For Binary As #FF
    Get #FF, , aByte
    Close #FF

    Dim aSize As Long, bSize As Long '加密(压缩)前后文件大小
    
    
'--------------------------- 测试压缩函数 ---------------------------
    
    aSize = UBound(aByte) + 1 '加密(压缩)前数据流大小
    bSize = aSize * 10        '加密(压缩)后数据流大小，为什么要是加密前的10倍呢？为了保证加密(压缩)后数据储存空间，
                          '有些文件是不能压缩的，压缩后反而比压缩前大
    
    ShowInfo "压缩文件 Compress NotePad.Exe 压缩前大小" & CStr(aSize), 0
    
    ReDim bByte(bSize)
    Compress VarPtr(aByte(0)), aSize, VarPtr(bByte(0)), bSize, PassWord '测试压缩数据流SDK
    ReDim Preserve bByte(bSize - 1) '重新定义压缩后数据流，此时bSize是压缩后数据流大小

    FF = FreeFile
    Open bFile For Binary As #FF
    Put #FF, , bByte
    Close #FF

    ShowInfo "压缩后文件 Compress NotePad.C 压缩后大小" & CStr(bSize), 3
    
'--------------------------- 测试解压函数 ---------------------------
    aSize = UBound(aByte) * 10
    ReDim aByte(aSize)

    bSize = UBound(bByte) + 1
    Decompress VarPtr(bByte(0)), bSize, VarPtr(aByte(0)), aSize, PassWord
    ReDim Preserve aByte(aSize - 1)

    FF = FreeFile
    Open cFile For Binary As #FF
    Put #FF, , aByte
    Close #FF
    ShowInfo "解压后文件 Decompress NotePad.D 解压后大小" & CStr(aSize), 3

'--------------------------- 测试加密函数 ---------------------------
    aSize = UBound(aByte) + 1
    ReDim bByte(aSize * 10)
    bSize = UBound(bByte) + 1
    Encrypt VarPtr(aByte(0)), aSize, VarPtr(bByte(0)), bSize, PassWord
    ReDim Preserve bByte(bSize - 1)

    FF = FreeFile
    Open dFile For Binary As #FF
    Put #FF, , bByte
    Close #FF
    ShowInfo "加密后文件 Encrypt NotePad.Enc 加密后大小" & CStr(bSize), 3

'--------------------------- 测试解密函数 ---------------------------
    aSize = UBound(aByte) * 10
    ReDim aByte(aSize)

    bSize = UBound(bByte) + 1
    Decrypt VarPtr(bByte(0)), bSize, VarPtr(aByte(0)), aSize, PassWord
    ReDim Preserve aByte(aSize - 1)

    FF = FreeFile
    Open eFile For Binary As #FF
    Put #FF, , aByte
    Close #FF
    ShowInfo "解密后文件 Decrypt NotePad.Dec 解密后大小" & CStr(aSize), 3

End Sub

Private Sub Form_Initialize()
    GetRegisterHandle '初始化SDK，取得句柄
End Sub

Private Sub Form_Load()
    Me.Move 0, 0
    ComHwnd.ListIndex = 5
    Flatten Me
End Sub

Private Sub OptCalc_Click(Index As Integer)
    Dim I As Integer
    Select Case Index
        Case 0
            For I = 0 To TxtValue.UBound
                TxtValue(I).Enabled = True
            Next I
            PicOperate.Enabled = True
        Case 1, 2
            TxtValue(1).Enabled = False
            TxtValue(2).Enabled = False
            PicOperate.Enabled = False
            If Index = 1 Then Randomize: TxtValue(0).Text = Int(Rnd(10) * 999)
            If Index = 2 Then Randomize: TxtValue(0).Text = Int(Rnd(10) * 9)
    End Select
            
            
End Sub

Private Sub OptColor_Click(Index As Integer)
    LblColor.Caption = "字体颜色 " & OptColor(Index).BackColor
    TxtInfo.SetFocus
End Sub

Private Sub OptOperate_Click(Index As Integer)
    TxtValue(2).Text = Index
    TxtValue(2).SetFocus
End Sub


Private Sub SetWindow_Click()
    ShowInfo "获取、设置窗口句柄相关函数 EPEWindowFunction"
    Dim Values As Long
    Values = Val(TxtIndex.Text)
    If EPEWindowFunction(Values, Val(TxtHwnd.Text)) Then
        ShowInfo "操作成功！ " & ComHwnd.List(Values) & "(" & TxtHwnd.Text & ") = " & "True", 3
    Else
        ShowInfo "操作失败！ " & ComHwnd.List(Values) & "(" & TxtHwnd.Text & ") = " & "False", 3
    End If

End Sub

Private Sub TxtValue_Change(Index As Integer)
    Dim Result As Long
    Result = Val(TxtValue(2).Text)
    Select Case Index
        Case 2
            If Result < 0 Or Result > 9 Then Result = 0
            OptOperate(Result).Value = True
    End Select

End Sub
