unit Atributos;

interface

uses System.Types, Data.DB, System.SysUtils, Enumeradores;

// Tipificação dos atributos
type
  TAtributoString = class(TCustomAttribute)
  private
    FString: String;
  public
    constructor Create(aString: String = '');
    property ToString: String read FString write FString;
  end;

type
  TAtributoBoolean = class(TCustomAttribute)
  private
    FBoolean: Boolean;
  public
    constructor Create(aBoolean: Boolean = false);
    property ToBoolean: Boolean read FBoolean write FBoolean default False;
  end;

type
  TAtributoInteger = class(TCustomAttribute)
  private
    FInteger: Integer;
  public
    constructor Create(aInteger: Integer);
    property ToInteger: Integer read FInteger write FInteger;
  end;

// Tabela
type
  TTable = class(TCustomAttribute)
  private
    FName: String;
    FCaption: String;
    FCampoPesquisa: string;
    FAutoInc: Boolean;
  public
    property Name: String read FName write FName;
    property Caption: String read FCaption write FCaption;
    property CampoPesquisa: String read FCampoPesquisa write FCampoPesquisa;
    property AutoInc: Boolean read FAutoInc write FAutoInc;
    constructor Create(aName, aCaption, aCampoPesquisa: String; aAutoInc: Boolean = True);
  end;

// Campos
type
  TFieldEntity = class(TCustomAttribute)
  private
    FFieldName: String;
    FFieldType: TFieldType;
    FNotNull: TObjectRequired;
    FCaption: String;
    FDDLName: String;
    FUniqueRecord: Boolean;
  public
    property FieldName: String read FFieldName write FFieldName;
    property FieldType: TFieldType read FFieldType write FFieldType;
    property Caption: String read FCaption write FCaption;
    property NotNull: TObjectRequired read FNotNull write FNotNull;
    property DDLName: String read FDDLName write FDDLName;
    property UniqueRecord: Boolean read FUniqueRecord write FUniqueRecord;
    constructor Create(aFieldName, aCaption: String; aFieldType: TFieldType; aNotNull: TObjectRequired = poNull;
      aUniqueRecord: Boolean = False);
  end;

type // Campo Integer
  TFieldInteger = class(TFieldEntity)
  public
    constructor Create(aFieldName, aCaption: String; aNotNull: TObjectRequired = poNull); reintroduce;
  end;

type // Campo chave
  TKeyField = class(TFieldInteger)
  private
    FAutoInc: Boolean;
  public
    property AutoInc: Boolean read FAutoInc write FAutoInc;
    constructor Create(aAutoInc: Boolean = True); reintroduce;
  end;

type // Campo Varchar
  TFieldVarchar = class(TFieldEntity)
  private
    FMax: Integer;
    FMin: Integer;
  public
    property Min: Integer read FMin write FMin;
    property Max: Integer read FMax write FMax;
    constructor Create(aFieldName, aCaption: String; aMax: Integer; aMin: Integer = 0;
       aNotNull: TObjectRequired = poNull; aUniqueRecord: Boolean = False); reintroduce;
  end;

type // Campo DateTime
  TFieldDateTime = class(TFieldEntity)
  private
  public
    constructor Create(aFieldName, aCaption: String; aNotNull: TObjectRequired = poNull); reintroduce;
  end;

type // Campo chave estrangeira
  TForeignKeyField = class(TFieldInteger)
  private
    FForeignTable: String;
  public
    property ForeignTable: String read FForeignTable write FForeignTable;
    constructor Create(aForeignTable, aCaption: String; aNotNull: TObjectRequired = poNull; aFieldName: String = ''); reintroduce;
  end;

type // Campo Numeric
  TFieldNumeric = class(TFieldEntity)
  private
    FSize: Integer;
    FDecimal: Integer;
    FDefaultDDL: String;
  public
    property Size: Integer read FSize write FSize;
    property Decimal: Integer read FDecimal write FDecimal;
    property DefaultDDL: String read FDefaultDDL;
    constructor Create(aFieldName, aCaption: String; aSize: Integer; aDecimal: Integer; aDefaultDDL: String;
      aNotNull: TObjectRequired = poNull); reintroduce;
  end;

type // Campo Boolean
  TFieldBoolean = class(TFieldInteger)
  private
  public
    constructor Create(aFieldName, aCaption: String); reintroduce;
  end;

implementation

{ TTable }
constructor TTable.Create(aName, aCaption, aCampoPesquisa: String; aAutoInc: Boolean);
begin
  FName          := aName;
  FCaption       := aCaption;
  FCampoPesquisa := aCampoPesquisa;
  FAutoInc       := aAutoInc;
end;

{ TFieldEntity }
constructor TFieldEntity.Create(aFieldName, aCaption: String; aFieldType: TFieldType; aNotNull: TObjectRequired;
  aUniqueRecord: Boolean);
begin
  FFieldName    := aFieldName;
  FCaption      := aCaption;
  FFieldType    := aFieldType;
  FNotNull      := aNotNull;
  FDDLName      := '';
  FUniqueRecord := aUniqueRecord;
end;

{ TFieldInteger }
constructor TFieldInteger.Create(aFieldName, aCaption: String; aNotNull: TObjectRequired);
begin
  FFieldName := aFieldName;
  FCaption   := aCaption;
  FFieldType := ftInteger;
  FNotNull   := aNotNull;
  FDDLName   := 'INTEGER';
end;

{ TKeyField }
constructor TKeyField.Create(aAutoInc: Boolean);
begin
  FFieldName := 'ID';
  FCaption   := 'ID';
  FFieldType := ftInteger;
  FAutoInc   := aAutoInc;
  FNotNull   := poNotNull;
  FDDLName   := 'INTEGER';
end;

{ TFieldVarchar }
constructor TFieldVarchar.Create(aFieldName, aCaption: String; aMax: Integer; aMin: Integer;
  aNotNull: TObjectRequired; aUniqueRecord: Boolean);
begin
  FFieldName    := aFieldName;
  FCaption      := aCaption;
  FFieldType    := ftString;
  FMax          := aMax;
  FMin          := aMin;
  FNotNull      := aNotNull;
  if((FNotNull = NotNull)and(FMin = 0))then
    FMin        := 1;
  FDDLName      := 'VARCHAR('+ IntToStr(FMax) +')';
  FUniqueRecord := aUniqueRecord;
end;

{ TFieldDateTime }
constructor TFieldDateTime.Create(aFieldName, aCaption: String; aNotNull: TObjectRequired);
begin
  FFieldName := aFieldName;
  FCaption   := aCaption;
  FFieldType := ftDateTime;
  FNotNull   := aNotNull;
  FDDLName   := 'TIMESTAMP';
end;

{ TForeignKeyField }
constructor TForeignKeyField.Create(aForeignTable, aCaption: String; aNotNull: TObjectRequired; aFieldName: String);
begin
  FForeignTable := aForeignTable;
  if(aFieldName = '')then
    aFieldName := aForeignTable;
  FFieldName    := aFieldName+'_ID';
  FCaption      := aCaption;
  FFieldType    := ftInteger;
  FNotNull      := aNotNull;
  FDDLName      := 'INTEGER';
end;

{ TFieldNumeric }
constructor TFieldNumeric.Create(aFieldName, aCaption: String; aSize, aDecimal: Integer; aDefaultDDL: String;
  aNotNull: TObjectRequired = poNull);
begin
  FFieldName    := aFieldName;
  FCaption      := aCaption;
  FFieldType    := ftBCD;
  FSize         := aSize;
  FDecimal      := aDecimal;
  FNotNull      := aNotNull;
  FDDLName      := 'NUMERIC('+ IntToStr(FSize) +','+ IntToStr(FDecimal) +')';
  FUniqueRecord := False;
  FDefaultDDL   := aDefaultDDL;
end;

{ TFieldBoolean }
constructor TFieldBoolean.Create(aFieldName, aCaption: String);
begin
  FFieldName    := aFieldName;
  FCaption      := aCaption;
  FFieldType    := ftBoolean;
  FNotNull      := poNotNull;
  FDDLName      := 'SMALLINT DEFAULT 0 ';
  FUniqueRecord := False;
end;

{ TAttributeBoolean }
constructor TAtributoBoolean.Create(aBoolean: Boolean);
begin
  FBoolean := aBoolean;
end;

{ TAttributeString }
constructor TAtributoString.Create(aString: String);
begin
  FString := aString;
end;

{ TAttributeInteger }
constructor TAtributoInteger.Create(aInteger: Integer);
begin
  FInteger := aInteger;
end;

end.
