unit Domain.UseCase.Product.Update.Interfaces;

interface

uses
  Domain.Abstraction.Product;

type
IUseCaseUpdateProduct = interface
  procedure Execute(AbstractionProduct: TAbstractionProduct);
end;

implementation

end.
