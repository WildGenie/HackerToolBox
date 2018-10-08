object Form1: TForm1
  Left = 192
  Top = 114
  Width = 401
  Height = 285
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
    Top = 8
    Width = 345
    Height = 39
    Caption = 
      'This is a trial software example.You only can use this example 1' +
      '0 times.'#13#10'After using 10 times,you can not continue to use this ' +
      'software.'#13#10'And you can add your own solution and license the sof' +
      'tware to your user.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 120
    Top = 170
    Width = 49
    Height = 13
    Caption = 'You have '
  end
  object lbtrialtime: TLabel
    Left = 184
    Top = 169
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 208
    Top = 169
    Width = 55
    Height = 13
    Caption = 'times to trial'
  end
  object Label5: TLabel
    Left = 120
    Top = 191
    Width = 51
    Height = 13
    Caption = 'licensed to'
  end
  object lbusername: TLabel
    Left = 192
    Top = 191
    Width = 81
    Height = 13
    Caption = 'unregistered user'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
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
    Top = 128
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
    Top = 211
    Width = 97
    Height = 33
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkClick
  end
end
