unit TestFramework.DataValidators.TestTStringDataValidator;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IDataValidator,
  DataValidators.TStringDataValidator;

type
  TestTStringDataValidator = class(TTestCase)
  strict private
    FStringDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_String_Valid;
    procedure TestParse_String_Invalid;
  end;

implementation

procedure TestTStringDataValidator.SetUp;
begin
  FStringDataValidator := TStringDataValidator.Create;
end;

procedure TestTStringDataValidator.TearDown;
begin

end;

procedure TestTStringDataValidator.TestParse_String_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 1234;
  ReturnValue := FStringDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TestTStringDataValidator.TestParse_String_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := 'my string for testing';
  ReturnValue := FStringDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTStringDataValidator.Suite);
end.

