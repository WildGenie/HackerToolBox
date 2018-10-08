object Crea_Form: TCrea_Form
  Left = 377
  Top = 334
  Width = 269
  Height = 82
  BorderIcons = [biSystemMenu]
  Caption = #29983#25104#25991#20214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 2
    Top = 15
    Width = 81
    Height = 25
    Caption = #12304#29983#25104#25991#26412#12305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 90
    Top = 15
    Width = 81
    Height = 25
    Caption = #12304#29983#25104#32593#39029#12305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 178
    Top = 16
    Width = 81
    Height = 25
    Caption = #12304#22797#21046#25991#31456#12305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 120
    Top = 48
    Width = 73
    Height = 17
    TabOrder = 3
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    FileName = '*.txt'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt'
  end
  object SaveDialog2: TSaveDialog
    FileName = '*.htm'
    Filter = #32593#39029#25991#20214'(*.html)|*.html;*.htm'
    Left = 32
  end
end
