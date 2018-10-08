object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'VPRotect Example'
  ClientHeight = 166
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 37
    Height = 13
    Caption = 'HardId:'
  end
  object Label2: TLabel
    Left = 40
    Top = 38
    Width = 53
    Height = 13
    Caption = 'UserName:'
  end
  object Button1: TButton
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = 'IsRegister'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 151
    Top = 88
    Width = 75
    Height = 25
    Caption = 'HardId'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 270
    Top = 88
    Width = 75
    Height = 25
    Caption = 'UserName'
    TabOrder = 2
    OnClick = Button3Click
  end
  object E_HardId: TEdit
    Left = 98
    Top = 8
    Width = 247
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 3
    Text = 'E_HardId'
  end
  object E_UserName: TEdit
    Left = 99
    Top = 35
    Width = 246
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 4
    Text = 'Edit1'
  end
  object Button4: TButton
    Left = 40
    Top = 133
    Width = 75
    Height = 25
    Caption = 'RegDecode'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 151
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Mutation'
    TabOrder = 6
    OnClick = Button5Click
  end
end
