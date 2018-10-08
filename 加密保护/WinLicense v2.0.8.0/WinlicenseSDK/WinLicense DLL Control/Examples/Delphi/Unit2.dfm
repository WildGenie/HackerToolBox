object Form2: TForm2
  Left = 316
  Top = 299
  Width = 632
  Height = 384
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 48
    Top = 16
    Width = 537
    Height = 113
    Caption = 'Text Key Registration'
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 53
      Width = 96
      Height = 13
      Caption = 'Insert your Text key:'
    end
    object btCheckText: TButton
      Left = 328
      Top = 24
      Width = 153
      Height = 22
      Caption = 'Check Text Key'
      TabOrder = 0
      OnClick = btCheckTextClick
    end
    object btInstallTextToFile: TButton
      Left = 328
      Top = 56
      Width = 154
      Height = 22
      Caption = 'Install to File'
      TabOrder = 1
      OnClick = btInstallTextToFileClick
    end
    object btRestartApplication: TButton
      Left = 328
      Top = 85
      Width = 155
      Height = 20
      Caption = 'Restart to Finish Registration'
      TabOrder = 2
      OnClick = btRestartApplicationClick
    end
    object edTextKey: TEdit
      Left = 112
      Top = 48
      Width = 185
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 48
    Top = 152
    Width = 537
    Height = 137
    Caption = 'Smart Key Registration'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 105
      Width = 102
      Height = 13
      Caption = 'Insert your Smart key:'
    end
    object Label3: TLabel
      Left = 56
      Top = 20
      Width = 56
      Height = 13
      Caption = 'User Name:'
    end
    object Label4: TLabel
      Left = 64
      Top = 47
      Width = 47
      Height = 13
      Caption = 'Company:'
    end
    object Label5: TLabel
      Left = 48
      Top = 76
      Width = 64
      Height = 13
      Caption = 'Custom Data:'
    end
    object btCheckSmart: TButton
      Left = 328
      Top = 24
      Width = 153
      Height = 22
      Caption = 'Check Smart Key'
      TabOrder = 0
      OnClick = btCheckSmartClick
    end
    object btInstallSmartToFile: TButton
      Left = 328
      Top = 64
      Width = 154
      Height = 22
      Caption = 'Install to File'
      TabOrder = 1
      OnClick = btInstallSmartToFileClick
    end
    object btRestartApplication2: TButton
      Left = 328
      Top = 101
      Width = 155
      Height = 20
      Caption = 'Restart to Finish Registration'
      TabOrder = 2
      OnClick = btRestartApplicationClick
    end
    object edSmartKey: TEdit
      Left = 126
      Top = 101
      Width = 187
      Height = 21
      TabOrder = 3
    end
    object edUserName: TEdit
      Left = 126
      Top = 16
      Width = 187
      Height = 21
      TabOrder = 4
    end
    object edCompany: TEdit
      Left = 126
      Top = 43
      Width = 187
      Height = 21
      TabOrder = 5
    end
    object edCustom: TEdit
      Left = 126
      Top = 72
      Width = 187
      Height = 21
      TabOrder = 6
    end
  end
  object Button1: TButton
    Left = 208
    Top = 296
    Width = 185
    Height = 25
    Caption = 'Continue in Trial Mode'
    TabOrder = 2
    OnClick = Button1Click
  end
end
