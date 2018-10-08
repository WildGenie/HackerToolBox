object Gaoji_Form: TGaoji_Form
  Left = 335
  Top = 296
  Width = 396
  Height = 165
  BorderIcons = [biSystemMenu]
  Caption = #22522#26412#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 191
    Top = 14
    Width = 72
    Height = 12
    Caption = #12304#20316'    '#32773#12305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = -1
    Width = 386
    Height = 137
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 14
      Width = 72
      Height = 12
      Caption = #12304#20316'    '#32773#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 58
      Width = 72
      Height = 12
      Caption = #12304#20316#32773#22768#26126#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 7
      Top = 81
      Width = 72
      Height = 12
      Caption = #12304#29256#26435#22768#26126#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 36
      Width = 72
      Height = 12
      Caption = #12304#37038'    '#31665#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 193
      Top = 14
      Width = 72
      Height = 12
      Caption = #12304#20027'    '#39029#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 192
      Top = 38
      Width = 72
      Height = 12
      Caption = #12304'QQ    '#21495#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object author: TEdit
      Left = 80
      Top = 12
      Width = 112
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = authorChange
    end
    object Profassion: TEdit
      Left = 80
      Top = 56
      Width = 297
      Height = 18
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = #21482#26159#24863#20852#36259#65292#27809#26377#20854#20182#30446#30340#12290#22833#35823#20043#22788#25964#35831#35832#20301#22823#20384#36176#25945'!'
      OnChange = ProfassionChange
    end
    object Copyright: TEdit
      Left = 80
      Top = 78
      Width = 296
      Height = 18
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Text = #26412#25991#21407#21019#20110#30475#38634#25216#26415#35770#22363', '#36716#36733#35831#27880#26126#20316#32773#24182#20445#25345#25991#31456#30340#23436#25972', '#35874#35874'!'
      OnChange = CopyrightChange
    end
    object Button1: TButton
      Left = 72
      Top = 105
      Width = 81
      Height = 23
      Caption = #12304#20445'    '#23384#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 224
      Top = 105
      Width = 81
      Height = 23
      Caption = #12304#28165'    '#31354#12305
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
    object Email: TEdit
      Left = 80
      Top = 34
      Width = 112
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnChange = EmailChange
    end
    object qq: TEdit
      Left = 264
      Top = 35
      Width = 113
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      OnChange = qqChange
    end
  end
  object hpage: TEdit
    Left = 265
    Top = 12
    Width = 113
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnChange = hpageChange
  end
end
