object Form1: TForm1
  Left = 192
  Top = 114
  Width = 398
  Height = 273
  Caption = 'Trial Software using our key solution'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 96
    Top = 138
    Width = 49
    Height = 13
    Caption = 'You have '
  end
  object lbtrialtime: TLabel
    Left = 160
    Top = 137
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 184
    Top = 137
    Width = 55
    Height = 13
    Caption = 'times to trial'
  end
  object Label5: TLabel
    Left = 96
    Top = 159
    Width = 51
    Height = 13
    Caption = 'licensed to'
  end
  object lbusername: TLabel
    Left = 168
    Top = 159
    Width = 81
    Height = 13
    Caption = 'unregistered user'
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 365
    Height = 52
    Caption = 
      'Now we use our key solution for trial software.'#13#10'Please create a' +
      ' rsa key pair and use the '#39'key.dat'#39' to remove the trial limitati' +
      'on.'#13#10'When the '#39'key.dat'#39' is in the folder of .exe or .dll file,it' +
      ' will not check the trial information such as trial times or tri' +
      'al days.'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 80
    Width = 350
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
    OnClick = Label6Click
  end
  object Label1: TLabel
    Left = 96
    Top = 120
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Ok: TButton
    Left = 128
    Top = 187
    Width = 97
    Height = 33
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkClick
  end
end
