unit Utils.TArrayUtil;

interface

type
  TArrayUtil<T> = class
  public
    class procedure Append(var AArray: TArray<T>; const AValue: T);
  end;

implementation

{ TArrayUtil<T> }

class procedure TArrayUtil<T>.Append(var AArray: TArray<T>; const AValue: T);
begin
  SetLength(AArray, Length(AArray) + 1);
  AArray[High(AArray)] := AValue;
end;

end.
