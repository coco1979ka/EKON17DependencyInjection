program HelloWorldDI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  MessageWriter in 'MessageWriter.pas',
  ConsoleMessageWriter in 'ConsoleMessageWriter.pas',
  Salutation in 'Salutation.pas';

var
  ConsoleWriter: IMessageWriter;
  Salutation: TSalutation;

begin
  try
    ConsoleWriter := TConsoleMessageWriter.Create;
    Salutation := TSalutation.Create(ConsoleWriter);
    try
      Salutation.Exclaim;
    finally
      Salutation.Free;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
