unit Consumer;

interface

uses
  Service;

type
  TConsumer = class
  private
    FService: IService;
    function GetService: IService;
    procedure SetService(const Value: IService);
  public
    property Service: IService read GetService write SetService;
    procedure Test;
  end;

implementation

uses
  Classes,
  SysUtils;

{ TConsumer }

function TConsumer.GetService: IService;
begin
  if not Assigned(FService) then
    FService := TDefaultService.Create;
  Result := FService;
end;

procedure TConsumer.SetService(const Value: IService);
begin
  if not Assigned(Value) then
    raise EArgumentException.Create('Value must not be nil');
  if Assigned(FService) then
    raise EInvalidOperation.Create('Service has already been set');
  FService := Value;
end;

procedure TConsumer.Test;
begin
  Service.DoSomething;
end;

end.
