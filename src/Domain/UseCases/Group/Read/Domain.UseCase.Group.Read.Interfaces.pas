unit Domain.UseCase.Group.Read.Interfaces;

interface
uses
  Domain.Abstraction.Group, System.Generics.Collections;

type
IUseCaseReadGroup = Interface
  function Execute(AId: Integer): TAbstractionGroup;
End;

IUseCaseReadGroups = Interface
  function Execute: TObjectList<TAbstractionGroup>;
End;


implementation

end.
