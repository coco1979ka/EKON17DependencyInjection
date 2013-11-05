unit Service;

interface

type
  IService = interface
    ['{202CAE1A-F529-496B-B673-C5863C660704}']
    procedure DoSomething;
  end;

  TDefaultService = class (TInterfacedObject, IService)
    protected
      procedure DoSomething;
  end;

implementation

{ TDefaultService }

procedure TDefaultService.DoSomething;
begin
  Writeln('Hello World');
end;

end.
