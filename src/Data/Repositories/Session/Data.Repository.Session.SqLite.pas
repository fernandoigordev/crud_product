unit Data.Repository.Session.SqLite;

interface
uses
  Domain.Abstraction.Session, System.Generics.Collections,
  Data.Repository.Session.Interfaces, FireDAC.Comp.Client,
  FireDAC.DApt;

type
TRepositorySessionSqLite = Class(TInterfacedObject, IRepositorySession)
  private
    FConnection: TFDConnection;
    FFDQuery: TFDQuery;

    procedure OpenQuery(ASql: String);
    procedure ExecuteQuery(ASql: String);
  public
    procedure CreateSession(AbstractionSession: TAbstractionSession);
    function ReadSession(AId: Integer): TAbstractionSession;
    function ReadSessions: TObjectList<TAbstractionSession>;
    procedure UpdateSession(AbstractionSession: TAbstractionSession);
    procedure DeleteSession(AId: Integer);

    Constructor Create(AFDConnection: TFDConnection);
    Destructor Destroy;override;
End;

implementation

uses
  System.SysUtils, Data.Repository.Group.SqLite;

{ TRepositorySessionSqLite }

constructor TRepositorySessionSqLite.Create(AFDConnection: TFDConnection);
begin
  Inherited Create;
  FConnection := AFDConnection;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FConnection;
end;

procedure TRepositorySessionSqLite.CreateSession(
  AbstractionSession: TAbstractionSession);
var
  Sql: String;
begin
  Sql := Concat('insert into tSession values(',IntToStr(AbstractionSession.Id),',',
                QuotedStr(AbstractionSession.Name),',', IntToStr(AbstractionSession.Group.Id),')');
  ExecuteQuery(Sql);
end;

procedure TRepositorySessionSqLite.DeleteSession(AId: Integer);
begin
  ExecuteQuery(Concat('delete from tSession where id = ', IntToStr(AId)));
end;

destructor TRepositorySessionSqLite.Destroy;
begin
  FreeAndNil(FFDQuery);
  inherited;
end;

procedure TRepositorySessionSqLite.ExecuteQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.ExecSQL(ASql);
end;

procedure TRepositorySessionSqLite.OpenQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.Open(ASql);
end;

function TRepositorySessionSqLite.ReadSession(
  AId: Integer): TAbstractionSession;
var
  AbstractionSession: TAbstractionSession;
  RepositoryGroupSqLite: TRepositoryGroupSqLite;
begin
  Result := nil;
  OpenQuery(Concat('select * from tSession where id = ', IntToStr(AId)));
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionSession := TAbstractionSession.Create;
    AbstractionSession.Id := FFDQuery.FieldByName('Id').AsInteger;
    AbstractionSession.Name := FFDQuery.FieldByName('Name').AsString;

    try
      RepositoryGroupSqLite := TRepositoryGroupSqLite.Create(FConnection);
      AbstractionSession.Group := RepositoryGroupSqLite.ReadGroup(FFDQuery.FieldByName('GroupId').AsInteger);
    finally
      RepositoryGroupSqLite.Free;
    end;

    Result := AbstractionSession;
  end;
end;

function TRepositorySessionSqLite.ReadSessions: TObjectList<TAbstractionSession>;
var
  AbstractionSessions: TObjectList<TAbstractionSession>;
  RepositoryGroupSqLite: TRepositoryGroupSqLite;
  Index: Integer;
begin
  Result := Nil;
  OpenQuery('select * from tSession');
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionSessions := TObjectList<TAbstractionSession>.Create;
    FFDQuery.First;
    while not FFDQuery.Eof do
    begin
      Index := AbstractionSessions.Add(TAbstractionSession.Create);
      AbstractionSessions.Items[Index].Id   := FFDQuery.FieldByName('Id').AsInteger;
      AbstractionSessions.Items[Index].Name := FFDQuery.FieldByName('Name').AsString;

      try
        RepositoryGroupSqLite := TRepositoryGroupSqLite.Create(FConnection);
        AbstractionSessions.Items[Index].Group := RepositoryGroupSqLite.ReadGroup(FFDQuery.FieldByName('GroupId').AsInteger);
      finally
        RepositoryGroupSqLite.Free;
      end;

      FFDQuery.Next;
    end;
    Result := AbstractionSessions;
  end;
end;

procedure TRepositorySessionSqLite.UpdateSession(
  AbstractionSession: TAbstractionSession);
var
  Sql: String;
begin
  Sql := Concat('update tSession set Name = ', QuotedStr(AbstractionSession.Name), ',',
                'GroupId = ', IntToStr(AbstractionSession.Group.Id),
                ' where Id = ', IntToStr(AbstractionSession.Id));
  ExecuteQuery(Sql);
end;

end.
