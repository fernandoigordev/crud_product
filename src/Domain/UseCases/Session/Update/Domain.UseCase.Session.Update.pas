unit Domain.UseCase.Session.Update;

interface

uses
  Domain.Abstraction.Session, Domain.UseCase.Session.Update.Interfaces,
  Data.Repository.Session.Interfaces;

type
  TUseCaseUpdateSession = Class(TInterfacedObject, IUseCaseUpdateSession)
    private
      FRepositorySession: IRepositorySession;
    public
      procedure Execute(AbstractionSession: TAbstractionSession);
      Constructor Create(ARepositorySession: IRepositorySession);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseUpdateSession }

constructor TUseCaseUpdateSession.Create(ARepositorySession: IRepositorySession);
begin
  inherited Create;
  FRepositorySession := ARepositorySession;
end;

procedure TUseCaseUpdateSession.Execute(AbstractionSession: TAbstractionSession);
begin
  try
    FRepositorySession.UpdateSession(AbstractionSession);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao atualizar Sessão: ', E.Message));
    end;
  end;
end;

end.
