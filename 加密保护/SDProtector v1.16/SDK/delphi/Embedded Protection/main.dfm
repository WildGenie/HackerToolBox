object Demo: TDemo
  Left = 192
  Top = 109
  Width = 433
  Height = 294
  Caption = 'Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btDemo: TButton
    Left = 76
    Top = 16
    Width = 273
    Height = 25
    Caption = 'Example for RSA-key Locked Code Marks'
    TabOrder = 0
    OnClick = btDemoClick
  end
  object btLock: TButton
    Left = 76
    Top = 64
    Width = 273
    Height = 25
    Caption = 'Example for Dynamic Code En/Decryption Marks'
    TabOrder = 1
    OnClick = btLockClick
  end
  object btClear: TButton
    Left = 76
    Top = 112
    Width = 273
    Height = 25
    Caption = 'Example for Code Clear Marks'
    TabOrder = 2
    OnClick = btClearClick
  end
  object btEmbed: TButton
    Left = 76
    Top = 160
    Width = 273
    Height = 25
    Caption = 'Example for Embedded Protector Marks'
    TabOrder = 3
    OnClick = btEmbedClick
  end
  object btExit: TButton
    Left = 175
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = btExitClick
  end
end
