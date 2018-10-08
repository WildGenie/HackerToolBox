object frmRegistration: TfrmRegistration
  Left = 192
  Top = 107
  Width = 402
  Height = 285
  Caption = 'Registration'
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
    Left = 8
    Top = 13
    Width = 60
    Height = 13
    Caption = 'Hadrware ID'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 76
    Height = 13
    Caption = 'User information'
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 21
    Height = 13
    Caption = ' Key'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 152
    Width = 361
    Height = 2
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 66
    Height = 13
    Caption = 'Registered to:'
  end
  object Label5: TLabel
    Left = 8
    Top = 192
    Width = 80
    Height = 13
    Caption = 'Registration Key:'
  end
  object lbUserInfo: TLabel
    Left = 88
    Top = 168
    Width = 83
    Height = 13
    Caption = 'Unregistered user'
  end
  object eHardware: TEdit
    Left = 136
    Top = 8
    Width = 233
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object eUserInfo: TEdit
    Left = 8
    Top = 48
    Width = 361
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object eKey: TEdit
    Left = 8
    Top = 88
    Width = 361
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object btnRegister: TButton
    Left = 208
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 3
    OnClick = btnRegisterClick
  end
  object btnExit: TButton
    Left = 296
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = btnExitClick
  end
  object btnDeleteKey: TButton
    Left = 8
    Top = 120
    Width = 161
    Height = 25
    Caption = 'Delete local key'
    TabOrder = 5
    OnClick = btnDeleteKeyClick
  end
  object mKey: TMemo
    Left = 8
    Top = 208
    Width = 369
    Height = 33
    Color = clBtnFace
    Enabled = False
    TabOrder = 6
  end
end
