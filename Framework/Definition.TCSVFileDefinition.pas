unit Definition.TCSVFileDefinition;

interface

uses
  System.SysUtils, System.Variants, System.Generics.Collections,
  Framework.Interfaces,
  Interfaces.IRecord,
  Interfaces.IFile,
  DataContainers.TFile;

type
  TCSVFileDefinition = class(TInterfacedObject, IDefinition)
  strict private
    FFileStructure: IFile;
    FRecord: IRecord;
    function ProcessFileDefinition: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Prepare: Boolean;
    procedure LoadFromFile(const AFileName: string); overload;
    procedure LoadFromFile(const AFileName: string; AEncoding: TEncoding); overload;
  end;

implementation

{ TCSVFileDefinition }

constructor TCSVFileDefinition.Create;
begin
  inherited Create;
  FFileStructure := TFile.Create;
end;

destructor TCSVFileDefinition.Destroy;
begin
  inherited;
end;

procedure TCSVFileDefinition.LoadFromFile(const AFileName: string;
  AEncoding: TEncoding);
begin
  FFileStructure.Clear;
  FFileStructure.LoadFromFile(AFileName, AEncoding);
end;

function TCSVFileDefinition.Prepare: Boolean;
begin
  Result := ProcessFileDefinition;
end;

function TCSVFileDefinition.ProcessFileDefinition: Boolean;
var
  Index: Integer;
begin
  for Index := 0 to FFileStructure.Count -1 do
  begin


  end;
end;

procedure TCSVFileDefinition.LoadFromFile(const AFileName: string);
begin
  FFileStructure.Clear;
  FFileStructure.LoadFromFile(AFileName);
end;

end.
