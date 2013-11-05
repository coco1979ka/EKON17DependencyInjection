unit Salutation;

interface

uses
  MessageWriter;

type
  TSalutation = class
  private
    FMessageWriter: IMessageWriter;
  public
    constructor Create(MessageWriter: IMessageWriter);
    procedure Exclaim;
  end;

implementation

{ TSalutation }

constructor TSalutation.Create(MessageWriter: IMessageWriter);
begin
  FMessageWriter := MessageWriter;
end;

procedure TSalutation.Exclaim;
begin
  FMessageWriter.Write('Hello DI');
end;

end.
