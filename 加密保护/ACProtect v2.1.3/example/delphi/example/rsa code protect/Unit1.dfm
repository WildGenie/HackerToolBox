object Form1: TForm1
  Left = 192
  Top = 114
  Width = 348
  Height = 381
  Caption = 'RSA key lock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 310
    Height = 143
    Caption = 
      'example of RSA key lock,this will prevent the cracker to write o' +
      'ut the KeyGen of the software'#13#10'the code between the "RSA lock co' +
      'de begin" and "RSA lock code end" will be locked with the RSA102' +
      '4 keypair,'#13#10'without the correct RSA key Public key,the code lock' +
      'ed can not be unlock,so the function is limited to those who hav' +
      'e the correct key.dat used to generate the function limit softwa' +
      're.'#13#10#13#10'When test the rsa lock,please calculate rsa key pair firs' +
      't.'#13#10#13#10'Rsa Key lock is the best solution for function limit trial' +
      ' software.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 216
    Width = 308
    Height = 65
    Caption = 
      'Note:Please do not add any jump out code from the rsa'#13#10'lock begi' +
      'n flag to end flag such as '#39'Exit'#39' or '#39'Goto'#39',you can use '#39'if...el' +
      'se ...'#39' to replace the '#39'Exit'#39' or '#39'Goto'#39'.'#13#10'If you jump out the ra' +
      'nge you have encrypted,we can not control the code.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 16
    Top = 168
    Width = 304
    Height = 26
    Cursor = crHandPoint
    Caption = 
      'We suggest you go to our website  http://www.ultraprotect.com an' +
      'd view the online flash tutorials for more information.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label3Click
  end
  object Button1: TButton
    Left = 104
    Top = 296
    Width = 153
    Height = 41
    Caption = 'Rsa lock test button'
    TabOrder = 0
    OnClick = Button1Click
  end
end
