unit Enumeradores;

interface

type
  TTipoMsg = (tmFalha, tmAtencao, tmInfo);
  TObjectRequired = (poNull, poNotNull);

  TInfoTabela = record
    cNome:          String;
    cCaption:       String;
    cCampoPesquisa: String;
    lAutoInc:       Boolean;
  end;

  TAcao = (taNovo, taAlterar, taDeletar, taVisualizar);

  TAcaoHelper = record helper for TAcao
    function Descricao: String;
  end;

  TTipoRelatorio = (relAgrupado, relAlunosProfessor);
  TFiltroRelatorio = (frelTodos, frelAprovados, frelReprovados);

const
  LB = #13#10; // Quebra de linha

implementation

{ TAcaoHelper }

function TAcaoHelper.Descricao: String;
begin
  case Self of
    taNovo:       Result := 'Incluir';
    taAlterar:    Result := 'Alterar';
    taDeletar:    Result := 'Deletar';
    taVisualizar: Result := 'Visualizar';
  end;
end;

end.
