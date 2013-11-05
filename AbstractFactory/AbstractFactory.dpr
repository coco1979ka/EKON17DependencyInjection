program AbstractFactory;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Coordinates in '..\MethodInjection\Coordinates.pas',
  FastestRoute in '..\MethodInjection\FastestRoute.pas',
  Navigator in '..\MethodInjection\Navigator.pas',
  NullRoute in '..\MethodInjection\NullRoute.pas',
  RouteStrategy in '..\MethodInjection\RouteStrategy.pas',
  ShortestRoute in '..\MethodInjection\ShortestRoute.pas',
  NavigationControler in 'NavigationControler.pas',
  RouteStrategyFactory in 'RouteStrategyFactory.pas';

var
  NavigationController: TNavigationController;
  Input : string;

begin
  try
    Writeln('Berechne Route von Köln nach Düsseldorf:');

    Writeln('Bitte Typ angeben: (Shortest, Fastest)');
    Readln(Input);
    NavigationController := TNavigationController.Create(TNavigator.Create, TRouteStrategyFactory.Create);
    NavigationController.Calculate(Input);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
