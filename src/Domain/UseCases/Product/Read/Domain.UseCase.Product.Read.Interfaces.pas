unit Domain.UseCase.Product.Read.Interfaces;

interface

uses
  Domain.Abstraction.Product, System.Generics.Collections;

type
  IUseCaseReadProduct = interface
    function Execute(AId: Integer): TAbstractionProduct;
  end;

  IUseCaseReadProducts = interface
    function Execute: TObjectList<TAbstractionProduct>;
  end;

implementation

end.
