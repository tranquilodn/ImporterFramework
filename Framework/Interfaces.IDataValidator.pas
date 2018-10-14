unit Interfaces.IDataValidator;

interface

type
  IDataValidator = interface(IInterface)
    ['{D022EC8D-13B4-4BA0-96EE-C4E14E022696}']
    function Parse(const AValue: Variant): Boolean;
  end;

implementation

end.
