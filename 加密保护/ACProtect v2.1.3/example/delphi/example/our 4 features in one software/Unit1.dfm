object Form1: TForm1
  Left = 192
  Top = 114
  Width = 398
  Height = 433
  Caption = 'Trial Software using our key solution'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 8
    Width = 211
    Height = 65
    Caption = 
      'This example uses our 4 features'#13#10'1.damynic code protect'#13#10'2.embe' +
      'dded protect'#13#10'3.rsa code protect'#13#10'4.trial software using '#39'key.da' +
      't'#39' as key solution'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 120
    Top = 314
    Width = 49
    Height = 13
    Caption = 'You have '
  end
  object lbtrialtime: TLabel
    Left = 184
    Top = 313
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label4: TLabel
    Left = 208
    Top = 313
    Width = 55
    Height = 13
    Caption = 'times to trial'
  end
  object Label5: TLabel
    Left = 120
    Top = 335
    Width = 51
    Height = 13
    Caption = 'licensed to'
  end
  object lbusername: TLabel
    Left = 192
    Top = 335
    Width = 81
    Height = 13
    Caption = 'unregistered user'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 365
    Height = 52
    Caption = 
      'Now we use our key solution for trial software.'#13#10'Please create a' +
      ' rsa key pair and use the '#39'key.dat'#39' to remove the trial limitati' +
      'on.'#13#10'When the '#39'key.dat'#39' is in the folder of .exe or .dll file,it' +
      ' will not check the trial information such as trial times or tri' +
      'al days.'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 160
    Width = 350
    Height = 26
    Cursor = crHandPoint
    Caption = 
      'We suggest you go to our website  http://www.ultraprotect.com an' +
      'd view the online flash tutorials for more information.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label6Click
  end
  object Label7: TLabel
    Left = 8
    Top = 264
    Width = 104
    Height = 13
    Caption = 'damymic code protect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 72
    Top = 228
    Width = 6
    Height = 13
    Caption = '+'
  end
  object Label9: TLabel
    Left = 152
    Top = 228
    Width = 6
    Height = 13
    Caption = '='
  end
  object Label10: TLabel
    Left = 8
    Top = 208
    Width = 77
    Height = 13
    Caption = 'rsa code protect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 72
    Top = 284
    Width = 6
    Height = 13
    Caption = '--'
  end
  object Label12: TLabel
    Left = 152
    Top = 284
    Width = 6
    Height = 13
    Caption = '='
  end
  object Ok: TButton
    Left = 152
    Top = 355
    Width = 97
    Height = 33
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkClick
  end
  object edA: TEdit
    Left = 8
    Top = 224
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object edB: TEdit
    Left = 88
    Top = 224
    Width = 57
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object edC: TEdit
    Left = 168
    Top = 224
    Width = 57
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 248
    Top = 224
    Width = 81
    Height = 23
    Caption = 'calculate '
    TabOrder = 4
    OnClick = Button1Click
  end
  object edD: TEdit
    Left = 8
    Top = 280
    Width = 57
    Height = 21
    TabOrder = 5
    Text = '1'
  end
  object edE: TEdit
    Left = 88
    Top = 280
    Width = 57
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object edF: TEdit
    Left = 168
    Top = 280
    Width = 57
    Height = 21
    TabOrder = 7
  end
  object Button2: TButton
    Left = 248
    Top = 280
    Width = 81
    Height = 23
    Caption = 'calculate '
    TabOrder = 8
    OnClick = Button2Click
  end
end
