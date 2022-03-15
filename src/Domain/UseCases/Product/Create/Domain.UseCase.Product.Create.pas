  unit Domain.UseCase.Product.Create;

interface

uses
  Domain.UseCase.Product.Create.Interfaces, Domain.Abstraction.Product,
  Data.Repository.Product.Interfaces;

type
  TUseCaseCreateProduct = Class(TInterfacedObject, IUseCaseCreateProduct)
    private
      FRepositoryProduct: IRepositoryProduct;
    public
      function Execute(AbstractionProduct: TAbstractionProduct): Boolean;
      Constructor Create(ARepositoryProduct: IRepositoryProduct);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseCreateProduct }

constructor TUseCaseCreateProduct.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FRepositoryProduct := ARepositoryProduct;
end;

function TUseCaseCreateProduct.Execute(AbstractionProduct: TAbstractionProduct): Boolean;
begin
  Result := False;
  try
    FRepositoryProduct.CreateProduct(AbstractionProduct);
    Result := True;
  Except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao criar produto: ', E.Message));
    end;
  end;
end;

end.
