unit Navigator;

interface

uses
  SysUtils,
  Coordinates,
  RouteStrategy;

type
  TNavigator = class
    private
      FRouteStrategy: IRouteStrategy;
      FFromCity,
      FToCity : string;
      function CityToCoordinates (City: string) : TCoordinates;
      procedure SetFromCity(const Value: string);
      procedure SetToCity(const Value: string);
    public
      constructor Create(RouteStrategy: IRouteStrategy = nil);
      function CalculateRoute(Strategy: IRouteStrategy):string;
      property FromCity: string read FFromCity write SetFromCity;
      property ToCity: string read FToCity write SetToCity;
  end;
implementation

{ TUploader }

function TNavigator.CalculateRoute(Strategy: IRouteStrategy) : string;
begin
Result := Strategy.Calculate(CityToCoordinates(FFromCity),
                                    CityToCoordinates(ToCity));
end;

function TNavigator.CityToCoordinates (City: string): TCoordinates;

begin
if City = 'K�ln' then
  begin
  Result.Alt  := 50.2839123;
  Result.Long := 6.1237812;
  end
else if City = 'D�sseldorf' then
  begin
  Result.Alt  := 51.236723;
  Result.Long := 6.3892835;
  end;
end;

constructor TNavigator.Create(RouteStrategy: IRouteStrategy);
begin
  FRouteStrategy := RouteStrategy;
end;

procedure TNavigator.SetFromCity(const Value: string);
begin
  if not SameText (Value, 'K�ln') then
    raise Exception.Create('Wir sind nicht in ' + Value);
  FFromCity := Value;
end;

procedure TNavigator.SetToCity(const Value: string);
begin
  if not SameText(Value, 'D�sseldorf') then
    raise Exception.Create('Ich habe sie nicht verstanden!');
  FToCity := Value;
end;

end.
