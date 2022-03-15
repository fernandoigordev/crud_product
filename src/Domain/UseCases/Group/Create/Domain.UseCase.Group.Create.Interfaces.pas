unit Domain.UseCase.Group.Create.Interfaces;

interface
uses Domain.Abstraction.Group;

type
IUseCaseCreateGroup = Interface
  function Execute(AbstractionGroup: TAbstractionGroup): Boolean;
End;

implementation

end.
