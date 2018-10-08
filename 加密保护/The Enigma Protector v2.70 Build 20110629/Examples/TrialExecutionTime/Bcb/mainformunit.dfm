object frmMain: TfrmMain
  Left = 408
  Top = 127
  Width = 319
  Height = 322
  Caption = 'Test Application'
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
  object lbGlobalTime: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'GlobalTime:'
  end
  object lbExecutionTime: TLabel
    Left = 8
    Top = 72
    Width = 100
    Height = 13
    Caption = 'Time since execution'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 144
    Width = 297
    Height = 2
  end
  object Label1: TLabel
    Left = 8
    Top = 184
    Width = 20
    Height = 37
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 280
    Top = 184
    Width = 20
    Height = 37
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 184
    Width = 20
    Height = 37
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pbTrial: TProgressBar
    Left = 8
    Top = 224
    Width = 297
    Height = 25
    Min = 0
    Max = 100
    Position = 50
    Smooth = True
    Step = 1
    TabOrder = 3
  end
  object eGlobalTime: TEdit
    Left = 8
    Top = 24
    Width = 297
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object eExecutionTime: TEdit
    Left = 8
    Top = 88
    Width = 297
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object eStatus: TEdit
    Left = 8
    Top = 152
    Width = 297
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object btnClose: TButton
    Left = 48
    Top = 256
    Width = 217
    Height = 25
    Cancel = True
    Caption = '&Close'
    Default = True
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object tmTimer: TTimer
    Interval = 500
    OnTimer = tmTimerTimer
    Left = 280
  end
end
