unit Lib.Services;

{$M+}

interface

uses
  Ambrosia.Attributes;

type
  ITest = interface
    ['{A4F8404D-8C1A-4860-AB7E-12915C13A3D5}']
    procedure Test;
  end;


  TFirstService = class
    private
      FTest : ITest;
    public
      constructor Create(Test : ITest);
      procedure Consume;
  end;

implementation

uses
  SysUtils;

{ TFirstService }

procedure TFirstService.Consume;
begin
  FTest.Test;
end;

constructor TFirstService.Create(Test: ITest);
begin
  if not Assigned(Test) then
    raise EArgumentException.Create('Injected service may not be nil');
  FTest := Test;
end;

end.
