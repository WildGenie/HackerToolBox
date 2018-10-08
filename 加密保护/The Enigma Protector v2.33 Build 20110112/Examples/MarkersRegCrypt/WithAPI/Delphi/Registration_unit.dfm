object frmRegistration: TfrmRegistration
  Left = 302
  Top = 301
  Width = 442
  Height = 179
  Caption = 'Registration...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 76
    Height = 13
    Caption = 'Registration info'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 76
    Height = 13
    Caption = 'Registration key'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 417
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 80
    Width = 417
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 176
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
end
