unit DataValidators.TestSuite;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Framework.Interfaces,
  DataValidators.TBooleanDataValidator,
  DataValidators.TCurrencyDataValidator,
  DataValidators.TDateTimeDataValidator,
  DataValidators.TIntegerDataValidator,
  DataValidators.TNumericDataValidator,
  DataValidators.TStringDataValidator;

type
  TTBooleanDataValidatorTest = class(TTestCase)
  strict private
    FBooleanDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Boolean_True;
    procedure TestParse_Boolean_False;
    procedure TestParse_StringBoolean_Invalid;
    procedure TestParse_StringBoolean_Valid;
  end;

  TTCurrencyDataValidatorTest = class(TTestCase)
  strict private
    FCurrencyDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Currency;
    procedure TestParse_StringCurrency_Invalid;
    procedure TestParse_StringCurrency_Valid;
  end;

  TTDateTimeDataValidatorTest = class(TTestCase)
  strict private
    FDateTimeDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_DateTime;
    procedure TestParse_StringDateTime_Invalid;
    procedure TestParse_StringDateTime_Valid;
  end;

  TTIntegerDataValidatorTest = class(TTestCase)
  strict private
    FIntegerDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Integer;
    procedure TestParse_StringInteger_Invalid;
    procedure TestParse_StringInteger_Valid;
  end;

  TTNumericDataValidatorTest = class(TTestCase)
  strict private
    FNumericDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Numeric;
    procedure TestParse_StringNumeric_Invalid;
    procedure TestParse_StringNumeric_Valid;
  end;

  TTStringDataValidatorTest = class(TTestCase)
  strict private
    FStringDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_String_Invalid;
    procedure TestParse_String_Valid;
  end;

implementation

procedure TTBooleanDataValidatorTest.SetUp;
begin
  inherited;
  FBooleanDataValidator := TBooleanDataValidator.Create;
end;

procedure TTBooleanDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTBooleanDataValidatorTest.TestParse_StringBoolean_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'True';
  ReturnValue := FBooleanDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTBooleanDataValidatorTest.TestParse_Boolean_False;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := False;
  ReturnValue := FBooleanDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTBooleanDataValidatorTest.TestParse_Boolean_True;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := True;
  ReturnValue := FBooleanDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTBooleanDataValidatorTest.TestParse_StringBoolean_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'Tru';
  ReturnValue := FBooleanDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

{ TTCurrencyDataValidatorTest }

procedure TTCurrencyDataValidatorTest.SetUp;
begin
  inherited;
  FCurrencyDataValidator := TCurrencyDataValidator.Create;
end;

procedure TTCurrencyDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTCurrencyDataValidatorTest.TestParse_Currency;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 2450.70;
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTCurrencyDataValidatorTest.TestParse_StringCurrency_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '12,50.44';
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TTCurrencyDataValidatorTest.TestParse_StringCurrency_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1250.44';
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

{ TTDateTimeDataValidatorTest }

procedure TTDateTimeDataValidatorTest.SetUp;
begin
  inherited;
  FDateTimeDataValidator := TDateTimeDataValidator.Create('yyyy/mm/dd', '/');
end;

procedure TTDateTimeDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTDateTimeDataValidatorTest.TestParse_DateTime;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := Now;
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTDateTimeDataValidatorTest.TestParse_StringDateTime_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1973/13/28';
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TTDateTimeDataValidatorTest.TestParse_StringDateTime_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1973/11/28';
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

{ TTIntegerDataValidatorTest }

procedure TTIntegerDataValidatorTest.SetUp;
begin
  inherited;
  FIntegerDataValidator := TIntegerDataValidator.Create;
end;

procedure TTIntegerDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTIntegerDataValidatorTest.TestParse_Integer;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 12;
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTIntegerDataValidatorTest.TestParse_StringInteger_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'invalid integer';
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TTIntegerDataValidatorTest.TestParse_StringInteger_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1234';
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

{ TTNumericDataValidatorTest }

procedure TTNumericDataValidatorTest.SetUp;
begin
  inherited;
  FNumericDataValidator := TNumericDataValidator.Create;
end;

procedure TTNumericDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTNumericDataValidatorTest.TestParse_Numeric;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 1232132.43232;
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TTNumericDataValidatorTest.TestParse_StringNumeric_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '12,32,1,32.43232';
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TTNumericDataValidatorTest.TestParse_StringNumeric_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1232132.43232';
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

{ TTStringDataValidatorTest }

procedure TTStringDataValidatorTest.SetUp;
begin
  inherited;
  FStringDataValidator := TStringDataValidator.Create;
end;

procedure TTStringDataValidatorTest.TearDown;
begin
  inherited;
end;

procedure TTStringDataValidatorTest.TestParse_String_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 1234;
  ReturnValue := FStringDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TTStringDataValidatorTest.TestParse_String_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'my string for testing';
  ReturnValue := FStringDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

  RegisterTest(TTBooleanDataValidatorTest.Suite);
  RegisterTest(TTCurrencyDataValidatorTest.Suite);
  RegisterTest(TTDateTimeDataValidatorTest.Suite);
  RegisterTest(TTIntegerDataValidatorTest.Suite);
  RegisterTest(TTNumericDataValidatorTest.Suite);
  RegisterTest(TTStringDataValidatorTest.Suite);

end.

