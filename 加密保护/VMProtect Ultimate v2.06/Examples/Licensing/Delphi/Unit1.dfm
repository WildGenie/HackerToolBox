object Form1: TForm1
  Left = 280
  Top = 160
  BorderStyle = bsDialog
  Caption = 'License Test App'
  ClientHeight = 505
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 148
    Height = 13
    Caption = 'Paste the serial number below:'
  end
  object Label2: TLabel
    Left = 10
    Top = 426
    Width = 65
    Height = 13
    Caption = 'Hardware ID:'
  end
  object edSerialNumber: TMemo
    Left = 10
    Top = 23
    Width = 729
    Height = 123
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    WantReturns = False
    OnChange = edSerialNumberChange
  end
  object edInfo: TMemo
    Left = 10
    Top = 155
    Width = 729
    Height = 262
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object btTry: TButton
    Left = 10
    Top = 471
    Width = 170
    Height = 25
    Caption = 'Try to execute protected code'
    TabOrder = 2
    OnClick = btTryClick
  end
  object btClose: TButton
    Left = 664
    Top = 471
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 3
    OnClick = btCloseClick
  end
  object edHWID: TEdit
    Left = 10
    Top = 439
    Width = 729
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
end
