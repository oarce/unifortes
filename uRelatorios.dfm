object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  Caption = 'frmRelatorios'
  ClientHeight = 672
  ClientWidth = 1160
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object repAgrupado: TRLReport
    Left = 29
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsAgrupado
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 19
      BandType = btHeader
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 2
        Width = 39
        Height = 16
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 199
      Width = 718
      Height = 20
      BandType = btFooter
      object RLSystemInfo4: TRLSystemInfo
        Left = 679
        Top = 1
        Width = 37
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 625
        Top = 2
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 57
      Width = 718
      Height = 45
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 187
        Top = 4
        Width = 322
        Height = 22
        Caption = 'M'#201'DIAS AGRUPADAS POR ALUNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFiltroAgrupado: TRLLabel
        Left = 5
        Top = 27
        Width = 46
        Height = 16
        Caption = 'lblFiltro'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 121
      Width = 718
      Height = 78
      DataFields = 'ALUNOS_ID'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLDBText2: TRLDBText
          Left = 50
          Top = 1
          Width = 639
          Height = 16
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'ALU_NOME'
          DataSource = dtsAgrupado
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 8
          Top = 1
          Width = 38
          Height = 15
          Caption = 'Aluno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 19
        Width = 718
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        BeforePrint = RLBand5BeforePrint
        object RLDBText3: TRLDBText
          Left = 12
          Top = 0
          Width = 205
          Height = 14
          AutoSize = False
          DataField = 'DIS_NOME'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 227
          Top = 0
          Width = 180
          Height = 14
          AutoSize = False
          DataField = 'PRO_NOME'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 411
          Top = 0
          Width = 56
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'NOTA_1'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 468
          Top = 0
          Width = 52
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'NOTA_2'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 525
          Top = 0
          Width = 56
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'NOTA_TRAB'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 582
          Top = 0
          Width = 50
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'MEDIA'
          DataSource = dtsAgrupado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object lblSituacao: TRLLabel
          Left = 640
          Top = 0
          Width = 75
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Situa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 34
        Width = 718
        Height = 5
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 102
      Width = 718
      Height = 19
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel5: TRLLabel
        Left = 13
        Top = 2
        Width = 57
        Height = 15
        Caption = 'Disciplina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 411
        Top = 2
        Width = 56
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nota 1'#170
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 468
        Top = 2
        Width = 52
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nota 2'#170
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 525
        Top = 2
        Width = 56
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 582
        Top = 2
        Width = 50
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'M'#233'dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 639
        Top = 2
        Width = 75
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 227
        Top = 1
        Width = 55
        Height = 15
        Caption = 'Professor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
    end
  end
  object repAlunosProfessor: TRLReport
    Left = 206
    Top = 260
    Width = 794
    Height = 1123
    DataSource = dtsAlunosProfessor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand8: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 19
      BandType = btHeader
      object RLSystemInfo2: TRLSystemInfo
        Left = 3
        Top = 2
        Width = 39
        Height = 16
        Text = ''
      end
    end
    object RLBand9: TRLBand
      Left = 38
      Top = 180
      Width = 718
      Height = 20
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 679
        Top = 1
        Width = 37
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 625
        Top = 2
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
      end
    end
    object RLBand10: TRLBand
      Left = 38
      Top = 57
      Width = 718
      Height = 45
      BandType = btTitle
      object RLLabel13: TRLLabel
        Left = 234
        Top = 6
        Width = 255
        Height = 22
        Caption = 'ALUNOS POR PROFESSOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFiltro: TRLLabel
        Left = 5
        Top = 27
        Width = 46
        Height = 16
      end
    end
    object RLGroup2: TRLGroup
      Left = 38
      Top = 102
      Width = 718
      Height = 78
      DataFields = 'PROFESSORES_ID'
      object RLBand11: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 67
          Top = 1
          Width = 631
          Height = 16
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'PRO_NOME'
          DataSource = dtsAlunosProfessor
          Text = ''
        end
        object RLLabel23: TRLLabel
          Left = 10
          Top = 2
          Width = 55
          Height = 15
          Caption = 'Professor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
        end
      end
      object RLDetailGrid1: TRLDetailGrid
        Left = 0
        Top = 19
        Width = 718
        Height = 19
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        ColCount = 3
        object RLLabel17: TRLLabel
          Left = 5
          Top = 1
          Width = 38
          Height = 15
          Caption = 'Aluno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 46
          Top = 1
          Width = 188
          Height = 14
          AutoSize = False
          DataField = 'ALU_NOME'
          DataSource = dtsAlunosProfessor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
    end
  end
  object qryAgrupado: TFDQuery
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT N.ID'
      '     , N.ALUNOS_ID'
      '     , AL.ALU_NOME'
      '     , A.DISCIPLINAS_ID'
      '     , D.DIS_NOME'
      '     , A.PROFESSORES_ID'
      '     , P.PRO_NOME'
      '     , N.NOTA_1'
      '     , N.NOTA_2'
      '     , N.NOTA_TRAB'
      '     , ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) MEDIA'
      'FROM AULAS N'
      'INNER JOIN ALUNOS      AL ON N.ALUNOS_ID = AL.ID'
      'INNER JOIN ATRIBUICAO  A  ON N.ATRIBUICAO_ID = A.ID'
      'INNER JOIN PROFESSORES P  ON A.PROFESSORES_ID = P.ID'
      'INNER JOIN DISCIPLINAS D  ON A.DISCIPLINAS_ID = D.ID'
      'WHERE  ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) >= :VLR_MEDIA'
      'ORDER BY N.ALUNOS_ID, AL.ALU_NOME, D.DIS_NOME')
    Left = 840
    Top = 24
    ParamData = <
      item
        Name = 'VLR_MEDIA'
        ParamType = ptInput
      end>
    object qryAgrupadoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgrupadoDISCIPLINAS_ID: TIntegerField
      DisplayLabel = 'ID Discip.'
      FieldName = 'DISCIPLINAS_ID'
    end
    object qryAgrupadoPROFESSORES_ID: TIntegerField
      DisplayLabel = 'ID Prof.'
      FieldName = 'PROFESSORES_ID'
    end
    object qryAgrupadoNOTA_1: TBCDField
      DisplayLabel = 'Nota 1'#186' Per.'
      FieldName = 'NOTA_1'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryAgrupadoNOTA_2: TBCDField
      DisplayLabel = 'Nota 2'#186' Per.'
      FieldName = 'NOTA_2'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryAgrupadoNOTA_TRAB: TBCDField
      DisplayLabel = 'Nota Trabalho'
      FieldName = 'NOTA_TRAB'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryAgrupadoMEDIA: TBCDField
      FieldName = 'MEDIA'
      DisplayFormat = '###,##0.00'
      Size = 2
    end
    object qryAgrupadoDIS_NOME: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DIS_NOME'
      Size = 70
    end
    object qryAgrupadoPRO_NOME: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PRO_NOME'
      Size = 70
    end
    object qryAgrupadoALUNOS_ID: TIntegerField
      FieldName = 'ALUNOS_ID'
    end
    object qryAgrupadoALU_NOME: TStringField
      FieldName = 'ALU_NOME'
      Size = 70
    end
  end
  object dtsAgrupado: TDataSource
    DataSet = qryAgrupado
    Left = 872
    Top = 24
  end
  object dtsAlunosProfessor: TDataSource
    DataSet = qryAlunosProfessor
    Left = 952
    Top = 232
  end
  object qryAlunosProfessor: TFDQuery
    Connection = frmPrincipal.conConexao
    SQL.Strings = (
      'SELECT N.ID'
      '     , N.ALUNOS_ID'
      '     , AL.ALU_NOME'
      '     , A.DISCIPLINAS_ID'
      '     , D.DIS_NOME'
      '     , A.PROFESSORES_ID'
      '     , P.PRO_NOME'
      '     , N.NOTA_1'
      '     , N.NOTA_2'
      '     , N.NOTA_TRAB'
      '     , ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) MEDIA'
      'FROM AULAS N'
      'INNER JOIN ALUNOS      AL ON N.ALUNOS_ID = AL.ID'
      'INNER JOIN ATRIBUICAO  A  ON N.ATRIBUICAO_ID = A.ID'
      'INNER JOIN PROFESSORES P  ON A.PROFESSORES_ID = P.ID'
      'INNER JOIN DISCIPLINAS D  ON A.DISCIPLINAS_ID = D.ID'
      'WHERE  ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) >= :VLR_MEDIA'
      'ORDER BY N.ALUNOS_ID, AL.ALU_NOME, D.DIS_NOME')
    Left = 920
    Top = 231
    ParamData = <
      item
        Name = 'VLR_MEDIA'
        ParamType = ptInput
      end>
    object IntegerField3: TIntegerField
      DisplayLabel = 'ID Prof.'
      FieldName = 'PROFESSORES_ID'
    end
    object StringField2: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PRO_NOME'
      Size = 70
    end
    object IntegerField4: TIntegerField
      FieldName = 'ALUNOS_ID'
    end
    object StringField3: TStringField
      FieldName = 'ALU_NOME'
      Size = 70
    end
  end
end
