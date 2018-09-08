unit uCadDALUNOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmCadALUNOS = class(TfrmCadBase)
    Label1: TLabel;
    edtALU_NOME: TDBEdit;
    qryTabelaALU_NOME: TStringField;
  private

  protected
    procedure setParametros; override;
    procedure ValidarCampos; override;
  public

  end;

var
  frmCadALUNOS: TfrmCadALUNOS;

implementation

uses Util;

{$R *.dfm}

procedure TfrmCadALUNOS.setParametros;
begin
  inherited;
  FOutrosCampos := 'ALU_NOME';
end;

procedure TfrmCadALUNOS.ValidarCampos;
begin
  inherited;
  TUF.Validar((edtALU_NOME.Text = ''), 'Informe o Nome do Aluno antes de gravar!', edtALU_NOME);
end;

end.
