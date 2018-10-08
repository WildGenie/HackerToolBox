object Form1: TForm1
  Left = 192
  Top = 124
  Width = 610
  Height = 261
  Caption = 'Form1'
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
    Left = 16
    Top = 16
    Width = 87
    Height = 13
    Caption = 'Registration Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 77
    Height = 13
    Caption = 'Registration Key'
  end
  object Label3: TLabel
    Left = 16
    Top = 184
    Width = 262
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Enter registration name and key and click Check button'
  end
  object eName: TEdit
    Left = 16
    Top = 32
    Width = 561
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object mKey: TMemo
    Left = 16
    Top = 80
    Width = 561
    Height = 89
    TabOrder = 1
  end
  object Button1: TButton
    Left = 480
    Top = 184
    Width = 99
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 184
    Width = 99
    Height = 25
    Caption = 'Check'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
end
