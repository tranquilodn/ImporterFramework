unit DataContainers.TestSuite;

interface

uses
  TestFramework, System.SysUtils, ValidationRules.TDataTypeValidationRule,
  System.Variants, Utils.TArrayUtil, Interfaces.IField, Interfaces.IValidationRule,
  DataContainers.TField, ValidationRules.TMaxLengthValidationRule,
  ValidationRules.TIsEmptyValidationRule;

type
  TTFieldTest = class(TTestCase)
  strict private
    FField: IField;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParse_BooleanField_AcceptEmpty_EmptyValue;
    procedure TestParse_BooleanField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_BooleanField_AcceptEmpty_NonEmptyValue_True_Valid;
    procedure TestParse_BooleanField_AcceptEmpty_NonEmptyValue_False_Valid;
    procedure TestParse_BooleanField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_True_Valid;
    procedure TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_False_Valid;

    procedure TestParse_CurrencyField_AcceptEmpty_EmptyValue;
    procedure TestParse_CurrencyField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_CurrencyField_AcceptEmpty_NonEmptyValue_Valid;
    procedure TestParse_CurrencyField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_CurrencyField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_CurrencyField_DoNotAcceptEmpty_NonEmptyValue_Valid;

    procedure TestParse_DateTimeField_AcceptEmpty_EmptyValue;
    procedure TestParse_DateTimeField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_DateTimeField_AcceptEmpty_NonEmptyValue_Valid;
    procedure TestParse_DateTimeField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_DateTimeField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_DateTimeField_DoNotAcceptEmpty_NonEmptyValue_Valid;

    procedure TestParse_IntegerField_AcceptEmpty_EmptyValue;
    procedure TestParse_IntegerField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_IntegerField_AcceptEmpty_NonEmptyValue_Valid;
    procedure TestParse_IntegerField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_IntegerField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_IntegerField_DoNotAcceptEmpty_NonEmptyValue_Valid;

    procedure TestParse_NumericField_AcceptEmpty_EmptyValue;
    procedure TestParse_NumericField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_NumericField_AcceptEmpty_NonEmptyValue_Valid;
    procedure TestParse_NumericField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_NumericField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_NumericField_DoNotAcceptEmpty_NonEmptyValue_Valid;

    procedure TestParse_StringField_AcceptEmpty_EmptyValue;
    procedure TestParse_StringField_AcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_StringField_AcceptEmpty_NonEmptyValue_Valid;

    procedure TestParse_StringField_DoNotAcceptEmpty_EmptyValue;
    procedure TestParse_StringField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
    procedure TestParse_StringField_DoNotAcceptEmpty_NonEmptyValue_Valid;

  end;

implementation

procedure TTFieldTest.SetUp;
begin
  inherited;
end;

procedure TTFieldTest.TearDown;
begin
  inherited;
end;

procedure TTFieldTest.TestParse_BooleanField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Boolean', '', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '')
end;

procedure TTFieldTest.TestParse_BooleanField_AcceptEmpty_NonEmptyValue_False_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Boolean', '', ADateSeparator, 0);
  FField.Value := ' fAlsE   ';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_BooleanField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Boolean', '', ADateSeparator, 0);
  FField.Value := 'Tru';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_BooleanField_AcceptEmpty_NonEmptyValue_True_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Boolean', '', ADateSeparator, 0);
  FField.Value := '  tRuE   ';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_BooleanField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Boolean', '', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '')
end;

procedure TTFieldTest.TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_False_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Boolean', '', ADateSeparator, 0);
  FField.Value := 'falsE';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '')
end;

procedure TTFieldTest.TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Boolean', '', ADateSeparator, 0);
  FField.Value := 'Fals';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '')
end;

procedure TTFieldTest.TestParse_BooleanField_DoNotAcceptEmpty_NonEmptyValue_True_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Boolean', '', ADateSeparator, 0);
  FField.Value := 'true';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '')
end;

procedure TTFieldTest.TestParse_CurrencyField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Currency', '', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_CurrencyField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Currency', '', ADateSeparator, 0);
  FField.Value := '125,0.43';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_CurrencyField_AcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Currency', '', ADateSeparator, 0);
  FField.Value := '1250.43';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_CurrencyField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Currency', '', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_CurrencyField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Currency', '', ADateSeparator, 0);
  FField.Value := '125,0.43';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_CurrencyField_DoNotAcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Currency', '', ADateSeparator, 0);
  FField.Value := '1250.43';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_DateTimeField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_DateTimeField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28-13-1973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_DateTimeField_AcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(True, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28-11-1973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_DateTimeField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_DateTimeField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28-13-1973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_DateTimeField_DoNotAcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(False, 'DateTime', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28-11-1973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_IntegerField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_IntegerField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := 'Wrong!';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_IntegerField_AcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28111973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_IntegerField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_IntegerField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '28-13-1973';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_IntegerField_DoNotAcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Integer', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '10081971';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_NumericField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_NumericField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '323,2.2452';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_NumericField_AcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(True, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '3232123.54354';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_NumericField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_NumericField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '22342,34.543234';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_NumericField_DoNotAcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(False, 'Numeric', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '104320.81971';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_StringField_AcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_StringField_AcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(True, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := 12345;
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_StringField_AcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(True, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := 'This is a String';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

procedure TTFieldTest.TestParse_StringField_DoNotAcceptEmpty_EmptyValue;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := '';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_StringField_DoNotAcceptEmpty_NonEmptyValue_Invalid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '/';
  AReasonForRejection := '';
  FField := TField.Create(False, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := 2234234.543234;
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = False);
  Check(AReasonForRejection <> '');
end;

procedure TTFieldTest.TestParse_StringField_DoNotAcceptEmpty_NonEmptyValue_Valid;
var
  ReturnValue: Boolean;
  AReasonForRejection: String;
  ADateSeparator: Char;
begin
  ADateSeparator := '-';
  AReasonForRejection := '';
  FField := TField.Create(False, 'String', 'dd/mm/yyyy', ADateSeparator, 0);
  FField.Value := 'This is another String';
  ReturnValue := FField.Parse(AReasonForRejection);
  Check(ReturnValue = True);
  Check(AReasonForRejection = '');
end;

initialization
  RegisterTest(TTFieldTest.Suite);

end.

