unit IncrementalTimeProvider;

interface

uses
  TimeProvider;

type
  TIncrementalTimeProvider = class (TInterfacedObject, ITimeProvider)
  private
    FValue : TDateTime;
  protected
    function UtcNow: TDateTime;
  public
    constructor Create;
  end;

implementation

uses
  SysUtils;

{ TIncrementalTimeProvider }

constructor TIncrementalTimeProvider.Create;
begin
  FValue := Now;
end;

function TIncrementalTimeProvider.UtcNow: TDateTime;
begin
  Result := FValue;
  FValue := FValue + EncodeTime(0,0,1,0);
end;

end.
