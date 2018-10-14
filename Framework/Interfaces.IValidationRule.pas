unit Interfaces.IValidationRule;

interface

type
  IValidationRule = interface(IInterface)
    ['{7CD39036-1AB4-4D63-BDD7-E14D2AE76396}']
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

implementation

end.
