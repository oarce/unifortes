unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Enumeradores, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLParser, RLFilters,
  RLPDFFilter;

type

  TfrmRelatorios = class(TForm)
    repAgrupado: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    lblFiltroAgrupado: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    qryAgrupado: TFDQuery;
    qryAgrupadoID: TIntegerField;
    qryAgrupadoDISCIPLINAS_ID: TIntegerField;
    qryAgrupadoPROFESSORES_ID: TIntegerField;
    qryAgrupadoNOTA_1: TBCDField;
    qryAgrupadoNOTA_2: TBCDField;
    qryAgrupadoNOTA_TRAB: TBCDField;
    qryAgrupadoDIS_NOME: TStringField;
    qryAgrupadoPRO_NOME: TStringField;
    dtsAgrupado: TDataSource;
    qryAgrupadoALUNOS_ID: TIntegerField;
    qryAgrupadoALU_NOME: TStringField;
    qryAgrupadoMEDIA: TBCDField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLBand7: TRLBand;
    lblSituacao: TRLLabel;
    RLLabel4: TRLLabel;
    repAlunosProfessor: TRLReport;
    RLBand8: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLBand9: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel12: TRLLabel;
    RLBand10: TRLBand;
    RLLabel13: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand11: TRLBand;
    RLDBText1: TRLDBText;
    lblFiltro: TRLLabel;
    dtsAlunosProfessor: TDataSource;
    qryAlunosProfessor: TFDQuery;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    RLDetailGrid1: TRLDetailGrid;
    RLLabel17: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel23: TRLLabel;
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FTipo: TTipoRelatorio;
    FFiltro: TFiltroRelatorio;
  public
    procedure Imprimir;
    constructor Create(AOwner: TComponent; eTipo: TTipoRelatorio; eFiltro: TFiltroRelatorio); reintroduce;
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses uDefRelatorios;

{$R *.dfm}

constructor TfrmRelatorios.Create(AOwner: TComponent; eTipo: TTipoRelatorio; eFiltro: TFiltroRelatorio);
begin
  inherited Create(AOwner);
  FTipo   := eTipo;
  FFiltro := eFiltro;
end;

procedure TfrmRelatorios.Imprimir;
var
  sDescFiltro: string;
begin
  case FFiltro of
    frelAprovados:  sDescFiltro := 'Filtro: APROVADOS';
    frelReprovados: sDescFiltro := 'Filtro: REPROVADOS';
  else
    sDescFiltro := 'Filtro: TODOS';
  end;

  case FTipo of
    relAgrupado:
    begin
      qryAgrupado.Close;
      qryAgrupado.SQL.Clear;
      qryAgrupado.SQL.Add('SELECT N.ID                                            ');
      qryAgrupado.SQL.Add('     , N.ALUNOS_ID                                     ');
      qryAgrupado.SQL.Add('     , AL.ALU_NOME                                     ');
      qryAgrupado.SQL.Add('     , A.DISCIPLINAS_ID                                ');
      qryAgrupado.SQL.Add('     , D.DIS_NOME                                      ');
      qryAgrupado.SQL.Add('     , A.PROFESSORES_ID                                ');
      qryAgrupado.SQL.Add('     , P.PRO_NOME                                      ');
      qryAgrupado.SQL.Add('     , N.NOTA_1                                        ');
      qryAgrupado.SQL.Add('     , N.NOTA_2                                        ');
      qryAgrupado.SQL.Add('     , N.NOTA_TRAB                                     ');
      qryAgrupado.SQL.Add('     , ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) MEDIA ');
      qryAgrupado.SQL.Add('FROM AULAS N                                           ');
      qryAgrupado.SQL.Add('INNER JOIN ALUNOS      AL ON N.ALUNOS_ID = AL.ID       ');
      qryAgrupado.SQL.Add('INNER JOIN ATRIBUICAO  A  ON N.ATRIBUICAO_ID = A.ID    ');
      qryAgrupado.SQL.Add('INNER JOIN PROFESSORES P  ON A.PROFESSORES_ID = P.ID   ');
      qryAgrupado.SQL.Add('INNER JOIN DISCIPLINAS D  ON A.DISCIPLINAS_ID = D.ID   ');
      case FFiltro of
        frelAprovados:  qryAgrupado.SQL.Add('WHERE ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) >= 7.00 ');
        frelReprovados: qryAgrupado.SQL.Add('WHERE ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) < 7.00  ');
      end;
      qryAgrupado.SQL.Add('ORDER BY N.ALUNOS_ID, AL.ALU_NOME, D.DIS_NOME          ');
      qryAgrupado.Open;

      lblFiltroAgrupado.Caption := sDescFiltro;
      repAgrupado.Prepare;
      repAgrupado.Preview;
    end;
    relAlunosProfessor:
    begin
      qryAlunosProfessor.Close;
      qryAlunosProfessor.SQL.Clear;
      qryAlunosProfessor.SQL.Add('SELECT N.ALUNOS_ID                                     ');
      qryAlunosProfessor.SQL.Add('     , AL.ALU_NOME                                     ');
      qryAlunosProfessor.SQL.Add('     , A.PROFESSORES_ID                                ');
      qryAlunosProfessor.SQL.Add('     , P.PRO_NOME                                      ');
      qryAlunosProfessor.SQL.Add('FROM AULAS N                                           ');
      qryAlunosProfessor.SQL.Add('INNER JOIN ALUNOS      AL ON N.ALUNOS_ID = AL.ID       ');
      qryAlunosProfessor.SQL.Add('INNER JOIN ATRIBUICAO  A  ON N.ATRIBUICAO_ID = A.ID    ');
      qryAlunosProfessor.SQL.Add('INNER JOIN PROFESSORES P  ON A.PROFESSORES_ID = P.ID   ');
      qryAlunosProfessor.SQL.Add('INNER JOIN DISCIPLINAS D  ON A.DISCIPLINAS_ID = D.ID   ');
      case FFiltro of
        frelAprovados:  qryAlunosProfessor.SQL.Add('WHERE ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) >= 7.00 ');
        frelReprovados: qryAlunosProfessor.SQL.Add('WHERE ((N.NOTA_1 + N.NOTA_2 + N.NOTA_TRAB) / 3) < 7.00  ');
      end;
      qryAlunosProfessor.SQL.Add('GROUP BY N.ALUNOS_ID, AL.ALU_NOME, A.PROFESSORES_ID, P.PRO_NOME ');
      qryAlunosProfessor.SQL.Add('ORDER BY A.PROFESSORES_ID, P.PRO_NOME, AL.ALU_NOME      ');
      qryAlunosProfessor.Open;

      lblFiltro.Caption := sDescFiltro;
      repAlunosProfessor.Prepare;
      repAlunosProfessor.Preview;
    end;
  end;
end;

procedure TfrmRelatorios.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if qryAgrupadoMEDIA.AsCurrency >= 7.00 then
  begin
    lblSituacao.Caption    := 'APROVADO';
    lblSituacao.Font.Color := clNavy;
  end
  else
  begin
    lblSituacao.Caption    := 'REPROVADO';
    lblSituacao.Font.Color := clRed;
  end;
end;

end.
