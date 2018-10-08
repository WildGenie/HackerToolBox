object Form1: TForm1
  Left = 316
  Top = 127
  Width = 436
  Height = 219
  Caption = 'Main Form'
  Color = clBtnFace
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
    Left = 72
    Top = 24
    Width = 275
    Height = 20
    Caption = 'Application Successfully Executed'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTime: TLabel
    Left = 72
    Top = 72
    Width = 281
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbTime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClose: TButton
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object tTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tTimerTimer
    Left = 272
    Top = 136
  end
end
