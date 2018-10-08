object Form1: TForm1
  Left = 192
  Top = 114
  Width = 432
  Height = 281
  Caption = 'Trial Software using your own key solution'
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
      '0 days.'#13#10'After using 10 days,you can not continue to use this so' +
      'ftware.'#13#10'And you can add your own solution and license the softw' +
      'are to your user.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 152
    Top = 142
    Width = 49
    Height = 13
    Caption = 'You have '
  end
  object lbtrialtime: TLabel
    Left = 216
    Top = 141
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 240
    Top = 141
    Width = 53
    Height = 13
    Caption = 'days to trial'
  end
  object Label5: TLabel
    Left = 152
    Top = 163
    Width = 51
    Height = 13
    Caption = 'licensed to'
  end
  object lbusername: TLabel
    Left = 224
    Top = 163
    Width = 81
    Height = 13
    Caption = 'unregistered user'
  end
  object Label3: TLabel
    Left = 14
    Top = 64
    Width = 347
    Height = 13
    Caption = 
      'Now we use one solution for trial software.You can change it to ' +
      'your own.'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 104
    Width = 399
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
    Left = 256
    Top = 196
    Width = 105
    Height = 37
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkClick
  end
  object Button1: TButton
    Left = 72
    Top = 196
    Width = 105
    Height = 37
    Caption = 'Register'
    TabOrder = 1
    OnClick = Button1Click
  end
end
