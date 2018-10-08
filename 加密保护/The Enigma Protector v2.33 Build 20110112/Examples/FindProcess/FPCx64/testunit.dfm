object frmMain: TfrmMain
  Left = 281
  Height = 311
  Top = 342
  Width = 689
  BorderStyle = bsDialog
  Caption = 'EP_CheckupFindProcess test application'
  ClientHeight = 311
  ClientWidth = 689
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  LCLVersion = '0.9.29'
  object Label1: TLabel
    Left = 16
    Height = 33
    Top = 16
    Width = 657
    AutoSize = False
    Caption = 'This application demostrates how the EP_CheckupFindProcess Enigma API can be used to find running process. Note, instead of using of this function, you always may use CHECKUP-Executed Processes feature'
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Height = 14
    Top = 96
    Width = 390
    Caption = 'Process File Name (keep it empty if you do not want to specify any exact file name)'
    ParentColor = False
  end
  object Label3: TLabel
    Left = 16
    Height = 14
    Top = 144
    Width = 447
    Caption = 'Process Window Class (keep it empty if you do not want to seach process by it''s window class)'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 16
    Height = 33
    Top = 48
    Width = 665
    AutoSize = False
    Caption = 'Please also note, EP_CheckupFindProcess  has 3 parameters, if you''ve set up all 3 parameters, then the function will try to find a process that matches to all 3 criterias. For example, if you want to find a process only by it''s file name, keep window class and text values empty.'
    ParentColor = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 16
    Height = 38
    Top = 192
    Width = 656
    AutoSize = False
    Caption = 'Process Window Text (keep it empty if you do not want to include window text checkup to the function searching, note, for the window text checkup you may text masks, for example, the mask *debugger* will include all processes if their windows contain debugger word in the text) '
    ParentColor = False
    WordWrap = True
  end
  object eFileName: TEdit
    Left = 16
    Height = 21
    Top = 112
    Width = 657
    TabOrder = 0
  end
  object eWindowClass: TEdit
    Left = 16
    Height = 21
    Top = 160
    Width = 657
    TabOrder = 1
  end
  object eWindowText: TEdit
    Left = 16
    Height = 21
    Top = 240
    Width = 657
    TabOrder = 2
  end
  object btnFind: TButton
    Left = 232
    Height = 25
    Top = 272
    Width = 217
    Caption = 'Find Process!'
    OnClick = btnFindClick
    TabOrder = 3
  end
end
