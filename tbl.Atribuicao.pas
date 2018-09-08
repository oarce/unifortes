unit tbl.Atribuicao;

interface

uses System.Classes, Atributos, Tabelas, Enumeradores, System.Variants, System.Types;

type
  [TTable('ATRIBUICAO', 'Atribuição', '')]
  TAtribuicao = class(TTabela)
  private
    FDescricao: String;
    FProfessores: Integer;
    FDisciplinas: Integer;
  public
    [TForeignKeyField('DISCIPLINAS', 'Disciplinas', poNotNull)]
    property FKDisciplinas: Integer read FDisciplinas write FDisciplinas;

    [TForeignKeyField('PROFESSORES', 'Professores', poNotNull)]
    property FKProfessores: Integer read FProfessores write FProfessores;

    constructor Create(AOwner: TComponent); overload;
  end;

implementation

constructor TAtribuicao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  RegisterClass(TAtribuicao);

end.
