object frmControleAulas: TfrmControleAulas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Controle Aulas e Notas'
  ClientHeight = 594
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 350
    Width = 1014
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 379
    ExplicitWidth = 997
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 35
    Align = alTop
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 14
      Top = 7
      Width = 100
      Height = 17
      Caption = 'Lisrta de Alunos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6640172
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grdAlunos: TDBGrid
    Left = 0
    Top = 35
    Width = 1014
    Height = 315
    Align = alClient
    DataSource = dtsAlunos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3355443
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
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
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALU_NOME'
        Width = 461
        Visible = True
      end>
  end
  object pnlAulas: TPanel
    Left = 0
    Top = 360
    Width = 1014
    Height = 234
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1014
      234)
    object btnIncluir: TBitBtn
      Left = 8
      Top = 5
      Width = 123
      Height = 34
      Caption = 'Incluir Aula/Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnExcluir: TBitBtn
      Left = 280
      Top = 5
      Width = 136
      Height = 34
      Caption = 'Excluir Aula/Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnAlterar: TBitBtn
      Left = 138
      Top = 5
      Width = 136
      Height = 34
      Caption = 'Alterar Aula/Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object grdAulas: TDBGrid
      Left = 0
      Top = 42
      Width = 1014
      Height = 192
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsAula
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
          FieldName = 'DIS_NOME'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTA_1'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTA_2'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTA_TRAB'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_NOME'
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISCIPLINAS_ID'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROFESSORES_ID'
          Visible = True
        end>
    end
  end
  object qryAlunos: TFDQuery
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT ID'
      '     , ALU_NOME'
      'FROM ALUNOS  ')
    Left = 640
    Top = 176
    object qryAlunosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAlunosALU_NOME: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'ALU_NOME'
      Size = 70
    end
  end
  object dtsAlunos: TDataSource
    DataSet = qryAlunos
    OnDataChange = dtsAlunosDataChange
    Left = 664
    Top = 168
  end
  object qryAula: TFDQuery
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT N.ID'
      '     , A.DISCIPLINAS_ID'
      '     , D.DIS_NOME'
      '     , A.PROFESSORES_ID'
      '     , P.PRO_NOME'
      '     , N.NOTA_1'
      '     , N.NOTA_2'
      '     , N.NOTA_TRAB'
      'FROM AULAS N'
      'INNER JOIN ATRIBUICAO  A ON N.ATRIBUICAO_ID = A.ID'
      'INNER JOIN PROFESSORES P ON A.PROFESSORES_ID = P.ID'
      'INNER JOIN DISCIPLINAS D ON A.DISCIPLINAS_ID = D.ID'
      'WHERE N.ALUNOS_ID = :ALUNOS_ID'
      'ORDER BY D.DIS_NOME')
    Left = 672
    Top = 440
    ParamData = <
      item
        Name = 'ALUNOS_ID'
        ParamType = ptInput
      end>
    object qryAulaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAulaDISCIPLINAS_ID: TIntegerField
      DisplayLabel = 'ID Discip.'
      FieldName = 'DISCIPLINAS_ID'
    end
    object qryAulaPROFESSORES_ID: TIntegerField
      DisplayLabel = 'ID Prof.'
      FieldName = 'PROFESSORES_ID'
    end
    object qryAulaNOTA_1: TBCDField
      DisplayLabel = 'Nota 1'#186' Per.'
      FieldName = 'NOTA_1'
      DisplayFormat = '###,###,##0.00'
      Size = 2
    end
    object qryAulaNOTA_2: TBCDField
      DisplayLabel = 'Nota 2'#186' Per.'
      FieldName = 'NOTA_2'
      DisplayFormat = '###,###,##0.00'
      Size = 2
    end
    object qryAulaNOTA_TRAB: TBCDField
      DisplayLabel = 'Nota Trabalho'
      FieldName = 'NOTA_TRAB'
      DisplayFormat = '###,###,##0.00'
      Size = 2
    end
    object qryAulaDIS_NOME: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DIS_NOME'
      Size = 70
    end
    object qryAulaPRO_NOME: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PRO_NOME'
      Size = 70
    end
  end
  object dtsAula: TDataSource
    DataSet = qryAula
    Left = 704
    Top = 440
  end
end
