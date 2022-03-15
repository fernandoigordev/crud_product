unit Data.Repository.Product.Interfaces;

interface

uses
  Domain.Abstraction.Product, System.Generics.Collections;

type
IRepositoryProduct = Interface
  procedure CreateProduct(AbstractionProduct: TAbstractionProduct);
  function ReadProduct(AId: Integer): TAbstractionProduct;
  function ReadProducts: TObjectList<TAbstractionProduct>;
  procedure UpdateProduct(AbstractionProduct: TAbstractionProduct);
  procedure DeleteProduct(AId: Integer);
End;


implementation

end.
