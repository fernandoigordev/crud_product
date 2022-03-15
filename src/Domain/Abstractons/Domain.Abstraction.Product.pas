unit Domain.Abstraction.Product;

interface

uses
  Domain.Abstraction.Session;

type

TAbstractionProduct = Class
  private
    FId: Integer;
    FBarCode: String;
    FName: String;
    FPrice: Double;
    FUnity: String;
    FSession: TAbstractionSession;
  public
    property Id: Integer read FId write FId;
    property BarCode: String read FBarCode write FBarCode;
    property Name: String read FName write FName;
    property Price: Double read FPrice write FPrice;
    property Unity: String read FUnity write FUnity;
    property Session: TAbstractionSession read FSession write FSession;
End;

implementation

end.
