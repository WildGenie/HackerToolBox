object frmMain: TfrmMain
  Left = 293
  Top = 93
  Caption = 'Keys generator'
  ClientHeight = 418
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbUserInfo: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'User information'
  end
  object bClose: TButton
    Left = 480
    Top = 320
    Width = 65
    Height = 89
    Cancel = True
    Caption = 'Close'
    TabOrder = 0
    OnClick = bCloseClick
  end
  object eUserInfo: TEdit
    Left = 8
    Top = 24
    Width = 537
    Height = 21
    TabOrder = 1
  end
  object gbSections: TGroupBox
    Left = 360
    Top = 48
    Width = 185
    Height = 233
    Caption = 'Crypt Sections'
    TabOrder = 2
    object cbSection1: TCheckBox
      Left = 16
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Section 1'
      TabOrder = 0
    end
    object cbSection2: TCheckBox
      Left = 16
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Section 2'
      TabOrder = 1
    end
    object cbSection3: TCheckBox
      Left = 16
      Top = 72
      Width = 65
      Height = 17
      Caption = 'Section 3'
      TabOrder = 2
    end
    object cbSection4: TCheckBox
      Left = 16
      Top = 96
      Width = 65
      Height = 17
      Caption = 'Section 4'
      TabOrder = 3
    end
    object cbSection5: TCheckBox
      Left = 16
      Top = 120
      Width = 65
      Height = 17
      Caption = 'Section 5'
      TabOrder = 4
    end
    object cbSection6: TCheckBox
      Left = 16
      Top = 144
      Width = 65
      Height = 17
      Caption = 'Section 6'
      TabOrder = 5
    end
    object cbSection7: TCheckBox
      Left = 16
      Top = 168
      Width = 65
      Height = 17
      Caption = 'Section 7'
      TabOrder = 6
    end
    object cbSection8: TCheckBox
      Left = 16
      Top = 192
      Width = 65
      Height = 17
      Caption = 'Section 8'
      TabOrder = 7
    end
    object cbSection9: TCheckBox
      Left = 96
      Top = 24
      Width = 73
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
    Top = 288
    Width = 137
    Height = 25
    Caption = 'Generate'
    TabOrder = 3
    OnClick = bGenClick
  end
  object bGenFP: TButton
    Left = 152
    Top = 288
    Width = 129
    Height = 25
    Caption = 'Generate from project'
    TabOrder = 4
    OnClick = bGenFPClick
  end
  object mKey: TMemo
    Left = 8
    Top = 320
    Width = 457
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 345
    Height = 81
    Caption = 'Key type'
    TabOrder = 6
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Key Mode:'
    end
    object Label2: TLabel
      Left = 176
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Key Base:'
    end
    object cbKeyMode: TComboBox
      Left = 8
      Top = 32
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = '~ RSA 512'
      Items.Strings = (
        '~ RSA 512'
        '~ RSA 768'
        '~ RSA 1024'
        '~ RSA 2048'
        '~ RSA 3072'
        '~ RSA 4096')
    end
    object cbKeyBase: TComboBox
      Left = 176
      Top = 32
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemIndex = 3
      TabOrder = 1
      Text = 'Base 32'
      Items.Strings = (
        'Base 2'
        'Base 8'
        'Base 16'
        'Base 32'
        'Base 64')
    end
    object cbHyphens: TCheckBox
      Left = 8
      Top = 56
      Width = 321
      Height = 17
      Caption = 'Add hyphens to the key'
      TabOrder = 2
    end
  end
  object btnVerify: TButton
    Left = 288
    Top = 288
    Width = 121
    Height = 25
    Caption = 'Verify'
    TabOrder = 7
    OnClick = btnVerifyClick
  end
  object btnVerifyP: TButton
    Left = 416
    Top = 288
    Width = 129
    Height = 25
    Caption = 'Verify from project'
    TabOrder = 8
    OnClick = btnVerifyPClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 345
    Height = 145
    Caption = 'Key Restrictions'
    TabOrder = 9
    object cbExpirationDate: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Expiration Date'
      TabOrder = 0
      OnClick = cbExpirationDateClick
    end
    object DateTimePicker1: TDateTimePicker
      Left = 104
      Top = 22
      Width = 89
      Height = 21
      Date = 39182.849815173610000000
      Time = 39182.849815173610000000
      TabOrder = 1
    end
    object cbHardwareID: TCheckBox
      Left = 8
      Top = 120
      Width = 97
      Height = 17
      Caption = 'Hardware ID'
      TabOrder = 2
      OnClick = cbHardwareIDClick
    end
    object eHardware: TEdit
      Left = 96
      Top = 118
      Width = 241
      Height = 21
      TabOrder = 3
    end
    object cbRegisterAfter: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Register After'
      TabOrder = 4
      OnClick = cbRegisterAfterClick
    end
    object dtpRegisterAfter: TDateTimePicker
      Left = 104
      Top = 46
      Width = 89
      Height = 21
      Date = 39182.849815173610000000
      Time = 39182.849815173610000000
      TabOrder = 5
    end
    object cbRegisterBefore: TCheckBox
      Left = 8
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Register Before'
      TabOrder = 6
      OnClick = cbRegisterBeforeClick
    end
    object dtpRegisterBefore: TDateTimePicker
      Left = 104
      Top = 70
      Width = 89
      Height = 21
      Date = 39182.849815173610000000
      Time = 39182.849815173610000000
      TabOrder = 7
    end
    object cbExecutions: TCheckBox
      Left = 200
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Executions'
      TabOrder = 8
      OnClick = cbExecutionsClick
    end
    object cbDays: TCheckBox
      Left = 200
      Top = 48
      Width = 49
      Height = 17
      Caption = 'Days'
      TabOrder = 9
      OnClick = cbDaysClick
    end
    object cbRuntime: TCheckBox
      Left = 200
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Runtime'
      TabOrder = 10
      OnClick = cbRuntimeClick
    end
    object cbGlobalTime: TCheckBox
      Left = 200
      Top = 96
      Width = 81
      Height = 17
      Caption = 'Global Time'
      TabOrder = 11
      OnClick = cbGlobalTimeClick
    end
    object eExecutions: TEdit
      Left = 280
      Top = 22
      Width = 41
      Height = 21
      TabOrder = 12
      Text = '100'
    end
    object udExecutions: TUpDown
      Left = 321
      Top = 22
      Width = 17
      Height = 21
      Associate = eExecutions
      Min = 1
      Max = 32767
      Position = 100
      TabOrder = 13
    end
    object eDays: TEdit
      Left = 280
      Top = 46
      Width = 41
      Height = 21
      TabOrder = 14
      Text = '30'
    end
    object udDays: TUpDown
      Left = 321
      Top = 46
      Width = 16
      Height = 21
      Associate = eDays
      Min = 1
      Max = 32767
      Position = 30
      TabOrder = 15
    end
    object eRuntime: TEdit
      Left = 280
      Top = 70
      Width = 41
      Height = 21
      TabOrder = 16
      Text = '10'
    end
    object udRuntime: TUpDown
      Left = 321
      Top = 70
      Width = 16
      Height = 21
      Associate = eRuntime
      Min = 1
      Max = 32767
      Position = 10
      TabOrder = 17
    end
    object eGlobalTime: TEdit
      Left = 280
      Top = 94
      Width = 41
      Height = 21
      TabOrder = 18
      Text = '60'
    end
    object udGlobalTime: TUpDown
      Left = 321
      Top = 94
      Width = 16
      Height = 21
      Associate = eGlobalTime
      Min = 1
      Max = 32767
      Position = 60
      TabOrder = 19
    end
    object cbCountry: TCheckBox
      Left = 8
      Top = 96
      Width = 57
      Height = 17
      Caption = 'Country'
      TabOrder = 20
      OnClick = cbCountryClick
    end
    object comCountries: TComboBox
      Left = 72
      Top = 94
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 21
    end
  end
end
