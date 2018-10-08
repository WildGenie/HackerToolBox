object Form2: TForm2
  Left = 192
  Top = 114
  Width = 305
  Height = 194
  Caption = 'Register'
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
    Left = 24
    Top = 32
    Width = 53
    Height = 13
    Caption = 'User Name'
  end
  object Label2: TLabel
    Left = 24
    Top = 74
    Width = 64
    Height = 13
    Caption = 'Serial number'
  end
  object edUserName: TEdit
    Left = 104
    Top = 32
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'Test User'
  end
  object edSerialNumber: TEdit
    Left = 104
    Top = 72
    Width = 169
    Height = 21
    TabOrder = 1
    Text = '123456789'
  end
  object Button1: TButton
    Left = 40
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
end
