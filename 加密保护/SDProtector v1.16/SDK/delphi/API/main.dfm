object Demo: TDemo
  Left = 227
  Top = 138
  Width = 474
  Height = 382
  Caption = 'Example'
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
    Left = 48
    Top = 8
    Width = 276
    Height = 13
    Caption = 'This group of SDProtector API are used to retrieve trail info'
  end
  object Label2: TLabel
    Left = 48
    Top = 104
    Width = 311
    Height = 13
    Caption = 
      'This group of SDProtector API are used to retrieve registration ' +
      'info'
  end
  object Label3: TLabel
    Left = 48
    Top = 120
    Width = 377
    Height = 26
    Caption = 
      'In order to see how some API of this group work, you may need to' +
      ' click Register button to register this program first'
    WordWrap = True
  end
  object btnExit: TButton
    Left = 363
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = btnExitClick
  end
  object btnGetExpDate: TButton
    Left = 49
    Top = 32
    Width = 169
    Height = 25
    Caption = 'SDP_GetExpirationDate'
    TabOrder = 1
    OnClick = btnGetExpDateClick
  end
  object btnGetDayLeft: TButton
    Left = 49
    Top = 72
    Width = 169
    Height = 25
    Caption = 'SDP_GetNumOfDaysLeft'
    TabOrder = 2
    OnClick = btnGetDayLeftClick
  end
  object btnGetExecsLeft: TButton
    Left = 249
    Top = 32
    Width = 169
    Height = 25
    Caption = 'SDP_GetNumOfExecutionsLeft'
    TabOrder = 3
    OnClick = btnGetExecsLeftClick
  end
  object btnGetKeyExpDate: TButton
    Left = 49
    Top = 184
    Width = 169
    Height = 25
    Caption = 'SDP_GetKeyExpirationDate'
    TabOrder = 4
    OnClick = btnGetKeyExpDateClick
  end
  object btnGetRegName: TButton
    Left = 248
    Top = 152
    Width = 169
    Height = 25
    Caption = 'SDP_GetRegistrationName'
    TabOrder = 5
    OnClick = btnGetRegNameClick
  end
  object btnIsRegistered: TButton
    Left = 49
    Top = 152
    Width = 169
    Height = 25
    Caption = 'SDP_IsRegistered'
    TabOrder = 6
    OnClick = btnIsRegisteredClick
  end
  object btnSetRegKey: TButton
    Left = 248
    Top = 272
    Width = 169
    Height = 25
    Caption = 'SDP_SetRegistrationKey'
    TabOrder = 7
  end
  object btnGetHardwareID: TButton
    Left = 49
    Top = 272
    Width = 169
    Height = 25
    Caption = 'SDP_GetHardwareID'
    TabOrder = 8
    OnClick = btnGetHardwareIDClick
  end
  object btnClearRegInfo: TButton
    Left = 172
    Top = 320
    Width = 169
    Height = 25
    Caption = 'Clear Registration Info'
    TabOrder = 9
    OnClick = btnClearRegInfoClick
  end
  object btnRegister: TButton
    Left = 28
    Top = 320
    Width = 121
    Height = 25
    Caption = 'Register'
    TabOrder = 10
    OnClick = btnRegisterClick
  end
  object btnDetectDebugger: TButton
    Left = 49
    Top = 224
    Width = 169
    Height = 25
    Caption = 'SDP_DetectDebugger'
    TabOrder = 11
    OnClick = btnDetectDebuggerClick
  end
  object btnRetrieveHardwareID: TButton
    Left = 249
    Top = 224
    Width = 169
    Height = 25
    Caption = 'SDP_RetrieveHardwareID'
    TabOrder = 12
    OnClick = btnRetrieveHardwareIDClick
  end
end
