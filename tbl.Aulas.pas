unit tbl.Aulas;

interface

uses System.Classes, Atributos, Tabelas, Enumeradores, System.Variants, System.Types;

type
  [TTable('AULAS', 'Aulas/Notas', '')]
  TAulas = class(TTabela)
  private
    FAlunos: Integer;
    FAtribuicao: Integer;
    FNota1: Currency;
    FNota2: Currency;
    FNotaTrab: Currency;
  public
    [TForeignKeyField('ALUNOS', 'Alunos', poNotNull)]
    property FKAlunos: Integer read FAlunos write FAlunos;

    [TForeignKeyField('ATRIBUICAO', 'Atribuição', poNotNull)]
    property FKAtribuicao: Integer read FAtribuicao write FAtribuicao;

    [TFieldNumeric('NOTA_1', 'Nota 1º Per.', 18, 2, '0.00', poNotNull)]
    property Nota1: Currency read FNota1 write FNota1;

    [TFieldNumeric('NOTA_2', 'Nota 2º Per.', 18, 2, '0.00', poNotNull)]
    property Nota2: Currency read FNota2 write FNota2;

    [TFieldNumeric('NOTA_TRAB', 'Nota Trabalho', 18, 2, '0.00', poNotNull)]
    property NotaTrab: Currency read FNotaTrab write FNotaTrab;

    constructor Create(AOwner: TComponent); overload;
  end;

implementation

constructor TAulas.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  RegisterClass(TAulas);

end.

