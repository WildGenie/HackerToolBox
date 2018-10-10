解压密码：www.pediy.com


文件列表：

LordPE.EXE        .............增强版（英文版）
LordPE_hh.EXE     .............增强版（cao_cong汉化版）
\原版\LordPE.EXE  .............原版
LordPlug.dll      .............kanxue制作的功能插件
LordPeFix.dll     .............SnowFox修正（原来是freecat制作的功能插件，修正LordPE只显示60个进程的bug）
Procs.dll         .............之前的LordPeFix.dl有bug，Diken写了一个Procs.dll解决问题,源码Procs.7z，code by Diken

更新历史：

2017-06-08
之前的LordPeFix.dl有bug，Diken写了一个Procs.dll解决问题。


2008.5.31
资源名溢出漏洞。缓冲区长度检测是char,但是拷贝的时候是wchar，所以溢出了。

标 题: 测试你的LordPE 
作 者: somuch
时 间: 2008-05-16, 16:28
链 接: http://bbs.pediy.com/showthread.php?t=64935


2007.9.9
SnowFox
主页提供的LordPE增加版中所带Lordpefix.dll
发现并不能解除60进程限制, 原来是其中的偏移地址与所带LordPE主程序不匹配
修改了偏移地址后, 可以用了

2006.11.30
freecat制作的功能插件LordPeFix.dll，修正LordPE只显示60个进程的bug

2005.10.15
(1) 为LordPE查看输入表部分加上搜索功能 
(2) 为LordPE查看输入表部分加右键菜单(仅复制ThunkRVA/FirstThunk列).
(3) 当点击LordPE查看输入表部分中"View always FirstThunk",保持光条在原来位置.(LordPE默认会将光条置到0行)
(4) 修改FLC(File Location Calulator)窗口中各个文本框(VA,RVA,Offset)为只读属性,此时可以用鼠标复制里面的文本.(LordPE原来是将文本框禁止变灰,此时不可复制)


看雪学院
http://www.pediy.com
http://bbs.pediy.com