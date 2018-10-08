object Frm_VP_SDK: TFrm_VP_SDK
  Left = 0
  Top = 0
  Caption = 'VersionManager'
  ClientHeight = 56
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LB_Version: TLabel
    Left = 24
    Top = 24
    Width = 93
    Height = 13
    Caption = 'What is softVersion'
  end
  object Btn_GetVersion: TButton
    Left = 304
    Top = 23
    Width = 132
    Height = 25
    Caption = 'Btn_GetVersion'
    TabOrder = 0
    OnClick = Btn_GetVersionClick
  end
end
