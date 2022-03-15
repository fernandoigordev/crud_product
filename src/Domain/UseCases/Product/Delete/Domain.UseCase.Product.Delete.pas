unit Domain.UseCase.Product.Delete;

interface

uses
  Domain.UseCase.Product.Delete.Interfaces, Data.Repository.Product.Interfaces;

type
TUseCaseDeleteProduct = Class(TInterfacedObject, IUseCaseDeleteProduct)
  private
    FRepositoryProduct: IRepositoryProduct;
  public
    procedure Execute(AId: Integer);
    Constructor Create(ARepositoryProduct: IRepositoryProduct);
End;

implementation

uses
  System.SysUtils;

{ TUseCaseDeleteProduct }

constructor TUseCaseDeleteProduct.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FRepositoryProduct := ARepositoryProduct;
end;

procedure TUseCaseDeleteProduct.Execute(AId: Integer);
begin
  try
    FRepositoryProduct.DeleteProduct(AId);
  except
    on E: Exception do
    begin
      raise Exception.Create(Concat('Erro ao deletar o produto: ', E.Message));
    end;
  end;
end;

end.
