object frmRegKey: TfrmRegKey
  Left = 377
  Top = 349
  BorderStyle = bsDialog
  Caption = 'Registration'
  ClientHeight = 196
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 256
    Height = 13
    Caption = 'Please, send your hardware ID to the author:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lCode: TLabel
    Left = 8
    Top = 62
    Width = 215
    Height = 13
    Caption = 'Enter a registration key below, please'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lName: TLabel
    Left = 8
    Top = 113
    Width = 225
    Height = 13
    Caption = 'Enter a registration name below, please'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 193
    Height = 21
    Color = 16766592
    ReadOnly = True
    TabOrder = 0
  end
  object Button4: TButton
    Left = 208
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 1
    OnClick = Button4Click
  end
  object eCode: TEdit
    Left = 8
    Top = 82
    Width = 280
    Height = 21
    MaxLength = 255
    TabOrder = 2
  end
  object eName: TEdit
    Left = 8
    Top = 133
    Width = 280
    Height = 21
    MaxLength = 255
    TabOrder = 3
    Text = 'Registered User'
  end
  object btnRegOk: TButton
    Left = 8
    Top = 165
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnRegOkClick
  end
  object btnRegCancel: TButton
    Left = 88
    Top = 165
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object btnRegPaste: TButton
    Left = 168
    Top = 165
    Width = 75
    Height = 25
    Caption = 'Paste'
    TabOrder = 6
    OnClick = btnRegPasteClick
  end
end
