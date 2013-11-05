unit Lib.TestImpl;

interface

uses
  Lib.Services;

type
  [Singleton]
  TTest = class(TInterfacedObject, ITest)
  private
    FWelcomeMessage: string;
  protected
    procedure Test;
  public
    constructor Create(WelcomeMsg: string);
    destructor Destroy; override;
  end;

implementation

{ TTest }

constructor TTest.Create(WelcomeMsg : string);
begin
  Writeln('Creating Test');
  FWelcomeMessage := WelcomeMsg;
end;

destructor TTest.Destroy;
begin
  Writeln('Destroying Test');
  inherited;
end;

procedure TTest.Test;
begin
  Writeln(FWelcomeMessage);
end;

end.
