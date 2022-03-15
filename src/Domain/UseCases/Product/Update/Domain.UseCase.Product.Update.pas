unit Domain.UseCase.Product.Update;

interface
uses
  Domain.UseCase.Product.Update.Interfaces, Domain.Abstraction.Product,
  Data.Repository.Product.Interfaces;

type
  TUseCaseUpdateProduct = Class(TInterfacedObject, IUseCaseUpdateProduct)
    private
      FRepositoryProduct: IRepositoryProduct;
    public
      procedure Execute(AbstractionProduct: TAbstractionProduct);
      Constructor Create(ARepositoryProduct: IRepositoryProduct);
  End;

implementation

uses
  System.SysUtils;

{ TUseCaseUpdateProduct }

constructor TUseCaseUpdateProduct.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FRepositoryProduct := ARepositoryProduct;
end;

procedure TUseCaseUpdateProduct.Execute(AbstractionProduct: TAbstractionProduct);
begin
  try
    FRepositoryProduct.UpdateProduct(AbstractionProduct);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao atualizar o produto: ', E.Message));
    end;
  end;
end;

end.
