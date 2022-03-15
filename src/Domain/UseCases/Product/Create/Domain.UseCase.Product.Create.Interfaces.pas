unit Domain.UseCase.Product.Create.Interfaces;

interface
uses
  Domain.Abstraction.Product;

type

IUseCaseCreateProduct = interface
  function Execute(AbstractionProduct: TAbstractionProduct): Boolean;
end;

implementation

end.
