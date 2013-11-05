unit RouteStrategyFactory;

interface

type
  TRouteType = (rtFastest, rtShortest);

  IRouteStrategyFactory = interface
    ['{8C78107F-831E-4C16-BA0D-775A6B9262BF}']
    function CreateRouteStrategy(RouteType : TRouteType);
  end;

implementation

end.
