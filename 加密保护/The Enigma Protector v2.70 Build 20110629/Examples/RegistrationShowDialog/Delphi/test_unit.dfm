object Form1: TForm1
  Left = 192
  Top = 124
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 235
  ClientWidth = 439
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
    Left = 16
    Top = 16
    Width = 409
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = 'Test Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 176
    Top = 56
    Width = 249
    Height = 16
    Alignment = taCenter
    Caption = 'version 1.0.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 96
    Top = 88
    Width = 39
    Height = 13
    Caption = 'Our site:'
  end
  object Label4: TLabel
    Left = 144
    Top = 88
    Width = 135
    Height = 13
    Caption = 'http://enigmaprotector.com/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 88
    Top = 112
    Width = 47
    Height = 13
    Caption = 'Our email:'
  end
  object Label6: TLabel
    Left = 144
    Top = 112
    Width = 145
    Height = 13
    Caption = 'support@enigmaprotector.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 72
    Top = 144
    Width = 62
    Height = 13
    Caption = 'Licensed To:'
  end
  object lbRegInfo: TLabel
    Left = 16
    Top = 160
    Width = 401
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'UNREGISTERED'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object btnRegister: TButton
    Left = 192
    Top = 200
    Width = 107
    Height = 25
    Caption = 'Register'
    Default = True
    TabOrder = 0
    OnClick = btnRegisterClick
  end
  object btnClose: TButton
    Left = 320
    Top = 200
    Width = 107
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnUnregister: TButton
    Left = 16
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Unregister'
    TabOrder = 2
    OnClick = btnUnregisterClick
  end
end
