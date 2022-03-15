unit Domain.Entity.Session;

interface
type

TEntitySession = class
  private
    FId: Integer;
    FName: String;
    FGroupId: Integer;
  public
    property Id: Integer read FId write FId;
    property Name: String read FName write FName;
    property GroupId: Integer read FGroupId write FGroupId;
end;

implementation

end.
