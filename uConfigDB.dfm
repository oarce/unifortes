object frmConfigDB: TfrmConfigDB
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configurar Banco de Dados'
  ClientHeight = 279
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    385
    279)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 142
    Width = 135
    Height = 13
    Caption = 'Caminho do banco de dados'
  end
  object Label3: TLabel
    Left = 8
    Top = 186
    Width = 51
    Height = 13
    Caption = 'Dll fbClient'
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 127
    Caption = '  Login Firebird  '
    TabOrder = 0
    object lblPassword: TLabel
      Left = 18
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label1: TLabel
      Left = 18
      Top = 21
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object edtUser: TEdit
      Left = 18
      Top = 37
      Width = 136
      Height = 21
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object edtPassword: TEdit
      Left = 18
      Top = 85
      Width = 136
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'masterkey'
    end
  end
  object edtDir: TEdit
    Left = 8
    Top = 160
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object btnDir: TBitBtn
    Left = 338
    Top = 160
    Width = 28
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 2
    TabStop = False
    OnClick = btnDirClick
  end
  object btnOK: TBitBtn
    Left = 199
    Top = 41
    Width = 80
    Height = 30
    Caption = 'Conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    TabStop = False
    OnClick = btnOKClick
  end
  object btnCancelar: TBitBtn
    Left = 199
    Top = 77
    Width = 80
    Height = 30
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    TabStop = False
    OnClick = btnCancelarClick
  end
  object edtDll: TEdit
    Left = 8
    Top = 203
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Text = '\fbclient.dll'
  end
  object BitBtn1: TBitBtn
    Left = 338
    Top = 203
    Width = 28
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn1Click
  end
  object btnGerarDB: TBitBtn
    Left = 8
    Top = 237
    Width = 76
    Height = 30
    Caption = 'Criar BD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    TabStop = False
    OnClick = btnGerarDBClick
  end
  object btnInicializar: TBitBtn
    Left = 90
    Top = 237
    Width = 131
    Height = 30
    Caption = 'Criar Estrutura Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    TabStop = False
    OnClick = btnInicializarClick
  end
  object btnGerarScript: TBitBtn
    Left = 225
    Top = 237
    Width = 144
    Height = 30
    Caption = 'Gerar Script BD em txt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TabStop = False
    OnClick = btnGerarScriptClick
  end
  object dlgOpenBD: TOpenDialog
    Filter = '*.FDB'
    Left = 256
    Top = 108
  end
  object dlgOpenDll: TOpenDialog
    Filter = '*.dll'
    Left = 312
    Top = 116
  end
end
