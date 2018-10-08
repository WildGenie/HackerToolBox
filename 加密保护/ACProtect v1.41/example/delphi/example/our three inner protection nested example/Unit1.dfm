object Form1: TForm1
  Left = 192
  Top = 114
  Width = 398
  Height = 435
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
  object Label1: TLabel
    Left = 13
    Top = 32
    Width = 207
    Height = 52
    Caption = 
      'This example Nested our 3 inner protections'#13#10'1.damynic code prot' +
      'ect'#13#10'2.embedded protect'#13#10'3.rsa code protect'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 112
    Top = 298
    Width = 49
    Height = 13
    Caption = 'You have '
  end
  object lbtrialtime: TLabel
    Left = 176
    Top = 297
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 200
    Top = 297
    Width = 55
    Height = 13
    Caption = 'times to trial'
  end
  object Label5: TLabel
    Left = 112
    Top = 319
    Width = 51
    Height = 13
    Caption = 'licensed to'
  end
  object lbusername: TLabel
    Left = 184
    Top = 319
    Width = 81
    Height = 13
    Caption = 'unregistered user'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
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
    Top = 160
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
  object Ok: TButton
    Left = 144
    Top = 339
    Width = 97
    Height = 33
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkClick
  end
  object Memo1: TMemo
    Left = 80
    Top = 200
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
