unit Domain.UseCase.Session.Read;

interface

uses
    Domain.Abstraction.Session, System.Generics.Collections,
    Data.Repository.Session.Interfaces, Domain.UseCase.Session.Read.Interfaces;

type
TUseCaseReadSession = Class(TInterfacedObject, IUseCaseReadSession)
  private
    FRepositorySession: IRepositorySession;
  public
    function Execute(AId: Integer): TAbstractionSession;
    Constructor Create(ARepositorySession: IRepositorySession);
End;

TUseCaseReadSessions = Class(TInterfacedObject, IUseCaseReadSessions)
  private
    FRepositorySession: IRepositorySession;
  public
    function Execute: TObjectList<TAbstractionSession>;
    Constructor Create(ARepositorySession: IRepositorySession);
End;

implementation

uses
  System.SysUtils;


{ TUseCaseReadSession }

constructor TUseCaseReadSession.Create(ARepositorySession: IRepositorySession);
begin
  FRepositorySession := ARepositorySession;
end;

function TUseCaseReadSession.Execute(AId: Integer): TAbstractionSession;
begin
  Result := nil;
  try
    Result := FRepositorySession.ReadSession(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao ler Sesão: ', E.Message));
    end;
  end;
end;

{ TUseCaseReadSessions }

constructor TUseCaseReadSessions.Create(ARepositorySession: IRepositorySession);
begin
  FRepositorySession := ARepositorySession;
end;

function TUseCaseReadSessions.Execute: TObjectList<TAbstractionSession>;
begin
  Result := nil;
  try
    Result := FRepositorySession.ReadSessions;
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao ler Sessões: ', E.Message));
    end;
  end;
end;

end.
