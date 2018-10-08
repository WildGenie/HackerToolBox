unit EXECryptorKeyGen;

{ EXECryptor 2.3
  High level proxy class for call to eckeygen.dll
}

interface

uses SysUtils, Windows;

type
  TSerialNumberInfo = packed record
    LicType: integer;    //0..15
    UserParam: integer;  //0..1023
    ExpiryMonth,         //1..12
    ExpiryYear: integer; //2004..2024
    F1,F2,F3,F4,F5,F6: Boolean;
  end;
  PSerialNumberInfo = ^TSerialNumberInfo;

  TCreateSerialNumber = procedure(ProjectFileName,RegistrationName,
    HardwareID,SerialNumber: PChar); stdcall;
  TCreateSerialNumberEx = procedure (ProjectFileName,RegistrationName,HardwareID: PChar;
    pli: PSerialNumberInfo; SerialNumber: PChar); stdcall;
  TCreateSerialNumberW = procedure(ProjectFileName,RegistrationName,
    HardwareID,SerialNumber: PWideChar); stdcall;
  TCreateSerialNumberExW = procedure (ProjectFileName,RegistrationName,
    HardwareID: PWideChar; pli: PSerialNumberInfo; SerialNumber: PWideChar);
    stdcall;

  TKeyGen = class
  private
    hLib: THandle;
    FCreateSerialNumber: TCreateSerialNumber;
    FCreateSerialNumberEx: TCreateSerialNumberEx;
    FCreateSerialNumberW: TCreateSerialNumberW;
    FCreateSerialNumberExW: TCreateSerialNumberExW;
  public
    constructor Create(const DllPath: string = '');
    destructor Destroy;
    function CreateSerialNumber(const PrjName,RegistrationName: string;
      const HardwareID: string = ''): string;
    function CreateSerialNumberTimeLimited(const PrjName,RegistrationName: string;
      F1,F2,F3,F4,F5,F6: Boolean; LicType,ExpiryMonth,ExpiryYear: integer;
      const HardwareID: string = ''): string;
    function CreateSerialNumberEx(const PrjName,RegistrationName: string;
      F1,F2,F3,F4,F5,F6: Boolean; LicType,UserParam: integer;
      const HardwareID: string = ''): string;
    function CreateSerialNumberW(const PrjName,RegistrationName: WideString;
      const HardwareID: WideString = ''): WideString;
    function CreateSerialNumberTimeLimitedW(const PrjName,RegistrationName: WideString;
      F1,F2,F3,F4,F5,F6: Boolean; LicType,ExpiryMonth,ExpiryYear: integer;
      const HardwareID: WideString = ''): WideString;
    function CreateSerialNumberExW(const PrjName,RegistrationName: WideString;
      F1,F2,F3,F4,F5,F6: Boolean; LicType,UserParam: integer;
      const HardwareID: WideString = ''): WideString;
  end;
  
implementation

{ TKeyGen }

constructor TKeyGen.Create(const DllPath: string);
const DllName = 'eckeygen.dll';
begin
  inherited Create;
  hLib:=LoadLibrary(PChar(DllPath+DllName));
  if hLib = 0 then
    raise Exception.Create('Can''t load '+DllPath+DllName);
  FCreateSerialNumber:=GetProcAddress(hLib,'CreateSerialNumber');
  if not Assigned(FCreateSerialNumber) then
    raise Exception.Create('Can''t import CreateSerialNumber');
  FCreateSerialNumberEx:=GetProcAddress(hLib,'CreateSerialNumberEx');
  if not Assigned(FCreateSerialNumberEx) then
    raise Exception.Create('Can''t import CreateSerialNumberEx');
  FCreateSerialNumberW:=GetProcAddress(hLib,'CreateSerialNumberW');
  if not Assigned(FCreateSerialNumberW) then
    raise Exception.Create('Can''t import CreateSerialNumberW');
  FCreateSerialNumberExW:=GetProcAddress(hLib,'CreateSerialNumberExW');
  if not Assigned(FCreateSerialNumberExW) then
    raise Exception.Create('Can''t import CreateSerialNumberExW');
end;

function TKeyGen.CreateSerialNumber(const PrjName, RegistrationName,
  HardwareID: string): string;
begin
  SetLength(Result,1024);
  FCreateSerialNumber(PChar(PrjName), PChar(RegistrationName),
    PChar(HardwareID),PChar(Result));
  Result:=PChar(Result);
end;

function TKeyGen.CreateSerialNumberEx(const PrjName,
  RegistrationName: string; F1, F2, F3, F4, F5, F6: Boolean;
  LicType,UserParam: integer; const HardwareID: string): string;
var
  li: TSerialNumberInfo;
begin
  li.F1:=F1; li.F2:=F2; li.F3:=F3; li.F4:=F4; li.F5:=F5; li.F6:=F6;
  li.LicType:=LicType;
  li.UserParam:=UserParam;
  SetLength(Result,1024);
  FCreateSerialNumberEx(PChar(PrjName), PChar(RegistrationName),
    PChar(HardwareID),@li,PChar(Result));
  Result:=PChar(Result);
end;

function TKeyGen.CreateSerialNumberExW(const PrjName,
  RegistrationName: WideString; F1, F2, F3, F4, F5, F6: Boolean; LicType,
  UserParam: integer; const HardwareID: WideString): WideString;
var
  li: TSerialNumberInfo;
begin
  li.F1:=F1; li.F2:=F2; li.F3:=F3; li.F4:=F4; li.F5:=F5; li.F6:=F6;
  li.LicType:=LicType;
  li.UserParam:=UserParam;
  SetLength(Result,1024);
  FCreateSerialNumberExW(PWideChar(PrjName), PWideChar(RegistrationName),
    PWideChar(HardwareID),@li,PWideChar(Result));
  Result:=PWideChar(Result);
end;

function TKeyGen.CreateSerialNumberTimeLimited(const PrjName,
  RegistrationName: string; F1, F2, F3, F4, F5, F6: Boolean;
  LicType,ExpiryMonth,ExpiryYear: integer; const HardwareID: string): string;
var
  li: TSerialNumberInfo;
begin
  li.F1:=F1; li.F2:=F2; li.F3:=F3; li.F4:=F4; li.F5:=F5; li.F6:=F6;
  li.LicType:=LicType;
  li.ExpiryMonth:=ExpiryMonth;
  li.ExpiryYear:=ExpiryYear;
  SetLength(Result,1024);
  FCreateSerialNumberEx(PChar(PrjName), PChar(RegistrationName),
    PChar(HardwareID),@li,PChar(Result));
  Result:=PChar(Result);
end;

function TKeyGen.CreateSerialNumberTimeLimitedW(const PrjName,
  RegistrationName: WideString; F1, F2, F3, F4, F5, F6: Boolean; LicType,
  ExpiryMonth, ExpiryYear: integer;
  const HardwareID: WideString): WideString;
var
  li: TSerialNumberInfo;
begin
  li.F1:=F1; li.F2:=F2; li.F3:=F3; li.F4:=F4; li.F5:=F5; li.F6:=F6;
  li.LicType:=LicType;
  li.ExpiryMonth:=ExpiryMonth;
  li.ExpiryYear:=ExpiryYear;
  SetLength(Result,1024);
  FCreateSerialNumberExW(PWideChar(PrjName), PWideChar(RegistrationName),
    PWideChar(HardwareID),@li,PWideChar(Result));
  Result:=PWideChar(Result);
end;

function TKeyGen.CreateSerialNumberW(const PrjName, RegistrationName,
  HardwareID: WideString): WideString;
begin
  SetLength(Result,1024);
  FCreateSerialNumberW(PWideChar(PrjName), PWideChar(RegistrationName),
    PWideChar(HardwareID),PWideChar(Result));
  Result:=PWideChar(Result);
end;

destructor TKeyGen.Destroy;
begin
  FreeLibrary(hLib);
  inherited;
end;

end.
