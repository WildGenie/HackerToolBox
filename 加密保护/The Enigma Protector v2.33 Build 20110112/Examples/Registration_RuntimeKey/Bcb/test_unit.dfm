object Form1: TForm1
  Left = 192
  Top = 124
  Width = 597
  Height = 361
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 204
    Height = 13
    Caption = 'This example checks license each second.'
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 486
    Height = 52
    Caption = 
      'This application is registered with key.dat file, located in the' +
      ' same folder with compiled project.'#13#10'Registration key is limited' +
      ' to 3 Run-time minutes, i.e. license will be valid only 3 minute' +
      's since execution.'#13#10'If you want to view status of license, you h' +
      'ave to check license manually, by means Enigma API:'#13#10'EP_RegKeyRu' +
      'ntime, EP_RegKeyRuntimeTotal, EP_RegKeyRuntimeLeft'
  end
  object lbMessages: TListBox
    Left = 16
    Top = 96
    Width = 545
    Height = 97
    ItemHeight = 13
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 200
    Width = 465
    Height = 105
    Caption = 
      'Enter another registration key to test Run-time limit of registr' +
      'ation keys'
    TabOrder = 1
    object Label4: TLabel
      Left = 13
      Top = 28
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label5: TLabel
      Left = 15
      Top = 52
      Width = 18
      Height = 13
      Caption = 'Key'
    end
    object btnRegister: TButton
      Left = 374
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Register'
      TabOrder = 0
      OnClick = btnRegisterClick
    end
    object eKey: TEdit
      Left = 48
      Top = 44
      Width = 401
      Height = 21
      TabOrder = 1
    end
    object eName: TEdit
      Left = 48
      Top = 20
      Width = 401
      Height = 21
      TabOrder = 2
    end
  end
  object btnClose: TButton
    Left = 488
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 544
    Top = 16
  end
end
