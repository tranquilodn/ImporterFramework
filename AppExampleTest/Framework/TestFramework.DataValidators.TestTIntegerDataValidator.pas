unit TestFramework.DataValidators.TestTIntegerDataValidator;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IDataValidator,
  DataValidators.TIntegerDataValidator;

type
  TestTIntegerDataValidator = class(TTestCase)
  strict private
    FIntegerDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_Integer;
    procedure TestParse_StringInteger_Valid;
    procedure TestParse_StringInteger_Invalid;
  end;

implementation

procedure TestTIntegerDataValidator.SetUp;
begin
  FIntegerDataValidator := TIntegerDataValidator.Create;
end;

procedure TestTIntegerDataValidator.TearDown;
begin

end;

procedure TestTIntegerDataValidator.TestParse_Integer;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 12;
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TestTIntegerDataValidator.TestParse_StringInteger_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'invalid integer';
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TestTIntegerDataValidator.TestParse_StringInteger_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1234';
  ReturnValue := FIntegerDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTIntegerDataValidator.Suite);
end.

