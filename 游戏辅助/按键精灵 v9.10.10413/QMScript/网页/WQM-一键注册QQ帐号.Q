[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=30832d0b-dce2-4f09-9c4d-a223522d49b8
Description=WQM-一键注册QQ帐号
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
【功能说明】
一键注册QQ帐号
【使用说明】
验证码输入需要手动输入,再按回车键后即可完成注册
【作者介绍】
兄弟工程师01
【制作日期】
2009.6.24

[Script]
Delay 1000
Call Plugin.Web.Bind("wqm.exe")
//<>===================================================打开网页免费申请
Call Plugin.Web.Tips("打开网页免费申请网页")
Call Plugin.Web.Go("http://zc.qq.com/chs/register.html")
Call Plugin.Web.SetSize(913,850)
Delay 1000
//<>===================================================输入名字
Call Plugin.Web.HtmlInput("name","id:nick")
Call Plugin.Web.Tips("输入生日")
Delay 500
//<>===================================================输入生日-年
Call Plugin.Web.LeftClick(350,230)
Delay 500
For 3
    Call Plugin.Web.KeyPress(40)
Next 
Delay 500
//<>===================================================输入生日-月
Call Plugin.Web.LeftClick(445,230)
Delay 500
For 3
    Call Plugin.Web.KeyPress(40)
Next 
Delay 500
//<>===================================================输入生日-日
Call Plugin.Web.LeftClick(545,230)
Delay 500
For 3
    Call Plugin.Web.KeyPress(40)
Next 
Delay 500
Call Plugin.Web.LeftClick(645,230)
//<>===================================================输入密码
Call Plugin.Web.LeftClick(380,310)
Delay 500
Call Plugin.Web.Tips("输入密码，默认密码：a111111")
Call Plugin.Web.KeyPress(65)
For 6
    Call Plugin.Web.KeyPress(49)
Next 
Delay 500
Call Plugin.Web.LeftClick(380,370)
Delay 500
Call Plugin.Web.KeyPress(65)
For 6
    Call Plugin.Web.KeyPress(49)
Next 
Delay 500
//<>==================================================输入验证码
Call Plugin.Web.Tips("等待输入验证码,结束按回车键")
Call Plugin.Web.LeftClick(380,445)
Delay 500
Rem 等待
key=WaitKey()
//<>===================================================按回车键即可提交申请
If key=13 Then
    Goto 离开
End If 
Goto 等待
Rem 离开
//<>===================================================确定并同意以下条款
Call Plugin.Web.Tips("注册提交")
Call Plugin.web.HtmlClick("id:btn_summit")
Delay 500
EndScript 
Sub OnScriptExit()
    Call Plugin.Web.Tips("脚本停止运行")
End Sub 
