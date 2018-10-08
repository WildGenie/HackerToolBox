object DemoForm: TDemoForm
  Left = 65
  Top = 42
  AutoScroll = False
  Caption = 'Demo for EncryptPE'
  ClientHeight = 477
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 72
    Height = 20
    AutoSize = False
    Caption = '&Hardware ID:'
    FocusControl = Edit1
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 32
    Top = 68
    Width = 72
    Height = 20
    AutoSize = False
    Caption = '&User Name:'
    FocusControl = Edit2
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 72
    Height = 20
    AutoSize = False
    Caption = 'Registrat&ion:'
    FocusControl = Edit3
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 10
    Top = 156
    Width = 320
    Height = 2
    Shape = bsTopLine
  end
  object Edit1: TEdit
    Left = 107
    Top = 24
    Width = 200
    Height = 21
    TabStop = False
    MaxLength = 32
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 107
    Top = 68
    Width = 200
    Height = 21
    MaxLength = 32
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 107
    Top = 112
    Width = 200
    Height = 21
    MaxLength = 32
    TabOrder = 2
  end
  object Button1: TButton
    Left = 63
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 201
    Top = 180
    Width = 75
    Height = 25
    Hint = 'Not a EncryptPE Program'
    Cancel = True
    Caption = '&Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 224
    Width = 275
    Height = 25
    Caption = 'Sho&wRegisterForm'
    Enabled = False
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 32
    Top = 264
    Width = 275
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object Edit6: TEdit
    Left = 32
    Top = 399
    Width = 275
    Height = 21
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 12
  end
  object Edit7: TEdit
    Left = 32
    Top = 433
    Width = 275
    Height = 21
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 13
  end
  object Button4: TButton
    Left = 32
    Top = 360
    Width = 125
    Height = 25
    Caption = '&Encrypt/Decrypt'
    Enabled = False
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 182
    Top = 360
    Width = 125
    Height = 25
    Caption = 'Co&mpress/Decompress'
    Enabled = False
    TabOrder = 11
    OnClick = Button5Click
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 331
    Width = 65
    Height = 17
    Caption = 'P&rocess'
    Enabled = False
    TabOrder = 8
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 144
    Top = 331
    Width = 65
    Height = 17
    Caption = 'He&x'
    Enabled = False
    TabOrder = 9
  end
  object Edit5: TEdit
    Left = 32
    Top = 298
    Width = 275
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 339
    Top = 0
    Width = 350
    Height = 477
    BevelOuter = bvNone
    TabOrder = 14
    object ValueListEditor1: TValueListEditor
      Left = 0
      Top = 0
      Width = 350
      Height = 99
      Align = alTop
      Enabled = False
      Strings.Strings = (
        'Color=$FF0000'
        'Hint='#13#10#13#10'      EncryptPE V1.2003.5.18, Copyright (C) WFS'
        'HomePage=http://www.encryptpe.com'
        'Email=wfs@encryptpe.com')
      TabOrder = 0
      ColWidths = (
        65
        279)
    end
    object Button6: TButton
      Left = 73
      Top = 103
      Width = 100
      Height = 25
      Caption = 'Hi&nt Set'
      Enabled = False
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 193
      Top = 103
      Width = 100
      Height = 25
      Caption = 'Language S&et'
      Enabled = False
      TabOrder = 2
      OnClick = Button7Click
    end
    object ValueListEditor2: TValueListEditor
      Left = 0
      Top = 132
      Width = 350
      Height = 345
      Align = alBottom
      Enabled = False
      Strings.Strings = (
        'FontCharset=0'
        'FontSize=8'
        'FontName=MS Sans Serif'
        'Str4=Warning'
        'Str5=Unknown error'
        'Str6=Information'
        'Str7=Debugger or monitor found!'
        'Str8=Exiting...'
        'Str9=Register'
        'Str10=Unregistered'
        'Str11=Registered'
        'Str12=Expired'
        'Str13=&Hardware ID:'
        'Str14=&User Name:'
        'Str15=Registrat&ion:'
        'Str16=&Ok'
        'Str17=&Cancel')
      TabOrder = 3
      ColWidths = (
        65
        279)
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
  end
end
