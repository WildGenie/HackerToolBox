Introduction:

DT_FixRes is a Win32 Programming Engine that can standardize scattered resources of 
Microsoft PE files. Furthermore, it provides advanced users with resource exporting 
functions, adding high flexibility to the fixing and rebuilding of PE resources. 
Accordingly, the engine is specially helpful to software localizers.

It is a common problem in packed PE files that after unpacking, their resources cannot 
be viewed or modified by some resource explorers. The main reason for this is that 
many packers/protectors move the uncompressable resources(eg.Icon,Version information) 
into the appended section, while most of the resource explorers cannot recognize 
correctly the resources distributed in two separate sections. DT_FixRes is a 
professional resource rebuilding engine for PE files, capable of recollecting the 
resources in different sections into a single one, optimizing structures and removing 
junks if any. Comparable to resource compilers, DT_FixRes restores the resource 
structures on an almost perfect basis. PE files, when fixed by DT_FixRes, expose the 
resources to all the resource explorers for free view or modification. What's more, 
the engine simplifies manual optimization of unpacked PE files substantially.
    
Disclaimers:

1.DT_FixRes is free for use, subject to the inclusion of copyrights for support to the 
  author.
2.DT_FixRes is presumbly safe to use, but the author holds no responsibility for any 
  damages possibly caused by the engine.

Instructions:

The engine of DT_FixRes is implemented as a dll(DT_FixRes.dll), exporting five 
functions in all, sorted into two types.

1st Type: Restoration of PE resources.

Features: When done, the engine will unconditionally append a resource section to the 
PE file, resulting in an increase in size. At the same time, it will clear all the 
resource data in the original resource section and name the new resource section as 
'.rsrc', all the section names before which will be deleted. This step ensures free 
view or modification of the resources by any known resource explorers. These functions 
apply to simple restoration of unpacked PE files, even for any primary users with no 
PE knowledge.

<1> Exported Function Name: FixResFromFile

-Prototype for C
BOOL __stdcall FixResFromFile(const char* PEFile, char* ErrMsg);

-Prototype for Delphi
function FixResFromFile(const PEFile: PChar; ErrMsg: PChar): Boolean; stdcall;

Arguments Specifications:
PEFile --- Pointer to the path of the PE file whose resource is to be fixed;
ErrMsg --- Pointer to buffer with the size of at least 80 bytes, for the reception for      
           error messages.

This function is compatible with all language run on Win32 platforms.

<2> Exported Function Name: FixResFromStream

-Prototype for Delphi
function FixResFromStream(PEStream: TMemoryStream; ErrMsg: PChar): Boolean;

Arguments Specifications:
PEStream represents the memory stream of the PE image. Refer to (1) for the others.

This function is especially applicable to unpacker writers. You may fix the resources 
by operating the memory stream for a reduction on customized code before dumping the 
PE image into your harddisk. Note that it is exclusively compatible with Delphi.

2nd Type: Export of restored resource section.

Features: There are various schemes of optimization for dumped PE files due to 
diversified modifications made to the original PE files by different 
packers/protectors. The engine provides an opportunity to the programmers that they 
can make customed optimization to the dumped PE files. As the caller, you may be quite 
acquainted with the best optimization scheme for the specific packer/protector as well 
as the best starting RVA to load the resource section into. So this function is 
prepared for the customed requirement. Note that the user should be familiar with PE 
stuctures on account of the relative complexity of this function. Advanced users only.

<1> Exported Function Name: DumpResFromFile

-Prototype for C
BOOL __stdcall DumpResFromFile(const char* PEFile, char* ResFile, 
  DWORD NewRVA, DWord FileAlign, char* ErrMsg);

-Prototype for Delphi
function DumpResFromFile(const PEFile: PChar; const ResFile: PChar;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean; stdcall;

Arguments Specifications:
PEFile --- Pointer to the path of the PE file whose resource is to be fixed;
ResFile --- Pointer to the path of the exported resource section;
NewRVA --- RVA for the PE file to load resource section into, or the virtual address 
           of resource data directory, RVA must be aligned on a DWORD boundary, and
           should be greater than 0x1000, but not greater than the size of PE image,
           multiple of 0x1000 is recommended;
FileAlign --- File alignment of the resource section, 0x200 or 0x1000 exclusively;
ErrMsg --- Pointer to buffer with the size of at least 80 bytes, for the reception for 
           error messages.

This function is compatible with all language run on Win32 platforms.

<2> Exported Function Name: DumpResFromStream

-Prototype for Delphi
function DumpResFromStream(PEStream: TMemoryStream; const ResFile: string;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean;

Arguments Specifications:
PEStream represents the memory stream of the PE image. Refer to (1) for the others.

<3> Exported Function Name: DumpResFromStreamEx

-Prototype for Delphi
function DumpResFromStreamEx(PEStream: TMemoryStream; ResStream: TMemoryStream;
  NewRVA: DWord; FileAlign: DWord; ErrMsg: PChar): Boolean;

Arguments Specifications:
ResStream represents the memory stream of the exported resource. Refer to (1) and (2£©
for the others.

The above two functions is especially applicable to unpacker writers. You may fix the 
resources by operating the memory stream for a reduction on customized code before 
dumping the PE image into your harddisk. Note that it is exclusively compatible with 
Delphi.

Special tips:
The engine restores only the resource of a correctly structured PE file so that please 
make sure of the validity of the target PE file before calling any of the above five 
functions. Otherwise, it may result in unexpectable errors.

Demo for Delphi:

procedure FixResDemo;
type
  TFixPERes = function(const AFileName: PChar; ErrMsg: PChar): Boolean; stdcall;
var
  ErrBuff: array[1..80] of Char;
  Handle: THandle;
  FixPERes: TFixPERes;
begin
  Handle := LoadLibrary('DT_FixRes.dll');
  if Handle <> 0 then
  begin
    @FixPERes := GetProcAddress(Handle, 'FixResFromFile');
    if @FixPERes <> nil then
      if not FixPERes(PChar('ur PE file'), @ErrBuff) then
        ShowMessage(ErrBuff);
    FreeLibrary(Handle);
  end;
end;

I wrote a demo to test the engine, which located in the same directory as the dll did. 
Please feel free to inform me of the bugs if any.

Special Thanks:
askformore for his substantial suggestion, cyclotron for translation of the manual and 
all friends on KanXue Forum.

dREAMtHEATER
2005-04-27
  
E-mail:NoteXPad@163.com
http://dREAMtHEATER.reg365.com
