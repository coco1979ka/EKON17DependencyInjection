program AmbientContext;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  TimeProvider in 'TimeProvider.pas',
  IncrementalTimeProvider in 'IncrementalTimeProvider.pas';

begin
  try
    TTimeProvider.Current := TIncrementalTimeProvider.Create;
    Writeln(FormatDateTime('hh:nn:ss',TTimeProvider.Current.UtcNow));
    Sleep(3000);
    Writeln(FormatDateTime('hh:nn:ss',TTimeProvider.Current.UtcNow));
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
