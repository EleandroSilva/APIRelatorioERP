unit View.entidade.relatorio.produto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLFilters,
  RLPDFFilter,
  RLReport,


  View.entidade.relatorio.base.simples,

  Model.Controller.Interfaces;

type
  TRelatorioProduto = class(TRelatorioBaseSimples)
    dsReport: TDataSource;
    rllIdProduto: TRLLabel;
    rllNomeProduto: TRLLabel;
    rbIdUsuario: TRLDBText;
    dbNomeUsuario: TRLDBText;
    procedure ReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FController : iController;
  protected
    function GetReportName: String; override;
    procedure CriarService; override;
  end;


implementation

uses
  Model.Imp.Controller;

{$R *.dfm}

{ TRelatorioProduto }

procedure TRelatorioProduto.CriarService;
begin
  inherited;
  dsReport.DataSet.Close;
end;

function TRelatorioProduto.GetReportName: String;
begin
  Result :='produtos';
end;

procedure TRelatorioProduto.ReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  FController := TController.New;

  FController.
      Entidades.
          Produto.
              &End.
            ListarTodos.
            DataSet(dsReport);
end;

end.
