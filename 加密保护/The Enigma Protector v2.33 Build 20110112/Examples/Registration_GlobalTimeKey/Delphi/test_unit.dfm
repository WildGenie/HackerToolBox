object Form1: TForm1
  Left = 192
  Top = 124
  Width = 648
  Height = 315
  Caption = 'Form1'
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
    Top = 16
    Width = 601
    Height = 65
    Caption = 
      'This application is showing how is working and how can be used r' +
      'egistration keys with Global Time lock. This test application is' +
      ' used registration keys installed in the file "key.dat" in the s' +
      'ame folder with the protected executable. Current registration k' +
      'ey is locked to 10 minutes, this means that license will work on' +
      'ly 10 minutes, combined time of all executions. To prolong regis' +
      'tration, customer has to set up new registration key. To check l' +
      'icense expiration we are using Enigma API: EP_LoadAndCheck and E' +
      'P_RegKeyGlobalTime'
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 88
    Width = 601
    Height = 169
    Caption = 'Application Information'
    TabOrder = 0
    object lbLicenseInfo: TLabel
      Left = 16
      Top = 24
      Width = 63
      Height = 13
      Caption = 'lbLicenseInfo'
    end
    object lbStart: TLabel
      Left = 128
      Top = 48
      Width = 30
      Height = 13
      Caption = 'lbStart'
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 102
      Height = 13
      Caption = 'Application started at:'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Current time:'
    end
    object lbTime: TLabel
      Left = 128
      Top = 64
      Width = 31
      Height = 13
      Caption = 'lbTime'
    end
    object lbKeyExpiration: TLabel
      Left = 320
      Top = 64
      Width = 72
      Height = 13
      Caption = 'lbKeyExpiration'
    end
    object Label6: TLabel
      Left = 288
      Top = 48
      Width = 139
      Height = 13
      Caption = 'Estimated key expiration time:'
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 88
      Width = 585
      Height = 73
      Caption = 'Install new registration key'
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 24
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object Label5: TLabel
        Left = 16
        Top = 48
        Width = 18
        Height = 13
        Caption = 'Key'
      end
      object eName: TEdit
        Left = 64
        Top = 20
        Width = 417
        Height = 21
        TabOrder = 0
      end
      object eKey: TEdit
        Left = 64
        Top = 44
        Width = 417
        Height = 21
        TabOrder = 1
      end
      object Button1: TButton
        Left = 496
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Register'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 576
    Top = 16
  end
end
