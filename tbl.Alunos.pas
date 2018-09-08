unit tbl.Alunos;

interface

uses System.Classes, Atributos, Tabelas, Enumeradores, System.Variants, System.Types;

type
  [TTable('ALUNOS', 'Alunos', 'ALU_NOME')]
  TAlunos = class(TTabela)
  private
    FNome: String;
  public
    [TFieldVarchar('ALU_NOME', 'Nome do Aluno', 70, 1, poNotNull, True)]
    property Nome: String read FNome write FNome;

    constructor Create(AOwner: TComponent); overload;
  end;

implementation

constructor TAlunos.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  RegisterClass(TAlunos);

end.

