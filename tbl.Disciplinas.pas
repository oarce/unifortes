unit tbl.Disciplinas;

interface

uses System.Classes, Atributos, Tabelas, Enumeradores, System.Variants, System.Types;

type
  [TTable('DISCIPLINAS', 'Disciplinas', 'DIS_NOME')]
  TDisciplinas = class(TTabela)
  private
    FDescricao: String;
  public
    [TFieldVarchar('DIS_NOME', 'Descrição', 70, 1, poNotNull, True)]
    property Descricao: String read FDescricao write FDescricao;

    constructor Create(AOwner: TComponent); overload;
  end;

implementation

constructor TDisciplinas.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  RegisterClass(TDisciplinas);

end.

