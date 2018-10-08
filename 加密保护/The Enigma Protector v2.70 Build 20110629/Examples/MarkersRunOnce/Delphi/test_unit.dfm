object Form1: TForm1
  Left = 334
  Top = 196
  Width = 651
  Height = 165
  Caption = 'Test Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 281
    Height = 13
    Caption = 'This example shows how RunOnce marker works.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 564
    Height = 13
    Caption = 
      'Click "Show a message" button, you will get a message box, click' +
      ' again - you will not get anything.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 48
    Width = 554
    Height = 26
    Caption = 
      'The code inside button click is under RunOnce marker, and this c' +
      'ode will be run only once while execution.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object btnShowMessage: TButton
    Left = 232
    Top = 96
    Width = 137
    Height = 25
    Caption = 'Show a message'
    Default = True
    TabOrder = 0
    OnClick = btnShowMessageClick
  end
  object btnClose: TButton
    Left = 552
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
  end
end
