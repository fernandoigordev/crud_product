unit Presentation.View.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dxGDIPlusClasses;

type
  TfmViewMenu = class(TForm)
    pnlLeft: TPanel;
    pnlContent: TPanel;
    Panel1: TPanel;
    pnlProduct: TPanel;
    Bevel1: TBevel;
    pnlClose: TPanel;
    imgProduct: TImage;
    lbProduct: TLabel;
    imgClose: TImage;
    lbClose: TLabel;
    procedure lbProductClick(Sender: TObject);
    procedure imgProductClick(Sender: TObject);
    procedure lbCloseClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ShowProductSearch;
    procedure CloseApplication;
  public
    { Public declarations }
  end;

var
  fmViewMenu: TfmViewMenu;

implementation

uses
  Presentation.View.ProductSearch;

{$R *.dfm}

{ TfmViewMenu }

procedure TfmViewMenu.CloseApplication;
begin
  Close;
end;

procedure TfmViewMenu.FormShow(Sender: TObject);
begin
  ShowProductSearch;
end;

procedure TfmViewMenu.imgCloseClick(Sender: TObject);
begin
  CloseApplication;
end;

procedure TfmViewMenu.imgProductClick(Sender: TObject);
begin
  ShowProductSearch;
end;

procedure TfmViewMenu.lbCloseClick(Sender: TObject);
begin
  CloseApplication;
end;

procedure TfmViewMenu.lbProductClick(Sender: TObject);
begin
  ShowProductSearch;
end;

procedure TfmViewMenu.ShowProductSearch;
begin
  if not Assigned(frProductSearch) then
  begin
    frProductSearch := TfrProductSearch.Create(Self);
    frProductSearch.Parent := pnlContent;
    frProductSearch.Align := alClient;
    frProductSearch.Show;
  end;
  frProductSearch.BringToFront;
end;

end.
