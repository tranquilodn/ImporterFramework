unit DataValidators.TDateTimeDataValidator;

interface

uses
  System.SysUtils, System.Variants,
  Framework.Interfaces;

type
  TDateTimeDataValidator = class(TInterfacedObject, IDataValidator)
  strict private
    FDateFormatSettings: TFormatSettings;
    procedure SetDateSeparator(const AValue: Char);
    procedure SetDateFormat(const AValue: String);
  public
    constructor Create(const ADateFormat: String; const ADateSeparator: Char);
    destructor Destroy; override;
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

{ TDateTimeDataValidator }

constructor TDateTimeDataValidator.Create(const ADateFormat: String;
  const ADateSeparator: Char);
begin
  inherited Create;
  SetDateFormat(ADateFormat);
  SetDateSeparator(ADateSeparator);

end;

destructor TDateTimeDataValidator.Destroy;
begin

  inherited;
end;

function TDateTimeDataValidator.Parse(const AValue: Variant): Boolean;
var
  AuxResult: TDateTime;
begin
  Result := VarType(AValue) = varDate;
  if not Result then
    Result := TryStrToDateTime(AValue, AuxResult, FDateFormatSettings);
end;

procedure TDateTimeDataValidator.SetDateSeparator(const AValue: Char);
begin
  FDateFormatSettings.DateSeparator := AValue;
end;

procedure TDateTimeDataValidator.SetDateFormat(const AValue: String);
begin
  FDateFormatSettings.ShortDateFormat := AValue;
end;

end.
