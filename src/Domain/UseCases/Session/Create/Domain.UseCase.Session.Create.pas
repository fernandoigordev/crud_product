unit Domain.UseCase.Session.Create;

interface
uses
  Domain.UseCase.Session.Create.Interfaces, Data.Repository.Session.Interfaces,
  Domain.Abstraction.Session;

type
  TUseCaseCreateSession = Class(TInterfacedObject, IUseCaseCreateSession)
    private
      FRepositorySession: IRepositorySession;
    public
      function Execute(AbstractionSession: TAbstractionSession): Boolean;
      Constructor Create(ARepositoryGroup: IRepositorySession);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseCreateSession }

constructor TUseCaseCreateSession.Create(ARepositoryGroup: IRepositorySession);
begin
  inherited Create;
  FRepositorySession := ARepositoryGroup;
end;

function TUseCaseCreateSession.Execute(AbstractionSession: TAbstractionSession): Boolean;
begin
  Result := False;
  try
    FRepositorySession.CreateSession(AbstractionSession);
    Result := True;
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao criar Session: ', E.Message));
    end;
  end;
end;

end.
