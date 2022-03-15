unit Data.Repository.Session.Interfaces;

interface
uses
  Domain.Abstraction.Session, System.Generics.Collections;

type
IRepositorySession = Interface
  procedure CreateSession(AbstractionSession: TAbstractionSession);
  function ReadSession(AId: Integer): TAbstractionSession;
  function ReadSessions: TObjectList<TAbstractionSession>;
  procedure UpdateSession(AbstractionSession: TAbstractionSession);
  procedure DeleteSession(AId: Integer);
End;


implementation

end.
