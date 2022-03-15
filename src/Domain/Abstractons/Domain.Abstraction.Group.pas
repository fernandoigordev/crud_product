unit Domain.Abstraction.Group;

interface

type
TAbstractionGroup = Class
  private
    FId: Integer;
    FName: String;
  public
    property Id: Integer read FId write FId;
    property Name: String read FName write FName;
End;

implementation

end.
