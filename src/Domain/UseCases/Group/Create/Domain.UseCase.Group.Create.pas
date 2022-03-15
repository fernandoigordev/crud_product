unit Domain.UseCase.Group.Create;

interface
uses
  Domain.UseCase.Group.Create.Interfaces, Domain.Abstraction.Group,
  Data.Repository.Group.Interfaces;

type
TUseCaseCreateGroup = Class(TInterfacedObject, IUseCaseCreateGroup)
  private
    FRepositoryGroup: IRepositoryGroup;
  public
    function Execute(AbstractionGroup: TAbstractionGroup): Boolean;
    Constructor Create(ARepositoryGroup: IRepositoryGroup);
End;

implementation

uses
  System.SysUtils;

{ TUseCaseCreateGroup }

constructor TUseCaseCreateGroup.Create(ARepositoryGroup: IRepositoryGroup);
begin
  inherited Create;
  FRepositoryGroup := ARepositoryGroup;
end;


function TUseCaseCreateGroup.Execute(AbstractionGroup: TAbstractionGroup): Boolean;
begin
  Result := False;
  try
    FRepositoryGroup.CreateGroup(AbstractionGroup);
    Result := True;
  Except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao criar grupo: ', E.Message));
    end;
  end;
end;

end.
