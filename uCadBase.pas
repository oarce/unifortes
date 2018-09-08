unit uCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Enumeradores,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Param, Vcl.ComCtrls,   Data.DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.OleCtrls,  Vcl.ExtCtrls, FireDAC.Comp.Client, Vcl.Mask, Vcl.Buttons,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmCadBase = class(TForm)
    dtsTabela: TDataSource;
    qryTabela: TFDQuery;
    qryTabelaID: TIntegerField;
    pnlTittle: TPanel;
    lblTitleEntity: TLabel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    edtID: TDBEdit;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FID: Integer;
    procedure MontaSQL;
    procedure CarregarDados;
  protected
    FAcao: TAcao;
    FInfoTabela: TInfoTabela;
    FOutrosCampos: string;
    function EmEdicao: Boolean;
    procedure ShowCaptions; virtual;
    procedure setParametros; virtual;
    procedure ValidarCampos; virtual;
    procedure CarregarDadosFilhos; virtual;
    procedure SalvarTabelaFilha; virtual;
  public
    constructor Create(AOwner: TComponent; eInfoTabela: TInfoTabela; aAction: TAcao; iID: Integer = 0); overload;
    property ID: Integer read FID write FID;
  end;

var
  frmCadBase: TfrmCadBase;

implementation

{$R *.dfm}

uses Util, uPrincipal;

function TfrmCadBase.EmEdicao: Boolean;
begin
  Result := (qryTabela.State in [dsEdit, dsInsert]);
end;

procedure TfrmCadBase.CarregarDados;
begin
  MontaSQL;
  qryTabela.ParamByName('ID').AsInteger := FID;
  qryTabela.Open;
end;

procedure TfrmCadBase.CarregarDadosFilhos;
begin

end;

procedure TfrmCadBase.SalvarTabelaFilha;
begin

end;

procedure TfrmCadBase.setParametros;
begin
  FOutrosCampos := '';
end;

procedure TfrmCadBase.ShowCaptions;
begin
  Self.Caption           := FInfoTabela.cCaption +' [ '+ FAcao.Descricao +' ]';
  lblTitleEntity.Caption := FInfoTabela.cCaption;
end;

procedure TfrmCadBase.ValidarCampos;
begin

end;

procedure TfrmCadBase.btnGravarClick(Sender: TObject);
begin
  SelectFirst;
  ValidarCampos;
  try
    CONEXAO.StartTrans;
    if qryTabelaID.AsInteger = 0 then
      qryTabelaID.AsInteger := CONEXAO.NovoID('SEQ_'+ FInfoTabela.cNome);
    qryTabela.Post;

    qryTabela.ApplyUpdates;
    SalvarTabelaFilha;
    CONEXAO.Commit;
    Close;
  except
    on E: Exception do
    begin
      CONEXAO.Rollback;
      TUFMsg.Msg(E, 'Não foi possível gravar o registro:');
      Close;
    end;
  end;
end;

constructor TfrmCadBase.Create(AOwner: TComponent; eInfoTabela: TInfoTabela; aAction: TAcao; iID: Integer);
begin
  inherited Create(AOwner);
  FInfoTabela := eInfoTabela;
  FAcao       := aAction;
  FID         := iID;
end;

procedure TfrmCadBase.FormShow(Sender: TObject);
begin
  setParametros;
  ShowCaptions;

  CarregarDados;

  case FAcao of
    taNovo:
    begin
      qryTabela.Append;
      qryTabelaID.AsInteger := 0;
      FID := 0;
    end;
    taAlterar:
    begin
      qryTabela.Edit;
    end;
    taVisualizar:
    begin
      dtsTabela.AutoEdit := False;
      btnGravar.Visible  := False;
    end;
  end;
  CarregarDadosFilhos;
end;

procedure TfrmCadBase.MontaSQL;
begin
   qryTabela.SQL.Clear;
   qryTabela.SQL.Add('SELECT T.ID                    ');
   qryTabela.SQL.Add('     , T.'+ FOutrosCampos       );
   qryTabela.SQL.Add('FROM '+ FInfoTabela.cNome +' T ');
   qryTabela.SQL.Add('WHERE T.ID = :ID               ');
end;

end.
