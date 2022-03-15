unit Presentation.Controller.Session;

interface
uses
  cxImageComboBox,Data.Repository.Session.Interfaces,
  Datasnap.DBClient;

type
TSessionController = Class
  private
    FSessionRepository: IRepositorySession;
  public
    Procedure LoadSessions(AcxImageComboBox: TcxImageComboBox);

    Constructor Create(ARepositorySession: IRepositorySession);
End;

implementation

uses
  System.Generics.Collections, Domain.UseCase.Session.Read.Interfaces,
  Domain.UseCase.Session.Read, Domain.Abstraction.Session;

{ TSessionController }

constructor TSessionController.Create(ARepositorySession: IRepositorySession);
begin
  Inherited Create;
  FSessionRepository := ARepositorySession;
end;

procedure TSessionController.LoadSessions(AcxImageComboBox: TcxImageComboBox);
var
  UseCaseReadSessions: IUseCaseReadSessions;
  ListSessions: TObjectList<TAbstractionSession>;
  AbstractionSession: TAbstractionSession;
begin
  UseCaseReadSessions := TUseCaseReadSessions.Create(FSessionRepository);
  AcxImageComboBox.Properties.Items.Clear;

  ListSessions := UseCaseReadSessions.Execute;
  if Assigned(ListSessions) and (ListSessions.Count > 0) then
  begin
    for AbstractionSession in ListSessions do
    begin
      if not Assigned(AcxImageComboBox.Properties.Items.FindItemID(AbstractionSession.Id)) then
      begin
        with AcxImageComboBox.Properties.Items.Add do
        begin
          Description := AbstractionSession.Name;
          Value := AbstractionSession.Id;
        end;
      end;
    end;
  end;
  AcxImageComboBox.ItemIndex := 0;
end;

end.
