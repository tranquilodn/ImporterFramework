unit TestFramework.DataValidators.TestTDateTimeDataValidator;

interface

uses
  TestFramework, System.SysUtils, System.Variants,
  Interfaces.IDataValidator,
  DataValidators.TDateTimeDataValidator;

type
  TestTDateTimeDataValidator = class(TTestCase)
  strict private
    FDateTimeDataValidator: IDataValidator;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_DateTime;
    procedure TestParse_StringDateTime_Valid;
    procedure TestParse_StringDateTime_Invalid;
  end;

implementation

procedure TestTDateTimeDataValidator.SetUp;
begin
  FDateTimeDataValidator := TDateTimeDataValidator.Create('yyyy/mm/dd', '/');
end;

procedure TestTDateTimeDataValidator.TearDown;
begin

end;

procedure TestTDateTimeDataValidator.TestParse_DateTime;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := Now;
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

procedure TestTDateTimeDataValidator.TestParse_StringDateTime_Invalid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1973/13/28';
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = False);
end;

procedure TestTDateTimeDataValidator.TestParse_StringDateTime_Valid;
var
  ReturnValue: Boolean;
  AValue: Variant;
begin
  AValue := '1973/11/28';
  ReturnValue := FDateTimeDataValidator.Parse(AValue);
  Check(ReturnValue = True);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTDateTimeDataValidator.Suite);

end.

