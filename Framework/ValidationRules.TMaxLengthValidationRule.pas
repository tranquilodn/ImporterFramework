unit ValidationRules.TMaxLengthValidationRule;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IValidationRule;

type
  TMaxLengthValidationRule = class(TInterfacedObject, IValidationRule)
  const
    INVALID_LENGTH_MESSAGE = 'Invalid length';
  strict private
    FMaxLength: Integer;
    procedure SetMaxLength(const AValue: Integer);
  public
    constructor Create(const AMaxLength: Integer);
    destructor Destroy; override;
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

implementation

{ TMaxLengthValidationRule }

constructor TMaxLengthValidationRule.Create(const AMaxLength: Integer);
begin
  inherited Create;
  SetMaxLength(AMaxLength);

end;

destructor TMaxLengthValidationRule.Destroy;
begin

  inherited;
end;

function TMaxLengthValidationRule.Parse(const AValue: Variant;
  var AReasonForRejection: String): Boolean;
begin
  Result := Length(Trim(AValue)) <= FMaxLength;
  if not Result then
    AReasonForRejection := Self.INVALID_LENGTH_MESSAGE;
end;

procedure TMaxLengthValidationRule.SetMaxLength(const AValue: Integer);
begin
  FMaxLength := AValue;
end;

end.
