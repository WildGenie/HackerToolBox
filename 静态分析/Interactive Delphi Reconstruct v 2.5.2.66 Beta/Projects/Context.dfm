object frmContext: TfrmContext
  Left = 352
  Top = 255
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Context menu options'
  ClientHeight = 168
  ClientWidth = 192
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 192
    Height = 168
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object LabelText: TLabel
      Left = 144
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Text'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 120
      Width = 161
      Height = 17
      Shape = bsTopLine
    end
    object btnOk: TButton
      Left = 16
      Top = 134
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancel: TButton
      Left = 104
      Top = 134
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object CBEXE: TCheckBox
      Left = 16
      Top = 12
      Width = 169
      Height = 17
      Caption = 'use for EXE- files'
      State = cbChecked
      TabOrder = 2
    end
    object CBDLL: TCheckBox
      Left = 16
      Top = 33
      Width = 161
      Height = 17
      Caption = 'use for DLL- files'
      State = cbChecked
      TabOrder = 3
    end
    object LabelCompressText: TEdit
      Left = 16
      Top = 84
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Compress with ASPack'
    end
    object CBOCX: TCheckBox
      Left = 16
      Top = 56
      Width = 169
      Height = 17
      Caption = 'use for OCX-file'
      State = cbChecked
      TabOrder = 5
    end
  end
  object FS: TFormStorage
    Options = [fpPosition]
    StoredProps.Strings = (
      'CBDLL.Checked'
      'CBEXE.Checked'
      'LabelCompressText.Text'
      'CBOCX.Checked')
    Left = 136
    Top = 8
  end
end
