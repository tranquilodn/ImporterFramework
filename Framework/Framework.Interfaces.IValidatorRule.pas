unit Framework.Interfaces.IValidatorRule;

interface

type
  IValidationRule = interface(IInterface)
    ['{2EC585CF-F095-4B6E-88D3-6108ACFD64E2}']
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

implementation

end.
