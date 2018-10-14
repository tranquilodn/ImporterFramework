unit DataContainers.TField;

interface

uses
  System.SysUtils, System.Variants, Utils.TArrayUtil,
  Interfaces.IField,
  Interfaces.IValidationRule,
  ValidationRules.TIsEmptyValidationRule,
  ValidationRules.TDataTypeValidationRule,
  ValidationRules.TMaxLengthValidationRule;

type
  TField = class(TInterfacedObject, IField)
  strict private
    FDestinationFieldName: String;
    FValidationRules: TArray<IValidationRule>;
    FIsValid: Boolean;
    FName: String;
    FValue: Variant;
    function GetName: String;
    procedure SetName(const AName: String);
    procedure SetDestinationFieldName(const ADestinationFieldName: String);
    function GetValue: Variant;
    procedure SetValue(const AValue: Variant);
    procedure SetValidationRules(const AAcceptEmpty: Boolean; const ADataType: String;
      const ADateFormat: String; const ADateSeparator: Char; const AMaxLength: Integer);
  public
    constructor Create(const AAcceptEmpty: Boolean; const ADataType: String;
      const ADateFormat: String; const ADateSeparator: Char;
      const AMaxLength: Integer);
    destructor Destroy; override;
    function Parse(var AReasonForRejection: String): Boolean;
    property DestinationFieldName: String read FDestinationFieldName write SetDestinationFieldName;
    property IsValid: Boolean read FIsValid;
    property Name: String read GetName write SetName;
    property Value: Variant read GetValue write SetValue;
  end;

implementation

{ TField }

constructor TField.Create(const AAcceptEmpty: Boolean; const ADataType: String;
  const ADateFormat: String; const ADateSeparator: Char; const AMaxLength: Integer);
begin
  inherited Create;
  SetValidationRules(AAcceptEmpty, ADataType, ADateFormat, ADateSeparator, AMaxLength);
end;

destructor TField.Destroy;
begin

  inherited;
end;

function TField.GetName: String;
begin
  Result := FName;
end;

function TField.GetValue: Variant;
begin
  Result := FValue;
end;

function TField.Parse(var AReasonForRejection: String): Boolean;
var
  Index: Integer;
begin
  Result := False;
  for Index := 0 to Length(FValidationRules) -1 do
  begin
    Result := FValidationRules[Index].Parse(FValue, AReasonForRejection);
    if not Result then
      Break;
  end;
end;

procedure TField.SetDestinationFieldName(const ADestinationFieldName: String);
begin
  if FDestinationFieldName <> ADestinationFieldName then
    FDestinationFieldName := ADestinationFieldName;
end;

procedure TField.SetName(const AName: String);
begin
  if FName <> AName then
    FName := AName;
end;

procedure TField.SetValidationRules(const AAcceptEmpty: Boolean;
  const ADataType, ADateFormat: String; const ADateSeparator: Char;
  const AMaxLength: Integer);
var
  AuxValidationRule: IValidationRule;
begin
  AuxValidationRule := TIsEmptyValidationRule.Create(AAcceptEmpty);
  TArrayUtil<IValidationRule>.Append(FValidationRules, AuxValidationRule);

  AuxValidationRule := TDataTypeValidationRule.Create(AAcceptEmpty, ADataType, ADateFormat, ADateSeparator);
  TArrayUtil<IValidationRule>.Append(FValidationRules, AuxValidationRule);

  if AMaxLength > 0 then
  begin
    AuxValidationRule := TMaxLengthValidationRule.Create(AMaxLength);
    TArrayUtil<IValidationRule>.Append(FValidationRules, AuxValidationRule);
  end;

end;

procedure TField.SetValue(const AValue: Variant);
begin
  if FValue <> AValue then
    FValue := AValue;
end;

end.
