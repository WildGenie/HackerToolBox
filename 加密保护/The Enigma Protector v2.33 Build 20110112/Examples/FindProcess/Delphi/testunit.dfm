object frmMain: TfrmMain
  Left = 281
  Top = 342
  BorderStyle = bsDialog
  Caption = 'EP_CheckupFindProcess test application'
  ClientHeight = 311
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 657
    Height = 33
    AutoSize = False
    Caption = 
      'This application demostrates how the EP_CheckupFindProcess Enigm' +
      'a API can be used to find running process. Note, instead of usin' +
      'g of this function, you always may use CHECKUP-Executed Processe' +
      's feature'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 389
    Height = 13
    Caption = 
      'Process File Name (keep it empty if you do not want to specify a' +
      'ny exact file name)'
  end
  object Label3: TLabel
    Left = 16
    Top = 144
    Width = 446
    Height = 13
    Caption = 
      'Process Window Class (keep it empty if you do not want to seach ' +
      'process by it'#39's window class)'
  end
  object Label4: TLabel
    Left = 16
    Top = 48
    Width = 665
    Height = 33
    AutoSize = False
    Caption = 
      'Please also note, EP_CheckupFindProcess  has 3 parameters, if yo' +
      'u'#39've set up all 3 parameters, then the function will try to find' +
      ' a process that matches to all 3 criterias. For example, if you ' +
      'want to find a process only by it'#39's file name, keep window class' +
      ' and text values empty.'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 16
    Top = 192
    Width = 657
    Height = 41
    Caption = 
      'Process Window Text (keep it empty if you do not want to include' +
      ' window text checkup to the function searching, note, for the wi' +
      'ndow text checkup you may text masks, for example, the mask *deb' +
      'ugger* will include all processes if their windows contain debug' +
      'ger word in the text) '
    WordWrap = True
  end
  object eFileName: TEdit
    Left = 16
    Top = 112
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object eWindowClass: TEdit
    Left = 16
    Top = 160
    Width = 657
    Height = 21
    TabOrder = 1
  end
  object eWindowText: TEdit
    Left = 16
    Top = 240
    Width = 657
    Height = 21
    TabOrder = 2
  end
  object btnFind: TButton
    Left = 232
    Top = 272
    Width = 217
    Height = 25
    Caption = 'Find Process!'
    TabOrder = 3
    OnClick = btnFindClick
  end
end
