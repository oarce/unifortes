unit uCadDISCIPLINAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase, FireDAC.Stan.Param, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmCadDISCIPLINAS = class(TfrmCadBase)
    qryTabelaDIS_NOME: TStringField;
    edtDIS_NOME: TDBEdit;
    Label1: TLabel;
    grdPesquisa: TDBGrid;
    qryProfessores: TFDQuery;
    IntegerField1: TIntegerField;
    dtsProfessores: TDataSource;
    qryProfessoresPRO_NOME: TStringField;
    cboProfessores: TDBLookupComboBox;
    Label2: TLabel;
    btnIncluir: TButton;
    btnExcluir: TButton;
    qryAtribuicao: TFDQuery;
    qryAtribuicaoID: TIntegerField;
    qryAtribuicaoPRO_NOME: TStringField;
    dtsATRIBUICAO: TDataSource;
    qryAtribuicaoDISCIPLINAS_ID: TIntegerField;
    qryAtribuicaoPROFESSORES_ID: TIntegerField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure qryAtribuicaoBeforeApplyUpdates(DataSet: TFDDataSet);
  private

  protected
    procedure setParametros; override;
    procedure ValidarCampos; override;
    procedure CarregarDadosFilhos; override;
    procedure SalvarTabelaFilha; override;
  public

  end;

var
  frmCadDISCIPLINAS: TfrmCadDISCIPLINAS;

implementation

uses Util, uPrincipal;

{$R *.dfm}

procedure TfrmCadDISCIPLINAS.btnExcluirClick(Sender: TObject);
begin
  inherited;
  qryAtribuicao.Delete;
end;

procedure TfrmCadDISCIPLINAS.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TUF.Validar((cboProfessores.Text = ''), 'Informe o Professor antes de incluir!', cboProfessores);
  qryAtribuicao.Append;
  qryAtribuicaoPROFESSORES_ID.AsInteger := cboProfessores.KeyValue;
  qryAtribuicaoPRO_NOME.AsString        := cboProfessores.Text;
  qryAtribuicao.Post;
end;

procedure TfrmCadDISCIPLINAS.CarregarDadosFilhos;
begin
  inherited;
  qryProfessores.Open;

  qryAtribuicao.Close;
  qryAtribuicao.ParamByName('DISCIPLINAS_ID').AsInteger := qryTabelaID.AsInteger;
  qryAtribuicao.Open;

  btnIncluir.Enabled := Self.EmEdicao;
  btnExcluir.Enabled := Self.EmEdicao;
end;

procedure TfrmCadDISCIPLINAS.qryAtribuicaoBeforeApplyUpdates(DataSet: TFDDataSet);
begin
  inherited;
  qryAtribuicao.First;
  while not qryAtribuicao.Eof do
  begin
    if (qryAtribuicaoID.AsInteger = 0) or (qryAtribuicaoDISCIPLINAS_ID.AsInteger = 0) then
    begin
      qryAtribuicao.Edit;
      if (qryAtribuicaoDISCIPLINAS_ID.AsInteger = 0) then
        qryAtribuicaoDISCIPLINAS_ID.AsInteger := qryTabelaID.AsInteger;
      if (qryAtribuicaoID.AsInteger = 0) then
        qryAtribuicaoID.AsInteger := CONEXAO.NovoID('SEQ_ATRIBUICAO');
      qryAtribuicao.Post;
    end;
    qryAtribuicao.Next;
  end;
end;

procedure TfrmCadDISCIPLINAS.SalvarTabelaFilha;
begin
  inherited;
  qryAtribuicao.ApplyUpdates;
end;

procedure TfrmCadDISCIPLINAS.setParametros;
begin
  inherited;
  FOutrosCampos := 'DIS_NOME';
end;

procedure TfrmCadDISCIPLINAS.ValidarCampos;
begin
  inherited;
  TUF.Validar((edtDIS_NOME.Text = ''), 'Informe a descrição antes de gravar!', edtDIS_NOME);
end;

end.
