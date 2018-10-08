object Form1: TForm1
  Left = 192
  Top = 114
  Width = 342
  Height = 295
  Caption = 'example of dynamic code lock'
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
    Left = 12
    Top = 8
    Width = 297
    Height = 65
    Caption = 
      'example of dynamic code lock the code between the dynamic lock b' +
      'egin and end flag will be crypted,'#13#10'when running,the code will b' +
      'e decrypted first,then run,after the running ,it will be encrypt' +
      'ed again to prevent dumpping and static analysis.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 128
    Width = 305
    Height = 65
    Caption = 
      'Note:Please do not add any jump out code from the dynamic '#13#10'lock' +
      ' begin flag to end flag such as '#39'Exit'#39' or '#39'Goto'#39',you can use '#39'if' +
      ' ...else...'#39' to replace the '#39'Exit'#39' or '#39'Goto'#39'.'#13#10'If you jump out t' +
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
    Top = 88
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
    Left = 96
    Top = 208
    Width = 153
    Height = 41
    Caption = 'Dynamic lock test button'
    TabOrder = 0
    OnClick = Button1Click
  end
end
