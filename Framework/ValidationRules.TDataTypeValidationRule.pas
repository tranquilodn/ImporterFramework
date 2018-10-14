unit ValidationRules.TDataTypeValidationRule;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IValidationRule,
  Interfaces.IDataValidator,
  EnumClasses.TDataType,
  DataValidators.TBooleanDataValidator,
  DataValidators.TCurrencyDataValidator,
  DataValidators.TDateTimeDataValidator,
  DataValidators.TIntegerDataValidator,
  DataValidators.TNumericDataValidator,
  DataValidators.TStringDataValidator;

type
  TDataTypeValidationRule = class(TInterfacedObject, IValidationRule)
  const
    INVALID_DATATYPE_MESSAGE = 'Invalid data type';
  strict private
    FDataValidator: IDataValidator;
    FDataType: String;
    FAcceptEmpty: Boolean;
    function GetDataValidatorInstance(const ADataType: String;
      const ADateFormat: String; const ADateSeparator: Char): IDataValidator;
    function IsEmpty(const AValue: Variant): Boolean;
  public
    constructor Create(const AAcceptEmpty: Boolean; const ADataType: String;
      const ADateFormat: String; const ADateSeparator: Char);
    destructor Destroy; override;
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

implementation

{ TDataTypeValidationRule }

constructor TDataTypeValidationRule.Create(const AAcceptEmpty: Boolean;
  const ADataType: String; const ADateFormat: String; const ADateSeparator: Char);
begin
  inherited Create;
  FAcceptEmpty := AAcceptEmpty;
  FDataType := ADataType;
  FDataValidator := GetDataValidatorInstance(FDataType, ADateFormat, ADateSeparator);

end;

destructor TDataTypeValidationRule.Destroy;
begin

  inherited;
end;

function TDataTypeValidationRule.GetDataValidatorInstance(
  const ADataType: String; const ADateFormat: String;
  const ADateSeparator: Char): IDataValidator;
var
  AuxDataType: String;
begin
  AuxDataType := UpperCase(Trim(ADataType));
  if AuxDataType = UpperCase(Trim(TDataType.dtBoolean)) then
    Result := TBooleanDataValidator.Create
  else if AuxDataType = UpperCase(Trim(TDataType.dtCurrency)) then
    Result := TCurrencyDataValidator.Create
  else if AuxDataType = UpperCase(Trim(TDataType.dtDateTime)) then
    Result := TDateTimeDataValidator.Create(ADateFormat, ADateSeparator)
  else if AuxDataType = UpperCase(Trim(TDataType.dtInteger)) then
    Result := TIntegerDataValidator.Create
  else if AuxDataType = UpperCase(Trim(TDataType.dtNumeric)) then
    Result := TNumericDataValidator.Create
  else if AuxDataType = UpperCase(Trim(TDataType.dtString)) then
    Result := TStringDataValidator.Create;
end;

function TDataTypeValidationRule.IsEmpty(const AValue: Variant): Boolean;
begin
  Result := (Trim(AValue) = '');
end;

function TDataTypeValidationRule.Parse(const AValue: Variant;
  var AReasonForRejection: String): Boolean;
begin
  Result := (FAcceptEmpty and IsEmpty(AValue));
  if not Result then
    Result := FDataValidator.Parse(AValue);
  if not Result then
    AReasonForRejection := Self.INVALID_DATATYPE_MESSAGE + ' [' + FDataType + ']';
end;

end.
