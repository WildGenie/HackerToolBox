object Form2: TForm2
  Left = 539
  Top = 306
  BorderStyle = bsDialog
  Caption = 'Register'
  ClientHeight = 223
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 23
    Top = 20
    Width = 63
    Height = 13
    Caption = 'Hardware ID:'
  end
  object lbl2: TLabel
    Left = 33
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Username:'
  end
  object lbl3: TLabel
    Left = 16
    Top = 80
    Width = 69
    Height = 13
    Caption = 'Serial Number:'
  end
  object edt1: TEdit
    Left = 96
    Top = 16
    Width = 225
    Height = 21
    Color = clSilver
    ImeName = #20013#25991' ('#31616#20307') - '#35895#27468#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 96
    Top = 48
    Width = 225
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#35895#27468#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object mmo1: TMemo
    Left = 96
    Top = 80
    Width = 225
    Height = 81
    ImeName = #20013#25991' ('#31616#20307') - '#35895#27468#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 176
    Width = 105
    Height = 33
    Caption = 'Register'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 176
    Width = 105
    Height = 33
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button2Click
  end
end
