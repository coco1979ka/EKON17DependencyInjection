unit ConsoleMessageWriter;

interface

uses
  MessageWriter;

type
  TConsoleMessageWriter = class(TInterfacedObject, IMessageWriter)
  protected
    procedure Write(Msg: string);
  end;

implementation

{ TConsoleMessageWriter }

procedure TConsoleMessageWriter.Write(Msg: string);
begin
  Writeln(Msg);
end;

end.
