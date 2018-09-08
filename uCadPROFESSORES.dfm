inherited frmCadPROFESSORES: TfrmCadPROFESSORES
  Caption = 'frmCadPROFESSORES'
  ClientWidth = 588
  ExplicitWidth = 604
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 74
    Top = 77
    Width = 119
    Height = 17
    Caption = 'Nome do Professor'
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
    Width = 588
    ExplicitWidth = 588
    inherited btnGravar: TBitBtn
      Left = 437
      ExplicitLeft = 437
    end
    inherited btnCancelar: TBitBtn
      Left = 512
      ExplicitLeft = 512
    end
  end
  object edtDIS_NOME: TDBEdit [4]
    Left = 74
    Top = 96
    Width = 495
    Height = 21
    CharCase = ecUpperCase
    DataField = 'PRO_NOME'
    DataSource = dtsTabela
    TabOrder = 2
  end
  inherited qryTabela: TFDQuery
    object qryTabelaPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 70
    end
  end
end
