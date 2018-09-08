object frmCadBase: TfrmCadBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frmCadBase'
  ClientHeight = 238
  ClientWidth = 778
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 18
    Top = 77
    Width = 14
    Height = 17
    Caption = 'ID'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object pnlTittle: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 67
    Align = alTop
    Color = 9861697
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object lblTitleEntity: TLabel
      Left = 19
      Top = 7
      Width = 58
      Height = 29
      Caption = 'Titulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btnGravar: TBitBtn
      Left = 627
      Top = 1
      Width = 75
      Height = 65
      Align = alRight
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TBitBtn
      Left = 702
      Top = 1
      Width = 75
      Height = 65
      Align = alRight
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object edtID: TDBEdit
    Left = 18
    Top = 96
    Width = 50
    Height = 25
    DataField = 'ID'
    DataSource = dtsTabela
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3355443
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dtsTabela: TDataSource
    DataSet = qryTabela
    Left = 464
    Top = 8
  end
  object qryTabela: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.conConexao
    Left = 432
    Top = 8
    object qryTabelaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
