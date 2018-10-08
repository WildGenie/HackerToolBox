object Form1: TForm1
  Left = 218
  Top = 135
  Width = 606
  Height = 383
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 598
    Height = 297
    Align = alTop
    Columns = <
      item
        Caption = '#'
        Width = 40
      end
      item
        Caption = 'Type'
        Width = 70
      end
      item
        Caption = 'Name'
        Width = 150
      end
      item
        Caption = 'Text'
        Width = 150
      end
      item
        Caption = 'File'
        Width = 150
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Button1: TButton
    Left = 224
    Top = 312
    Width = 145
    Height = 25
    Caption = 'Save File'
    TabOrder = 1
    OnClick = Button1Click
  end
  object SaveDialog1: TSaveDialog
    Left = 8
    Top = 312
  end
end
