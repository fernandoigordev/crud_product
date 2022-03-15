unit Domain.UseCase.Session.Delete;

interface

uses
  Domain.UseCase.Session.Delete.Interfaces, Data.Repository.Session.Interfaces;

type
  TUseCaseDeleteSession = Class(TInterfacedObject, IUseCaseDeleteSession)
    private
      FRepositorySession: IRepositorySession;
    public
      procedure Execute(AId: Integer);
      Constructor Create(ARepositorySession: IRepositorySession);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseDeleteSession }

constructor TUseCaseDeleteSession.Create(ARepositorySession: IRepositorySession);
begin
  Inherited Create;
  FRepositorySession := ARepositorySession;
end;

procedure TUseCaseDeleteSession.Execute(AId: Integer);
begin
  try
    FRepositorySession.DeleteSession(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao deletar Sessão: ', E.Message));
    end;
  end;
end;

end.
