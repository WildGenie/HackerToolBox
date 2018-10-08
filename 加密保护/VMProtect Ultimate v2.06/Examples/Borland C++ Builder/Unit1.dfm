object Form1: TForm1
  Left = 385
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'VMProtect test [Borland C++ Builder]'
  ClientHeight = 43
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 49
    Height = 13
    Caption = 'Password:'
  end
  object Edit1: TEdit
    Left = 60
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 189
    Top = 10
    Width = 100
    Height = 25
    Caption = 'Check password'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
