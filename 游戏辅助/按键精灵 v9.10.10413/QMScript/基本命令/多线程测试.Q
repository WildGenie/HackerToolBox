[General]
SyntaxVersion=2
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=120
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f2099881-eb0e-41d5-88af-5b027ad87114
Description=多线程测试(升级版)
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
MessageBox "多线程命令还在测试当中，并不稳定，请谨慎使用！" & vbcrlf & vbcrlf & "目前演示例子：多线程、多开并后台同时输入文字。"
//下面这个例子会打开一个记事本，用3个线程3个记事本同时向其中模拟按键


//所谓多线程并不是同时做一件相同的事情，而是不分前后顺序执行脚本。
Dimenv Hwnd1          //定义环境变量（多线程需要）
RunApp "notepad.exe"  //启动几个记事本测试用
RunApp "notepad.exe"
RunApp "notepad.exe"
Call Plugin.Msg.ShowScrTXT(400, 100, 1024, 600, "请耐心等待3秒时间。。。", "0000FF")
Delay 3000                                     //等待记事本工具打开
Hwnd = Plugin.Window.Search("无标题 - 记事本") //搜索所有记事本窗口句柄
MyArray = Split(Hwnd, "|")                     //分解句柄
If UBound(MyArray) >= 0 Then                   //判断是否搜到句柄？
    For i = 0 To UBound(MyArray) - 1 
        hwndEx = Clng(MyArray(i))                                     //类型转换
        Call Plugin.Window.Move(hwndEx, i * 100 + 100, i * 100 + 50)  //调整窗口位置
        Call Plugin.Window.Active(hwndEx)                             //激活前面
        Hwnd1 = Plugin.Window.FindEx(hwndEx, 0, "Edit", 0)            //获取可打字的窗口句柄
        BeginThread 打字                                              //启动线程
        Delay 100                                                     //启动线程需要点时间
    Next
End If
Call Plugin.Msg.ShowScrTXT(400, 100, 1024, 600, "多个记事本中，在后台同时输入20个数字。。。", "0000FF")
//无限循环，不至于让脚本停止了！
Do
    Delay 500
Loop
Sub 打字()
    Hwnd2=Hwnd1      //首先获取环境变量句柄
    //然后开始循环或者无限循环需要执行的脚本内容
    For i=0 to 19
        Call Plugin.Bkgnd.SendString(Hwnd2, i)
        Delay 100
        Call Plugin.Bkgnd.KeyPress(Hwnd2, 13)
        Delay 200
    Next
    ExitScript
End Sub
Sub OnScriptExit()
    MessageBox "脚本已经停止！"
End Sub

