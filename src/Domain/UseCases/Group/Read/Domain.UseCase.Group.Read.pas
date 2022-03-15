unit Domain.UseCase.Group.Read;

interface
uses
  Domain.UseCase.Group.Read.Interfaces, Domain.Abstraction.Group,
  Data.Repository.Group.Interfaces, System.Generics.Collections;

type
TUseCaseReadGroup = Class(TInterfacedObject, IUseCaseReadGroup)
  private
    FRepositoryGroup: IRepositoryGroup;
  public
    function Execute(AId: Integer): TAbstractionGroup;
    Constructor Create(ARepositoryGroup: IRepositoryGroup);
End;

TUseCaseReadGroups = Class(TInterfacedObject, IUseCaseReadGroups)
  private
    FRepositoryGroup: IRepositoryGroup;
  public
    function Execute: TObjectList<TAbstractionGroup>;
    Constructor Create(ARepositoryGroup: IRepositoryGroup);
End;


implementation

uses
  System.SysUtils;

{ TUseCaseReadGroup }

constructor TUseCaseReadGroup.Create(ARepositoryGroup: IRepositoryGroup);
begin
  inherited Create;
  FRepositoryGroup := ARepositoryGroup;
end;

function TUseCaseReadGroup.Execute(AId: Integer): TAbstractionGroup;
begin
  Result := Nil;
  try
    Result := FRepositoryGroup.ReadGroup(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao ler o grupo: ', E.Message));
    end;
  end;
end;

{ TUseCaseReadGroups }

constructor TUseCaseReadGroups.Create(ARepositoryGroup: IRepositoryGroup);
begin
  inherited Create;
  FRepositoryGroup := ARepositoryGroup;
end;

function TUseCaseReadGroups.Execute: TObjectList<TAbstractionGroup>;
begin
  Result := nil;
  try
    Result := FRepositoryGroup.ReadGroups;
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao Ler os grupos: ', E.Message));
    end;
  end;
end;

end.
