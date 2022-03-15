unit Domain.UseCase.Product.Read;

interface

uses
  Domain.UseCase.Product.Read.Interfaces, Domain.Abstraction.Product,
  System.Generics.Collections, Data.Repository.Product.Interfaces;

type
  TUseCaseReadProduct = Class(TInterfacedObject, IUseCaseReadProduct)
    private
      FRepositoryProduct: IRepositoryProduct;
    public
      function Execute(AId: Integer): TAbstractionProduct;
      Constructor Create(ARepositoryProduct: IRepositoryProduct);
  End;

  TUseCaseReadProducts = Class(TInterfacedObject, IUseCaseReadProducts)
    private
      FRepositoryProduct: IRepositoryProduct;
    public
      function Execute: TObjectList<TAbstractionProduct>;
      Constructor Create(ARepositoryProduct: IRepositoryProduct);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseReadProduct }

constructor TUseCaseReadProduct.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FRepositoryProduct := ARepositoryProduct;
end;

function TUseCaseReadProduct.Execute(AId: Integer): TAbstractionProduct;
begin
  Result := Nil;
  try
    Result := FRepositoryProduct.ReadProduct(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao ler o produto: ', E.Message));
    end;
  end;
end;

{ TUseCaseReadProducts }

constructor TUseCaseReadProducts.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FRepositoryProduct := ARepositoryProduct;
end;

function TUseCaseReadProducts.Execute: TObjectList<TAbstractionProduct>;
begin
  Result := Nil;
  try
    Result := FRepositoryProduct.ReadProducts;
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao ler os produtos: ', E.Message));
    end;
  end;
end;

end.
