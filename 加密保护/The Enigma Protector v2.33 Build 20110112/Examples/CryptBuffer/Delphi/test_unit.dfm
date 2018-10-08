object Form1: TForm1
  Left = 310
  Top = 173
  Width = 626
  Height = 313
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    610
    277)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 121
    Height = 13
    Caption = 'Enter string for Encryption'
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 114
    Height = 13
    Caption = 'Base16 encrypted string'
  end
  object Label3: TLabel
    Left = 16
    Top = 225
    Width = 77
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Decrypted string'
  end
  object eSource: TEdit
    Left = 16
    Top = 88
    Width = 577
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = eSourceChange
  end
  object mEncrypted: TMemo
    Left = 16
    Top = 128
    Width = 577
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object eDecrypted: TEdit
    Left = 16
    Top = 241
    Width = 577
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 577
    Height = 57
    Caption = 'Enter Password (Key) for encryption/decryption'
    TabOrder = 3
    object ePassword: TEdit
      Left = 16
      Top = 24
      Width = 553
      Height = 21
      TabOrder = 0
      Text = 'Password'
      OnChange = eSourceChange
    end
  end
end
