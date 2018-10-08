object Form1: TForm1
  Left = 192
  Top = 114
  Width = 363
  Height = 381
  Caption = 'example of embeded protect'
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
    Width = 327
    Height = 143
    Caption = 
      'ACProtector will embeded a cryptor(include anti-debug,anti-trace' +
      ',encrypt,decrypt fucntions etc.)here.'#13#10'The Cryptor  encrypt  the' +
      ' codes between the embeded lock header and embedded lock tail ,t' +
      'hen communicate with the loader;'#13#10'After checking,then decrypt th' +
      'e codes,and run the decrypted code .'#13#10'After the Running ,all the' +
      ' codes (include the embedded cryptor and the crypted code) will ' +
      'de destroyed.'#13#10'So the cracker can not dump the code from memory ' +
      'to analysis.and the cracker can not strip loader away .'#13#10'used to' +
      ' protect init code and password check function etc. ( run only o' +
      'nce and very important)'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 216
    Width = 326
    Height = 65
    Caption = 
      'Note:Please do not add any jump out code from the embedeed'#13#10'lock' +
      ' begin flag to end flag such as '#39'Exit'#39' or '#39'Goto'#39',you can use '#39'if' +
      '...else ...'#39' to replace the '#39'Exit'#39' or '#39'Goto'#39'.'#13#10'If you jump out t' +
      'he range you have encrypted,we can not control the code.'
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
    Caption = 'embedded protect test button'
    TabOrder = 0
    OnClick = Button1Click
  end
end
