unit Framework.Interfaces;

interface

uses
  System.SysUtils;

type
  IDataValidator = interface(IInterface)
    ['{D022EC8D-13B4-4BA0-96EE-C4E14E022696}']
    function Parse(const AValue: Variant): Boolean;
  end;

  IValidationRule = interface(IInterface)
    ['{7CD39036-1AB4-4D63-BDD7-E14D2AE76396}']
    function Parse(const AValue: Variant; var AReasonForRejection: String): Boolean;
  end;

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

  IRecord = interface(IInterface)
    ['{49628DFF-B6B4-489D-8419-5F63ABD2D889}']
    function GetFields: TArray<IField>;
    function FieldByName(const AFieldName: String): IField;
    procedure AddField(const AField: IField);
    property Fields: TArray<IField> read GetFields;
  end;

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
