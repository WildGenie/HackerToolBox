object Form1: TForm1
  Left = 545
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Zprotect Key Generator'
  ClientHeight = 614
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 20
    Top = 17
    Width = 56
    Height = 13
    Caption = 'Master Key:'
  end
  object lbl2: TLabel
    Left = 13
    Top = 45
    Width = 63
    Height = 13
    Caption = 'Hardware ID:'
  end
  object lbl3: TLabel
    Left = 44
    Top = 72
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lbl4: TLabel
    Left = 20
    Top = 100
    Width = 55
    Height = 13
    Caption = 'Watermark:'
  end
  object lbl5: TLabel
    Left = 16
    Top = 480
    Width = 74
    Height = 13
    Caption = 'Serials Number:'
  end
  object edt1: TEdit
    Left = 80
    Top = 13
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object chk1: TCheckBox
    Left = 352
    Top = 16
    Width = 73
    Height = 17
    Caption = 'Plaintext'
    TabOrder = 1
    OnClick = chk1Click
  end
  object edt2: TEdit
    Left = 80
    Top = 41
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object edt3: TEdit
    Left = 80
    Top = 68
    Width = 257
    Height = 21
    TabOrder = 3
  end
  object edt4: TEdit
    Left = 80
    Top = 96
    Width = 369
    Height = 21
    TabOrder = 4
  end
  object grp1: TGroupBox
    Left = 8
    Top = 120
    Width = 441
    Height = 49
    Caption = 'Limited Key'
    TabOrder = 5
    object lbl6: TLabel
      Left = 34
      Top = 20
      Width = 63
      Height = 13
      Caption = 'Validity Days:'
    end
    object lbl7: TLabel
      Left = 182
      Top = 20
      Width = 22
      Height = 13
      Caption = 'days'
    end
    object lbl8: TLabel
      Left = 226
      Top = 20
      Width = 57
      Height = 13
      Caption = 'Expiry Date:'
    end
    object edt6: TEdit
      Left = 104
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object dtp1: TDateTimePicker
      Left = 288
      Top = 16
      Width = 137
      Height = 21
      Date = 39926.758059722200000000
      Time = 39926.758059722200000000
      TabOrder = 1
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 176
    Width = 225
    Height = 145
    Caption = 'Trial Settings'
    TabOrder = 6
    object lbl9: TLabel
      Left = 20
      Top = 28
      Width = 76
      Height = 13
      Caption = 'Execution Time:'
    end
    object lbl10: TLabel
      Left = 184
      Top = 28
      Width = 21
      Height = 13
      Caption = 'mins'
    end
    object lbl11: TLabel
      Left = 40
      Top = 87
      Width = 57
      Height = 13
      Caption = 'Expiry Date:'
    end
    object lbl18: TLabel
      Left = 46
      Top = 57
      Width = 50
      Height = 13
      Caption = 'Trial Days:'
    end
    object lbl19: TLabel
      Left = 184
      Top = 60
      Width = 22
      Height = 13
      Caption = 'days'
    end
    object lbl20: TLabel
      Left = 42
      Top = 116
      Width = 55
      Height = 13
      Caption = 'Executions:'
    end
    object lbl21: TLabel
      Left = 184
      Top = 116
      Width = 24
      Height = 13
      Caption = 'times'
    end
    object edt7: TEdit
      Left = 104
      Top = 25
      Width = 73
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object dtp2: TDateTimePicker
      Left = 104
      Top = 84
      Width = 89
      Height = 21
      Date = 39926.758059722200000000
      Time = 39926.758059722200000000
      TabOrder = 1
    end
    object edt10: TEdit
      Left = 104
      Top = 54
      Width = 73
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object edt11: TEdit
      Left = 104
      Top = 113
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0'
    end
  end
  object grp3: TGroupBox
    Left = 240
    Top = 176
    Width = 209
    Height = 145
    Caption = 'Decoding Sections'
    TabOrder = 7
    object lbl12: TLabel
      Left = 40
      Top = 112
      Width = 52
      Height = 13
      Caption = 'Section_C:'
    end
    object lbl14: TLabel
      Left = 40
      Top = 72
      Width = 52
      Height = 13
      Caption = 'Section_B:'
    end
    object lbl13: TLabel
      Left = 40
      Top = 32
      Width = 52
      Height = 13
      Caption = 'Section_A:'
    end
    object cbb1: TComboBox
      Left = 104
      Top = 28
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'False'
      Items.Strings = (
        'False'
        'True')
    end
    object cbb2: TComboBox
      Left = 104
      Top = 68
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'False'
      Items.Strings = (
        'False'
        'True')
    end
    object cbb3: TComboBox
      Left = 104
      Top = 108
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'False'
      Items.Strings = (
        'False'
        'True')
    end
  end
  object grp4: TGroupBox
    Left = 8
    Top = 328
    Width = 441
    Height = 145
    Caption = 'Custom Data'
    TabOrder = 8
    object lbl15: TLabel
      Left = 8
      Top = 28
      Width = 77
      Height = 13
      Caption = 'Custom String 1:'
    end
    object lbl16: TLabel
      Left = 8
      Top = 57
      Width = 77
      Height = 13
      Caption = 'Custom String 2:'
    end
    object lbl17: TLabel
      Left = 8
      Top = 87
      Width = 77
      Height = 13
      Caption = 'Custom String 3:'
    end
    object lbl22: TLabel
      Left = 24
      Top = 116
      Width = 45
      Height = 13
      Caption = 'Integer 1:'
    end
    object lbl23: TLabel
      Left = 160
      Top = 116
      Width = 45
      Height = 13
      Caption = 'Integer 2:'
    end
    object lbl24: TLabel
      Left = 296
      Top = 116
      Width = 45
      Height = 13
      Caption = 'Integer 3:'
    end
    object edt9: TEdit
      Left = 88
      Top = 28
      Width = 345
      Height = 21
      TabOrder = 0
    end
    object edt8: TEdit
      Left = 88
      Top = 57
      Width = 345
      Height = 21
      TabOrder = 1
    end
    object edt12: TEdit
      Left = 88
      Top = 87
      Width = 345
      Height = 21
      TabOrder = 2
    end
    object edt13: TEdit
      Left = 72
      Top = 112
      Width = 81
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object edt14: TEdit
      Left = 208
      Top = 112
      Width = 81
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object edt15: TEdit
      Left = 344
      Top = 112
      Width = 89
      Height = 21
      TabOrder = 5
      Text = '0'
    end
  end
  object Button1: TButton
    Left = 64
    Top = 584
    Width = 97
    Height = 25
    Caption = 'Generate'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 66
    Width = 97
    Height = 25
    Caption = 'As Watermark'
    TabOrder = 10
    OnClick = Button2Click
  end
  object mmo1: TMemo
    Left = 16
    Top = 496
    Width = 433
    Height = 81
    TabOrder = 11
  end
  object Button3: TButton
    Left = 168
    Top = 584
    Width = 129
    Height = 25
    Caption = 'Copy to clipboard'
    TabOrder = 12
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 584
    Width = 145
    Height = 25
    Caption = 'Save as keyfile'
    TabOrder = 13
    OnClick = Button4Click
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '*.key'
    FileName = 'License.key'
    Filter = 'License File|*.key|所有文件|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 384
    Top = 32
  end
  object XPManifest1: TXPManifest
    Left = 416
    Top = 32
  end
end
