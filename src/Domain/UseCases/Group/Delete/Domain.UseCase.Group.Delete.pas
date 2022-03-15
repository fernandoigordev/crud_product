unit Domain.UseCase.Group.Delete;

interface
uses
  Domain.UseCase.Group.Delete.Interfaces, Data.Repository.Group.Interfaces;

type
TUseCaseDeleteGroup = Class(TInterfacedObject, IUseCaseDeleteGroup)
  private
    FRepositoryGroup: IRepositoryGroup;
  public
    procedure Execute(AId: Integer);
    Constructor Create(ARepositoryGroup: IRepositoryGroup);
End;


implementation

uses
  System.SysUtils;

{ TUseCaseDeleteGroup }

constructor TUseCaseDeleteGroup.Create(ARepositoryGroup: IRepositoryGroup);
begin
  inherited Create;
  FRepositoryGroup := ARepositoryGroup;
end;

procedure TUseCaseDeleteGroup.Execute(AId: Integer);
begin
  try
    FRepositoryGroup.DeleteGroup(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao deletar o grupo: ', E.Message));
    end;
  end;
end;

end.
