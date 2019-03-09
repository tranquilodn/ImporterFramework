unit DataValidators.TBooleanDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Framework.Interfaces;

type
  TBooleanDataValidator = class(TInterfacedObject, IDataValidator)
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TBooleanDataValidator }

constructor TBooleanDataValidator.Create;
begin
  inherited;

end;

destructor TBooleanDataValidator.Destroy;
begin

  inherited;
end;

function TBooleanDataValidator.Parse(const AValue: Variant): Boolean;
begin
  Result := VarType(AValue) = varBoolean;
  if not Result then
    Result := (
      (UpperCase(Trim(AValue)) = 'TRUE') or
      (UpperCase(Trim(AValue)) = 'FALSE')
    );
end;

end.
