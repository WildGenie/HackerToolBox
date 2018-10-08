object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Test Enigma trial API'
  ClientHeight = 159
  ClientWidth = 337
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 319
    Height = 13
    Caption = 
      'This is example of using Enigma API functions for TRIAL applicat' +
      'ion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 96
    Top = 32
    Width = 146
    Height = 16
    Caption = 'TRIAL APPLICATION'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClose: TButton
    Left = 128
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 48
    Width = 321
    Height = 73
    BevelInner = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Trial days:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 82
      Height = 13
      Caption = 'Trial days left:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 152
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Trial executions:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 152
      Top = 32
      Width = 117
      Height = 13
      Caption = 'Trial executions left:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 88
      Top = 56
      Width = 69
      Height = 13
      Caption = 'Test it until:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object trDaysAll: TLabel
      Left = 96
      Top = 8
      Width = 35
      Height = 13
      Caption = 'XXXXX'
    end
    object trDaysLeft: TLabel
      Left = 96
      Top = 32
      Width = 35
      Height = 13
      Caption = 'XXXXX'
    end
    object trExecAll: TLabel
      Left = 272
      Top = 8
      Width = 35
      Height = 13
      Caption = 'XXXXX'
    end
    object trExecLeft: TLabel
      Left = 272
      Top = 32
      Width = 35
      Height = 13
      Caption = 'XXXXX'
    end
    object trDate: TLabel
      Left = 168
      Top = 56
      Width = 35
      Height = 13
      Caption = 'XXXXX'
    end
  end
end
