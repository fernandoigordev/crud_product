unit Presentation.View.Product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  AdvGlowButton, CalcEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient,
  Domain.Abstraction.Product,Data.Repository.Product.SqLite,
  Presentation.Controller.Product, Presentation.Controller.Session,
  Data.Repository.Session.SqLite, Data.Repository.Session.Interfaces,
  Data.Repository.Product.Interfaces;

type
  TfrProduct = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    pnlBottom: TPanel;
    btnSave: TAdvGlowButton;
    btnCancel: TAdvGlowButton;
    pnlContent: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbSession: TcxImageComboBox;
    edBarCode: TDBEdit;
    edName: TDBEdit;
    edPrice: TDBEdit;
    cbUnity: TcxImageComboBox;
    cdsProducts: TClientDataSet;
    cdsProductsId: TIntegerField;
    cdsProductsPrice: TFloatField;
    cdsProductsUnity: TStringField;
    cdsProductsSessionId: TIntegerField;
    dsProducts: TDataSource;
    cdsProductsBarCode: TStringField;
    cdsProductsName: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBarCodeExit(Sender: TObject);
    procedure edNameExit(Sender: TObject);
    procedure edPriceExit(Sender: TObject);
  private
    { Private declarations }
    FProductController: TProductController;
    FSessionController: TSessionController;
    FRepositoryProductSqLite: IRepositoryProduct;
    FRepositorySessionSqLite: IRepositorySession;
    FProc: TProc;
    function Validate(ACode: Integer): Boolean;
  public
    { Public declarations }
    procedure SetProductInsert;
    procedure SetProductUpdate(AbstractionProduct: TAbstractionProduct);
    procedure SaveProduct;

    Constructor Create(AReload: TProc);
  end;

var
  frProduct: TfrProduct;

implementation

uses
  Data.DataModule;

{$R *.dfm}

procedure TfrProduct.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrProduct.btnSaveClick(Sender: TObject);
begin
  SaveProduct;
end;

constructor TfrProduct.Create(AReload: TProc);
begin
  inherited Create(nil);
  FProc := AReload;
end;

procedure TfrProduct.edBarCodeExit(Sender: TObject);
begin
  Validate(1);
end;

procedure TfrProduct.edNameExit(Sender: TObject);
begin
  Validate(2);
end;

procedure TfrProduct.edPriceExit(Sender: TObject);
begin
  Validate(3);
end;

procedure TfrProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frProduct);
end;

procedure TfrProduct.FormCreate(Sender: TObject);
begin
  FRepositoryProductSqLite := TRepositoryProductSqLite.Create(DataModule1.FDConnection);
  FRepositorySessionSqLite := TRepositorySessionSqLite.Create(DataModule1.FDConnection);
  FProductController := TProductController.Create(FRepositoryProductSqLite);
  FSessionController := TSessionController.Create(FRepositorySessionSqLite);

  FSessionController.LoadSessions(cbSession);
  cbUnity.ItemIndex := 0;
end;

procedure TfrProduct.FormDestroy(Sender: TObject);
begin
  FProductController.Free;
  FSessionController.Free;
end;

procedure TfrProduct.SaveProduct;
begin
  if Validate(0) then
  begin
    cdsProducts.FieldByName('SessionId').AsInteger := cbSession.Properties.Items[cbSession.ItemIndex].Value;
    cdsProducts.FieldByName('Unity').AsString := cbUnity.Properties.Items[cbUnity.ItemIndex].Value;
    if cdsProducts.State = dsInsert then
    begin
      cdsProducts.Post;
      FProductController.CreateProduct(cdsProducts);
    end
    else if cdsProducts.State = dsEdit then
    begin
      cdsProducts.Post;
      FProductController.UpdateProduct(cdsProducts);
    end;
    FProc;
    Close;
  end;
end;

procedure TfrProduct.SetProductInsert;
begin
  cdsProducts.Close;
  cdsProducts.Open;
  cdsProducts.Insert;
end;

procedure TfrProduct.SetProductUpdate(AbstractionProduct: TAbstractionProduct);
var
  Index: Integer;
begin
  cdsProducts.EmptyDataSet;
  cdsProducts.Close;
  cdsProducts.Open;

  cdsProducts.Append;
  cdsProducts.FieldByName('Id').AsInteger := AbstractionProduct.Id;
  cdsProducts.FieldByName('BarCode').AsString := AbstractionProduct.BarCode;
  cdsProducts.FieldByName('Name').AsString := AbstractionProduct.Name;
  cdsProducts.FieldByName('Price').AsFloat := AbstractionProduct.Price;
  cdsProducts.FieldByName('Unity').AsString := AbstractionProduct.Unity;
  cdsProducts.FieldByName('SessionId').AsInteger := AbstractionProduct.Session.Id;
  cdsProducts.Post;

  for Index := 0 to cbUnity.Properties.Items.Count-1 do
  begin
    if cbUnity.Properties.Items[Index].Value = AbstractionProduct.Unity  then
      cbUnity.ItemIndex := Index;
  end;

  for Index := 0 to cbSession.Properties.Items.Count-1 do
  begin
    if cbSession.Properties.Items[Index].Value = AbstractionProduct.Session.Id  then
      cbSession.ItemIndex := Index;
  end;

  cdsProducts.Edit;
end;

function TfrProduct.Validate(ACode: Integer): Boolean;
begin
  Result := True;

  if ACode in [0,1] then
  begin
    if edBarCode.Text = EmptyStr then
    begin
      MessageDlg('Código de barras inválido!', mtInformation, [mbOK], 0);
      Result := False;
      edBarCode.SetFocus;
    end;
  end;

  if Result and (ACode in [0,2]) then
  begin
    if edName.Text = EmptyStr then
    begin
      MessageDlg('Nome inválido!', mtInformation, [mbOK], 0);
      Result := False;
      edName.SetFocus;
    end;
  end;

   if Result and (ACode in [0,3]) then
  begin
    if StrToFloatDef(Trim(StringReplace(edPrice.EditText, 'R$', '', [rfReplaceAll])), 0) <= 0 then
    begin
      MessageDlg('Preço inválido!', mtInformation, [mbOK], 0);
      Result := False;
      edPrice.SetFocus;
    end;
  end;


end;

end.
