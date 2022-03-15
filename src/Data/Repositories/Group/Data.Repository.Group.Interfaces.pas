unit Data.Repository.Group.Interfaces;

interface
uses
  Domain.Abstraction.Group, System.Generics.Collections;

type
IRepositoryGroup = Interface
  procedure CreateGroup(AbstractionGroup: TAbstractionGroup);
  function ReadGroup(AId: Integer): TAbstractionGroup;
  function ReadGroups: TObjectList<TAbstractionGroup>;
  procedure UpdateGroup(AbstractionGroup: TAbstractionGroup);
  procedure DeleteGroup(AId: Integer);
End;

implementation

end.
