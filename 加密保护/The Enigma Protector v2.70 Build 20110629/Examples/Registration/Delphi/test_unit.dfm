object frmRegistration: TfrmRegistration
  Left = 192
  Top = 107
  Caption = 'frmRegistration'
  ClientHeight = 241
  ClientWidth = 410
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
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Hardware ID'
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 76
    Height = 13
    Caption = 'User information'
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 18
    Height = 13
    Caption = 'Key'
  end
  object Label2: TLabel
    Left = 8
    Top = 160
    Width = 66
    Height = 13
    Caption = 'Registered to:'
  end
  object Label5: TLabel
    Left = 8
    Top = 184
    Width = 79
    Height = 13
    Caption = 'Registration key:'
  end
  object lbUserInfo: TLabel
    Left = 96
    Top = 160
    Width = 119
    Height = 13
    Caption = 'UNREGISTERED USER'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 152
    Width = 393
    Height = 2
  end
  object btnRegister: TButton
    Left = 232
    Top = 128
    Width = 75
    Height = 21
    Caption = 'Register'
    TabOrder = 0
    OnClick = btnRegisterClick
  end
  object btnExit: TButton
    Left = 328
    Top = 128
    Width = 75
    Height = 21
    Caption = 'Exit'
    TabOrder = 1
    OnClick = btnExitClick
  end
  object eHardware: TEdit
    Left = 88
    Top = 16
    Width = 313
    Height = 21
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object eUserInfo: TEdit
    Left = 8
    Top = 56
    Width = 393
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object eKey: TEdit
    Left = 8
    Top = 96
    Width = 393
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object btnDeleteKey: TButton
    Left = 8
    Top = 128
    Width = 171
    Height = 21
    Caption = 'Delete local key'
    TabOrder = 5
    OnClick = btnDeleteKeyClick
  end
  object mKey: TMemo
    Left = 8
    Top = 200
    Width = 393
    Height = 33
    Color = clBtnFace
    Enabled = False
    TabOrder = 6
  end
end
