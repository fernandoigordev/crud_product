unit Presentation.View.ProductSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, AdvGlowButton, Datasnap.DBClient,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, CalcEdit,
  Presentation.Controller.Product, Data.Repository.Product.SqLite, cxButtonEdit;

type
  TfrProductSearch = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    GridProductsDBTableView1: TcxGridDBTableView;
    GridProductsLevel1: TcxGridLevel;
    GridProducts: TcxGrid;
    GridProductsDBTableView1Column1: TcxGridDBColumn;
    GridProductsDBTableView1Column2: TcxGridDBColumn;
    GridProductsDBTableView1Column3: TcxGridDBColumn;
    GridProductsDBTableView1Column4: TcxGridDBColumn;
    GridProductsDBTableView1Column5: TcxGridDBColumn;
    GridProductsDBTableView1Column6: TcxGridDBColumn;
    pnlHeader: TPanel;
    btnAddProduct: TAdvGlowButton;
    cdsProducts: TClientDataSet;
    cdsProductsId: TIntegerField;
    cdsProductsName: TStringField;
    cdsProductsPrice: TFloatField;
    cdsProductsUnity: TStringField;
    cdsProductsGroup: TStringField;
    cdsProductsSession: TStringField;
    cdsProductsSessionId: TIntegerField;
    dsProducts: TDataSource;
    edProductName: TEdit;
    Label2: TLabel;
    cbGroupFielter: TcxImageComboBox;
    cbSessionFilter: TcxImageComboBox;
    cbPriceFilter: TcxImageComboBox;
    edPriceFilterValue: TCalcEdit;
    cdsProductsBarCode: TStringField;
    GridProductsDBTableView1Column7: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    pnlBottom: TPanel;
    Bevel2: TBevel;
    AdvGlowButton1: TAdvGlowButton;
    SaveDialogGrid: TSaveDialog;
    AdvGlowButton2: TAdvGlowButton;
    procedure btnAddProductClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbGroupFielterPropertiesChange(Sender: TObject);
    procedure cbPriceFilterPropertiesChange(Sender: TObject);
    procedure edPriceFilterValueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edProductNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure GridProductsDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridProductsDBTableView1Column7PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    { Private declarations }
    FProductController: TProductController;
    FRepositoryProductSqLite: TRepositoryProductSqLite;
    Procedure AddProduct;
    procedure UpdateProduct;
    Procedure FilterCdsProducts;
    procedure LoadProducts;
  public
    { Public declarations }
  end;

var
  frProductSearch: TfrProductSearch;

implementation

uses
  Presentation.View.Product, Data.DataModule, Domain.Abstraction.Product,
  Domain.Abstraction.Session, cxGridExportLink, Presentation.View.Product.Report;

{$R *.dfm}

{ TfrProductSearch }

procedure TfrProductSearch.AdvGlowButton1Click(Sender: TObject);
begin
  if SaveDialogGrid.Execute then
    ExportGridToExcel(SaveDialogGrid.FileName, GridProducts);
end;

procedure TfrProductSearch.AdvGlowButton2Click(Sender: TObject);
var
  frProductReport: TfrProductReport;
begin
  frProductReport := TfrProductReport.Create(nil);
  try
    frProductReport.dsProductReport.DataSet := cdsProducts;
    frProductReport.RLReport1.Preview;
  finally
    frProductReport.free;
  end;
end;

procedure TfrProductSearch.btnAddProductClick(Sender: TObject);
begin
  AddProduct;
end;

procedure TfrProductSearch.cbGroupFielterPropertiesChange(Sender: TObject);
begin
  FilterCdsProducts;
end;

procedure TfrProductSearch.cbPriceFilterPropertiesChange(Sender: TObject);
begin
  FilterCdsProducts;
  edPriceFilterValue.Enabled := cbPriceFilter.Properties.Items[cbPriceFilter.ItemIndex].Value <> '';
end;

procedure TfrProductSearch.edPriceFilterValueKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    GridProducts.SetFocus;
    FilterCdsProducts;
  end;
end;

procedure TfrProductSearch.edProductNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FilterCdsProducts;
end;

procedure TfrProductSearch.FilterCdsProducts;
begin
  cdsProducts.Filtered := False;
  cdsProducts.Filter := EmptyStr;

  if edProductName.Text <> EmptyStr then
    cdsProducts.Filter := Concat('Upper(Name) LIKE ', QuotedStr(Concat('%',UpperCase(edProductName.Text),'%')));

  if cbGroupFielter.Properties.Items[cbGroupFielter.ItemIndex].Value > 0 then
  begin
    if cdsProducts.Filter <> EmptyStr then
      cdsProducts.Filter := Concat(cdsProducts.Filter, ' AND ');

    cdsProducts.Filter := Concat(cdsProducts.Filter, 'Upper(Group)=',
                          QuotedStr(UpperCase(cbGroupFielter.Properties.Items[cbGroupFielter.ItemIndex].Description)));
  end;

  if cbSessionFilter.Properties.Items[cbSessionFilter.ItemIndex].Value > 0 then
  begin
    if cdsProducts.Filter <> EmptyStr then
      cdsProducts.Filter := Concat(cdsProducts.Filter, ' AND ');

    cdsProducts.Filter := Concat(cdsProducts.Filter, 'Upper(Session)=',
                          QuotedStr(UpperCase(cbSessionFilter.Properties.Items[cbSessionFilter.ItemIndex].Description)));
  end;

  if (cbPriceFilter.Properties.Items[cbPriceFilter.ItemIndex].Value <> '') and
     (edPriceFilterValue.Text <> '') then
  begin
    if cdsProducts.Filter <> EmptyStr then
      cdsProducts.Filter := Concat(cdsProducts.Filter, ' AND ');

    cdsProducts.Filter := Concat(cdsProducts.Filter, 'Price',
                          cbPriceFilter.Properties.Items[cbPriceFilter.ItemIndex].Value,
                          edPriceFilterValue.Text);
  end;
  cdsProducts.Filtered := cdsProducts.Filter <> EmptyStr;
end;

procedure TfrProductSearch.FormCreate(Sender: TObject);
begin
  FRepositoryProductSqLite := TRepositoryProductSqLite.Create(DataModule1.FDConnection);
  FProductController := TProductController.Create(FRepositoryProductSqLite);
end;

procedure TfrProductSearch.FormDestroy(Sender: TObject);
begin
  FProductController.Free;
end;

procedure TfrProductSearch.FormShow(Sender: TObject);
begin
  LoadProducts;
end;

procedure TfrProductSearch.GridProductsDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  UpdateProduct;
end;

procedure TfrProductSearch.GridProductsDBTableView1Column7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if  MessageDlg(Concat('Deseja excluir o Item ', cdsProducts.FieldByName('Name').AsString, '?'),
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = ID_YES then
  begin
    FProductController.DeleteProduct(cdsProducts.FieldByName('ID').AsInteger);
    LoadProducts;
  end;
end;

procedure TfrProductSearch.LoadProducts;
begin
  cbGroupFielter.Properties.OnChange := nil;
  cbSessionFilter.Properties.OnChange := nil;
  cbPriceFilter.Properties.OnChange := nil;

  cbGroupFielter.Properties.Items.Clear;
  cbSessionFilter.Properties.Items.Clear;

  FProductController.LoadFilterGroups(cbGroupFielter);
  FProductController.LoadFilterSessions(cbSessionFilter);
  FProductController.LoadFilterPrice(cbPriceFilter);
  FProductController.LoadProductsGrid(cdsProducts);

  cbGroupFielter.Properties.OnChange := cbGroupFielterPropertiesChange;
  cbSessionFilter.Properties.OnChange := cbGroupFielterPropertiesChange;
  cbPriceFilter.Properties.OnChange := cbPriceFilterPropertiesChange;
  edPriceFilterValue.Enabled := False;
end;

procedure TfrProductSearch.UpdateProduct;
var
  AbstractionProduct: TAbstractionProduct;
begin
  AbstractionProduct := TAbstractionProduct.Create;
  try
    if not Assigned(frProduct) then
    begin
      frProduct := TfrProduct.Create(
      procedure
      begin
        LoadProducts;
      end);
      frProduct.Parent := Self.Parent;
      frProduct.Align := alClient;

      AbstractionProduct.Id := cdsProducts.FieldByName('Id').AsInteger;
      AbstractionProduct.BarCode := cdsProducts.FieldByName('BarCode').AsString;
      AbstractionProduct.Name  := cdsProducts.FieldByName('Name').AsString;
      AbstractionProduct.Price := cdsProducts.FieldByName('Price').AsFloat;
      AbstractionProduct.Unity := cdsProducts.FieldByName('Unity').AsString;
      AbstractionProduct.Session := TAbstractionSession.Create;
      AbstractionProduct.Session.Id := cdsProducts.FieldByName('SessionId').AsInteger;

      frProduct.SetProductUpdate(AbstractionProduct);
      frProduct.Show;
    end;
    frProduct.BringToFront;
  finally
    AbstractionProduct.Free;
  end;
end;

procedure TfrProductSearch.AddProduct;
begin
  if not Assigned(frProduct) then
  begin
    frProduct := TfrProduct.Create(
    procedure
    begin
      LoadProducts;
    end);
    frProduct.Parent := Self.Parent;
    frProduct.Align := alClient;
    frProduct.SetProductInsert;
    frProduct.Show;
  end;
  frProduct.BringToFront;
end;

end.
