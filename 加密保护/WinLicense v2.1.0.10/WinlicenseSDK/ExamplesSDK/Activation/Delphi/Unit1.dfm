object Form1: TForm1
  Left = 112
  Top = 285
  Width = 375
  Height = 581
  Caption = 'SmartActivate SDK'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 56
    Top = 16
    Width = 273
    Height = 81
    Caption = 'Application Status '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 87
      Height = 13
      Caption = 'WLRegGetStatus:'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 102
      Height = 13
      Caption = 'WLRegGetStatusExt:'
    end
    object labStatus: TLabel
      Left = 104
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labStatusEx: TLabel
      Left = 112
      Top = 48
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 56
    Top = 112
    Width = 273
    Height = 105
    Caption = 'Registration Info'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label5: TLabel
      Left = 8
      Top = 48
      Width = 84
      Height = 13
      Caption = 'Days to Activate: '
    end
    object labName: TLabel
      Left = 48
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labDaysExp: TLabel
      Left = 96
      Top = 48
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labNoRegistered: TLabel
      Left = 48
      Top = 80
      Width = 129
      Height = 16
      Caption = 'NO REGISTERED!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 56
    Top = 232
    Width = 273
    Height = 169
    Caption = 'Activation Info'
    TabOrder = 2
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Expiration Date:'
    end
    object labNoActivated: TLabel
      Left = 56
      Top = 136
      Width = 116
      Height = 16
      Caption = 'NO ACTIVATED!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 8
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Custom1:'
    end
    object labCustom1: TLabel
      Left = 56
      Top = 56
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 56
      Top = 72
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 80
      Width = 44
      Height = 13
      Caption = 'Custom2:'
    end
    object labCustom2: TLabel
      Left = 56
      Top = 80
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 104
      Width = 44
      Height = 13
      Caption = 'Custom3:'
    end
    object labCustom3: TLabel
      Left = 56
      Top = 104
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 89
      Top = 20
      Width = 89
      Height = 21
      Date = 39168.377481724540000000
      Time = 39168.377481724540000000
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 48
    Top = 424
    Width = 273
    Height = 113
    Caption = 'Activate - ReActivate'
    TabOrder = 3
    object Label3: TLabel
      Left = 84
      Top = 29
      Width = 110
      Height = 16
      Caption = 'Activation Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ActivationCodeEdit: TEdit
      Left = 42
      Top = 49
      Width = 185
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 90
      Top = 78
      Width = 81
      Height = 27
      Caption = 'Activate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
