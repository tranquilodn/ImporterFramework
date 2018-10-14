unit DataValidators.TStringDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Interfaces.IDataValidator;

type
  TStringDataValidator = class(TInterfacedObject, IDataValidator)
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TStringDataValidator }

constructor TStringDataValidator.Create;
begin
  inherited;

end;

destructor TStringDataValidator.Destroy;
begin

  inherited;
end;

function TStringDataValidator.Parse(const AValue: Variant): Boolean;
begin
  Result := ((VarType(AValue) = varOleStr)
    or (VarType(AValue) = varString)
    or (VarType(AValue) = varUString));
end;

end.
