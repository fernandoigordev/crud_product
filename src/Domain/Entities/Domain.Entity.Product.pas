unit Domain.Entity.Product;

interface

type

TEntityProduct = Class
  private
    FId: Integer;
    FBarCode: String;
    FName: String;
    FPrice: Double;
    FUnity: String;
    FSessionId: Integer;
  public
    property Id: Integer read FId write FId;
    property BarCode: String read FBarCode write FBarCode;
    property Name: String read FName write FName;
    property Price: Double read FPrice write FPrice;
    property Unity: String read FUnity write FUnity;
    property SessionId: Integer read FSessionId write FSessionId;
End;

implementation

end.
