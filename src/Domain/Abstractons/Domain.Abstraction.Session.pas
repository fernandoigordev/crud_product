unit Domain.Abstraction.Session;

interface

uses
  Domain.Abstraction.Group;

type
TAbstractionSession = Class
  private
    FId: Integer;
    FName: String;
    FGroup: TAbstractionGroup;
  public
    property Id: Integer read FId write FId;
    property Name: String read FName write FName;
    property Group: TAbstractionGroup read FGroup write FGroup;
End;

implementation

end.
