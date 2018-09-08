unit uCadPROFESSORES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmCadPROFESSORES = class(TfrmCadBase)
    Label1: TLabel;
    edtDIS_NOME: TDBEdit;
    qryTabelaPRO_NOME: TStringField;
  private

  protected
    procedure setParametros; override;
    procedure ValidarCampos; override;
  public

  end;

var
  frmCadPROFESSORES: TfrmCadPROFESSORES;

implementation

uses Util;

{$R *.dfm}

procedure TfrmCadPROFESSORES.setParametros;
begin
  inherited;
  FOutrosCampos := 'PRO_NOME';
end;

procedure TfrmCadPROFESSORES.ValidarCampos;
begin
  inherited;
  TUF.Validar((edtDIS_NOME.Text = ''), 'Informe o Nome do Professor antes de gravar!', edtDIS_NOME);
end;

end.
