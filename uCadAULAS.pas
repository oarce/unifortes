unit uCadAULAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase, FireDAC.Stan.Param,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmCadAULAS = class(TfrmCadBase)
    qryAtribuicao: TFDQuery;
    qryAtribuicaoID: TIntegerField;
    qryAtribuicaoDISCIPLINAS_ID: TIntegerField;
    qryAtribuicaoPROFESSORES_ID: TIntegerField;
    dtsATRIBUICAO: TDataSource;
    Label2: TLabel;
    cboProfessores: TDBLookupComboBox;
    Label1: TLabel;
    lblAluno: TLabel;
    qryAtribuicaoDESCRICAO: TStringField;
    Label6: TLabel;
    edtNOTA_1: TDBEdit;
    edtNOTA_2: TDBEdit;
    Label3: TLabel;
    qryTabelaALUNOS_ID: TIntegerField;
    qryTabelaATRIBUICAO_ID: TIntegerField;
    qryTabelaNOTA_1: TBCDField;
    qryTabelaNOTA_2: TBCDField;
    qryTabelaNOTA_TRAB: TBCDField;
    Label4: TLabel;
    edtNOTA_TRAB: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    procedure qryTabelaNewRecord(DataSet: TDataSet);
  private
    FIDAluno: Integer;
    FDescAluno: string;
    procedure SetIDAluno(const Value: Integer);
    procedure SetDescAluno(const Value: string);
  protected
    procedure setParametros; override;
    procedure ValidarCampos; override;
    procedure ShowCaptions; override;
    procedure CarregarDadosFilhos; override;
  public
    property IDAluno: Integer read FIDAluno write SetIDAluno;
    property DescAluno: string read FDescAluno write SetDescAluno;
  end;

var
  frmCadAULAS: TfrmCadAULAS;

implementation

uses Util, Enumeradores, uPrincipal;

{$R *.dfm}

procedure TfrmCadAULAS.CarregarDadosFilhos;
begin
  inherited;
  qryAtribuicao.Open;
end;

procedure TfrmCadAULAS.qryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryTabelaALUNOS_ID.AsInteger  := FIDAluno;
  qryTabelaNOTA_1.AsCurrency    := 0.00;
  qryTabelaNOTA_2.AsCurrency    := 0.00;
  qryTabelaNOTA_TRAB.AsCurrency := 0.00;
end;

procedure TfrmCadAULAS.SetDescAluno(const Value: string);
begin
  FDescAluno := Value;
end;

procedure TfrmCadAULAS.SetIDAluno(const Value: Integer);
begin
  FIDAluno := Value;
end;

procedure TfrmCadAULAS.setParametros;
begin
  inherited;
  FOutrosCampos := 'ALUNOS_ID '
               +LB+' , T.ATRIBUICAO_ID '
               +LB+' , T.NOTA_1 '
               +LB+' , T.NOTA_2 '
               +LB+' , T.NOTA_TRAB ';
end;

procedure TfrmCadAULAS.ShowCaptions;
begin
  inherited;
  lblAluno.Caption := IntToStr(FIDAluno) +' - '+ FDescAluno;
end;

procedure TfrmCadAULAS.ValidarCampos;
var
  qryValidar: TFDQuery;
begin
  inherited;
  TUF.Validar((cboProfessores.Text = ''), 'Informe a Disciplina/Professor antes de incluir!', cboProfessores);

  qryValidar := CONEXAO.CreateQuery(Self);
  try
    qryValidar.SQL.Add('SELECT COUNT(ID) QTD                 ');
    qryValidar.SQL.Add('FROM AULAS                           ');
    qryValidar.SQL.Add('WHERE ALUNOS_ID = :ALUNOS_ID         ');
    qryValidar.SQL.Add('AND   ATRIBUICAO_ID = :ATRIBUICAO_ID ');
    if FAcao = taAlterar then
       qryValidar.SQL.Add('AND  ID <> '+ qryTabelaID.AsString );
    qryValidar.ParamByName('ALUNOS_ID').AsInteger := FIDAluno;
    qryValidar.ParamByName('ATRIBUICAO_ID').AsInteger := cboProfessores.KeyValue;
    qryValidar.Open;

    TUF.Validar((qryValidar.FieldByName('QTD').AsInteger > 0), 'Aluno já está matriculado nesta disciplina!', cboProfessores);
  finally
    FreeAndNil(qryValidar);
  end;
end;

end.
