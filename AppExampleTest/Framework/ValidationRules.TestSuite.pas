unit ValidationRules.TestSuite;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IValidationRule,
  EnumClasses.TDataType,
  ValidationRules.TIsEmptyValidationRule,
  ValidationRules.TMaxLengthValidationRule,
  ValidationRules.TDataTypeValidationRule;

type
  TTIsEmptyValidationRuleTest = class(TTestCase)
  strict private
    FIsEmptyValidationRule: IValidationRule;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_AcceptEmpty_EmptyValue;
    procedure TestParse_AcceptEmpty_NonEmptyValue;
    procedure TestParse_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_DoNotAcceptEmpty_NonEmptyValue;
  end;

  TTMaxLengthValidationRuleTest = class(TTestCase)
  strict private
    FIsEmptyValidationRule: IValidationRule;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Invalid;
    procedure TestParse_Valid;
  end;

  TTDataTypeValidationRuleTest = class(TTestCase)
  strict private
    FDataTypeValidationRule: IValidationRule;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    //Boolean DataType
    procedure TestParse_BooleanDataType_True;
    procedure TestParse_BooleanDataType_False;
    procedure TestParse_BooleanDataType_StringBoolean_Invalid;
    procedure TestParse_BooleanDataType_StringBoolean_True_Valid;
    procedure TestParse_BooleanDataType_StringBoolean_False_Valid;
    //Currency DataType
    procedure TestParse_CurrencyDataType;
    procedure TestParse_CurrencyDataType_StringCurrency_Invalid;
    procedure TestParse_CurrencyDataType_StringCurrency_Valid;
    //DateTime DataType
    procedure TestParse_DateTimeDataType;
    procedure TestParse_DateTimeDataType_StringDateTime_Invalid;
    procedure TestParse_DateTimeDataType_StringDateTime_Valid;
    //Integer DataType
    procedure TestParse_IntegerDataType;
    procedure TestParse_IntegerDataType_StringInteger_Invalid;
    procedure TestParse_IntegerDataType_StringInteger_Valid;
    //Numeric DataType
    procedure TestParse_NumericDataType;
    procedure TestParse_NumericDataType_StringNumeric_Invalid;
    procedure TestParse_NumericDataType_StringNumeric_Valid;
    //String DataType
    procedure TestParse_StringDataType_Invalid;
    procedure TestParse_StringDataType_Valid;
  end;

implementation

{ TTIsEmptyValidationRuleTest }

procedure TTIsEmptyValidationRuleTest.SetUp;
begin
  inherited;
end;

procedure TTIsEmptyValidationRuleTest.TearDown;
begin
  inherited;
end;

procedure TTIsEmptyValidationRuleTest.TestParse_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TIsEmptyValidationRule.Create(True);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTIsEmptyValidationRuleTest.TestParse_AcceptEmpty_NonEmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'field is not empty';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TIsEmptyValidationRule.Create(True);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTIsEmptyValidationRuleTest.TestParse_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TIsEmptyValidationRule.Create(False);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TIsEmptyValidationRule.IS_EMPTY_MESSAGE);
end;

procedure TTIsEmptyValidationRuleTest.TestParse_DoNotAcceptEmpty_NonEmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'field is not empty';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TIsEmptyValidationRule.Create(False);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

{ TTMaxLengthValidationRuleTest }

procedure TTMaxLengthValidationRuleTest.SetUp;
begin
  inherited;
end;

procedure TTMaxLengthValidationRuleTest.TearDown;
begin
  inherited;
end;

procedure TTMaxLengthValidationRuleTest.TestParse_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'this string is 31 chars length.';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TMaxLengthValidationRule.Create(30);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TMaxLengthValidationRule.INVALID_LENGTH_MESSAGE);
end;

procedure TTMaxLengthValidationRuleTest.TestParse_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'this string is 30 chars length';
  AReasonForRejection := '';
  FIsEmptyValidationRule := TMaxLengthValidationRule.Create(30);
  ReturnValue := FIsEmptyValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

{ TTDataTypeValidationRuleTest }

procedure TTDataTypeValidationRuleTest.SetUp;
begin
  inherited;
end;

procedure TTDataTypeValidationRuleTest.TearDown;
begin
  inherited;
end;

procedure TTDataTypeValidationRuleTest.TestParse_BooleanDataType_False;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := False;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(True, TDataType.dtBoolean, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_BooleanDataType_StringBoolean_False_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'False';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtBoolean, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_BooleanDataType_StringBoolean_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'InvalidBoolean';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtBoolean, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtBoolean + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_BooleanDataType_StringBoolean_True_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'True';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtBoolean, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_BooleanDataType_True;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := True;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtBoolean, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_CurrencyDataType;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 12321.33;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtCurrency, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_CurrencyDataType_StringCurrency_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '123,21.33';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtCurrency, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtCurrency + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_CurrencyDataType_StringCurrency_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '12360';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtCurrency, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_DateTimeDataType;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := Now;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtDateTime, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_DateTimeDataType_StringDateTime_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '28/11/1973';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtDateTime, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtDateTime + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_DateTimeDataType_StringDateTime_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '1973/11/28';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtDateTime, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_IntegerDataType;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 1250;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtInteger, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_IntegerDataType_StringInteger_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '1230.44';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtInteger, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtInteger + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_IntegerDataType_StringInteger_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '1250';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtInteger, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_NumericDataType;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 1250.443234;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtNumeric, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_NumericDataType_StringNumeric_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '123,0.44';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtNumeric, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtNumeric + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_NumericDataType_StringNumeric_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := '1250.234323';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtNumeric, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTDataTypeValidationRuleTest.TestParse_StringDataType_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 1230.44;
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtString, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection = TDataTypeValidationRule.INVALID_DATATYPE_MESSAGE + ' [' + TDataType.dtString + ']');
end;

procedure TTDataTypeValidationRuleTest.TestParse_StringDataType_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  AValue: Variant;
begin
  AValue := 'ValidString';
  AReasonForRejection := '';
  FDataTypeValidationRule := TDataTypeValidationRule.Create(False, TDataType.dtString, 'yyyy/mm/dd', '/');
  ReturnValue := FDataTypeValidationRule.Parse(AValue, AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

  RegisterTest(TTIsEmptyValidationRuleTest.Suite);
  RegisterTest(TTMaxLengthValidationRuleTest.Suite);
  RegisterTest(TTDataTypeValidationRuleTest.Suite);
end.
