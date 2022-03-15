unit Domain.UseCase.Group.Update;

interface
uses
  Domain.UseCase.Group.Update.Interfaces, Domain.Abstraction.Group,
  Data.Repository.Group.Interfaces;

type
TUseCaseUpdateGroup = Class(TInterfacedObject, IUseCaseUpdateGroup)
  private
    FRepositoryGroup: IRepositoryGroup;
  public
    procedure Execute(AbstractionGroup: TAbstractionGroup);
    Constructor Create(ARepositoryGroup: IRepositoryGroup);
End;


implementation

uses
  System.SysUtils;

{ TUseCaseUpdateGroup }

constructor TUseCaseUpdateGroup.Create(ARepositoryGroup: IRepositoryGroup);
begin
  inherited Create;
  FRepositoryGroup := ARepositoryGroup;
end;

procedure TUseCaseUpdateGroup.Execute(AbstractionGroup: TAbstractionGroup);
begin
  try
    FRepositoryGroup.UpdateGroup(AbstractionGroup);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao atualizar o grupo: ', E.Message));
    end;
  end;
end;

end.
