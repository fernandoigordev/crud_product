unit Domain.UseCase.Session.Update.Interfaces;

interface

uses
  Domain.Abstraction.Session;

type
  IUseCaseUpdateSession = Interface
    procedure Execute(AbstractionSession: TAbstractionSession);
  End;


implementation

end.
