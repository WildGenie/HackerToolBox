object frmMain: TfrmMain
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'The Enigma Protector Keys Geneartor'
  ClientHeight = 415
  ClientWidth = 596
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
  object lbUserInfo: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'User Information'
  end
  object eUserInfo: TEdit
    Left = 8
    Top = 24
    Width = 385
    Height = 21
    TabOrder = 0
  end
  object gbSections: TGroupBox
    Left = 400
    Top = 24
    Width = 185
    Height = 249
    Caption = 'Crypted Sections'
    TabOrder = 1
    object cbSection1: TCheckBox
      Left = 8
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Section 1'
      TabOrder = 0
    end
    object cbSection2: TCheckBox
      Left = 8
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Section 2'
      TabOrder = 1
    end
    object cbSection3: TCheckBox
      Left = 8
      Top = 72
      Width = 65
      Height = 17
      Caption = 'Section 3'
      TabOrder = 2
    end
    object cbSection4: TCheckBox
      Left = 8
      Top = 96
      Width = 65
      Height = 17
      Caption = 'Section 4'
      TabOrder = 3
    end
    object cbSection5: TCheckBox
      Left = 8
      Top = 120
      Width = 65
      Height = 17
      Caption = 'Section 5'
      TabOrder = 4
    end
    object cbSection6: TCheckBox
      Left = 8
      Top = 144
      Width = 65
      Height = 17
      Caption = 'Section 6'
      TabOrder = 5
    end
    object cbSection7: TCheckBox
      Left = 8
      Top = 168
      Width = 65
      Height = 17
      Caption = 'Section 7'
      TabOrder = 6
    end
    object cbSection8: TCheckBox
      Left = 8
      Top = 192
      Width = 65
      Height = 17
      Caption = 'Section 8'
      TabOrder = 7
    end
    object cbSection9: TCheckBox
      Left = 96
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Section 9'
      TabOrder = 8
    end
    object cbSection10: TCheckBox
      Left = 96
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Section 10'
      TabOrder = 9
    end
    object cbSection11: TCheckBox
      Left = 96
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Section 11'
      TabOrder = 10
    end
    object cbSection12: TCheckBox
      Left = 96
      Top = 96
      Width = 73
      Height = 17
      Caption = 'Section 12'
      TabOrder = 11
    end
    object cbSection13: TCheckBox
      Left = 96
      Top = 120
      Width = 73
      Height = 17
      Caption = 'Section 13'
      TabOrder = 12
    end
    object cbSection14: TCheckBox
      Left = 96
      Top = 144
      Width = 73
      Height = 17
      Caption = 'Section 14'
      TabOrder = 13
    end
    object cbSection15: TCheckBox
      Left = 96
      Top = 168
      Width = 73
      Height = 17
      Caption = 'Section 15'
      TabOrder = 14
    end
    object cbSection16: TCheckBox
      Left = 96
      Top = 192
      Width = 73
      Height = 17
      Caption = 'Section 16'
      TabOrder = 15
    end
  end
  object bGen: TButton
    Left = 8
    Top = 280
    Width = 137
    Height = 25
    Caption = 'Generate Key'
    TabOrder = 2
    OnClick = bGenClick
  end
  object bGenFP: TButton
    Left = 152
    Top = 280
    Width = 145
    Height = 25
    Caption = 'Generate Key From Project'
    TabOrder = 3
    OnClick = bGenFPClick
  end
  object bClose: TButton
    Left = 448
    Top = 312
    Width = 137
    Height = 89
    Cancel = True
    Caption = 'Close'
    TabOrder = 4
    OnClick = bCloseClick
  end
  object mKey: TMemo
    Left = 8
    Top = 312
    Width = 433
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 385
    Height = 65
    Caption = 'Type of registration keys'
    TabOrder = 6
    object Label1: TLabel
      Left = 112
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Key Mode:'
    end
    object Label2: TLabel
      Left = 240
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Key Base:'
    end
    object cbKeyMode: TComboBox
      Left = 112
      Top = 32
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '~ RSA 512'
        '~ RSA 768'
        '~ RSA 1024'
        '~ RSA 2048'
        '~ RSA 3072'
        '~ RSA 4096')
    end
    object cbKeyBase: TComboBox
      Left = 248
      Top = 32
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Base 2'
        'Base 8'
        'Base 16'
        'Base 32'
        'Base 64')
    end
    object cbHyphens: TCheckBox
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = 'Add hyphens'
      TabOrder = 2
    end
  end
  object btnVerify: TButton
    Left = 304
    Top = 280
    Width = 137
    Height = 25
    Caption = 'Verify'
    TabOrder = 7
    OnClick = btnVerifyClick
  end
  object btnVerifyFP: TButton
    Left = 448
    Top = 280
    Width = 137
    Height = 25
    Caption = 'Verify From Project'
    TabOrder = 8
    OnClick = btnVerifyFPClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 385
    Height = 153
    Caption = 'Key Restrictions'
    TabOrder = 9
    object cbRegisterAfter: TCheckBox
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      Caption = 'Register After'
      TabOrder = 0
      OnClick = cbRegisterAfterClick
    end
    object cbExpiration: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Expiration Date'
      TabOrder = 1
      OnClick = cbExpirationClick
    end
    object dtpExpiration: TDateTimePicker
      Left = 104
      Top = 20
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 39186.5290076968
      Time = 39186.5290076968
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object dtpRegisterAfter: TDateTimePicker
      Left = 104
      Top = 44
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 39186.5290076968
      Time = 39186.5290076968
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object cbRegisterBefore: TCheckBox
      Left = 8
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Register Before'
      TabOrder = 4
      OnClick = cbRegisterBeforeClick
    end
    object dtpRegisterBefore: TDateTimePicker
      Left = 104
      Top = 68
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 39186.5290076968
      Time = 39186.5290076968
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
    end
    object cbExecutions: TCheckBox
      Left = 232
      Top = 24
      Width = 81
      Height = 17
      Caption = 'Executions'
      TabOrder = 6
      OnClick = cbExecutionsClick
    end
    object cbDays: TCheckBox
      Left = 232
      Top = 48
      Width = 49
      Height = 17
      Caption = 'Days'
      TabOrder = 7
      OnClick = cbDaysClick
    end
    object cbRuntime: TCheckBox
      Left = 232
      Top = 72
      Width = 65
      Height = 17
      Caption = 'Runtime'
      TabOrder = 8
      OnClick = cbRuntimeClick
    end
    object cbGlobalTime: TCheckBox
      Left = 232
      Top = 96
      Width = 81
      Height = 17
      Caption = 'Global Time'
      TabOrder = 9
      OnClick = cbGlobalTimeClick
    end
    object seExecutions: TCSpinEdit
      Left = 312
      Top = 20
      Width = 65
      Height = 22
      TabStop = True
      Enabled = False
      MaxValue = 65535
      MinValue = 1
      ParentColor = False
      TabOrder = 10
      Value = 100
    end
    object seDays: TCSpinEdit
      Left = 312
      Top = 44
      Width = 65
      Height = 22
      TabStop = True
      Enabled = False
      MaxValue = 65535
      MinValue = 1
      ParentColor = False
      TabOrder = 11
      Value = 30
    end
    object seRuntime: TCSpinEdit
      Left = 312
      Top = 68
      Width = 65
      Height = 22
      TabStop = True
      Enabled = False
      MaxValue = 65535
      MinValue = 1
      ParentColor = False
      TabOrder = 12
      Value = 10
    end
    object seGlobalTime: TCSpinEdit
      Left = 312
      Top = 92
      Width = 65
      Height = 22
      TabStop = True
      Enabled = False
      MaxValue = 65535
      MinValue = 1
      ParentColor = False
      TabOrder = 13
      Value = 60
    end
    object eHardware: TEdit
      Left = 104
      Top = 116
      Width = 273
      Height = 21
      TabOrder = 14
    end
    object cbHardware: TCheckBox
      Left = 8
      Top = 120
      Width = 81
      Height = 17
      Caption = 'Hardware ID'
      TabOrder = 15
      OnClick = cbHardwareClick
    end
    object cbCountry: TCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Country Lock'
      TabOrder = 16
      OnClick = cbCountryClick
    end
    object comCountry: TComboBox
      Left = 104
      Top = 92
      Width = 121
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 17
    end
  end
end
