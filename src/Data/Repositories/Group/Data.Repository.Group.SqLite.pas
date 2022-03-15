unit Data.Repository.Group.SqLite;

interface
uses
  Data.Repository.Group.Interfaces, Domain.Abstraction.Group,
  System.Generics.Collections, FireDAC.Comp.Client, FireDAC.DApt;
type
TRepositoryGroupSqLite = Class(TInterfacedObject, IRepositoryGroup)
  private
    FConnection: TFDConnection;
    FFDQuery: TFDQuery;

    procedure OpenQuery(ASql: String);
    procedure ExecuteQuery(ASql: String);
  public
    procedure CreateGroup(AbstractionGroup: TAbstractionGroup);
    function ReadGroup(AId: Integer): TAbstractionGroup;
    function ReadGroups: TObjectList<TAbstractionGroup>;
    procedure UpdateGroup(AbstractionGroup: TAbstractionGroup);
    procedure DeleteGroup(AId: Integer);

    Constructor Create(AFDConnection: TFDConnection);
    Destructor Destroy;override;
End;

implementation

uses
  System.SysUtils;

{ TRepositoryGroupSqLite }

constructor TRepositoryGroupSqLite.Create(AFDConnection: TFDConnection);
begin
  Inherited Create;
  FConnection := AFDConnection;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FConnection;
end;

procedure TRepositoryGroupSqLite.CreateGroup(AbstractionGroup: TAbstractionGroup);
var
  Sql: String;
begin
  Sql := Concat('insert into tGroup values(',IntToStr(AbstractionGroup.Id),',',
                QuotedStr(AbstractionGroup.Name),')');
  ExecuteQuery(Sql);
end;

procedure TRepositoryGroupSqLite.DeleteGroup(AId: Integer);
begin
  ExecuteQuery(Concat('delete from tGroup where id = ', IntToStr(AId)));
end;

destructor TRepositoryGroupSqLite.Destroy;
begin
  FreeAndNil(FFDQuery);
  inherited;
end;

procedure TRepositoryGroupSqLite.ExecuteQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.ExecSQL(ASql);
end;

procedure TRepositoryGroupSqLite.OpenQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.Open(ASql);
end;

function TRepositoryGroupSqLite.ReadGroup(AId: Integer): TAbstractionGroup;
var
  AbstractionGroup: TAbstractionGroup;
begin
  Result := nil;
  OpenQuery(Concat('select * from tgroup where id = ', IntToStr(AId)));
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionGroup := TAbstractionGroup.Create;
    AbstractionGroup.Id := FFDQuery.FieldByName('Id').AsInteger;
    AbstractionGroup.Name := FFDQuery.FieldByName('Name').AsString;
    Result := AbstractionGroup;
  end;
end;

function TRepositoryGroupSqLite.ReadGroups: TObjectList<TAbstractionGroup>;
var
  AbstractionGroups: TObjectList<TAbstractionGroup>;
  Index: Integer;
begin
  Result := Nil;
  OpenQuery('select * from tgroup');
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionGroups := TObjectList<TAbstractionGroup>.Create;
    FFDQuery.First;
    while not FFDQuery.Eof do
    begin
      Index := AbstractionGroups.Add(TAbstractionGroup.Create);
      AbstractionGroups.Items[Index].Id   := FFDQuery.FieldByName('Id').AsInteger;
      AbstractionGroups.Items[Index].Name := FFDQuery.FieldByName('Name').AsString;
      FFDQuery.Next;
    end;
    Result := AbstractionGroups;
  end;
end;

procedure TRepositoryGroupSqLite.UpdateGroup(AbstractionGroup: TAbstractionGroup);
var
  Sql: String;
begin
  Sql := Concat('update tGroup set Name = ', QuotedStr(AbstractionGroup.Name),
                ' where Id = ', IntToStr(AbstractionGroup.Id));
  ExecuteQuery(Sql);
end;

end.
