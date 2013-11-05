unit OtherService;

interface

uses
  Service;

type
  TOtherService = class (TInterfacedObject, IService)
  protected
    procedure DoSomething;
  end;

implementation

{ TOtherService }

procedure TOtherService.DoSomething;
begin
  Writeln('Hallo Welt');
end;

end.
