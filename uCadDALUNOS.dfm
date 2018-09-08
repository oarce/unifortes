inherited frmCadALUNOS: TfrmCadALUNOS
  Caption = 'frmCadALUNOS'
  ClientWidth = 586
  ExplicitWidth = 602
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 74
    Top = 77
    Width = 96
    Height = 17
    Caption = 'Nome do aluno'
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
    Width = 586
    ExplicitWidth = 586
    inherited btnGravar: TBitBtn
      Left = 435
      ExplicitLeft = 435
    end
    inherited btnCancelar: TBitBtn
      Left = 510
      ExplicitLeft = 510
    end
  end
  object edtALU_NOME: TDBEdit [4]
    Left = 74
    Top = 96
    Width = 495
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ALU_NOME'
    DataSource = dtsTabela
    TabOrder = 2
  end
  inherited qryTabela: TFDQuery
    object qryTabelaALU_NOME: TStringField
      FieldName = 'ALU_NOME'
      Size = 70
    end
  end
end
