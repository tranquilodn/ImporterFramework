unit DataValidators.TCurrencyDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IDataValidator;

type
  TCurrencyDataValidator = class(TInterfacedObject, IDataValidator)
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TCurrencyDataValidator }

constructor TCurrencyDataValidator.Create;
begin
  inherited;

end;

destructor TCurrencyDataValidator.Destroy;
begin

  inherited;
end;

function TCurrencyDataValidator.Parse(const AValue: Variant): Boolean;
var
  AuxResult: Currency;
begin
  Result := VarType(AValue) = varCurrency;
  if not Result then
    Result := TryStrToCurr(AValue, AuxResult);
end;

end.
