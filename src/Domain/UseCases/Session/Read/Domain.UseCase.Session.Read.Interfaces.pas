unit Domain.UseCase.Session.Read.Interfaces;

interface

uses
  Domain.Abstraction.Session, System.Generics.Collections;

type
IUseCaseReadSession = interface
  function Execute(AId: Integer): TAbstractionSession;
end;

IUseCaseReadSessions = interface
  function Execute: TObjectList<TAbstractionSession>;
end;

implementation

end.
