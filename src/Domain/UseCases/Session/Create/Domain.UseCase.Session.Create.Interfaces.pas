unit Domain.UseCase.Session.Create.Interfaces;

interface
uses
  Domain.Abstraction.Session;

type

IUseCaseCreateSession = interface
  function Execute(AbstractionSession: TAbstractionSession): Boolean;
end;

implementation

end.
