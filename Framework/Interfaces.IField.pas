unit Interfaces.IField;

interface

type
  IField = interface(IInterface)
    ['{17A1E04E-9020-4E17-BC2F-2D0D3E144960}']
    function GetName: String;
    procedure SetName(const AName: String);
    function GetValue: Variant;
    procedure SetValue(const AValue: Variant);
    property Name: String read GetName write SetName;
    function Parse(var AReasonForRejection: String): Boolean;
    property Value: Variant read GetValue write SetValue;
  end;

implementation

end.
