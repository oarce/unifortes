unit uConfigDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Util,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Enumeradores;

type
  TfrmConfigDB = class(TForm)
    grp1: TGroupBox;
    edtUser: TEdit;
    lblPassword: TLabel;
    Label1: TLabel;
    edtPassword: TEdit;
    edtDir: TEdit;
    Label2: TLabel;
    btnDir: TBitBtn;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    edtDll: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    btnGerarDB: TBitBtn;
    btnInicializar: TBitBtn;
    btnGerarScript: TBitBtn;
    dlgOpenBD: TOpenDialog;
    dlgOpenDll: TOpenDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnGerarDBClick(Sender: TObject);
    procedure btnDirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarScriptClick(Sender: TObject);
    procedure btnInicializarClick(Sender: TObject);
  private
    procedure Validacoes;
    procedure CarregarConfiguracao;
  public

  end;

var
  frmConfigDB: TfrmConfigDB;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfrmConfigDB.BitBtn1Click(Sender: TObject);
begin
  if dlgOpenDll.Execute then
  begin
    try
      edtDll.Text := dlgOpenDll.Files.Strings[0];
    except
    end;
  end;
end;

procedure TfrmConfigDB.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigDB.btnDirClick(Sender: TObject);
begin
  if dlgOpenBD.Execute then
  begin
    try
      edtDir.Text := dlgOpenBD.Files.Strings[0];
    except
    end;
  end;
end;

procedure TfrmConfigDB.btnGerarDBClick(Sender: TObject);
begin
  Validacoes;
  TUF.Validar((not FileExists(edtDll.Text)), 'Dll fbClient não encontrada!');
  try
    frmPrincipal.FDScript.SQLScripts.Clear;
    with frmPrincipal.FDScript.SQLScripts.Add do
    begin
      Name := 'Criar_DBFirebird';
      SQL.Add(' SET SQL DIALECT 3; '
          +LB+' SET CLIENTLIB '''+ Trim(edtDll.Text) +''' '
          +LB+' CREATE DATABASE '''+ Trim(edtDir.Text) +''' '
          +LB+'   USER ''SYSDBA'' PASSWORD ''Argus'' '
          +LB+'   PAGE_SIZE 16384 '
          +LB+'   DEFAULT CHARACTER SET NONE; '
          +LB+' SET TERM ^ ; ');
    end;
    frmPrincipal.FDScript.ValidateAll;
    frmPrincipal.FDScript.ExecuteAll;

    TUFMsg.Msg('Banco de Dados criado com sucesso!'+LB+'Inicialize novamente a aplicação para continuar.');
    Application.Terminate;
    Abort;
  except
    on E: Exception do
    begin
       TUFMsg.Msg(E, 'Não foi possível gerar o banco de dados:');
       Abort;;
    end;
  end;
end;

procedure TfrmConfigDB.btnGerarScriptClick(Sender: TObject);
begin
  CONEXAO.Verificar;
  CONEXAO.CriarEstruturaBD(ExtractFilePath(ParamStr(0))+'\scriptBD.txt');
end;

procedure TfrmConfigDB.btnInicializarClick(Sender: TObject);
begin
  CONEXAO.Verificar;
  CONEXAO.CriarEstruturaBD;
end;

procedure TfrmConfigDB.btnOKClick(Sender: TObject);
begin
  Validacoes;
  TUF.Validar((not FileExists(edtDir.Text)), 'Arquivo do Banco de Dados não encontrado!', edtDir);

  CONEXAO.Username := edtUser.Text;
  CONEXAO.Password := edtPassword.Text;
  CONEXAO.NomeBD   := edtDir.Text;
  if CONEXAO.ConectarDB then
    TUFMsg.Msg('Banco de dados conectado com sucesso!');
end;

procedure TfrmConfigDB.CarregarConfiguracao;
begin
  CONEXAO.LerConfiguracao;
  edtUser.Text     := CONEXAO.Username;
  edtPassword.Text := CONEXAO.Password;
  edtDir.Text      := CONEXAO.NomeBD;

  edtDll.Text := ExtractFilePath(ParamStr(0))+'\fbClient.dll';
end;

procedure TfrmConfigDB.FormShow(Sender: TObject);
begin
  CarregarConfiguracao;
end;

procedure TfrmConfigDB.Validacoes;
begin
  TUF.Validar((Trim(edtUser.Text) = ''), 'Informe o Username do Banco de Dados!', edtUser);
  TUF.Validar((Trim(edtPassword.Text) = ''), 'Informe o Password do Banco de Dados!', edtPassword);
  TUF.Validar((Trim(edtDir.Text) = ''), 'Informe o Caminho do Banco de Dados!', edtDir);
end;

end.
