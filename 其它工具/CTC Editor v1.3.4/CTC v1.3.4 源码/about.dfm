object About_Form: TAbout_Form
  Left = 360
  Top = 295
  Width = 320
  Height = 181
  BorderIcons = [biSystemMenu]
  Caption = #20851#20110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 1
    Width = 298
    Height = 144
    TabOrder = 0
    OnClick = GroupBox1Click
    object Label1: TLabel
      Left = 27
      Top = 45
      Width = 205
      Height = 16
      Caption = 'Made by'#65306'clide2000[DFCG][OCN]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label1Click
    end
    object Label2: TLabel
      Left = 27
      Top = 63
      Width = 148
      Height = 16
      Caption = 'Email: 54arma@sina.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 107
      Top = 12
      Width = 76
      Height = 16
      Caption = 'Bulid: v1.3.4'
      Constraints.MinWidth = 76
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label3Click
    end
    object Label4: TLabel
      Left = 13
      Top = 99
      Width = 270
      Height = 16
      Caption = 'Thanks to :'#30475#38634#12289#38378#30005#29436' '#12289'WXB And You !'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 212
      Top = 124
      Width = 68
      Height = 16
      Caption = 'by 2007.5.5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = Label4Click
    end
  end
end
