object frmNag: TfrmNag
  Left = 209
  Top = 202
  Width = 465
  Height = 201
  Caption = 'NAG screen'
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
    Left = 40
    Top = 104
    Width = 225
    Height = 16
    Caption = 'Demo version of Text Editor v1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
    Top = 8
    Width = 244
    Height = 37
    Caption = 'Text viewer v1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 80
    Width = 78
    Height = 13
    Caption = 'Registration link:'
  end
  object Label4: TLabel
    Left = 128
    Top = 80
    Width = 156
    Height = 13
    Caption = 'http://www.enigma.izmuroma.ru/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 56
    Width = 314
    Height = 13
    Caption = 
      'Please, register this software to remove NAG and DEMO limitation' +
      's'
  end
  object Button1: TButton
    Left = 16
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Buy'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Try'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 368
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button3Click
  end
end
