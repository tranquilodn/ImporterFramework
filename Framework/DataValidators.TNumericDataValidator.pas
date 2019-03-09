unit DataValidators.TNumericDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Framework.Interfaces;

type
  TNumericDataValidator = class(TInterfacedObject, IDataValidator)
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TNumericDataValidator }

constructor TNumericDataValidator.Create;
begin
  inherited;

end;

destructor TNumericDataValidator.Destroy;
begin

  inherited;
end;

function TNumericDataValidator.Parse(const AValue: Variant): Boolean;
var
  AuxResult: Extended;
begin
  Result := VarType(AValue) = varDouble;
  if not Result then
    Result := TryStrToFloat(AValue, AuxResult);
end;

end.
