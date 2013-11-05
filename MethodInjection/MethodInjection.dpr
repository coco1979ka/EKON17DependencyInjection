program MethodInjection;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Navigator in 'Navigator.pas',
  RouteStrategy in 'RouteStrategy.pas',
  Coordinates in 'Coordinates.pas',
  ShortestRoute in 'ShortestRoute.pas',
  FastestRoute in 'FastestRoute.pas',
  NullRoute in 'NullRoute.pas';

var
  Navi : TNavigator;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    Writeln('Berechne Route von K�ln nach D�sseldorf: ');
    Navi := TNavigator.Create(TNullRoute.Create);
    try
      Navi.FromCity := 'K�ln';
      Navi.ToCity := 'D�sseldorf';

      Writeln('K�rzeste: ');
      Writeln(Navi.CalculateRoute(TShortestRoute.Create));

      Writeln('Schnellste: ');
      Writeln(Navi.CalculateRoute(TFastestRoute.Create));
    finally
      Navi.Free;
    end;
    Readln;
  except
    on E: Exception do
      begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
      end;
  end;
end.
