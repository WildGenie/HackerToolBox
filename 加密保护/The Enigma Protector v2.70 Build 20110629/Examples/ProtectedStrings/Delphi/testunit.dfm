object Form1: TForm1
  Left = 192
  Top = 114
  Width = 346
  Height = 235
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 90
    Height = 13
    Caption = '1st protected string'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 94
    Height = 13
    Caption = '2nd protected string'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 91
    Height = 13
    Caption = '3rd protected string'
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 16
    Top = 80
    Width = 305
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 16
    Top = 128
    Width = 305
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 128
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button1Click
  end
end
