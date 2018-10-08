object frmApp: TfrmApp
  Left = 320
  Top = 284
  BorderStyle = bsDialog
  Caption = 'Hello'
  ClientHeight = 217
  ClientWidth = 342
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
    Left = 70
    Top = 8
    Width = 193
    Height = 19
    Alignment = taCenter
    Caption = 'Advanced Application 1.0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lStatus: TLabel
    Left = 16
    Top = 48
    Width = 312
    Height = 90
    Alignment = taCenter
    AutoSize = False
    Caption = 'lStatus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 8
    Top = 155
    Width = 318
    Height = 4
  end
  object btnClose: TButton
    Left = 12
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnBuy: TButton
    Left = 128
    Top = 174
    Width = 86
    Height = 25
    Caption = 'Buy Now'
    TabOrder = 0
    OnClick = btnBuyClick
  end
  object btnRegistration: TButton
    Left = 250
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Registration'
    TabOrder = 1
    OnClick = btnRegistrationClick
  end
end
