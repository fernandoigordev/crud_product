unit Presentation.View.Product.Report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrProductReport = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    lbBarCode: TRLLabel;
    lbName: TRLLabel;
    lbPrice: TRLLabel;
    lbUnity: TRLLabel;
    lbGroup: TRLLabel;
    lbSession: TRLLabel;
    DbTextBarCode: TRLDBText;
    dbTextName: TRLDBText;
    dbTextPrice: TRLDBText;
    dbTextUnity: TRLDBText;
    dbTextGroup: TRLDBText;
    dbTextSession: TRLDBText;
    dsProductReport: TDataSource;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frProductReport: TfrProductReport;

implementation

{$R *.dfm}

end.
