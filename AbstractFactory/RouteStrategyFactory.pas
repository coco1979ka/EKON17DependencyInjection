unit RouteStrategyFactory;

interface

uses
  RouteStrategy;

type
  TRouteType = (rtNone, rtFastest, rtShortest);

  IRouteStrategyFactory = interface
    ['{8C78107F-831E-4C16-BA0D-775A6B9262BF}']
    function CreateRouteStrategy(RouteType : TRouteType) : IRouteStrategy;
  end;

  TRouteStrategyFactory = class (TInterfacedObject, IRouteStrategyFactory)
  protected
    function CreateRouteStrategy(RouteType: TRouteType): IRouteStrategy;
  end;

implementation

uses
  ShortestRoute,
  FastestRoute,
  NullRoute;

{ TRouteStrategyFactory }

function TRouteStrategyFactory.CreateRouteStrategy(
  RouteType: TRouteType): IRouteStrategy;
begin
  case RouteType of
    rtFastest: Result := TFastestRoute.Create;
    rtShortest: Result := TShortestRoute.Create;
    else
      Result := TNullRoute.Create;
  end;
end;

end.
