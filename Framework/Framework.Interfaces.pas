unit Framework.Interfaces;

interface

uses
  System.SysUtils;

type
  IFile = interface(IInterface)
    ['{960B153E-2687-40D1-A1F9-9DF228A07D14}']
    procedure LoadFromFile(const AFileName: string); overload;
    procedure SaveToFile(const AFileName: string); overload;
    procedure LoadFromFile(const AFileName: string; AEncoding: TEncoding); overload;
    procedure SaveToFile(const AFileName: string; AEncoding: TEncoding); overload;
    function Add(const AString: string): Integer;
    function GetCount: Integer;
    property Count: Integer read GetCount;
    procedure Clear;
  end;

  IDefinition = interface(IInterface)
    ['{1F86BADE-DA3F-4A33-AF36-8FB2F815FB74}']
    procedure LoadFromFile(const AFileName: string); overload;
    procedure LoadFromFile(const AFileName: string; AEncoding: TEncoding); overload;
    function Prepare: Boolean;
  end;

implementation

end.
