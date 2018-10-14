unit Interfaces.IRecord;

interface

uses
  System.SysUtils,
  Interfaces.IField;

type
  IRecord = interface(IInterface)
    ['{49628DFF-B6B4-489D-8419-5F63ABD2D889}']
    function GetFields: TArray<IField>;
    function FieldByName(const AFieldName: String): IField;
    procedure AddField(const AField: IField);
    property Fields: TArray<IField> read GetFields;
  end;

implementation

end.
