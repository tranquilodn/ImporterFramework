unit DataContainers.TRecord;

interface

uses
  System.SysUtils, System.Variants,
  Utils.TArrayUtil,
  Interfaces.IRecord,
  Interfaces.IField,
  Exceptions.EFieldNameMustBeUniqueException;

type
  TRecord = class(TInterfacedObject, IRecord)
  strict private
    FFields: TArray<IField>;
    function FieldNameAlreadyExists(const AFieldName: String): Boolean;
    function GetFields: TArray<IField>;
  public
    constructor Create;
    destructor Destroy; override;
    function FieldByName(const AFieldName: String): IField;
    procedure AddField(const AField: IField);
    property Fields: TArray<IField> read GetFields;
  end;

implementation

{ TRecord }

procedure TRecord.AddField(const AField: IField);
begin
  if FieldNameAlreadyExists(AField.Name) then
    raise EFieldNameMustBeUniqueException.Create(EFieldNameMustBeUniqueException.FIELD_NAME_MUST_BE_UNIQUE_MESSAGE);
  TArrayUtil<IField>.Append(FFields, AField);
end;

constructor TRecord.Create;
begin
  inherited;

end;

destructor TRecord.Destroy;
begin

  inherited;
end;

function TRecord.FieldByName(const AFieldName: String): IField;
var
  Index: Integer;
begin
  Result := Nil;
  for Index := 0 to Length(FFields) - 1 do
    if (UpperCase(FFields[Index].Name) = UpperCase(Trim(AFieldName))) then
    begin
      Result := FFields[Index];
      Break;
    end;
  if Result = Nil then
  begin
    raise Exception.Create('Field not Found. Please, check your File Definition');
    Abort;
  end;
end;

function TRecord.FieldNameAlreadyExists(const AFieldName: String): Boolean;
var
  Index: Integer;
begin
  for Index := 0 to Length(FFields) - 1 do
  begin
    Result := UpperCase(Trim(FFields[Index].Name)) = UpperCase(Trim(AFieldName));
    if Result then
      Break;
  end;
end;

function TRecord.GetFields: TArray<IField>;
begin
  Result := FFields;
end;

end.
