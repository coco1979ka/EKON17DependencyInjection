program SelfMadeDI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Lib.Services,
  MyContainer in 'MyContainer.pas';

var
  Service : TFirstService;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Service := TMyContainer.InjectFirstService(TApplicationContext.Create);
    try
      Service.Consume;
    finally
      Service.Free;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
