object Form1: TForm1
  Left = 273
  Top = 190
  Width = 549
  Height = 524
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
    Left = 8
    Top = 8
    Width = 155
    Height = 13
    Caption = 'Enter string to calculate hash for:'
  end
  object Label11: TLabel
    Left = 264
    Top = 8
    Width = 104
    Height = 13
    Caption = 'Calculate hash for file:'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 521
    Height = 385
    Caption = 'Calculated hashes'
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Xor32'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 23
      Height = 13
      Caption = 'MD2'
    end
    object Label4: TLabel
      Left = 8
      Top = 96
      Width = 23
      Height = 13
      Caption = 'MD5'
    end
    object Label5: TLabel
      Left = 8
      Top = 136
      Width = 57
      Height = 13
      Caption = 'RipeMD160'
    end
    object Label6: TLabel
      Left = 8
      Top = 176
      Width = 21
      Height = 13
      Caption = 'SH1'
    end
    object Label7: TLabel
      Left = 8
      Top = 216
      Width = 40
      Height = 13
      Caption = 'SHA224'
    end
    object Label8: TLabel
      Left = 8
      Top = 256
      Width = 40
      Height = 13
      Caption = 'SHA256'
    end
    object Label9: TLabel
      Left = 8
      Top = 296
      Width = 40
      Height = 13
      Caption = 'SHA384'
    end
    object Label10: TLabel
      Left = 8
      Top = 336
      Width = 40
      Height = 13
      Caption = 'SHA512'
    end
    object eXor32: TEdit
      Left = 8
      Top = 32
      Width = 505
      Height = 21
      TabOrder = 0
    end
    object eMD2: TEdit
      Left = 8
      Top = 72
      Width = 505
      Height = 21
      TabOrder = 1
    end
    object eMD5: TEdit
      Left = 8
      Top = 112
      Width = 505
      Height = 21
      TabOrder = 2
    end
    object eRipeMD160: TEdit
      Left = 8
      Top = 152
      Width = 505
      Height = 21
      TabOrder = 3
    end
    object eSH1: TEdit
      Left = 8
      Top = 192
      Width = 505
      Height = 21
      TabOrder = 4
    end
    object eSHA224: TEdit
      Left = 8
      Top = 232
      Width = 505
      Height = 21
      TabOrder = 5
    end
    object eSHA256: TEdit
      Left = 8
      Top = 272
      Width = 505
      Height = 21
      TabOrder = 6
    end
    object eSHA384: TEdit
      Left = 8
      Top = 312
      Width = 505
      Height = 21
      TabOrder = 7
    end
    object eSHA512: TEdit
      Left = 8
      Top = 352
      Width = 505
      Height = 21
      TabOrder = 8
    end
  end
  object Button1: TButton
    Left = 456
    Top = 456
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 264
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 3
    OnChange = Edit2Change
  end
  object Button2: TButton
    Left = 456
    Top = 24
    Width = 75
    Height = 21
    Caption = 'Browse...'
    TabOrder = 4
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Options = [ofEnableSizing]
    Left = 8
    Top = 456
  end
end
