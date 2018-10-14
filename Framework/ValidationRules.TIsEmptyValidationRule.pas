unit ValidationRules.TIsEmptyValidationRule;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IValidationRule;

type
  TIsEmptyValidationRule = class(TInterfacedObject, IValidationRule)
  const
    IS_EMPTY_MESSAGE = 'Field is empty';
  strict private
    FAcceptEmtpy: Boolean;
    procedure SetAcceptEmtpy(const AAcceptEmpty: Boolean);
  public
    constructor Create(const AAcceptEmpty: Boolean);
    destructor Destroy; override;
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

implementation

{ TIsEmptyValidationRule }

constructor TIsEmptyValidationRule.Create(const AAcceptEmpty: Boolean);
begin
  inherited Create;
  SetAcceptEmtpy(AAcceptEmpty);
end;

destructor TIsEmptyValidationRule.Destroy;
begin

  inherited;
end;

function TIsEmptyValidationRule.Parse(const AValue: Variant;
  var AReasonForRejection: String): Boolean;
begin
  Result := FAcceptEmtpy;
  if not Result then
    Result := (Trim(AValue) <> '');
  if not Result then
    AReasonForRejection := Self.IS_EMPTY_MESSAGE;
end;

procedure TIsEmptyValidationRule.SetAcceptEmtpy(const AAcceptEmpty: Boolean);
begin
  if FAcceptEmtpy <> AAcceptEmpty then
    FAcceptEmtpy := AAcceptEmpty;
end;

end.
