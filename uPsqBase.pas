unit uPsqBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Enumeradores,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Menus, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Math, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls, Vcl.Grids,
  FireDAC.Phys, Vcl.Buttons, Tabelas, uCadBase, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmPsqBase = class(TForm)
    pnl1: TPanel;
    dtsPesquisa: TDataSource;
    spwMenu: TSplitView;
    lvwActions: TListView;
    pnl2: TPanel;
    qryPesquisa: TFDQuery;
    edtDescricao: TEdit;
    lblDescricao: TLabel;
    qryPesquisaID: TIntegerField;
    grdPesquisa: TDBGrid;
    btnFiltrar: TBitBtn;
    qryPesquisaCAMPO_PESQUISA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure lvwActionsClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private

  protected
    FFiltros: String;
    FTabelaClass: TTabelaClass;
    FTabela: TTabela;
    FInfoTabela: TInfoTabela;
    FfrmCadastro: TfrmCadBase;
    procedure CriarCadastro(aAcao: TAcao);
    procedure CarregarPesquisa; virtual;
    procedure Incluir; virtual;
    procedure Alterar; virtual;
    procedure Deletar; virtual;
    procedure Visualizar; virtual;
  public
    constructor Create(AOwner: TComponent; eTabelaClass: TTabelaClass); overload;
  end;

var
  frmPsqBase: TfrmPsqBase;

implementation

{$R *.dfm}

uses uPrincipal, Util, uCadDISCIPLINAS, uCadDALUNOS, uCadPROFESSORES;

procedure TfrmPsqBase.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  CarregarPesquisa;
end;

constructor TfrmPsqBase.Create(AOwner: TComponent; eTabelaClass: TTabelaClass);
begin
  inherited Create(AOwner);
  FTabela        := eTabelaClass.Create(Self);
  FTabelaClass   := eTabelaClass;
  FInfoTabela    := TUF.CarregarInfoTabela(FTabela);
  spwMenu.Opened := True;
end;

procedure TfrmPsqBase.CriarCadastro(aAcao: TAcao);
begin
   if FTabelaClass.ClassName = 'TDisciplinas' then
     FfrmCadastro := TfrmCadDISCIPLINAS.Create(Self, FInfoTabela, aAcao, qryPesquisaID.AsInteger)
   else if FTabelaClass.ClassName = 'TAlunos' then
     FfrmCadastro := TfrmCadALUNOS.Create(Self, FInfoTabela, aAcao, qryPesquisaID.AsInteger)
   else if FTabelaClass.ClassName = 'TProfessores' then
     FfrmCadastro := TfrmCadPROFESSORES.Create(Self, FInfoTabela, aAcao, qryPesquisaID.AsInteger);
end;

procedure TfrmPsqBase.Deletar;
begin
  TUF.Validar(qryPesquisa.IsEmpty, 'Não há registros para esta operação!');
  if TUFMsg.PerguntaSimNao('Confirma a exclusão do registro ID: '+ qryPesquisaID.AsString + '?') then
  begin
    try
      CONEXAO.StartTrans;
      qryPesquisa.Delete;
      CONEXAO.Commit;

      CarregarPesquisa;
    except
      on E: Exception do
      begin
        CONEXAO.Rollback;
        TUFMsg.Msg(E, 'Falha ao excluir: '+ FInfoTabela.cCaption +'.');
      end;
    end;
  end;
end;

procedure TfrmPsqBase.FormShow(Sender: TObject);
begin
  Self.Caption := 'Consulta ['+ FInfoTabela.cCaption +']';
  lblDescricao.Caption := FInfoTabela.cCaption;
  grdPesquisa.Columns.Items[1].Title.Caption := FInfoTabela.cCaption;

  CarregarPesquisa;
  TUF.FocarComponente(edtDescricao);
end;

procedure TfrmPsqBase.Incluir;
begin
  CriarCadastro(taNovo);
  try
    FfrmCadastro.ShowModal;
  finally
    FreeAndNil(FfrmCadastro);
  end;
end;

procedure TfrmPsqBase.lvwActionsClick(Sender: TObject);
begin
  case lvwActions.ItemIndex of
    0: Incluir;
    1: Alterar;
    2: Deletar;
    3: Visualizar;
  end;
  if (lvwActions.ItemIndex in [0,1,2,3]) then
    CarregarPesquisa;
end;

procedure TfrmPsqBase.CarregarPesquisa;
begin
  if (Trim(edtDescricao.Text) <> '') and (FInfoTabela.cCampoPesquisa <> '') then
    FFiltros := ' WHERE T.'+ FInfoTabela.cCampoPesquisa +' LIKE ''%'+ edtDescricao.Text +'%'' ';

  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT T.ID                    ');
  qryPesquisa.SQL.Add('     , T.'+ FInfoTabela.cCampoPesquisa +' CAMPO_PESQUISA ');
  qryPesquisa.SQL.Add('FROM '+ FInfoTabela.cNome +' T ');
  qryPesquisa.SQL.Add( FFiltros                        );
  qryPesquisa.SQL.Add('ORDER BY T.ID                  ');
  qryPesquisa.Open;
end;

procedure TfrmPsqBase.Alterar;
begin
  TUF.Validar(qryPesquisa.IsEmpty, 'Não há registros para esta operação!');
  CriarCadastro(taAlterar);
  try
    FfrmCadastro.ShowModal;
  finally
    FreeAndNil(FfrmCadastro);
  end;
end;

procedure TfrmPsqBase.Visualizar;
begin
  TUF.Validar(qryPesquisa.IsEmpty, 'Não há registros para esta operação!');
  CriarCadastro(taVisualizar);
  try
    FfrmCadastro.ShowModal;
  finally
    FreeAndNil(FfrmCadastro);
  end;
end;

end.
