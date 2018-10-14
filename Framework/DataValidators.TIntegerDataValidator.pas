unit DataValidators.TIntegerDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IDataValidator;

type
  TIntegerDataValidator = class(TInterfacedObject, IDataValidator)
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TIntegerDataValidator }

constructor TIntegerDataValidator.Create;
begin
  inherited;

end;

destructor TIntegerDataValidator.Destroy;
begin

  inherited;
end;

function TIntegerDataValidator.Parse(const AValue: Variant): Boolean;
var
  AuxResult: Integer;
begin
  Result := VarType(AValue) = varInteger;
  if not Result then
    Result := TryStrToInt(AValue, AuxResult);
end;

end.
