object MainForm: TMainForm
  Left = 313
  Top = 379
  BorderStyle = bsDialog
  Caption = 'Text file to MySQL Server'
  ClientHeight = 278
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 618
    Top = 166
    Width = 83
    Height = 13
    Caption = 'www.turbog.com'
  end
  object Label10: TLabel
    Left = 407
    Top = 166
    Width = 117
    Height = 26
    Caption = 'M.Ali VARDAR   2012 '#13#10'GPL Licensed Application'
  end
  object Button1: TButton
    Left = 626
    Top = 234
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 393
    Height = 264
    Caption = 'MySQL Connection Settings'
    TabOrder = 1
    object Label1: TLabel
      Left = 27
      Top = 37
      Width = 68
      Height = 13
      Caption = 'MySQL Server'
    end
    object Label2: TLabel
      Left = 27
      Top = 64
      Width = 51
      Height = 13
      Caption = 'User name'
    end
    object Label3: TLabel
      Left = 27
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label4: TLabel
      Left = 27
      Top = 118
      Width = 75
      Height = 13
      Caption = 'Database name'
    end
    object Label5: TLabel
      Left = 27
      Top = 202
      Width = 55
      Height = 13
      Caption = 'Table name'
    end
    object Label6: TLabel
      Left = 27
      Top = 237
      Width = 51
      Height = 13
      Caption = 'Field name'
    end
    object Label7: TLabel
      Left = 27
      Top = 159
      Width = 77
      Height = 13
      Caption = 'Status MySQL : '
    end
    object Label8: TLabel
      Left = 126
      Top = 159
      Width = 64
      Height = 13
      Caption = 'Disconnected'
    end
    object Edit1: TEdit
      Left = 178
      Top = 29
      Width = 199
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object Edit2: TEdit
      Left = 178
      Top = 56
      Width = 199
      Height = 21
      TabOrder = 1
      Text = 'root'
    end
    object Edit3: TEdit
      Left = 178
      Top = 83
      Width = 199
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 178
      Top = 110
      Width = 199
      Height = 21
      TabOrder = 3
    end
    object Button2: TButton
      Left = 238
      Top = 147
      Width = 139
      Height = 25
      Caption = 'Connect'
      TabOrder = 4
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 178
      Top = 194
      Width = 199
      Height = 21
      TabOrder = 5
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 178
      Top = 229
      Width = 199
      Height = 21
      TabOrder = 6
    end
  end
  object Edit5: TEdit
    Left = 407
    Top = 16
    Width = 302
    Height = 21
    TabOrder = 2
  end
  object Button3: TButton
    Left = 578
    Top = 43
    Width = 131
    Height = 25
    Caption = 'Select Text File'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 407
    Top = 115
    Width = 302
    Height = 25
    Caption = 'Move All Data to MySQL'
    TabOrder = 4
    OnClick = Button4Click
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 376
    Top = 16
  end
  object ZConnection1: TZConnection
    AfterConnect = ZConnection1AfterConnect
    AfterDisconnect = ZConnection1AfterDisconnect
    Port = 0
    Database = '127.0.0.1'
    User = 'root'
    Password = 'vardar76'
    Protocol = 'mysql'
    Left = 152
    Top = 24
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'show tables;')
    Params = <>
    Left = 152
    Top = 72
  end
  object ZTable1: TZTable
    Connection = ZConnection1
    Left = 152
    Top = 127
  end
end
