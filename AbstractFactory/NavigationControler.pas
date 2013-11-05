unit NavigationControler;

interface

uses
  RouteStrategyFactory,
  Navigator;

type
  TNavigationController = class
  private
    FNavigator: TNavigator;
    FRouteStrategyFactory: IRouteStrategyFactory;
  public
    constructor Create(Navigator: TNavigator; RouteStrategyFactory: IRouteStrategyFactory);
    procedure Calculate(UserInput: string);
    procedure Display;
  end;

implementation

uses
  RouteStrategy,
  StrUtils,
  SysUtils;

{ TNavigationController }

procedure TNavigationController.Calculate(UserInput: string);
var
  Strategy: IRouteStrategy;
  RouteType: TRouteType;
begin
  if StartsText('S', UserInput) then
    RouteType := rtShortest
  else if StartsText('F', UserInput) then
    RouteType := rtFastest
  else
    RouteType := rtNone;
  Strategy := FRouteStrategyFactory.CreateRouteStrategy(RouteType);
  FNavigator.FromCity := 'Köln';
  FNavigator.ToCity := 'Düsseldorf';
  Writeln(FNavigator.CalculateRoute(Strategy));
end;

constructor TNavigationController.Create(Navigator: TNavigator; RouteStrategyFactory: IRouteStrategyFactory);
begin
  if not Assigned(RouteStrategyFactory) then
    raise EArgumentException.Create('Factory must not be nil');
  if not Assigned(Navigator) then
    raise EArgumentException.Create('Navigator must not be nil');
  FNavigator := Navigator;
  FRouteStrategyFactory := RouteStrategyFactory;
end;

procedure TNavigationController.Display;
begin

end;

end.
