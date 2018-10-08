object frmMain: TfrmMain
  Left = 255
  Top = 138
  Width = 316
  Height = 307
  Caption = 'Test Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbLabel1: TLabel
    Left = 16
    Top = 16
    Width = 59
    Height = 13
    Caption = 'Global Time:'
  end
  object lbExecutionTime: TLabel
    Left = 16
    Top = 72
    Width = 103
    Height = 13
    Caption = 'Time since execution:'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 128
    Width = 289
    Height = 2
  end
  object Label1: TLabel
    Left = 8
    Top = 138
    Width = 137
    Height = 13
    Alignment = taCenter
    Caption = 'Trial parameters'
  end
  object Label2: TLabel
    Left = 8
    Top = 170
    Width = 139
    Height = 13
    Caption = 'Total execition time (minutes):'
  end
  object Label3: TLabel
    Left = 8
    Top = 202
    Width = 137
    Height = 13
    Caption = 'Left execution time (minutes):'
  end
  object eGlobalTime: TEdit
    Left = 8
    Top = 32
    Width = 289
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object eExecutionTime: TEdit
    Left = 8
    Top = 88
    Width = 289
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object eTotalExecutionTime: TEdit
    Left = 152
    Top = 168
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object eLeftExecutionTime: TEdit
    Left = 152
    Top = 200
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object btnExit: TButton
    Left = 112
    Top = 240
    Width = 89
    Height = 25
    Cancel = True
    Caption = '&Exit'
    Default = True
    TabOrder = 4
    OnClick = btnExitClick
  end
  object eStatus: TEdit
    Left = 152
    Top = 136
    Width = 145
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object tmTimer: TTimer
    Interval = 500
    OnTimer = tmTimerTimer
    Left = 272
  end
end
