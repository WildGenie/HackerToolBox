object frmMain: TfrmMain
  Left = 293
  Height = 425
  Top = 93
  Width = 616
  Caption = 'Keys generator'
  ClientHeight = 425
  ClientWidth = 616
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  OnShow = FormShow
  LCLVersion = '0.9.29'
  object lbUserInfo: TLabel
    Left = 8
    Height = 14
    Top = 8
    Width = 77
    Caption = 'User information'
    ParentColor = False
  end
  object bClose: TButton
    Left = 528
    Height = 89
    Top = 320
    Width = 65
    Cancel = True
    Caption = 'Close'
    OnClick = bCloseClick
    TabOrder = 0
  end
  object eUserInfo: TEdit
    Left = 8
    Height = 21
    Top = 24
    Width = 586
    TabOrder = 1
  end
  object gbSections: TGroupBox
    Left = 409
    Height = 233
    Top = 48
    Width = 185
    Caption = 'Crypt Sections'
    ClientHeight = 215
    ClientWidth = 181
    TabOrder = 2
    object cbSection1: TCheckBox
      Left = 14
      Height = 19
      Top = 8
      Width = 65
      Caption = 'Section 1'
      TabOrder = 0
    end
    object cbSection2: TCheckBox
      Left = 14
      Height = 19
      Top = 32
      Width = 65
      Caption = 'Section 2'
      TabOrder = 1
    end
    object cbSection3: TCheckBox
      Left = 14
      Height = 19
      Top = 56
      Width = 65
      Caption = 'Section 3'
      TabOrder = 2
    end
    object cbSection4: TCheckBox
      Left = 14
      Height = 19
      Top = 80
      Width = 65
      Caption = 'Section 4'
      TabOrder = 3
    end
    object cbSection5: TCheckBox
      Left = 14
      Height = 19
      Top = 104
      Width = 65
      Caption = 'Section 5'
      TabOrder = 4
    end
    object cbSection6: TCheckBox
      Left = 14
      Height = 19
      Top = 128
      Width = 65
      Caption = 'Section 6'
      TabOrder = 5
    end
    object cbSection7: TCheckBox
      Left = 14
      Height = 19
      Top = 152
      Width = 65
      Caption = 'Section 7'
      TabOrder = 6
    end
    object cbSection8: TCheckBox
      Left = 14
      Height = 19
      Top = 176
      Width = 65
      Caption = 'Section 8'
      TabOrder = 7
    end
    object cbSection9: TCheckBox
      Left = 94
      Height = 19
      Top = 8
      Width = 65
      Caption = 'Section 9'
      TabOrder = 8
    end
    object cbSection10: TCheckBox
      Left = 94
      Height = 19
      Top = 32
      Width = 71
      Caption = 'Section 10'
      TabOrder = 9
    end
    object cbSection11: TCheckBox
      Left = 94
      Height = 19
      Top = 56
      Width = 71
      Caption = 'Section 11'
      TabOrder = 10
    end
    object cbSection12: TCheckBox
      Left = 94
      Height = 19
      Top = 80
      Width = 71
      Caption = 'Section 12'
      TabOrder = 11
    end
    object cbSection13: TCheckBox
      Left = 94
      Height = 19
      Top = 104
      Width = 71
      Caption = 'Section 13'
      TabOrder = 12
    end
    object cbSection14: TCheckBox
      Left = 94
      Height = 19
      Top = 128
      Width = 71
      Caption = 'Section 14'
      TabOrder = 13
    end
    object cbSection15: TCheckBox
      Left = 94
      Height = 19
      Top = 152
      Width = 71
      Caption = 'Section 15'
      TabOrder = 14
    end
    object cbSection16: TCheckBox
      Left = 94
      Height = 19
      Top = 176
      Width = 71
      Caption = 'Section 16'
      TabOrder = 15
    end
  end
  object bGen: TButton
    Left = 8
    Height = 25
    Top = 288
    Width = 137
    Caption = 'Generate'
    OnClick = bGenClick
    TabOrder = 3
  end
  object bGenFP: TButton
    Left = 168
    Height = 25
    Top = 288
    Width = 129
    Caption = 'Generate from project'
    OnClick = bGenFPClick
    TabOrder = 4
  end
  object mKey: TMemo
    Left = 8
    Height = 89
    Top = 320
    Width = 513
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 8
    Height = 81
    Top = 48
    Width = 393
    Caption = 'Key type'
    ClientHeight = 63
    ClientWidth = 389
    TabOrder = 6
    object Label1: TLabel
      Left = 6
      Height = 14
      Top = 0
      Width = 52
      Caption = 'Key Mode:'
      ParentColor = False
    end
    object Label2: TLabel
      Left = 198
      Height = 14
      Top = 0
      Width = 49
      Caption = 'Key Base:'
      ParentColor = False
    end
    object cbKeyMode: TComboBox
      Left = 6
      Height = 21
      Top = 16
      Width = 161
      ItemHeight = 13
      ItemIndex = 0
      Items.Strings = (
        '~ RSA 512'
        '~ RSA 768'
        '~ RSA 1024'
        '~ RSA 2048'
        '~ RSA 3072'
        '~ RSA 4096'
      )
      Style = csDropDownList
      TabOrder = 0
      Text = '~ RSA 512'
    end
    object cbKeyBase: TComboBox
      Left = 198
      Height = 21
      Top = 16
      Width = 161
      ItemHeight = 13
      ItemIndex = 3
      Items.Strings = (
        'Base 2'
        'Base 8'
        'Base 16'
        'Base 32'
        'Base 64'
      )
      Style = csDropDownList
      TabOrder = 1
      Text = 'Base 32'
    end
    object cbHyphens: TCheckBox
      Left = 6
      Height = 19
      Top = 40
      Width = 132
      Caption = 'Add hyphens to the key'
      TabOrder = 2
    end
  end
  object btnVerify: TButton
    Left = 320
    Height = 25
    Top = 288
    Width = 121
    Caption = 'Verify'
    OnClick = btnVerifyClick
    TabOrder = 7
  end
  object btnVerifyP: TButton
    Left = 464
    Height = 25
    Top = 288
    Width = 129
    Caption = 'Verify from project'
    OnClick = btnVerifyPClick
    TabOrder = 8
  end
  object GroupBox2: TGroupBox
    Left = 8
    Height = 145
    Top = 136
    Width = 393
    Caption = 'Key Restrictions'
    ClientHeight = 127
    ClientWidth = 389
    TabOrder = 9
    object cbExpirationDate: TCheckBox
      Left = 10
      Height = 19
      Top = 8
      Width = 92
      Caption = 'Expiration Date'
      OnClick = cbExpirationDateClick
      TabOrder = 0
    end
    object cbHardwareID: TCheckBox
      Left = 10
      Height = 19
      Top = 104
      Width = 80
      Caption = 'Hardware ID'
      OnClick = cbHardwareIDClick
      TabOrder = 1
    end
    object eHardware: TEdit
      Left = 102
      Height = 21
      Top = 102
      Width = 280
      TabOrder = 2
    end
    object cbRegisterAfter: TCheckBox
      Left = 10
      Height = 19
      Top = 32
      Width = 84
      Caption = 'Register After'
      OnClick = cbRegisterAfterClick
      TabOrder = 3
    end
    object cbRegisterBefore: TCheckBox
      Left = 10
      Height = 19
      Top = 56
      Width = 93
      Caption = 'Register Before'
      OnClick = cbRegisterBeforeClick
      TabOrder = 4
    end
    object cbExecutions: TCheckBox
      Left = 246
      Height = 19
      Top = 8
      Width = 72
      Caption = 'Executions'
      OnClick = cbExecutionsClick
      TabOrder = 5
    end
    object cbDays: TCheckBox
      Left = 246
      Height = 19
      Top = 32
      Width = 44
      Caption = 'Days'
      OnClick = cbDaysClick
      TabOrder = 6
    end
    object cbRuntime: TCheckBox
      Left = 246
      Height = 19
      Top = 56
      Width = 59
      Caption = 'Runtime'
      OnClick = cbRuntimeClick
      TabOrder = 7
    end
    object cbGlobalTime: TCheckBox
      Left = 246
      Height = 19
      Top = 80
      Width = 76
      Caption = 'Global Time'
      OnClick = cbGlobalTimeClick
      TabOrder = 8
    end
    object eExecutions: TEdit
      Left = 326
      Height = 21
      Top = 6
      Width = 41
      TabOrder = 9
      Text = '100'
    end
    object udExecutions: TUpDown
      Left = 367
      Height = 21
      Top = 6
      Width = 17
      Associate = eExecutions
      Min = 1
      Max = 32767
      Position = 100
      TabOrder = 10
      Wrap = False
    end
    object eDays: TEdit
      Left = 326
      Height = 21
      Top = 30
      Width = 41
      TabOrder = 11
      Text = '30'
    end
    object udDays: TUpDown
      Left = 367
      Height = 21
      Top = 30
      Width = 16
      Associate = eDays
      Min = 1
      Max = 32767
      Position = 30
      TabOrder = 12
      Wrap = False
    end
    object eRuntime: TEdit
      Left = 326
      Height = 21
      Top = 54
      Width = 41
      TabOrder = 14
      Text = '10'
    end
    object udRuntime: TUpDown
      Left = 367
      Height = 21
      Top = 54
      Width = 16
      Associate = eRuntime
      Min = 1
      Max = 32767
      Position = 10
      TabOrder = 16
      Wrap = False
    end
    object eGlobalTime: TEdit
      Left = 326
      Height = 21
      Top = 78
      Width = 41
      TabOrder = 18
      Text = '60'
    end
    object udGlobalTime: TUpDown
      Left = 367
      Height = 21
      Top = 78
      Width = 16
      Associate = eGlobalTime
      Min = 1
      Max = 32767
      Position = 60
      TabOrder = 13
      Wrap = False
    end
    object cbCountry: TCheckBox
      Left = 10
      Height = 19
      Top = 80
      Width = 56
      Caption = 'Country'
      OnClick = cbCountryClick
      TabOrder = 15
    end
    object comCountries: TComboBox
      Left = 102
      Height = 21
      Top = 78
      Width = 128
      ItemHeight = 13
      Style = csDropDownList
      TabOrder = 17
    end
    object dtpRegisterBefore: TDateEdit
      Left = 102
      Height = 21
      Top = 56
      Width = 112
      CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
      OKCaption = 'OK'
      CancelCaption = 'Cancel'
      DateOrder = doNone
      ButtonWidth = 23
      CharCase = ecNormal
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000064000000640000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D69E
        72C4D3996EF4D19668FFCE9263FFCB8E5EFFC98A5BFFC78756FFC38452FFC384
        52FFC38452FFC38452FFC38452FFC38452FFBB7742B0FFFFFF00FFFFFF00D7A1
        75FFF8F2EDFFF7F0EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FFEAD6
        C8FFF2E5DCFFFAF4F1FFF9F3F0FFFAF5F2FFC58A5DFDFFFFFF00FFFFFF00D9A4
        7AFFF9F3EEFFEBD2BEFFFFFFFFFFEBD3BFFFFFFFFFFFEBD3C0FFFFFFFFFFEAC7
        ADFFECD9CDFFF1E4DBFFF9F3F0FFF9F2EFFFC68C5FFFFFFFFF00FFFFFF00DDA8
        7EFFF9F3EFFFEBD0BAFFEBD0BBFF75B57AFF75B57AFF75B57AFFEBD1BDFFEACD
        B5FFFAF4F0FFEBD9CCFFF1E4DBFFFAF4F1FFC68A5CFFFFFFFF00FFFFFF00DFAA
        82FFF9F3EFFFEACEB7FFFFFFFFFF75B57AFF94D49BFF74B579FFFFFFFFFFEACF
        BAFFFBF6F2FFFAF3F0FFEBD8CBFFF2E6DDFFC88D5FFFFFFFFF00FFFFFF00E1AE
        87FFFAF4F0FFEACBB2FFEACCB3FF75B57AFF74B579FF73B478FFEACEB7FF70B3
        75FF6FB274FF6EB172FFE8C8AEFFEAD7C9FFC48654FFFFFFFF00FFFFFF00E3B1
        8CFFFAF6F1FFEAC9AEFFFFFFFFFFEAC9B0FFFFFFFFFFE9CBB3FFFFFFFFFF6FB1
        73FF8ED295FF6BAF6FFFFFFFFFFFF1E5DBFFC68655FFFFFFFF00FFFFFF00E5B4
        8FFFFAF6F2FFE9C6AAFFE9C6ACFFEAC7ACFFE9C7ADFFE9C9AEFFE9C9B0FF6CB0
        71FF6AAF6EFF68AD6DFFE8CCB5FFF2E7DEFFC88A59FFFFFFFF00FFFFFF00E7B7
        94FFFBF7F4FFE9C3A6FFFFFFFFFFE8C4A9FFFFFFFFFFE9C6AAFFFFFFFFFFE8C7
        ACFFFFFFFFFFE8C8B0FFFFFFFFFFF7F1EBFFCB8F5FFFFFFFFF00FFFFFF00E9BA
        98FFFBF7F4FF65A4FFFF64A3FFFF62A2FFFF61A1FFFF5F9FFFFF5C9DFFFF5A9A
        FFFF5798FFFF5495FFFF5294FFFFFBF7F4FFCE9364FFFFFFFF00FFFFFF00EBBD
        9BFFFBF7F4FF64A4FFFF79BDFFFF75BBFFFF71B9FFFF6DB8FFFF68B3FFFF61B0
        FFFF5AABFFFF54A7FFFF3B7DFFFFFBF7F4FFD1976AFFFFFFFF00FFFFFF00ECBF
        9EFFFBF7F4FF65A4FFFF64A3FFFF60A0FFFF5D9EFFFF5899FFFF5496FFFF4D90
        FFFF478BFFFF4284FFFF3D7FFFFFFBF7F4FFD49B6FFFFFFFFF00FFFFFF00EEC1
        A1EBFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
        F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFD7A074F8FFFFFF00FFFFFF00EFC2
        A37EEFC1A2E3EDC09FFFEBBE9DFFEBBC9AFFE9BA96FFE7B793FFE6B590FFE4B2
        8CFFE2AF88FFE0AC84FFDDA980FFDCA57DFFDAA37ACAFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
      }
      NumGlyphs = 0
      MaxLength = 0
      TabOrder = 19
    end
    object dtpRegisterAfter: TDateEdit
      Left = 102
      Height = 21
      Top = 32
      Width = 112
      CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
      OKCaption = 'OK'
      CancelCaption = 'Cancel'
      DateOrder = doNone
      ButtonWidth = 23
      CharCase = ecNormal
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000064000000640000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D69E
        72C4D3996EF4D19668FFCE9263FFCB8E5EFFC98A5BFFC78756FFC38452FFC384
        52FFC38452FFC38452FFC38452FFC38452FFBB7742B0FFFFFF00FFFFFF00D7A1
        75FFF8F2EDFFF7F0EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FFEAD6
        C8FFF2E5DCFFFAF4F1FFF9F3F0FFFAF5F2FFC58A5DFDFFFFFF00FFFFFF00D9A4
        7AFFF9F3EEFFEBD2BEFFFFFFFFFFEBD3BFFFFFFFFFFFEBD3C0FFFFFFFFFFEAC7
        ADFFECD9CDFFF1E4DBFFF9F3F0FFF9F2EFFFC68C5FFFFFFFFF00FFFFFF00DDA8
        7EFFF9F3EFFFEBD0BAFFEBD0BBFF75B57AFF75B57AFF75B57AFFEBD1BDFFEACD
        B5FFFAF4F0FFEBD9CCFFF1E4DBFFFAF4F1FFC68A5CFFFFFFFF00FFFFFF00DFAA
        82FFF9F3EFFFEACEB7FFFFFFFFFF75B57AFF94D49BFF74B579FFFFFFFFFFEACF
        BAFFFBF6F2FFFAF3F0FFEBD8CBFFF2E6DDFFC88D5FFFFFFFFF00FFFFFF00E1AE
        87FFFAF4F0FFEACBB2FFEACCB3FF75B57AFF74B579FF73B478FFEACEB7FF70B3
        75FF6FB274FF6EB172FFE8C8AEFFEAD7C9FFC48654FFFFFFFF00FFFFFF00E3B1
        8CFFFAF6F1FFEAC9AEFFFFFFFFFFEAC9B0FFFFFFFFFFE9CBB3FFFFFFFFFF6FB1
        73FF8ED295FF6BAF6FFFFFFFFFFFF1E5DBFFC68655FFFFFFFF00FFFFFF00E5B4
        8FFFFAF6F2FFE9C6AAFFE9C6ACFFEAC7ACFFE9C7ADFFE9C9AEFFE9C9B0FF6CB0
        71FF6AAF6EFF68AD6DFFE8CCB5FFF2E7DEFFC88A59FFFFFFFF00FFFFFF00E7B7
        94FFFBF7F4FFE9C3A6FFFFFFFFFFE8C4A9FFFFFFFFFFE9C6AAFFFFFFFFFFE8C7
        ACFFFFFFFFFFE8C8B0FFFFFFFFFFF7F1EBFFCB8F5FFFFFFFFF00FFFFFF00E9BA
        98FFFBF7F4FF65A4FFFF64A3FFFF62A2FFFF61A1FFFF5F9FFFFF5C9DFFFF5A9A
        FFFF5798FFFF5495FFFF5294FFFFFBF7F4FFCE9364FFFFFFFF00FFFFFF00EBBD
        9BFFFBF7F4FF64A4FFFF79BDFFFF75BBFFFF71B9FFFF6DB8FFFF68B3FFFF61B0
        FFFF5AABFFFF54A7FFFF3B7DFFFFFBF7F4FFD1976AFFFFFFFF00FFFFFF00ECBF
        9EFFFBF7F4FF65A4FFFF64A3FFFF60A0FFFF5D9EFFFF5899FFFF5496FFFF4D90
        FFFF478BFFFF4284FFFF3D7FFFFFFBF7F4FFD49B6FFFFFFFFF00FFFFFF00EEC1
        A1EBFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
        F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFD7A074F8FFFFFF00FFFFFF00EFC2
        A37EEFC1A2E3EDC09FFFEBBE9DFFEBBC9AFFE9BA96FFE7B793FFE6B590FFE4B2
        8CFFE2AF88FFE0AC84FFDDA980FFDCA57DFFDAA37ACAFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
      }
      NumGlyphs = 0
      MaxLength = 0
      TabOrder = 20
    end
    object dtpExpirationDate: TDateEdit
      Left = 102
      Height = 21
      Top = 8
      Width = 112
      CalendarDisplaySettings = [dsShowHeadings, dsShowDayNames]
      OKCaption = 'OK'
      CancelCaption = 'Cancel'
      DateOrder = doNone
      ButtonWidth = 23
      CharCase = ecNormal
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000064000000640000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D69E
        72C4D3996EF4D19668FFCE9263FFCB8E5EFFC98A5BFFC78756FFC38452FFC384
        52FFC38452FFC38452FFC38452FFC38452FFBB7742B0FFFFFF00FFFFFF00D7A1
        75FFF8F2EDFFF7F0EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FFEAD6
        C8FFF2E5DCFFFAF4F1FFF9F3F0FFFAF5F2FFC58A5DFDFFFFFF00FFFFFF00D9A4
        7AFFF9F3EEFFEBD2BEFFFFFFFFFFEBD3BFFFFFFFFFFFEBD3C0FFFFFFFFFFEAC7
        ADFFECD9CDFFF1E4DBFFF9F3F0FFF9F2EFFFC68C5FFFFFFFFF00FFFFFF00DDA8
        7EFFF9F3EFFFEBD0BAFFEBD0BBFF75B57AFF75B57AFF75B57AFFEBD1BDFFEACD
        B5FFFAF4F0FFEBD9CCFFF1E4DBFFFAF4F1FFC68A5CFFFFFFFF00FFFFFF00DFAA
        82FFF9F3EFFFEACEB7FFFFFFFFFF75B57AFF94D49BFF74B579FFFFFFFFFFEACF
        BAFFFBF6F2FFFAF3F0FFEBD8CBFFF2E6DDFFC88D5FFFFFFFFF00FFFFFF00E1AE
        87FFFAF4F0FFEACBB2FFEACCB3FF75B57AFF74B579FF73B478FFEACEB7FF70B3
        75FF6FB274FF6EB172FFE8C8AEFFEAD7C9FFC48654FFFFFFFF00FFFFFF00E3B1
        8CFFFAF6F1FFEAC9AEFFFFFFFFFFEAC9B0FFFFFFFFFFE9CBB3FFFFFFFFFF6FB1
        73FF8ED295FF6BAF6FFFFFFFFFFFF1E5DBFFC68655FFFFFFFF00FFFFFF00E5B4
        8FFFFAF6F2FFE9C6AAFFE9C6ACFFEAC7ACFFE9C7ADFFE9C9AEFFE9C9B0FF6CB0
        71FF6AAF6EFF68AD6DFFE8CCB5FFF2E7DEFFC88A59FFFFFFFF00FFFFFF00E7B7
        94FFFBF7F4FFE9C3A6FFFFFFFFFFE8C4A9FFFFFFFFFFE9C6AAFFFFFFFFFFE8C7
        ACFFFFFFFFFFE8C8B0FFFFFFFFFFF7F1EBFFCB8F5FFFFFFFFF00FFFFFF00E9BA
        98FFFBF7F4FF65A4FFFF64A3FFFF62A2FFFF61A1FFFF5F9FFFFF5C9DFFFF5A9A
        FFFF5798FFFF5495FFFF5294FFFFFBF7F4FFCE9364FFFFFFFF00FFFFFF00EBBD
        9BFFFBF7F4FF64A4FFFF79BDFFFF75BBFFFF71B9FFFF6DB8FFFF68B3FFFF61B0
        FFFF5AABFFFF54A7FFFF3B7DFFFFFBF7F4FFD1976AFFFFFFFF00FFFFFF00ECBF
        9EFFFBF7F4FF65A4FFFF64A3FFFF60A0FFFF5D9EFFFF5899FFFF5496FFFF4D90
        FFFF478BFFFF4284FFFF3D7FFFFFFBF7F4FFD49B6FFFFFFFFF00FFFFFF00EEC1
        A1EBFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
        F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFD7A074F8FFFFFF00FFFFFF00EFC2
        A37EEFC1A2E3EDC09FFFEBBE9DFFEBBC9AFFE9BA96FFE7B793FFE6B590FFE4B2
        8CFFE2AF88FFE0AC84FFDDA980FFDCA57DFFDAA37ACAFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
      }
      NumGlyphs = 0
      MaxLength = 0
      TabOrder = 21
    end
  end
end
