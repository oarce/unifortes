unit Tabelas;

interface

uses System.Classes, RTTI, Atributos, Enumeradores;

type
  // Class padrão
  TTabela = class(TPersistent)
  private
    FID: Integer;
    procedure setFID(aID: Integer);
  public
    [TKeyField(True)]
    property ID: Integer read FID write setFID;

    constructor Create(AOwner: TComponent);
    procedure Destroy;
  end;

  TTabelaClass = class of TTabela;

implementation

constructor TTabela.Create(AOwner: TComponent);
begin
  inherited Create;
end;

procedure TTabela.setFID(aID: Integer);
begin
  FID := aID;
end;

procedure TTabela.Destroy;
begin
  Self.Free;
end;

end.
