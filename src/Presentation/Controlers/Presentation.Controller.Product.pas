unit Presentation.Controller.Product;

interface

uses
  cxImageComboBox,Data.Repository.Product.Interfaces,
  Datasnap.DBClient, Domain.Abstraction.Product;

type
TProductController = Class
  private
    FProductRepository: IRepositoryProduct;
  public
    procedure LoadFilterGroups(AcxImageComboBox: TcxImageComboBox);
    procedure LoadFilterSessions(AcxImageComboBox: TcxImageComboBox);
    procedure LoadFilterPrice(AcxImageComboBox: TcxImageComboBox);

    function CreateProduct(AClientDataSet: TClientDataSet): Boolean;
    Procedure LoadProductsGrid(AClientDataSet: TClientDataSet);
    procedure UpdateProduct(AClientDataSet: TClientDataSet);
    procedure DeleteProduct(AId: Integer);

    Constructor Create(ARepositoryProduct: IRepositoryProduct);
End;

implementation

uses
  System.Generics.Collections,Domain.UseCase.Product.Read.Interfaces,
  Domain.UseCase.Product.Read, Domain.UseCase.Product.Create.Interfaces,
  Domain.UseCase.Product.Create, Domain.UseCase.Product.Update.Interfaces,
  Domain.UseCase.Product.Update, Domain.UseCase.Product.Delete.Interfaces,
  Domain.UseCase.Product.Delete, Domain.Abstraction.Session, System.SysUtils;

{ TProductController }

constructor TProductController.Create(ARepositoryProduct: IRepositoryProduct);
begin
  Inherited Create;
  FProductRepository := ARepositoryProduct;
end;

function TProductController.CreateProduct(AClientDataSet: TClientDataSet): Boolean;
var
  UseCaseCreateProduct: IUseCaseCreateProduct;
  AbstractionProduct: TAbstractionProduct;
begin
  Result := False;
  AbstractionProduct := TAbstractionProduct.Create;
  try
    AbstractionProduct.Id := DateTimeToFileDate(Now);
    AbstractionProduct.BarCode := AClientDataSet.FieldByName('BarCode').AsString;
    AbstractionProduct.Name  := AClientDataSet.FieldByName('Name').AsString;
    AbstractionProduct.Price := AClientDataSet.FieldByName('Price').AsFloat;
    AbstractionProduct.Unity := AClientDataSet.FieldByName('Unity').AsString;
    AbstractionProduct.Session := TAbstractionSession.Create;
    AbstractionProduct.Session.Id := AClientDataSet.FieldByName('SessionId').AsInteger;

    UseCaseCreateProduct := TUseCaseCreateProduct.Create(FProductRepository);
    Result := UseCaseCreateProduct.Execute(AbstractionProduct);
  finally
    AbstractionProduct.Free;
  end;
end;

procedure TProductController.DeleteProduct(AId: Integer);
var
  UseCaseDeleteProduct: IUseCaseDeleteProduct;
begin
  UseCaseDeleteProduct := TUseCaseDeleteProduct.Create(FProductRepository);
  UseCaseDeleteProduct.Execute(AId);
end;

procedure TProductController.LoadFilterPrice(
  AcxImageComboBox: TcxImageComboBox);
begin
  AcxImageComboBox.Properties.Items.Clear;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := '<Nenhum>';
    Value := '';
  end;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := 'Preço maior que:';
    Value := '>';
  end;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := 'Preço menor que:';
    Value := '<';
  end;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := 'Preço igual a:';
    Value := '=';
  end;
  AcxImageComboBox.ItemIndex := 0;
end;

procedure TProductController.LoadFilterGroups(AcxImageComboBox: TcxImageComboBox);
var
  UseCaseReadProducts: IUseCaseReadProducts;
  ListProducts: TObjectList<TAbstractionProduct>;
  AbstractionProduct: TAbstractionProduct;
  index: Integer;
  GroupExist: Boolean;
begin
  UseCaseReadProducts := TUseCaseReadProducts.Create(FProductRepository);
  AcxImageComboBox.Properties.Items.Clear;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := '<Todos os grupos>';
    Value := 0;
  end;
  ListProducts := UseCaseReadProducts.Execute;
  if Assigned(ListProducts) and (ListProducts.Count > 0) then
  begin
    for AbstractionProduct in ListProducts do
    begin
      GroupExist := False;
      for index := 0 to AcxImageComboBox.Properties.Items.Count-1 do
      begin
        if AcxImageComboBox.Properties.Items[index].Value = AbstractionProduct.Session.Group.Id  then
          GroupExist := True;
      end;


      if not GroupExist then
      begin
        with AcxImageComboBox.Properties.Items.Add do
        begin
          Description := AbstractionProduct.Session.Group.Name;
          Value := AbstractionProduct.Session.Group.Id;
        end;
      end;
    end;
  end;
  AcxImageComboBox.ItemIndex := 0;
end;

procedure TProductController.LoadProductsGrid(AClientDataSet: TClientDataSet);
var
  UseCaseReadProducts: IUseCaseReadProducts;
  ListProducts: TObjectList<TAbstractionProduct>;
  AbstractionProduct: TAbstractionProduct;
begin
  UseCaseReadProducts := TUseCaseReadProducts.Create(FProductRepository);
  AClientDataSet.EmptyDataSet;
  ListProducts := UseCaseReadProducts.Execute;
  if Assigned(ListProducts) and (ListProducts.Count > 0) then
  begin
    AClientDataSet.Close;
    AClientDataSet.Open;
    for AbstractionProduct in ListProducts do
    begin
      AClientDataSet.Append;
      AClientDataSet.FieldByName('Id').AsInteger := AbstractionProduct.Id;
      AClientDataSet.FieldByName('BarCode').AsString := AbstractionProduct.BarCode;
      AClientDataSet.FieldByName('Name').AsString := AbstractionProduct.Name;
      AClientDataSet.FieldByName('Price').AsFloat := AbstractionProduct.Price;
      AClientDataSet.FieldByName('Unity').AsString := AbstractionProduct.Unity;
      AClientDataSet.FieldByName('Group').AsString := AbstractionProduct.Session.Group.Name;
      AClientDataSet.FieldByName('Session').AsString := AbstractionProduct.Session.Name;
      AClientDataSet.FieldByName('SessionId').AsInteger := AbstractionProduct.Session.Id;
      AClientDataSet.Post;
    end;
    AClientDataSet.First;
  end;
end;


procedure TProductController.LoadFilterSessions(AcxImageComboBox: TcxImageComboBox);
var
  UseCaseReadProducts: IUseCaseReadProducts;
  ListProducts: TObjectList<TAbstractionProduct>;
  AbstractionProduct: TAbstractionProduct;
  index: Integer;
  SessionExist: Boolean;
begin
  UseCaseReadProducts := TUseCaseReadProducts.Create(FProductRepository);
  AcxImageComboBox.Properties.Items.Clear;
  with AcxImageComboBox.Properties.Items.Add do
  begin
    Description := '<Todos as Sessões>';
    Value := 0;
  end;
  ListProducts := UseCaseReadProducts.Execute;
  if Assigned(ListProducts) and (ListProducts.Count > 0) then
  begin
    for AbstractionProduct in ListProducts do
    begin
      SessionExist := False;
      for index := 0 to AcxImageComboBox.Properties.Items.Count-1 do
      begin
        if AcxImageComboBox.Properties.Items[index].Value = AbstractionProduct.Session.Id then
          SessionExist := True;
      end;

      if not SessionExist then
      begin
        with AcxImageComboBox.Properties.Items.Add do
        begin
          Description := AbstractionProduct.Session.Name;
          Value := AbstractionProduct.Session.Id;
        end;
      end;
    end;
  end;
  AcxImageComboBox.ItemIndex := 0;
end;

procedure TProductController.UpdateProduct(AClientDataSet: TClientDataSet);
var
  UseCaseUpdateProduct: IUseCaseUpdateProduct;
  AbstractionProduct: TAbstractionProduct;
begin
  AbstractionProduct := TAbstractionProduct.Create;
  try
    AbstractionProduct.Id := AClientDataSet.FieldByName('Id').AsInteger;
    AbstractionProduct.BarCode := AClientDataSet.FieldByName('BarCode').AsString;
    AbstractionProduct.Name  := AClientDataSet.FieldByName('Name').AsString;
    AbstractionProduct.Price := AClientDataSet.FieldByName('Price').AsFloat;
    AbstractionProduct.Unity := AClientDataSet.FieldByName('Unity').AsString;
    AbstractionProduct.Session := TAbstractionSession.Create;
    AbstractionProduct.Session.Id := AClientDataSet.FieldByName('SessionId').AsInteger;

    UseCaseUpdateProduct := TUseCaseUpdateProduct.Create(FProductRepository);
    UseCaseUpdateProduct.Execute(AbstractionProduct);
  finally
    AbstractionProduct.Free;
  end;
end;

end.
