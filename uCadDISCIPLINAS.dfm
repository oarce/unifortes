inherited frmCadDISCIPLINAS: TfrmCadDISCIPLINAS
  Caption = 'frmCadDISCIPLINAS'
  ClientHeight = 377
  ClientWidth = 589
  ExplicitWidth = 605
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 74
    Top = 77
    Width = 59
    Height = 17
    Caption = 'Descri'#231#227'o'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 19
    Top = 130
    Width = 250
    Height = 17
    Caption = 'Professores que lecionam esta disciplina'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  inherited pnlTittle: TPanel
    Width = 589
    ExplicitWidth = 589
    inherited btnGravar: TBitBtn
      Left = 438
      ExplicitLeft = 438
    end
    inherited btnCancelar: TBitBtn
      Left = 513
      ExplicitLeft = 513
    end
  end
  object edtDIS_NOME: TDBEdit [5]
    Left = 74
    Top = 96
    Width = 495
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DIS_NOME'
    DataSource = dtsTabela
    TabOrder = 2
  end
  object grdPesquisa: TDBGrid [6]
    Left = 19
    Top = 176
    Width = 550
    Height = 189
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dtsATRIBUICAO
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3355443
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = 6640172
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Pitch = fpFixed
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROFESSORES_ID'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_NOME'
        Width = 397
        Visible = True
      end>
  end
  object cboProfessores: TDBLookupComboBox [7]
    Left = 19
    Top = 149
    Width = 412
    Height = 21
    KeyField = 'ID'
    ListField = 'PRO_NOME'
    ListSource = dtsProfessores
    TabOrder = 4
  end
  object btnIncluir: TButton [8]
    Left = 437
    Top = 142
    Width = 65
    Height = 28
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnIncluirClick
  end
  object btnExcluir: TButton [9]
    Left = 504
    Top = 142
    Width = 65
    Height = 28
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  inherited qryTabela: TFDQuery
    object qryTabelaDIS_NOME: TStringField
      FieldName = 'DIS_NOME'
      Size = 70
    end
  end
  object qryProfessores: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT ID'
      '           , PRO_NOME'
      'FROM PROFESSORES')
    Left = 448
    Top = 232
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProfessoresPRO_NOME: TStringField
      DisplayLabel = 'Nome do Professor'
      FieldName = 'PRO_NOME'
      Size = 70
    end
  end
  object dtsProfessores: TDataSource
    DataSet = qryProfessores
    Left = 480
    Top = 232
  end
  object qryAtribuicao: TFDQuery
    CachedUpdates = True
    BeforeApplyUpdates = qryAtribuicaoBeforeApplyUpdates
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT A.ID'
      '     , A.DISCIPLINAS_ID'
      '     , A.PROFESSORES_ID'
      '     , P.PRO_NOME'
      'FROM ATRIBUICAO A'
      'INNER JOIN PROFESSORES P ON A.PROFESSORES_ID = P.ID'
      'WHERE A.DISCIPLINAS_ID = :DISCIPLINAS_ID'
      'ORDER BY P.PRO_NOME')
    Left = 296
    Top = 232
    ParamData = <
      item
        Name = 'DISCIPLINAS_ID'
        ParamType = ptInput
      end>
    object qryAtribuicaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAtribuicaoPRO_NOME: TStringField
      DisplayLabel = 'Nome do Professor'
      FieldName = 'PRO_NOME'
      ProviderFlags = [pfInWhere]
      Size = 70
    end
    object qryAtribuicaoDISCIPLINAS_ID: TIntegerField
      FieldName = 'DISCIPLINAS_ID'
    end
    object qryAtribuicaoPROFESSORES_ID: TIntegerField
      DisplayLabel = 'ID Prof.'
      FieldName = 'PROFESSORES_ID'
    end
  end
  object dtsATRIBUICAO: TDataSource
    DataSet = qryAtribuicao
    Left = 328
    Top = 232
  end
end
