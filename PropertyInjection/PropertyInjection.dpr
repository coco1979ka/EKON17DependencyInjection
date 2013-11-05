program PropertyInjection;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Service in 'Service.pas',
  Consumer in 'Consumer.pas',
  OtherService in 'OtherService.pas';

var
  Consumer: TConsumer;

begin
  try
    Consumer := TConsumer.Create;
    try
      Consumer.Service := TOtherService.Create;
      Consumer.Test;
    finally
      Consumer.Free;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
