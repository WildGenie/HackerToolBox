object Form1: TForm1
  Left = 226
  Top = 230
  Width = 603
  Height = 263
  Caption = 'Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    587
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 87
    Height = 13
    Caption = 'Registration Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 77
    Height = 13
    Caption = 'Registration Key'
  end
  object Label3: TLabel
    Left = 16
    Top = 184
    Width = 337
    Height = 33
    AutoSize = False
    Caption = 
      'Enter registration name and key to check out internal registrati' +
      'on key information'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object eName: TEdit
    Left = 16
    Top = 32
    Width = 553
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = ''
  end
  object mKey: TMemo
    Left = 16
    Top = 80
    Width = 553
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = ('')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 472
    Top = 184
    Width = 99
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 360
    Top = 184
    Width = 99
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Check'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
end
