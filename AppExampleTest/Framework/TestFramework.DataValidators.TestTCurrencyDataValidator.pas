unit TestFramework.DataValidators.TestTCurrencyDataValidator;
interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IDataValidator,
  DataValidators.TCurrencyDataValidator;

type
  TestTCurrencyDataValidator = class(TTestCase)
  strict private
    FCurrencyDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Currency;
    procedure TestParse_StringCurrency_Valid;
    procedure TestParse_StringCurrency_Invalid;
  end;

implementation

procedure TestTCurrencyDataValidator.SetUp;
begin
  FCurrencyDataValidator := TCurrencyDataValidator.Create;
end;

procedure TestTCurrencyDataValidator.TearDown;
begin

end;

procedure TestTCurrencyDataValidator.TestParse_Currency;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 2450.70;
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TestTCurrencyDataValidator.TestParse_StringCurrency_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '12,50.44';
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TestTCurrencyDataValidator.TestParse_StringCurrency_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1250.44';
  ReturnValue := FCurrencyDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCurrencyDataValidator.Suite);
end.

