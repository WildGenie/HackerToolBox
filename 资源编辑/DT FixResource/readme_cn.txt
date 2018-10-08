简介：
    引擎 DT_FixRes 应用于 Win32 平台，用户通过编程方式调用该引擎，可将微软 PE 格式文件
中的非标准资源（Resource）进行标准化修复，同时它还为高级用户提供了资源导出功能，为 PE 
资源修复、重建提供了高度的灵活性。该引擎特别适合进行软件汉化工作的朋友。

    很多被加壳的 PE 文件在脱壳以后，往往该 PE 文件的资源部分无法用某些资源工具进行查
看、编辑，同时也不利于脱壳文件的优化工作。这其中的主要原因是由于很多加壳程序将部分资源
（如 Icon、Version Information) 从资源节 (resource section) 移到了壳增加的节里，这导致
很多资源工具不能正确识别分布在两个节里的资源数据。DT_FixRes 作为 PE 文件资源修复、重建
引擎，为此提供了终极解决方案。它可以将分布在多个节里的资源重新移到一个资源节里，并且对
资源进行了完全优化，修复后的资源不含有任何垃圾数据，如同资源编译器的编译效果，可以媲美
未加壳前的原始资源。这样资源工具也就能够顺利地对修复后的 PE 资源进行查看、编辑，另外也
大大简化了对脱壳文件的手工优化工作。

声明：
   1.您可以免费使用该引擎，如果您发布了使用该引擎的程序，请在相关说明中注明该引擎的版
     权信息，以表示支持作者的辛勤劳动；
   2.本软件是安全的，但是作者不承诺对任何由于使用本软件而引起的损失或者伤害负责。

使用说明：
   本引擎以动态链接库（DT_FixRes.dll）形式实现，该 DLL 共输出五个函数，按功能分为两大
类。

第一类：PE 文件资源修复功能。

特  点：修复后，引擎会无条件地在 PE 文件尾部增加一个新资源节，这会导致文件体积变大；同
        时它会将你的旧资源位置的所有资源数据清零（即置零）；新增资源节被命名为
        “.rsrc”，以前存在的所有节名将被删掉，本步骤可以保证所有已知的资源工具对修复后
        的资源进行查看、编辑。该功能适合对脱壳后 PE 文件资源的简单修复，用户无须具备任
        何相关 PE 文件知识，简单易用。

<1> 输出函数 FixResFromFile

C 形式函数原型:
BOOL __stdcall FixResFromFile(const char* PEFile, char* ErrMsg);

Delphi 形式函数原型：
function FixResFromFile(const PEFile: PChar; ErrMsg: PChar): Boolean; stdcall;

参数说明：
PEFile --- 指针，指向你需要进行资源修复的 PE 文件路径；
ErrMsg --- 指针，指向一块至少具有 80 个字节空间的 Buffer，在执行该函数返回 False 时，
           用于接收错误消息。

该函数适用任何 Win32 平台的编程语言去调用。

<2> 输出函数 FixResFromStream

Delphi 形式函数原型：
function FixResFromStream(PEStream: TMemoryStream; ErrMsg: PChar): Boolean;

参数说明：
PEStream 为 PE 映象的内存流，其他说明同 <1> 。

此函数对写脱壳机的用户特别适用，当你将 dump 出来的 PE 内存映象保存到硬盘之前，你可以先
进行资源修复。通过对内存流的操作，可以减少代码工作量。注意：该函数仅适用于 Delphi 语
言。

第二类：导出重建后的资源节功能。

特  点：由于不同的加壳程序对原始 PE 文件的结构改变的千差万别，导致对脱壳文件的 PE 结构
        优化方案也是千差万别的，因此很难在一个程序里完成对所有脱壳类型的 PE 结构优化，
        引擎将机会留给用户自己。作为使用者，你可能知道如何脱某种类型的壳以及如何优化脱
        壳后的 PE 结构，那么你也就可能需要将修复或者重建后的资源节加载在你认为更合适的
        RVA 地址起始处。该功能接口能满足你的这个定制需要。由于该功能的相对复杂性，要求
        使用者必须对 PE 结构十分熟悉，因此本功能仅适合高级用户使用。

<1> 输出函数 DumpResFromFile

C 形式函数原型:
BOOL __stdcall DumpResFromFile(const char* PEFile, char* ResFile, 
  DWORD NewRVA, DWord FileAlign, char* ErrMsg);

Delphi 形式函数原型：
function DumpResFromFile(const PEFile: PChar; const ResFile: PChar;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean; stdcall;

参数说明：
PEFile --- 指针，指向你需要进行资源修复的 PE 文件路径；
ResFile ---指针，指向需要导出的经过修复的资源节文件保存路径；
NewRVA --- 你希望修复后的 PE 文件资源节的加载 RVA 地址，即 resouce data directroy 的
           virtual address。该地址应该大于 0x1000，但不要大于 PE 内存映象尺寸
           (Size of PE Image)，并且应该是 DWORD 边界对齐，建议是 0x1000 的倍数。
FileAlign --- 资源节的文件对齐方式，值只能是 0x200 或者 0x1000。
ErrMsg --- 指针，指向一块至少具有 80 个字节空间的 Buffer，在执行该函数返回 False 时，
           用于接收错误消息。

该函数适用任何 Win32 平台的编程语言去调用。

<2> 输出函数 DumpResFromStream

Delphi 形式函数原型：
function DumpResFromStream(PEStream: TMemoryStream; const ResFile: string;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean;

参数说明：
PEStream 为 PE 映象的内存流，其他说明同 <1> 。

<3> 输出函数 DumpResFromStreamEx
 
Delphi 形式函数原型：
function DumpResFromStreamEx(PEStream: TMemoryStream; ResStream: TMemoryStream;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean;

参数说明：
ResStream 为导出的经过修复的资源节内存流，其他说明同 <1>、<2>。

函数 <2>、<3> 对写脱壳机的用户特别适用，当你将 dump 出来的 PE 内存映象保存到硬盘之前，
你可能需要进行 PE 结构的优化，在优化之前很可能需要导出重建的资源节。通过对内存流的操
作，可以减少代码工作量。注意：以上两个函数仅适用于 Delphi 语言。

特别提示：引擎只在正确 PE 格式的基础上修复、重建 PE 资源，因此应用以上五个函数之前请保
          证被操作文件或者内存流均具有正确的 PE 格式，否则可能造成不可预期的错误。

调用范例（Delphi 语言）：
procedure FixResDemo;
type
  TFixPERes = function(const AFileName: PChar; ErrMsg: PChar): Boolean; stdcall;
var
  ErrMsg: array[1..80] of Char;
  Handle: THandle;
  FixPERes: TFixPERes;
begin
  Handle := LoadLibrary('DT_FixRes.dll');
  if Handle <> 0 then
  begin
    @FixPERes := GetProcAddress(Handle, 'FixResFromFile');
    if @FixPERes <> nil then
      if not FixPERes(PChar('ur PE file'), @ErrMsg) then
        ShowMessage(ErrMsg);
    FreeLibrary(Handle);
  end;
end;

我写了一个测试该引擎功能的 Demo，请与引擎文件（DT_FixRes.dll）放在同一文件目录下进行测
试，发现 bug 请发信通知我。

特别致谢：感谢 askformore 为本程序提出了实质性的建议；感谢 cyclotron 为本文档提供了英文
          翻译；感谢长期以来支持我的所有看雪论坛的朋友。

dREAMtHEATER
2005-04-27
  
E-mail:NoteXPad@163.com
http://dREAMtHEATER.reg365.com
