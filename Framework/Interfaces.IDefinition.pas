unit Interfaces.IDefinition;

interface

uses
  System.SysUtils;

type
  IDefinition = interface(IInterface)
    ['{1F86BADE-DA3F-4A33-AF36-8FB2F815FB74}']
    procedure LoadFromFile(const AFileName: string); overload;
    procedure LoadFromFile(const AFileName: string; AEncoding: TEncoding); overload;
    function Prepare: Boolean;
  end;

implementation

end.
