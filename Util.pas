unit Util;

interface

uses
  Windows, Vcl.Forms, System.SysUtils, Enumeradores, System.Classes, System.Math, System.StrUtils, Vcl.Controls,
  Vcl.ComCtrls, System.IniFiles, Atributos, Tabelas, RTTI, FireDAC.Comp.Client;

type

  TUF = class
    class procedure FocarComponente(oComponent: TWinControl);
    class procedure Validar(lCondicao: Boolean; cMsg: String; oObj: TWinControl = nil);
    class function CarregarInfoTabela(aTabela: TTabela): TInfoTabela;
  end;

  TUFConexao = class
  private
    FNomeBD: String;
    FUsername: String;
    FPassword: String;
    function getNomeArqIni: string;
  public
    property NomeBD: String read FNomeBD write FNomeBD;
    property Username: String read FUsername write FUsername;
    property Password: String read FPassword write FPassword;
    property NomeArqIni: string read getNomeArqIni;
    procedure LerConfiguracao;
    procedure GravarConfiguracao;
    function ConectarDB: Boolean;
    function ExisteArqIni: Boolean;
    procedure Verificar;

    procedure StartTrans;
    procedure Commit;
    procedure Rollback;

    function CreateQuery(AOwner: TComponent): TFDQuery;
    function NovoID(cNomeGenerator: string): Integer;

    procedure CriarEstruturaBD(cArqTxt: string = '');
  end;

  TDDL = class
    class function ScriptGenerator(aTabela: TTabela): String;
    class function ScriptTabela(aTabela: TTabela): String;
    class function ScriptCompletaTabela(cNomeClasseTabela: String): string;
  end;

  TUFMsg = class
    class procedure Msg(cMsg: String; oTMsg: TTipoMsg = tmInfo); overload;
    class procedure Msg(oException: Exception; cMsg: String); overload;
    class function PerguntaSimNao(cMsg: String; lFocarSim: Boolean = False): Boolean;
  end;

implementation

uses uPrincipal;

{ TUFMsg }
class procedure TUFMsg.Msg(cMsg: String; oTMsg: TTipoMsg);
begin
  case oTMsg of
    tmFalha:   Application.MessageBox(PChar(cMsg), 'Falha'     , MB_OK + MB_ICONERROR       + MB_TOPMOST);
    tmAtencao: Application.MessageBox(PChar(cMsg), 'Atenção'   , MB_OK + MB_ICONWARNING     + MB_TOPMOST);
    tmInfo:    Application.MessageBox(PChar(cMsg), 'Informação', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;

class procedure TUFMsg.Msg(oException: Exception; cMsg: String);
begin
  if(oException.ClassName <> 'EAbort')then
    Msg(cMsg+LB+LB+oException.Message, tmFalha);
end;

class function TUFMsg.PerguntaSimNao(cMsg: String; lFocarSim: Boolean = False): Boolean;
var
  oParamsMsg: Cardinal;
begin
  oParamsMsg := (MB_YESNO + MB_ICONQUESTION + ifThen(lFocarSim, MB_DEFBUTTON1, MB_DEFBUTTON2) + MB_TOPMOST);
  Result     := (MessageBox(Application.Handle, Pchar(cMsg), 'Atenção', oParamsMsg) = IDYES);
end;


class function TUF.CarregarInfoTabela(aTabela: TTabela): TInfoTabela;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  oAtributo: TCustomAttribute;
begin
  Contexto := TRttiContext.Create;
  try
    TypObj := Contexto.GetType(TObject(aTabela).ClassInfo);
    for oAtributo in TypObj.GetAttributes do
    begin
      if oAtributo is TTable then
      begin
        Result.cNome          := TTable(oAtributo).Name;
        Result.cCaption       := TTable(oAtributo).Caption;
        Result.cCampoPesquisa := TTable(oAtributo).CampoPesquisa;
        Result.lAutoInc       := TTable(oAtributo).AutoInc;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

class procedure TUF.FocarComponente(oComponent: TWinControl);
begin
  if(Assigned(oComponent))then
  begin
    if(oComponent.CanFocus)then
    begin
      oComponent.SetFocus;
    end;
  end;
end;

class procedure TUF.Validar(lCondicao: Boolean; cMsg: String; oObj: TWinControl = nil);
begin
  if lCondicao then
  begin
    if (Trim(cMsg) <> '') then
      TUFMsg.Msg(cMsg, tmAtencao);
    TUF.FocarComponente(oObj);
    Abort;
  end;
end;

{ TUFConexao }

procedure TUFConexao.Commit;
begin
  frmPrincipal.conConexao.Commit;
end;

function TUFConexao.ConectarDB: Boolean;
begin
  try
    Result := False;
    with frmPrincipal.conConexao do
    begin
      if Connected then
        Connected := False;
      Params.Values['DriverID']  := 'FB';
      Params.Values['Database']  := FNomeBD;
      Params.Values['User_Name'] := FUsername;
      Params.Values['Password']  := FPassword;

      Connected := True;
      Result := True;
      GravarConfiguracao;
    end;
  except
    on E:Exception do
    begin
      TUFMsg.Msg(E,'Falha ao conectar a base de dados:');
      Abort;
    end;
  end;
end;

function TUFConexao.CreateQuery(AOwner: TComponent): TFDQuery;
begin
  Result := TFDQuery.Create(AOwner);
  Result.Connection  := frmPrincipal.conConexao;
  Result.Transaction := frmPrincipal.FDTrans;
end;

procedure TUFConexao.CriarEstruturaBD(cArqTxt: string = '');
var
  stlScript: TStringList;
  Arq: TextFile;
  i: Integer;
begin
  stlScript := TStringList.Create;
  try
    stlScript.Add(TDDL.ScriptCompletaTabela('TProfessores'));
    stlScript.Add(TDDL.ScriptCompletaTabela('TDisciplinas'));
    stlScript.Add(TDDL.ScriptCompletaTabela('TAlunos'));
    stlScript.Add(TDDL.ScriptCompletaTabela('TAtribuicao'));
    stlScript.Add(TDDL.ScriptCompletaTabela('TAulas'));

    if cArqTxt <> '' then
    begin
      try
        AssignFile(Arq, cArqTxt);
        Rewrite(arq);

        Writeln(arq, stlScript.Text);
        CloseFile(arq);

        TUFMsg.Msg('Script gerado em "'+ cArqTxt +'".');
      except
        on e: Exception do
        begin
          TUFMsg.Msg(E, 'Falha ao gerar o script!');
          Abort;
        end;
      end;
    end
    else
    begin
      try
        frmPrincipal.FDScript.SQLScripts.Clear;
        if (not frmPrincipal.conConexao.InTransaction) then
          frmPrincipal.conConexao.StartTransaction;

        with frmPrincipal.FDScript.SQLScripts.Add do
        begin
          Name := 'ScriptBancodeDados';
          SQL.Add( stlScript.Text );
        end;

        frmPrincipal.FDScript.ValidateAll;
        frmPrincipal.FDScript.ExecuteAll;
        frmPrincipal.conConexao.Commit;

        TUFMsg.Msg('Estrutura do banco de dados criada com sucesso.');
      except
        on e: Exception do
        begin
          frmPrincipal.conConexao.Rollback;
          TUFMsg.Msg(E, 'Falha ao executar os script!');
          Abort;
        end;
      end;
    end;
  finally
    stlScript.Free;
  end;
end;

function TUFConexao.ExisteArqIni: Boolean;
begin
  Result := FileExists(getNomeArqIni);
end;

procedure TUFConexao.GravarConfiguracao;
var
  Arq: TIniFile;
begin
  Arq := TIniFile.Create(getNomeArqIni);
  try
    Arq.WriteString('CONEXAO', 'NOME_BD',  FNomeBD);
    Arq.WriteString('CONEXAO', 'USERNAME', FUsername);
    Arq.WriteString('CONEXAO', 'PASSWORD', FPassword);
  finally
    Arq.Free;
  end;
end;

procedure TUFConexao.LerConfiguracao;
var
  Arq: TIniFile;
begin
  Arq := TIniFile.Create(getNomeArqIni);
  try
    FNomeBD   := Arq.ReadString('CONEXAO', 'NOME_BD',  ExtractFilePath(ParamStr(0))+'\UNIFORTES.FDB');
    FUsername := Arq.ReadString('CONEXAO', 'USERNAME', 'SYSDBA');
    FPassword := Arq.ReadString('CONEXAO', 'PASSWORD', 'masterkey');
  finally
    Arq.Free;
  end;
end;

function TUFConexao.NovoID(cNomeGenerator: string): Integer;
var
  qryGenID: TFDQuery;
begin
  Result := 0;
  qryGenID := Self.CreateQuery(Application);
  try
    qryGenID.SQL.Text := 'SELECT GEN_ID('+ cNomeGenerator +', 1) AS ID FROM RDB$DATABASE';
    qryGenID.Open;
    Result := qryGenID.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(qryGenID);
  end;
end;

procedure TUFConexao.Rollback;
begin
  frmPrincipal.conConexao.Rollback;
end;

procedure TUFConexao.StartTrans;
begin
  if (not frmPrincipal.conConexao.InTransaction) then
    frmPrincipal.conConexao.StartTransaction;
end;

procedure TUFConexao.Verificar;
begin
  TUF.Validar((not frmPrincipal.conConexao.Connected), 'Base de dados não está conectada!'+LB+'Verifique as configurações!');
end;

function TUFConexao.getNomeArqIni: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'config.ini';
end;

{ TDDL }
class function TDDL.ScriptCompletaTabela(cNomeClasseTabela: String): string;
var
  oClasseForm: TTabelaClass;
  aTabela: TTabela;
begin
  Result := '';
  oClasseForm  := TTabelaClass(GetClass(cNomeClasseTabela));

  if(Assigned(oClasseForm))then
  begin
    aTabela := oClasseForm.Create(Application);
    try
      Result := '-- Tabela da classe '+ cNomeClasseTabela;
      Result := Result +LB+ ScriptGenerator(aTabela);
      Result := Result +LB+LB+ ScriptTabela(aTabela);
    finally
      aTabela.Free;
    end;
  end
  else
    TUF.Validar((cNomeClasseTabela <> ''), 'TabelaClass ('+ cNomeClasseTabela +') não registrada!');
end;

class function TDDL.ScriptGenerator(aTabela: TTabela): String;
var
  rTabela: TInfoTabela;
begin
  Result := '';
  rTabela := TUF.CarregarInfoTabela(aTabela);
  if(rTabela.lAutoInc)then
    Result := ' CREATE SEQUENCE SEQ_'+ rTabela.cNome +'; ';
end;

class function TDDL.ScriptTabela(aTabela: TTabela): String;
var
  rTabela: TInfoTabela;
  oContext: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  cScript: String;
begin
  rTabela := TUF.CarregarInfoTabela(aTabela);
  cScript := 'CREATE TABLE '+ rTabela.cNome +' ( '
         +LB+'   ID INTEGER NOT NULL PRIMARY KEY ';

  TypObj := oContext.GetType(TPersistent(aTabela).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is TFieldEntity then
      begin
        if(TFieldEntity(Atributo).FieldName <> 'ID')then
        begin
          if Atributo is TForeignKeyField then
          begin
            cScript := cScript +LB +' ,'+ TFieldEntity(Atributo).FieldName +' '+ TFieldEntity(Atributo).DDLName
                                   +' REFERENCES '+ TForeignKeyField(Atributo).ForeignTable +' (ID) '
                                   + IfThen((TFieldEntity(Atributo).NotNull = poNotNull), ' NOT NULL ', '');
          end
          else
          if Atributo is TFieldNumeric then
          begin
            cScript := cScript +LB +' ,'+ TFieldEntity(Atributo).FieldName +' '+ TFieldEntity(Atributo).DDLName
                                   +IfThen((TFieldNumeric(Atributo).DefaultDDL <> '')
                                          ,' DEFAULT '+ QuotedStr(TFieldNumeric(Atributo).DefaultDDL) +' NOT NULL ');
          end
          else
          begin
            cScript := cScript +LB +' ,'+ TFieldEntity(Atributo).FieldName +' '+ TFieldEntity(Atributo).DDLName
                                   + IfThen((TFieldEntity(Atributo).NotNull = poNotNull), ' NOT NULL ', '');
          end;
        end;
      end;
    end;
  end;
  cScript := cScript +LB + ' );';
  Result := cScript;
end;

end.
