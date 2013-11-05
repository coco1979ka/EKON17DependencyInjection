unit TimeProvider;

interface

type
  ITimeProvider = interface
    ['{A1E218EE-D684-4D68-BE9C-845E479CDA80}']
    function UtcNow: TDateTime;
  end;

  TTimeProvider = class abstract(TInterfacedObject, ITimeProvider)
  private
    type
    TDefaultTimeProvider = class(TInterfacedObject, ITimeProvider)
    protected
      function UtcNow: TDateTime;
    end;
    class var FCurrent: ITimeProvider;
    class function GetCurrent: ITimeProvider; static;
    class procedure SetCurrent(const Value: ITimeProvider); static;
  protected
    function UtcNow: TDateTime;
  public
    class constructor Create;
    class procedure ResetToDefault;
    class property Current: ITimeProvider read GetCurrent write SetCurrent;
  end;

implementation

uses
  SysUtils,
  Windows;

{ TTimeProvider }

class constructor TTimeProvider.Create;
begin
  TTimeProvider.FCurrent := TDefaultTimeProvider.Create;
end;

class function TTimeProvider.GetCurrent: ITimeProvider;
begin
  Result := TTimeProvider.FCurrent;
end;

class procedure TTimeProvider.ResetToDefault;
begin
  TTimeProvider.FCurrent := TDefaultTimeProvider.Create;
end;

class procedure TTimeProvider.SetCurrent(const Value: ITimeProvider);
begin
  TTimeProvider.FCurrent := Value;
end;

function TTimeProvider.UtcNow: TDateTime;
begin
  TTimeProvider.FCurrent.UtcNow;
end;

{ TTimeProvider.TDefaultTimeProvider }

function TTimeProvider.TDefaultTimeProvider.UtcNow: TDateTime;
var
  SystemTime: TSystemTime;
begin
  GetSystemTime(SystemTime);
  Result := EncodeDate(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) +
    EncodeTime(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond,
    SystemTime.wMilliseconds);
end;

end.
