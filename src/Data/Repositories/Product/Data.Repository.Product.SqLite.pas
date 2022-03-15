unit Data.Repository.Product.SqLite;

interface

uses
  Domain.Abstraction.Product, System.Generics.Collections,
  Data.Repository.Product.Interfaces, FireDAC.Comp.Client,
  FireDAC.DApt;

type
TRepositoryProductSqLite = Class(TInterfacedObject, IRepositoryProduct)
  private
    FConnection: TFDConnection;
    FFDQuery: TFDQuery;

    procedure OpenQuery(ASql: String);
    procedure ExecuteQuery(ASql: String);
  public
    procedure CreateProduct(AbstractionProduct: TAbstractionProduct);
    function ReadProduct(AId: Integer): TAbstractionProduct;
    function ReadProducts: TObjectList<TAbstractionProduct>;
    procedure UpdateProduct(AbstractionProduct: TAbstractionProduct);
    procedure DeleteProduct(AId: Integer);

    Constructor Create(AFDConnection: TFDConnection);
    Destructor Destroy;override;
End;

implementation

uses
  System.SysUtils, Data.Repository.Session.SqLite;

{ TRepositoryProductSqLite }

constructor TRepositoryProductSqLite.Create(AFDConnection: TFDConnection);
begin
  Inherited Create;
  FConnection := AFDConnection;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FConnection;
end;

procedure TRepositoryProductSqLite.CreateProduct(
  AbstractionProduct: TAbstractionProduct);
var
  Sql: String;
begin
  Sql := Concat('insert into tProduct values(',IntToStr(AbstractionProduct.Id),',',
                QuotedStr(AbstractionProduct.BarCode),',',QuotedStr(AbstractionProduct.Name),',',
                StringReplace(FloatToStr(AbstractionProduct.Price), ',', '.', [rfReplaceAll]),',',
                QuotedStr(AbstractionProduct.Unity),',',IntToStr(AbstractionProduct.Session.Id),')');
  ExecuteQuery(Sql);
end;

procedure TRepositoryProductSqLite.DeleteProduct(AId: Integer);
begin
  ExecuteQuery(Concat('delete from tProduct where id = ', IntToStr(AId)));
end;

destructor TRepositoryProductSqLite.Destroy;
begin
  FreeAndNil(FFDQuery);
  inherited;
end;

procedure TRepositoryProductSqLite.ExecuteQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.ExecSQL(ASql);
end;

procedure TRepositoryProductSqLite.OpenQuery(ASql: String);
begin
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.Open(ASql);
end;

function TRepositoryProductSqLite.ReadProduct(
  AId: Integer): TAbstractionProduct;
var
  AbstractionProduct: TAbstractionProduct;
  RepositorySessionSqLite: TRepositorySessionSqLite;
begin
  Result := nil;
  OpenQuery(Concat('select * from tProduct where id = ', IntToStr(AId)));
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionProduct := TAbstractionProduct.Create;
    AbstractionProduct.Id := FFDQuery.FieldByName('Id').AsInteger;
    AbstractionProduct.BarCode := FFDQuery.FieldByName('BarCode').AsString;
    AbstractionProduct.Name := FFDQuery.FieldByName('Name').AsString;
    AbstractionProduct.Price := FFDQuery.FieldByName('Price').AsFloat;
    AbstractionProduct.Unity := FFDQuery.FieldByName('Unity').AsString;

    try
      RepositorySessionSqLite := TRepositorySessionSqLite.Create(FConnection);
      AbstractionProduct.Session := RepositorySessionSqLite.ReadSession(FFDQuery.FieldByName('SessionId').AsInteger);
    finally
      RepositorySessionSqLite.Free;
    end;

    Result := AbstractionProduct;
  end;
end;

function TRepositoryProductSqLite.ReadProducts: TObjectList<TAbstractionProduct>;
var
  AbstractionProducts: TObjectList<TAbstractionProduct>;
  RepositorySessionSqLite: TRepositorySessionSqLite;
  Index: Integer;
begin
  Result := Nil;
  OpenQuery('select * from tProduct');
  if FFDQuery.RecordCount > 0 then
  begin
    AbstractionProducts := TObjectList<TAbstractionProduct>.Create;
    FFDQuery.First;
    while not FFDQuery.Eof do
    begin
      Index := AbstractionProducts.Add(TAbstractionProduct.Create);
      AbstractionProducts.Items[Index].Id := FFDQuery.FieldByName('Id').AsInteger;
      AbstractionProducts.Items[Index].BarCode := FFDQuery.FieldByName('BarCode').AsString;
      AbstractionProducts.Items[Index].Name := FFDQuery.FieldByName('Name').AsString;
      AbstractionProducts.Items[Index].Price := FFDQuery.FieldByName('Price').AsFloat;
      AbstractionProducts.Items[Index].Unity := FFDQuery.FieldByName('Unity').AsString;

      try
        RepositorySessionSqLite := TRepositorySessionSqLite.Create(FConnection);
        AbstractionProducts.Items[Index].Session := RepositorySessionSqLite.ReadSession(FFDQuery.FieldByName('SessionId').AsInteger);
      finally
        RepositorySessionSqLite.Free;
      end;

      FFDQuery.Next;
    end;
    Result := AbstractionProducts;
  end;
end;

procedure TRepositoryProductSqLite.UpdateProduct(
  AbstractionProduct: TAbstractionProduct);
var
  Sql: String;
begin
  Sql := Concat('update tProduct set BarCode = ', QuotedStr(AbstractionProduct.BarCode),',',
                ' Name = ', QuotedStr(AbstractionProduct.Name),',',
                ' Price = ', StringReplace(FloatToStr(AbstractionProduct.Price), ',', '.', [rfReplaceAll]),',',
                ' Unity = ', QuotedStr(AbstractionProduct.Unity),',',
                'SessionId = ', IntToStr(AbstractionProduct.Session.Id),
                ' where id = ', IntToStr(AbstractionProduct.Id));
  ExecuteQuery(Sql);
end;

end.
