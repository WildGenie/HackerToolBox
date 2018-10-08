object Form1: TForm1
  Left = 445
  Top = 280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Custom Register Window'
  ClientHeight = 308
  ClientWidth = 412
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
  object lbl1: TLabel
    Left = 8
    Top = 248
    Width = 84
    Height = 13
    Caption = 'Current version is:'
  end
  object lbl2: TLabel
    Left = 96
    Top = 248
    Width = 217
    Height = 13
    Caption = 'Trial Version'
  end
  object Button1: TButton
    Left = 328
    Top = 272
    Width = 73
    Height = 25
    Caption = 'Register'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 393
    Height = 217
    Caption = 'NOTE'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 168
      Width = 329
      Height = 13
      Caption = 
        'The program must be protected by Zprotect with the following opt' +
        'ions:'
    end
    object Label2: TLabel
      Left = 8
      Top = 192
      Width = 185
      Height = 13
      Caption = '1. Trial Settings -> HDID + Name + Key'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 357
      Height = 13
      Caption = 
        'This DEMO shows you how to use custom registration functions in ' +
        'your own'
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 83
      Height = 13
      Caption = 'project, including:'
    end
    object Label5: TLabel
      Left = 32
      Top = 56
      Width = 124
      Height = 13
      Caption = 'ZP_GetRegistrationState()'
    end
    object Label6: TLabel
      Left = 32
      Top = 72
      Width = 112
      Height = 13
      Caption = 'ZP_ShowRegWindow()'
    end
    object Label7: TLabel
      Left = 32
      Top = 88
      Width = 89
      Height = 13
      Caption = 'ZP_RegByKeyStr()'
    end
    object Label8: TLabel
      Left = 32
      Top = 104
      Width = 113
      Height = 13
      Caption = 'ZP_GetHardwareIDStr()'
    end
    object Label9: TLabel
      Left = 32
      Top = 120
      Width = 93
      Height = 13
      Caption = 'ZP_GetUserName()'
    end
    object Label10: TLabel
      Left = 32
      Top = 136
      Width = 89
      Height = 13
      Caption = 'ZP_GetKeyBuffer()'
    end
  end
end
