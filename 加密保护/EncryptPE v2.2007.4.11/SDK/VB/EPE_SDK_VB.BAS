Attribute VB_Name = "ModEPE_SDK_VB"
Option Explicit

'-------------------------------------------------------------------------------------------------------------------------------------
' VB 的 String 是以Unicode的形式存在，所以我们要将它的字符转换，储存于一个Byte的数组中，然后取数组第一为的字节，得到指针：
' 用 目标数组 = StrConv(要转换字符,VbFromUnicode)
' 再用 指针 = VarPtr(目标数组(0))，在VB中，数组的缺省下标为0
'-------------------------------------------------------------------------------------------------------------------------------------

'------------------------- 使用VB4/5的时候需要用到 -------------------------------------------------------------------------------------
'Public Enum CompareMethod
'    BinaryCompare
'    TextCompare
'End Enum
'-------------------------------------------------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------------------------------------------------
'API声明及常数定义
Private Const MAX_PATH = 260
Private Const WM_USER = &H400
Private Const FILE_MAP_WRITE = &H2

Private Const High_Int As Long = &H7FFFFFFF '代替Delphi中的 High(Integer)

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function IsWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function lstrlenA Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function OpenFileMapping Lib "kernel32" Alias "OpenFileMappingA" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal lpName As String) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function MapViewOfFile Lib "kernel32" (ByVal hFileMappingObject As Long, ByVal dwDesiredAccess As Long, ByVal dwFileOffsetHigh As Long, ByVal dwFileOffsetLow As Long, ByVal dwNumberOfBytesToMap As Long) As Long
Private Declare Function UnmapViewOfFile Lib "kernel32" (ByVal lpBaseAddress As Long) As Long
Private Declare Function IsBadReadPtr Lib "kernel32" (ByVal lp As Long, ByVal ucb As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
'-------------------------------------------------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------------------------------------------------
' SDK 类型定义及声明
Private Type TUserRecord
    Bz As Long
    ValueSize As Long
    ValueBuf As Long
    PassSize As Long
    PassBuf As Long
End Type

Public RegisterHandle  As Long
Public RegisterStrings() As String
'-------------------------------------------------------------------------------------------------------------------------------------

' --------------- 以下为一些VB SDK中要用的函数，并非SDK所必须的函数，不同的语言使用方法不同 -----------------

Public Function IsLibrary() As Boolean
    '利用VB的一些特点，编译出来的无论是ActiveX DLL或是普通DLL，都含有DllRegisterServer来判断
    If GetProcAddress(App.HInstance, "DllRegisterServer") Then IsLibrary = True
End Function

'将数字转换成字符
Public Function LongToHex(Value As Long, Bit As Integer) As String
    LongToHex = Left$(String$(Bit, Chr$(48)), Bit - Len(Hex$(Value))) + Hex$(Value)
End Function

'删除字符串中的 Chr$(0)
Public Function TrimNull(ByVal Str As String) As String
    If InStr(Str, Chr$(0)) > 0& Then
        TrimNull = Left$(Str, InStr(Str, Chr$(0)) - 1&)
    Else
        TrimNull = Str
    End If
End Function

'从指针(地址)中返回字符
Public Function PointerToStringA(lpStringA As Long) As String
   Dim Buffer() As Byte
   Dim nLen As Long
   
   If lpStringA Then
      nLen = lstrlenA(ByVal lpStringA) '测试字符串的长度
      If nLen Then
         ReDim Buffer(0 To (nLen - 1)) As Byte
         CopyMemory Buffer(0), ByVal lpStringA, nLen
         PointerToStringA = StrConv(Buffer, vbUnicode)
         Erase Buffer '删除临时数组
      End If
   End If
End Function

'取字符串的长度，VB中自身的 Len() 函数对中文支持不好，所以改用此函数
Function Length(OrgiString As String) As Integer
    Length = LenB(StrConv(OrgiString, vbFromUnicode))
End Function

'判断一个地址的数据是否可读
Function Assigned(ByVal Address As Long, Optional Length As Long = 4) As Boolean
    If IsBadReadPtr(Address, Length) = 0 Then Assigned = True
End Function

'--------------------- 以下皆为SDK函数 -------------------------------

'{在调用SDK之前需取得与壳通信的窗口句柄，本单元initialization部分已经调用该函数}
Sub GetRegisterHandle()
    Dim TempStr As String
    Dim I As Long
    Dim hFileMap As Long
    Dim TempP As Long
    
    RegisterHandle = 0
    Dim ModuleName As String
    
    TempStr = String$(MAX_PATH, Chr$(0)) '临时字符保存
    
    ModuleName = TempStr
    Dim HInstance As Long
    
    HInstance = App.HInstance
    
    ModuleName = Left$(ModuleName, GetModuleFileName(HInstance, ModuleName, Len(ModuleName)))
    '取得程序的完整途径
    
    TempStr = Replace(ModuleName, "\", "/")
    '将所有"\"替换成"/"，如果您使用VB4/5的话，请用本模块中的ReplaceVB5()代替VB6使用的内部函数 Replace()
                                                                                                    
    TempStr = TrimNull(TempStr) + "/" + LongToHex(GetCurrentProcessId, 8)
    '将当前进程ID变成长度为8位的16进制字符
    
    hFileMap = OpenFileMapping(FILE_MAP_WRITE, False, ByVal TempStr)
    '尝试打开内存映射文件
    
    If hFileMap > 0 Then '如果能够取得句柄则进行下一步操作
        TempP = MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0)
        If TempP <> 0 Then
            CopyMemory RegisterHandle, ByVal TempP, 4 'TempP实际是一个指针
            UnmapViewOfFile TempP
        End If
        CloseHandle hFileMap
    End If
    
    ReDim RegisterStrings(0)  ' 初始化注册信息数组
         
    
End Sub

'{取得共15条注册相关信息，按INDEX值：
'0是否注册(Y/N)，1机器信息，2注册用户，3注册信息，4软件名称（注册窗口标题）
'5本次已运行多少分钟，6每隔多少分钟要求注册，7每次限制运行多少分钟
'8第一次在本机使用软件的日期，格式YYYYMMDD，9限制试用日期，格式YYYYMMDD
'10限制试用天数，11已运行次数，12限制试用次数，
'13加壳时设置的特征整数值，14为保护密码的EPEHash值，可依此二者判断是否破解版
'函数返回指定项，同时全部保存在RegisterStrings中}
Function GetRegisterInfo(Optional Index As Long = 0) As String
    Dim I As Long, MessageResult As Long
    If Index = 0 Then GetRegisterInfo = "N"
    If (Index = 4) And Not IsLibrary Then GetRegisterInfo = App.Title

Already_Get_Register_Information:
    If Index < 0 Or Index > UBound(RegisterStrings) Then Exit Function

    If UBound(RegisterStrings) > 0 Then
        GetRegisterInfo = RegisterStrings(Index)
        Exit Function
    End If

    If IsWindow(RegisterHandle) <> 0 Then
        For I = 1 To 100
            MessageResult = SendMessage(RegisterHandle, WM_USER, 0&, 1&)
    
            If (MessageResult <> -1) And (MessageResult <> 0) Then
                GetRegisterInfo = PointerToStringA(MessageResult)
                RegisterStrings = Split(GetRegisterInfo, vbCrLf)
                ' 分离文件，分离特征为Chr$(13) + Chr$(10) = VbCrlf，
                ' VB4/5中请使用后面的SplitVB5()函数代替VB内部函数Split()
                GoTo Already_Get_Register_Information '当取得信息后退出
                Exit For
            End If
        Next I
    End If
    
End Function

'{取得注册用户名称，未注册则为空，GetRegisterInfo(2)可能未注册也有值}
Function GetRegisterUser() As String

    If IsWindow(RegisterHandle) <> 0 Then
        If GetRegisterInfo = "Y" Then
            GetRegisterUser = RegisterStrings(2)
        Else
            GetRegisterUser = ""
        End If
    End If

End Function
'{显示注册窗口}
Function ShowRegisterForm() As Boolean
    Dim I As Long, MessageResult As Long
    If IsWindow(RegisterHandle) <> 0 Then
        For I = 1 To 100
            MessageResult = SendMessage(RegisterHandle, WM_USER, 0&, 0&)
            If MessageResult = 1 Then
                ShowRegisterForm = True
                Exit Function
            End If
        Next I
    End If
End Function

'{在EncryptPE加密程序运行过程中不允许ProcessName指定的进程（不含.EXE）运行，
'多个进程则多次调用该函数，或者用逗号隔开多个进程名}
Function KillProcess(ProcessName As String) As Boolean
    Dim I As Long, MessageResult As Long
    Dim StrBuffer() As Byte
    
    If (Len(ProcessName) = 0) Or IsWindow(RegisterHandle) = 0 Then Exit Function
    StrBuffer = StrConv(ProcessName + Chr$(0), vbFromUnicode)
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 88&, VarPtr(StrBuffer(0)))
        If MessageResult = 1 Then
            KillProcess = True
            Exit Function
        End If
    Next I
    
End Function
'{取消截杀，见KillProcess}
Function NotKillProcess(ProcessName As String) As Boolean
    Dim I As Long, MessageResult As Long
    Dim StrBuffer() As Byte
    
    If (Len(ProcessName) = 0) Or IsWindow(RegisterHandle) = 0 Then Exit Function
    StrBuffer = StrConv(ProcessName + Chr$(0), vbFromUnicode)
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 89&, VarPtr(StrBuffer(0)))
        If MessageResult = 1 Then
            NotKillProcess = True
            Exit Function
        End If
    Next I
    
End Function
'{设置加壳进程中不允许加载的模块名，可以以逗号隔开多个模块名}
Function KillDLL(DLLName As String) As Boolean
    Dim I As Long, MessageResult As Long
    Dim StrBuffer() As Byte
    
    If IsWindow(RegisterHandle) = 0 Then Exit Function
    StrBuffer = StrConv(DLLName + Chr$(0), vbFromUnicode)
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 90&, VarPtr(StrBuffer(0)))
        If MessageResult = 1 Then
            KillDLL = True
            Exit Function
        End If
    Next I
    
End Function
'{获取指字字串的EPEHash值}
Function EPEHash(SourceString As String) As String
    Dim I As Long, MessageResult As Long
    Dim StrBuffer() As Byte
    
    If IsWindow(RegisterHandle) = 0 Then Exit Function
    StrBuffer = StrConv(SourceString + Chr$(0), vbFromUnicode)
        For I = 1 To 100
            MessageResult = SendMessage(RegisterHandle, WM_USER, 99&, VarPtr(StrBuffer(0)))
    
            If (MessageResult <> -1) And (MessageResult <> 0) Then
                EPEHash = PointerToStringA(MessageResult)
                Exit For
            End If
        Next I

End Function

'{写入注册用户名、注册信息，与GetRegisterInfo配合可用于设计个性注册窗口}
Function SetRegisterInfo(User As String, Info As String) As Boolean
    Dim I As Long, MessageResult As Long
    Dim P As TUserRecord
    Dim BufferUser() As Byte
    Dim BufferInfo() As Byte
    
    BufferUser = StrConv(User, vbFromUnicode)
    BufferInfo = StrConv(Info, vbFromUnicode)
    
    If IsWindow(RegisterHandle) = 0 Then Exit Function
    P.Bz = &HFF&
    P.ValueSize = Length(User)
    If P.ValueSize > 0 Then
        P.ValueBuf = VarPtr(BufferUser(0))
    Else
        P.ValueBuf = 0
    End If
    
    P.PassSize = Length(Info)
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(BufferInfo(0))
    Else
        P.PassBuf = 0
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 100&, VarPtr(P))
        If MessageResult = 1 Then
            SetRegisterInfo = True
            Exit Function
        End If
    Next I
    
End Function

'{改变注册窜口的界面语言元素，PLanguage指向内存（不含逗号和省略号）：
'一个字节字符集，一个字节字体大小，字体名称＃0，字符串4＃0，字符串5＃0，......，字符串17＃0
'如一个字符串：#134#9'宋体'#0'警告'#0'出现未知错误'＃0......'取消(&C)'#0
'方便用户编写多语言程序}
Function SetLanguage(ByVal PLanguage As Long) As Boolean
    Dim I As Long, MessageResult As Long
    If PLanguage = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 1000&, PLanguage)
        If MessageResult = 1 Then
            SetLanguage = True
            Exit Function
        End If
    Next I

End Function

'{改变注册窗口的提示、网站主页、邮件地址等信息，PHint指向内存（不含逗号）:
'过期后输入框颜色转换成的字符串＃0，提示信息＃0，主页＃0，邮箱地址＃0
'如一个字符串: '$0000FF'#0'请注册本软件'#0'http://www.server.com'#0'mailto:someone@server.com'#0}
Function SetRegisterHint(ByVal PHint As Long) As Boolean
    Dim I As Long, MessageResult As Long
    If PHint = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 10000&, PHint)
        If MessageResult = 1 Then
            SetRegisterHint = True
            Exit Function
        End If
    Next I

End Function

'{按Index取值0至9分别对应操作如下：
'+ - * div mod and or xor shl shr
'返回值为某一操作的结果值,+可用于个人开发版}
Function EPECaclResult(Value1 As Long, Value2 As Long, Index As Long) As Long
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long
        
    If IsWindow(RegisterHandle) = 0 Then Exit Function
    P.Bz = Index
    P.ValueSize = Value1
    P.PassSize = Value2
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 5&, VarPtr(P))
        If MessageResult = 1 Then
            EPECaclResult = P.ValueSize
            Exit Function
        End If
    Next I
    
End Function

'{返回范围在 >=0 且 < Value 的随机整数}
Function EPERandom(Value As Long) As Long
    Dim I As Long
    
    If IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        EPERandom = SendMessage(RegisterHandle, WM_USER, 15&, Value)
        If EPERandom <> -1 Then Exit Function
        
    Next I
    
End Function

'{按Index取值0至9分别返回：
'系统版本VER_PLATFORM_WIN32S(0) VER_PLATFORM_WIN32_WINDOWS(1) VER_PLATFORM_WIN32_NT(2),
'GetTickCount, GetCurrentProcess, GetCurrentProcessID, GetCurrentThread, GetCurrentThreadID,
'GetActiveWindow, GetFocus, GetForegroundWindow, GetDesktopWindow}
Function EPECustomValue(Index As Long) As Long
    Dim I As Long
    
    If (Index < 0) Or (Index > 9) Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        EPECustomValue = SendMessage(RegisterHandle, WM_USER, 25&, Index)
        If EPECustomValue <> -1 Then
            Exit For
        Else
            If Index = 2 Then Exit For
        End If
    Next I
    
End Function

'{按Index取值0至9对窗口句柄aHwnd执行相关WINDOW函数判断结果：
'IsWindow, IsWindowVisible, IsIconic, IsZoomed, 显示窗口, 隐藏窗口,
'使窗口能与用户交互, 使窗口不能与用户交互, IsWindowEnabled, CloseWindow, DestroyWindow}
Function EPEWindowFunction(Index As Long, aHwnd As Long) As Boolean
    Dim I As Long, MessageResult As Long
    If (Index < 0) Or (Index > 10) Or IsWindow(aHwnd) = 0 Or IsWindow(RegisterHandle) = 0 Then
        For I = 1 To 100
            MessageResult = SendMessage(RegisterHandle, WM_USER, Index * 10 + 35, aHwnd&)
            If MessageResult = 1 Then
                EPEWindowFunction = True
                Exit Function
            End If
        Next I
    End If
End Function

'{申请Size大小内存空间}
Function EPEGetMem(Size As Long) As Long
    Dim I As Long, MessageResult As Long
    If (Size <= 0) Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 145&, Size&)
        If (MessageResult <> -1) And (MessageResult <> 0) Then Exit For
    Next I
    EPEGetMem = MessageResult
End Function

'{释放内存}
Function EPEFreeMem(ByVal Buf As Long) As Boolean
    Dim I As Long, MessageResult As Long
    If Buf = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 155&, Buf&)
        If MessageResult = 1 Then EPEFreeMem = True: Exit For
    Next I
End Function

'{清空一段内存}
Function EPEZeroMemory(ByVal Buf As Long, Size As Long) As Boolean
    
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    P.Bz = 0&
    P.ValueSize = Size
    P.ValueBuf = Buf
    
    If Buf = 0 Or Size <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 165&, VarPtr(P))
        If MessageResult = 1 Then EPEZeroMemory = True: Exit For
    Next I
            
End Function

'{以Fill字节值填充一段内存}
Function EPEFillMemory(ByVal Buf As Long, Size As Long, Fill As Byte) As Boolean
    
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    P.Bz = 1&
    P.ValueSize = Size
    P.ValueBuf = Buf
    P.PassSize = Fill

    If Buf = 0 Or Size <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 165&, VarPtr(P))
        
        If MessageResult = 1 Then EPEFillMemory = True: Exit For
    Next I

End Function

'{内存复制}
Function EPECopyMemory(ByVal Destination As Long, ByVal Source As Long, Size As Long) As Boolean
    
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    P.Bz = 2&
    P.PassBuf = Destination
    P.ValueBuf = Source
    P.ValueSize = Size
    
    If Destination = 0 Or Source = 0 Or Size <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 165&, VarPtr(P))
        If MessageResult = 1 Then EPECopyMemory = True: Exit For
    Next I
            
End Function

'{内存移动}
Function EPEMoveMemory(ByVal Destination As Long, ByVal Source As Long, Size As Long) As Boolean
    
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    P.Bz = 3&
    P.PassBuf = Destination
    P.ValueBuf = Source
    P.ValueSize = Size

    If Destination = 0 Or Source = 0 Or Size <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, 165&, VarPtr(P))
        If MessageResult = 1 Then EPEMoveMemory = True: Exit For
    Next I
            
End Function

'{按Index取值0至5分别获得：
'GetCurrentDirectory, GetWindowsDirectory, GetSystemDirectory,
'GetTempPath, GetComputerName, GetUserName}
Function EPESystemStr(Index As Long) As Long
    Dim I As Long, MessageResult As Long
    If (Index < 0) Or (Index > 5) Or IsWindow(RegisterHandle) = 0 Then Exit Function
        For I = 1 To 100
            MessageResult = SendMessage(RegisterHandle, WM_USER, 175&, Index&)
            If (MessageResult <> -1) And (MessageResult <> 0) Then EPESystemStr = MessageResult: Exit For
        Next I
            
End Function

'{内存数据压缩}
Sub Compress(ByVal InBuf As Long, InBytes As Long, ByVal OutBuf As Long, OutBytes As Long, Optional PassWord As String = "")
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    
    If Not Assigned(InBuf) Or InBytes <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Sub
    P.Bz = 0&
    P.ValueSize = InBytes
    P.ValueBuf = InBuf
    P.PassSize = Length(PassWord)
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = vbNull
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int&, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs

            OutBytes = P.ValueSize
            CopyMemory ByVal OutBuf, ByVal P.ValueBuf, P.ValueSize
            Exit For
        End If
    Next I

    Exit Sub
Errs:
    OutBuf = vbNull
    OutBytes = 0
    Exit Sub

End Sub

'{压缩后的数据解压缩}
Sub Decompress(ByVal InBuf As Long, InBytes As Long, ByVal OutBuf As Long, OutBytes As Long, Optional PassWord As String = "", Optional OutEstimate As Long = 0)
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    
    If Not Assigned(InBuf) Or InBytes <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Sub
    P.Bz = 1&
    P.ValueSize = InBytes
    P.ValueBuf = InBuf
    P.PassSize = Length(PassWord)
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = vbNull
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int&, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs

            OutBytes = P.ValueSize
            CopyMemory ByVal OutBuf, ByVal P.ValueBuf, P.ValueSize
            Exit For
        End If
    Next I

    Exit Sub
Errs:
    OutBuf = vbNull
    OutBytes = 0
    Exit Sub

End Sub

'{字符串压缩生成新的字符串}
Function StringCompress(SourceString As String, Optional PassWord As String = "", Optional HFlag As Boolean = True) As String
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    Dim StringBuffer() As Byte
    
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    StringBuffer = StrConv(SourceString, vbFromUnicode)
    

    If Len(SourceString) = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    If HFlag Then
        P.Bz = 10&
    Else
        P.Bz = 20&
    End If
    
    P.ValueSize = Length(SourceString)
    P.ValueBuf = VarPtr(StringBuffer(0))
    P.PassSize = Length(PassWord)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = 0
    End If

    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs
            Dim Result() As Byte
            ReDim Result(P.ValueSize - 1) As Byte
            CopyMemory Result(0), ByVal P.ValueBuf, P.ValueSize
            StringCompress = StrConv(Result, vbUnicode)
            Exit For
        End If
    Next I

    Erase PassBuffer
    Erase StringBuffer
    Erase Result
    
    Exit Function
Errs:
    StringCompress = ""
    Exit Function
End Function

'{将压缩生成的字符串解压缩还原成原字符串}
Function StringDecompress(SourceString As String, Optional PassWord As String = "", Optional HFlag As Boolean = True) As String
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    Dim StringBuffer() As Byte
    
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    StringBuffer = StrConv(SourceString, vbFromUnicode)

    If Len(SourceString) = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    If HFlag Then
        P.Bz = 11&
    Else
        P.Bz = 21&
    End If
    
    P.ValueSize = Length(SourceString)
    P.ValueBuf = VarPtr(StringBuffer(0))
    P.PassSize = Length(PassWord)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = 0
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs
            Dim Result() As Byte
            ReDim Result(P.ValueSize - 1) As Byte
            CopyMemory Result(0), ByVal P.ValueBuf, P.ValueSize
            StringDecompress = StrConv(Result, vbUnicode)
            Exit For
        End If
    Next I

    Erase PassBuffer
    Erase StringBuffer
    Erase Result

    Exit Function
Errs:
    StringDecompress = ""
    Erase PassBuffer
    Erase StringBuffer
    Erase Result
    Exit Function
End Function

'{对一段内存数据进行加密}
Sub Encrypt(ByVal InBuf As Long, InBytes As Long, ByVal OutBuf As Long, OutBytes As Long, Optional PassWord As String = "")
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    
    If Not Assigned(InBuf) Or InBytes <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Sub
    P.Bz = 100&
    P.ValueSize = InBytes
    P.ValueBuf = InBuf
    P.PassSize = Length(PassWord)
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = vbNull
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int&, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs
            OutBytes = P.ValueSize
            CopyMemory ByVal OutBuf, ByVal P.ValueBuf, P.ValueSize
            Exit For
        End If
    Next I
    Erase PassBuffer
    Exit Sub
Errs:
    OutBuf = vbNull
    OutBytes = 0
    Erase PassBuffer
    Exit Sub

End Sub

'{对已加密数据进行解密}
Sub Decrypt(ByVal InBuf As Long, InBytes As Long, ByVal OutBuf As Long, OutBytes As Long, Optional PassWord As String = "")
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    
    If Not Assigned(InBuf) Or InBytes <= 0 Or IsWindow(RegisterHandle) = 0 Then Exit Sub
    P.Bz = 101&
    P.ValueSize = InBytes
    P.ValueBuf = InBuf
    P.PassSize = Length(PassWord)
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = vbNull
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int&, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs

            OutBytes = P.ValueSize
            CopyMemory ByVal OutBuf, ByVal P.ValueBuf, P.ValueSize
            Exit For
        End If
    Next I

    Erase PassBuffer
    Exit Sub
Errs:
    OutBuf = vbNull
    OutBytes = 0
    Erase PassBuffer
    Exit Sub

End Sub

'{对字符串进行加密生成新的字符串}
Function StringEncrypt(SourceString As String, Optional PassWord As String = "", Optional HFlag As Boolean = True) As String
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    Dim StringBuffer() As Byte
    
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    StringBuffer = StrConv(SourceString, vbFromUnicode)

    If Len(SourceString) = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    If HFlag Then
        P.Bz = 110&
    Else
        P.Bz = 120&
    End If
    
    P.ValueSize = Length(SourceString)
    P.ValueBuf = VarPtr(StringBuffer(0))
    P.PassSize = Length(PassWord)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = 0
    End If

    CopyMemory ByVal VarPtr(P), P, Len(P)
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs

            Dim Result() As Byte
            ReDim Result(P.ValueSize - 1) As Byte
            CopyMemory Result(0), ByVal P.ValueBuf, P.ValueSize
            StringEncrypt = StrConv(Result, vbUnicode)
            Exit For
        End If
    Next I

    Erase PassBuffer
    Erase StringBuffer
    Erase Result
    
    Exit Function
Errs:
    StringEncrypt = ""
    Erase PassBuffer
    Erase StringBuffer
    Erase Result
    Exit Function
End Function

'{将加密生成的字符串解密还原成原字符串}
Function StringDecrypt(SourceString As String, Optional PassWord As String = "", Optional HFlag As Boolean = True) As String
    Dim P As TUserRecord
    Dim I As Long, MessageResult As Long

    Dim PassBuffer() As Byte
    Dim StringBuffer() As Byte
        
    PassBuffer = StrConv(PassWord, vbFromUnicode)
    StringBuffer = StrConv(SourceString, vbFromUnicode)
    
    If Len(SourceString) = 0 Or IsWindow(RegisterHandle) = 0 Then Exit Function
    
    If HFlag Then
        P.Bz = 111&
    Else
        P.Bz = 121&
    End If
    
    P.ValueSize = Length(SourceString)
    P.ValueBuf = VarPtr(StringBuffer(0))
    P.PassSize = Length(PassWord)
    
    If P.PassSize > 0 Then
        P.PassBuf = VarPtr(PassBuffer(0))
    Else
        P.PassBuf = 0
    End If
    
    For I = 1 To 100
        MessageResult = SendMessage(RegisterHandle, WM_USER, High_Int, VarPtr(P))
        If MessageResult = 1 Then
            On Error GoTo Errs

            Dim Result() As Byte
            ReDim Result(P.ValueSize - 1) As Byte
            CopyMemory Result(0), ByVal P.ValueBuf, P.ValueSize
            StringDecrypt = StrConv(Result, vbUnicode)
            Exit For
        End If
    Next I
    
    Erase PassBuffer
    Erase StringBuffer
    Erase Result

    Exit Function
Errs:
    Erase PassBuffer
    Erase StringBuffer
    Erase Result
    StringDecrypt = ""
    Exit Function
End Function


'------------- 以下两个函数使用VB4/5的时候需要用到 -------------------------------------------------------------------------------------
' SplitVB5() 代替 VB6的 Split()
' ReplaceVB5() 代替VB6的 Replace()
'-------------------------------------------------------------------------------------------------------------------------------------

'Public Function SplitVB5(Expression As String, Optional ByVal Delimiter As String = "  ", Optional ByVal Limit As Long = -1, Optional ByVal Compare As CompareMethod = BinaryCompare) As Variant
'
'    Dim lPos1   As Long
'    Dim lPos2   As Long
'    Dim lIdx    As Long
'    Dim lCnt    As Long
'    Dim saTmp() As String
'
'    lCnt = 0
'    lPos1 = 1
'    ReDim saTmp(99)
'
'    lPos2 = InStr(1, Expression, Delimiter, Compare)
'    While lPos2 > 0 And ((lCnt <= Limit) Or (Limit = -1))
'        saTmp(lCnt) = Mid$(Expression, lPos1, lPos2 - lPos1)
'        lCnt = lCnt + 1
'        If (lCnt Mod 100) = 0 Then
'            ReDim Preserve saTmp(UBound(saTmp) + 100)
'        End If
'        lPos1 = lPos2 + Len(Delimiter)
'        lPos2 = InStr(lPos1, Expression, Delimiter, Compare)
'    Wend
'
'    If lPos1 < Len(Expression) Then
'        saTmp(lCnt) = Mid$(Expression, lPos1)
'        lCnt = lCnt + 1
'    End If
'
'    If lCnt > 0 Then
'        ReDim Preserve saTmp(lCnt - 1)
'    Else
'        ReDim saTmp(-1 To -1)
'    End If
'
'    SplitVB5 = saTmp
'
'End Function

'Function ReplaceVB5(sInput As String, WhatToReplace As String, ReplaceWith As String) As String
'    Dim Ret As Long
'    ReplaceVB5 = sInput
'    Ret = -Len(ReplaceWith) + 1
'    Do
'        Ret = InStr(Ret + Len(ReplaceWith), ReplaceVB5, WhatToReplace, vbTextCompare)
'        If Ret = 0 Then Exit Do
'        ReplaceVB5 = Left$(ReplaceVB5, Ret - 1) + ReplaceWith + Right$(ReplaceVB5, Len(ReplaceVB5) - Ret - Len(WhatToReplace) + 1)
'    Loop
'End Function

