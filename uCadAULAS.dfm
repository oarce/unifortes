inherited frmCadAULAS: TfrmCadAULAS
  Caption = 'frmCadAULAS'
  ClientHeight = 255
  ClientWidth = 669
  ExplicitWidth = 685
  ExplicitHeight = 294
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [1]
    Left = 19
    Top = 130
    Width = 262
    Height = 17
    Caption = 'Disciplina / Professor (Atribui'#231#227'o de Aula)'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 77
    Top = 79
    Width = 125
    Height = 17
    Caption = 'ID - Nome do Aluno'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblAluno: TLabel [3]
    Left = 77
    Top = 97
    Width = 46
    Height = 21
    Caption = 'Aluno'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel [4]
    Left = 19
    Top = 182
    Width = 41
    Height = 17
    Caption = 'Nota 1'
    FocusControl = edtNOTA_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [5]
    Left = 131
    Top = 182
    Width = 41
    Height = 17
    Caption = 'Nota 2'
    FocusControl = edtNOTA_2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [6]
    Left = 241
    Top = 182
    Width = 88
    Height = 17
    Caption = 'Nota Trabalho'
    FocusControl = edtNOTA_TRAB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [7]
    Left = 367
    Top = 201
    Width = 31
    Height = 21
    Caption = '0.00'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel [8]
    Left = 365
    Top = 182
    Width = 38
    Height = 17
    Caption = 'M'#233'dia'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  inherited pnlTittle: TPanel
    Width = 669
    ExplicitWidth = 669
    inherited btnGravar: TBitBtn
      Left = 518
      ExplicitLeft = 518
    end
    inherited btnCancelar: TBitBtn
      Left = 593
      ExplicitLeft = 593
    end
  end
  object cboProfessores: TDBLookupComboBox [11]
    Left = 19
    Top = 149
    Width = 630
    Height = 21
    DataField = 'ATRIBUICAO_ID'
    DataSource = dtsTabela
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = dtsATRIBUICAO
    TabOrder = 2
  end
  object edtNOTA_1: TDBEdit [12]
    Left = 19
    Top = 202
    Width = 104
    Height = 21
    DataField = 'NOTA_1'
    DataSource = dtsTabela
    TabOrder = 3
  end
  object edtNOTA_2: TDBEdit [13]
    Left = 131
    Top = 202
    Width = 104
    Height = 21
    DataField = 'NOTA_2'
    DataSource = dtsTabela
    TabOrder = 4
  end
  object edtNOTA_TRAB: TDBEdit [14]
    Left = 241
    Top = 202
    Width = 104
    Height = 21
    DataField = 'NOTA_TRAB'
    DataSource = dtsTabela
    TabOrder = 5
  end
  inherited qryTabela: TFDQuery
    OnNewRecord = qryTabelaNewRecord
    object qryTabelaALUNOS_ID: TIntegerField
      FieldName = 'ALUNOS_ID'
    end
    object qryTabelaATRIBUICAO_ID: TIntegerField
      FieldName = 'ATRIBUICAO_ID'
    end
    object qryTabelaNOTA_1: TBCDField
      FieldName = 'NOTA_1'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryTabelaNOTA_2: TBCDField
      FieldName = 'NOTA_2'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryTabelaNOTA_TRAB: TBCDField
      FieldName = 'NOTA_TRAB'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
  end
  object qryAtribuicao: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT A.ID'
      '     , A.DISCIPLINAS_ID'
      '     , A.PROFESSORES_ID'
      
        '     , (D.DIS_NOME || '#39' - Professor: '#39' || P.PRO_NOME) AS DESCRIC' +
        'AO'
      'FROM ATRIBUICAO A'
      'INNER JOIN PROFESSORES P ON A.PROFESSORES_ID = P.ID'
      'INNER JOIN DISCIPLINAS D ON A.DISCIPLINAS_ID = D.ID'
      'ORDER BY D.DIS_NOME')
    Left = 448
    Top = 128
    object qryAtribuicaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAtribuicaoDISCIPLINAS_ID: TIntegerField
      FieldName = 'DISCIPLINAS_ID'
    end
    object qryAtribuicaoPROFESSORES_ID: TIntegerField
      DisplayLabel = 'ID Prof.'
      FieldName = 'PROFESSORES_ID'
    end
    object qryAtribuicaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object dtsATRIBUICAO: TDataSource
    DataSet = qryAtribuicao
    Left = 480
    Top = 128
  end
end
