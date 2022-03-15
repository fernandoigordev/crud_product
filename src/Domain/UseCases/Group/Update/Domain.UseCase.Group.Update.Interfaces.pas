unit Domain.UseCase.Group.Update.Interfaces;

interface
uses
  Domain.Abstraction.Group;

type
IUseCaseUpdateGroup = Interface
  procedure Execute(AbstractionGroup: TAbstractionGroup);
End;

implementation

end.
