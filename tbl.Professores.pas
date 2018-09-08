unit tbl.Professores;

interface

uses System.Classes, Atributos, Tabelas, Enumeradores, System.Variants, System.Types;

type
  [TTable('PROFESSORES', 'Professores', 'PRO_NOME')]
  TProfessores = class(TTabela)
  private
    FNome: String;
  public
    [TFieldVarchar('PRO_NOME', 'Nome', 70, 1, poNotNull, True)]
    property Nome: String read FNome write FNome;

    constructor Create(AOwner: TComponent); overload;
  end;

implementation

constructor TProfessores.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  RegisterClass(TProfessores);

end.

