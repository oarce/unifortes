unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ImgList,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, Util, FireDAC.Phys, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.UI, FireDAC.Comp.Script, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, System.ImageList,
  FireDAC.UI.Intf, FireDAC.Stan.Async, FireDAC.Comp.ScriptCommands, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error,
  FireDAC.Stan.Error, FireDAC.Stan.Option, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    FDScript: TFDScript;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    conConexao: TFDConnection;
    FDTrans: TFDTransaction;
    iml48white: TImageList;
    spwTabelas: TSplitView;
    lvwTabelas: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lvwTabelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AbrirTelaConfiguracao;
  public

  end;

var
  frmPrincipal: TfrmPrincipal;
  CONEXAO: TUFConexao;

implementation

uses uConfigDB, uPsqBase, tbl.Disciplinas, tbl.Alunos, tbl.Professores, uControleAulas, uDefRelatorios;

{$R *.dfm}

procedure TfrmPrincipal.AbrirTelaConfiguracao;
begin
  Application.CreateForm(TfrmConfigDB, frmConfigDB);
  try
    frmConfigDB.ShowModal;
  finally
    frmConfigDB.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CONEXAO := TUFConexao.Create;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AbrirTelaConfiguracao;
end;

procedure TfrmPrincipal.lvwTabelasClick(Sender: TObject);
var
  frmPsqProfessores: TfrmPsqBase;
  frmPsqDisciplinas: TfrmPsqBase;
  frmPsqAlunos: TfrmPsqBase;
  frmContAulas: TfrmControleAulas;
  frmRelatorios: TfrmDefRelatorios;
begin
  if lvwTabelas.ItemIndex <> 0 then
    CONEXAO.Verificar;
  case lvwTabelas.ItemIndex of
    0: AbrirTelaConfiguracao;
    1: begin
         frmPsqProfessores := TfrmPsqBase.Create(Self, TProfessores);
         try
            frmPsqProfessores.ShowModal;
         finally
            frmPsqProfessores.Free;
         end;
       end;
    2: begin
         frmPsqDisciplinas := TfrmPsqBase.Create(Self, TDisciplinas);
         try
            frmPsqDisciplinas.ShowModal;
         finally
            frmPsqDisciplinas.Free;
         end;
       end;
    3: begin
         frmPsqAlunos := TfrmPsqBase.Create(Self, TAlunos);
         try
            frmPsqAlunos.ShowModal;
         finally
            frmPsqAlunos.Free;
         end;
       end;
    4: begin
         frmContAulas := TfrmControleAulas.Create(Self);
         try
            frmContAulas.ShowModal;
         finally
            frmContAulas.Free;
         end;
       end;
    5: begin
         frmRelatorios := TfrmDefRelatorios.Create(Self);
         try
            frmRelatorios.ShowModal;
         finally
            frmRelatorios.Free;
         end;
       end;
  end;
end;

end.
