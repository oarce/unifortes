unit uControleAulas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Param, Tabelas,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Enumeradores, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmControleAulas = class(TForm)
    pnl1: TPanel;
    qryAlunos: TFDQuery;
    qryAlunosID: TIntegerField;
    dtsAlunos: TDataSource;
    grdAlunos: TDBGrid;
    grdAulas: TDBGrid;
    pnlAulas: TPanel;
    spl1: TSplitter;
    lblDescricao: TLabel;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    qryAlunosALU_NOME: TStringField;
    qryAula: TFDQuery;
    qryAulaID: TIntegerField;
    qryAulaDISCIPLINAS_ID: TIntegerField;
    qryAulaPROFESSORES_ID: TIntegerField;
    qryAulaNOTA_1: TBCDField;
    qryAulaNOTA_2: TBCDField;
    qryAulaNOTA_TRAB: TBCDField;
    dtsAula: TDataSource;
    btnAlterar: TBitBtn;
    qryAulaDIS_NOME: TStringField;
    qryAulaPRO_NOME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dtsAlunosDataChange(Sender: TObject; Field: TField);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FInfoTabela: TInfoTabela;
    procedure CarregarAlunos;
    procedure CarregarAulas;
  public

  end;

var
  frmControleAulas: TfrmControleAulas;

implementation

uses uPrincipal, Util, uCadAULAS, tbl.Aulas;

{$R *.dfm}

procedure TfrmControleAulas.btnAlterarClick(Sender: TObject);
var
  frmAula: TfrmCadAULAS;
begin
  FInfoTabela := TUF.CarregarInfoTabela(TAulas.Create(Self));
  frmAula := TfrmCadAULAS.Create(Self, FInfoTabela, taAlterar, qryAulaID.AsInteger);
  try
    frmAula.IDAluno   := qryAlunosID.AsInteger;
    frmAula.DescAluno := qryAlunosALU_NOME.AsString;
    frmAula.ShowModal;
    CarregarAulas;
  finally
    FreeAndNil(frmAula);
  end;
end;

procedure TfrmControleAulas.btnExcluirClick(Sender: TObject);
begin
  TUF.Validar(qryAula.IsEmpty, 'Não há registros para esta operação!');
  if TUFMsg.PerguntaSimNao('Confirma a exclusão do registro ID: '+ qryAulaID.AsString + '?') then
  begin
    try
      CONEXAO.StartTrans;
      qryAula.Delete;
      CONEXAO.Commit;

      CarregarAulas;
    except
      on E: Exception do
      begin
        CONEXAO.Rollback;
        TUFMsg.Msg(E, 'Falha ao excluir a Aula/Nota '+ FInfoTabela.cCaption +'.');
      end;
    end;
  end;
end;

procedure TfrmControleAulas.btnIncluirClick(Sender: TObject);
var
  frmAula: TfrmCadAULAS;
begin
  FInfoTabela := TUF.CarregarInfoTabela(TAulas.Create(Self));
  frmAula := TfrmCadAULAS.Create(Self, FInfoTabela, taNovo);
  try
    frmAula.IDAluno   := qryAlunosID.AsInteger;
    frmAula.DescAluno := qryAlunosALU_NOME.AsString;
    frmAula.ShowModal;
    CarregarAulas;
  finally
    FreeAndNil(frmAula);
  end;
end;

procedure TfrmControleAulas.CarregarAlunos;
begin
  qryAlunos.Close;
  qryAlunos.Open;
end;

procedure TfrmControleAulas.CarregarAulas;
begin
  if qryAlunos.IsEmpty then
     qryAula.Close
  else
  begin
    qryAula.Close;
    qryAula.ParamByName('ALUNOS_ID').AsInteger := qryAlunosID.AsInteger;
    qryAula.Open;
  end;
end;

procedure TfrmControleAulas.dtsAlunosDataChange(Sender: TObject; Field: TField);
begin
  CarregarAulas;
  btnIncluir.Enabled := (not qryAlunos.IsEmpty);
  btnExcluir.Enabled := (not qryAlunos.IsEmpty);
end;

procedure TfrmControleAulas.FormShow(Sender: TObject);
begin
  CarregarAlunos;
end;

end.
