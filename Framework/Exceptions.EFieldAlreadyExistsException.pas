unit Exceptions.EFieldAlreadyExistsException;

interface

uses
  System.SysUtils;

type
  EFieldNameMustBeUniqueException = class(Exception)
  const
    FIELD_NAME_MUST_BE_UNIQUE_MESSAGE = 'Field Name must be unique';
  end;

implementation

end.
