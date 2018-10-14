unit TestFramework.DataValidators.TestTNumericDataValidator;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IDataValidator,
  DataValidators.TNumericDataValidator;

type
  TestTNumericDataValidator = class(TTestCase)
  strict private
    FNumericDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Numeric;
    procedure TestParse_StringNumeric_Valid;
    procedure TestParse_StringNumeric_Invalid;
  end;

implementation

procedure TestTNumericDataValidator.SetUp;
begin
  FNumericDataValidator := TNumericDataValidator.Create;
end;

procedure TestTNumericDataValidator.TearDown;
begin

end;

procedure TestTNumericDataValidator.TestParse_Numeric;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 1232132.43232;
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TestTNumericDataValidator.TestParse_StringNumeric_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '12,32,1,32.43232';
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TestTNumericDataValidator.TestParse_StringNumeric_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1232132.43232';
  ReturnValue := FNumericDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTNumericDataValidator.Suite);
end.

