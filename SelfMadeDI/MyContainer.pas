unit MyContainer;

interface

uses
  Lib.Services;

type
  TApplicationContext = class
    private
      FWelcomeMessage : string;
      FTestSingleton : ITest;
    public
      constructor Create();
      property WelcomeMessage : string read FWelcomeMessage;
      property TestSingleton : ITest read FTestSingleton;
  end;

  TMyContainer = class
    public
      class function InjectFirstService (Context : TApplicationContext) : TFirstService; static;
      class function InjectTest (Context : TApplicationContext) : ITest; static;
      class function InjectWelcomeMessage (Context : TApplicationContext) : string; static;
  end;

implementation

uses
  Lib.TestImpl;

{ TMyContainer }

class function TMyContainer.InjectFirstService(Context: TApplicationContext): TFirstService;
begin
  Result := TFirstService.Create(InjectTest(Context));
end;

class function TMyContainer.InjectTest(Context: TApplicationContext): ITest;
begin
  Result := TTest.Create(InjectWelcomeMessage(Context));
end;

class function TMyContainer.InjectWelcomeMessage(Context: TApplicationContext): string;
begin
  Result := Context.WelcomeMessage;
end;

{ TApplicationContext }

constructor TApplicationContext.Create;
begin
  FWelcomeMessage := 'Hallo Köln';
end;

end.
