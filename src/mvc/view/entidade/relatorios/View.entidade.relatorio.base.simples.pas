unit View.entidade.relatorio.base.simples;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLReport,
  Data.DB,
  RLFilters,
  RLPDFFilter,


  View.entidade.relatorio.base;

type
  TRelatorioBaseSimples = class(TRelatorioBase)
    BandaCabecalho: TRLBand;
    BandaDados: TRLBand;
    private
    protected
      procedure CriarService; virtual; abstract;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;
implementation

{$R *.dfm}

constructor TRelatorioBaseSimples.Create;
begin
  inherited;
end;

destructor TRelatorioBaseSimples.Destroy;
begin
  inherited;
end;

end.
