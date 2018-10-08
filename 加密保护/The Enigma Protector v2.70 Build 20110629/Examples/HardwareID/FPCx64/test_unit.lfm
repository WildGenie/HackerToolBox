object frmMain: TfrmMain
  Left = 322
  Top = 219
  BorderStyle = bsDialog
  Caption = 'Hardware registration'
  ClientHeight = 374
  ClientWidth = 427
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
  object lbHardware: TLabel
    Left = 8
    Top = 8
    Width = 123
    Height = 13
    Caption = 'Unique hardware identifier'
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 259
    Height = 13
    Caption = 'Send this hardware id to author to complete registration'
  end
  object lbUserName: TLabel
    Left = 8
    Top = 240
    Width = 76
    Height = 13
    Caption = 'User information'
  end
  object lbKey: TLabel
    Left = 8
    Top = 288
    Width = 76
    Height = 13
    Caption = 'Registration key'
  end
  object Label2: TLabel
    Left = 288
    Top = 16
    Width = 66
    Height = 13
    Caption = 'Registered to:'
  end
  object lbRegName: TLabel
    Left = 288
    Top = 40
    Width = 129
    Height = 13
    AutoSize = False
    Caption = 'UNREGISTER USER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object eHardware: TEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object btnHardwareCopy: TButton
    Left = 168
    Top = 24
    Width = 105
    Height = 21
    Caption = 'Copy to clipboard'
    TabOrder = 1
    OnClick = btnHardwareCopyClick
  end
  object eUserInfo: TEdit
    Left = 8
    Top = 256
    Width = 409
    Height = 21
    TabOrder = 2
  end
  object mKey: TMemo
    Left = 8
    Top = 304
    Width = 409
    Height = 33
    TabOrder = 3
  end
  object btnRegister: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 21
    Caption = 'Register'
    TabOrder = 4
    OnClick = btnRegisterClick
  end
  object btnExit: TButton
    Left = 344
    Top = 344
    Width = 75
    Height = 21
    Caption = 'Exit'
    TabOrder = 6
    OnClick = btnExitClick
  end
  object btnDelete: TButton
    Left = 160
    Top = 344
    Width = 121
    Height = 21
    Caption = 'Delete local key'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 64
    Width = 409
    Height = 161
    Lines.Strings = (
      
        'This example shows how can be released resitration window with u' +
        'sing of '
      'Hardware '
      
        'ID. For generation of registration key for this application you ' +
        'should open '
      'necessary '
      
        'test project in Enigma and fill out Hardware ID (shown above) an' +
        'd registration '
      
        'information fields, then press "Create" button and try to regist' +
        'er. Do not forget that '
      'you '
      
        'should manually define necessary Enigma options for IDs generati' +
        'on! There are '
      'following IDs generation types:'
      '- from system Volume Serial Number'
      '- from system Volume Name'
      '- from Computer Name'
      '- from CPU type'
      '- from motherboard BIOS'
      'See help for additional info!')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
  end
end
