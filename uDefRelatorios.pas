unit uDefRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Enumeradores;

type
  TfrmDefRelatorios = class(TForm)
    cbbFiltro: TComboBox;
    lblDescricao: TLabel;
    cbbTipo: TComboBox;
    Label1: TLabel;
    btnAlterar: TBitBtn;
    procedure btnAlterarClick(Sender: TObject);
  private

  public

  end;

var
  frmDefRelatorios: TfrmDefRelatorios;

implementation

uses uRelatorios;

{$R *.dfm}

procedure TfrmDefRelatorios.btnAlterarClick(Sender: TObject);
var
  frmRel: TfrmRelatorios;
begin
  frmRel := TfrmRelatorios.Create(Self, TTipoRelatorio(cbbTipo.ItemIndex), TFiltroRelatorio(cbbFiltro.ItemIndex));
  try
    frmRel.Imprimir;
  finally
    FreeAndNil(frmRel);
  end;
end;

end.
