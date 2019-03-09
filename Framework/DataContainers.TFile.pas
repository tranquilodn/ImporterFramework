unit DataContainers.TFile;

interface

uses
  System.SysUtils, System.Classes,
  Framework.Interfaces;

type
  TFile = class(TInterfacedObject, IFIle)
  strict private
    FFile: TStringList;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string); overload;
    procedure LoadFromFile(const AFileName: string; AEncoding: TEncoding); overload;
    procedure SaveToFile(const AFileName: string); overload;
    procedure SaveToFile(const AFileName: string; AEncoding: TEncoding); overload;
    function Add(const AString: string): Integer;
    procedure Clear;
    property Count: Integer read GetCount;
  end;

implementation

{ TFile }

function TFile.Add(const AString: string): Integer;
begin
  Result := FFile.Add(AString);
end;

procedure TFile.Clear;
begin
  FFile.Clear;
end;

constructor TFile.Create;
begin
  inherited;
  FFile := TStringList.Create;
end;

destructor TFile.Destroy;
begin
  FFile.Free;
  inherited;
end;

function TFile.GetCount: Integer;
begin
  Result := FFile.Count;
end;

procedure TFile.LoadFromFile(const AFileName: string; AEncoding: TEncoding);
begin
  FFile.Clear;
  FFile.LoadFromFile(AFileNAme, AEncoding);
end;

procedure TFile.SaveToFile(const AFileName: string; AEncoding: TEncoding);
begin
  FFile.SaveToFile(AFileName, AEncoding);
end;

procedure TFile.SaveToFile(const AFileName: string);
begin
  FFile.SaveToFile(AFileName);
  FFile.Count
end;

procedure TFile.LoadFromFile(const AFileName: string);
begin
  FFile.Clear;
  FFile.LoadFromFile(AFileNAme);
end;

end.
