object Form3: TForm3
  Left = 152
  Top = 110
  Width = 550
  Height = 356
  Caption = 'EXECryptor KeyGen Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 90
    Height = 13
    Caption = 'Registration Name:'
  end
  object Label2: TLabel
    Left = 16
    Top = 292
    Width = 69
    Height = 13
    Caption = 'Serial Number:'
  end
  object Label3: TLabel
    Left = 16
    Top = 52
    Width = 60
    Height = 13
    Caption = 'HardwareID:'
  end
  object Label4: TLabel
    Left = 16
    Top = 204
    Width = 60
    Height = 13
    Caption = 'License type'
  end
  object Label5: TLabel
    Left = 16
    Top = 84
    Width = 49
    Height = 13
    Caption = 'Serial type'
  end
  object Label6: TLabel
    Left = 16
    Top = 232
    Width = 54
    Height = 13
    Caption = 'User param'
  end
  object Label7: TLabel
    Left = 16
    Top = 260
    Width = 52
    Height = 13
    Caption = 'Expiry after'
  end
  object RegNameEdit: TEdit
    Left = 116
    Top = 20
    Width = 213
    Height = 21
    TabOrder = 0
  end
  object SNEdit: TEdit
    Left = 116
    Top = 288
    Width = 213
    Height = 21
    ParentColor = True
    ReadOnly = True
    TabOrder = 15
  end
  object Button1: TButton
    Left = 350
    Top = 12
    Width = 177
    Height = 25
    Caption = 'Create through DLL interface'
    TabOrder = 16
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 350
    Top = 52
    Width = 177
    Height = 25
    Caption = 'Create through COM interface'
    TabOrder = 17
    OnClick = Button2Click
  end
  object HWIDEdit: TEdit
    Left = 116
    Top = 48
    Width = 213
    Height = 21
    TabOrder = 1
  end
  object LicTypeEdit: TEdit
    Left = 116
    Top = 200
    Width = 37
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object LicTypeUpDown: TUpDown
    Left = 153
    Top = 200
    Width = 17
    Height = 21
    Associate = LicTypeEdit
    Min = 0
    Max = 15
    Position = 0
    TabOrder = 18
    Thousands = False
    Wrap = False
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 148
    Width = 97
    Height = 17
    Caption = 'Feature 1'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 172
    Width = 97
    Height = 17
    Caption = 'Feature 2'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object CheckBox3: TCheckBox
    Left = 128
    Top = 148
    Width = 97
    Height = 17
    Caption = 'Feature 3'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object CheckBox4: TCheckBox
    Left = 128
    Top = 172
    Width = 97
    Height = 17
    Caption = 'Feature 4'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object CheckBox5: TCheckBox
    Left = 240
    Top = 148
    Width = 97
    Height = 17
    Caption = 'Feature 5'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object CheckBox6: TCheckBox
    Left = 240
    Top = 172
    Width = 97
    Height = 17
    Caption = 'Feature 6'
    Checked = True
    State = cbChecked
    TabOrder = 10
  end
  object RadioButton1: TRadioButton
    Left = 116
    Top = 80
    Width = 113
    Height = 17
    Caption = 'Short'
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 116
    Top = 100
    Width = 113
    Height = 17
    Caption = 'Time limited'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object RadioButton3: TRadioButton
    Left = 116
    Top = 120
    Width = 113
    Height = 17
    Caption = 'Long'
    TabOrder = 4
    OnClick = RadioButton1Click
  end
  object UserParamEdit: TEdit
    Left = 116
    Top = 228
    Width = 37
    Height = 21
    TabOrder = 12
    Text = '0'
  end
  object UserParamUpDown: TUpDown
    Left = 153
    Top = 228
    Width = 17
    Height = 21
    Associate = UserParamEdit
    Min = 0
    Max = 1023
    Position = 0
    TabOrder = 19
    Thousands = False
    Wrap = False
  end
  object YearEdit: TEdit
    Left = 228
    Top = 256
    Width = 37
    Height = 21
    TabOrder = 14
    Text = '2004'
  end
  object YearUpDown: TUpDown
    Left = 265
    Top = 256
    Width = 17
    Height = 21
    Associate = YearEdit
    Min = 2004
    Max = 2024
    Position = 2004
    TabOrder = 20
    Thousands = False
    Wrap = False
  end
  object MonthCombo: TComboBox
    Left = 116
    Top = 256
    Width = 101
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
  end
end
