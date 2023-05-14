unit Model.Entidade.Produto;

interface

uses
  System.SysUtils,

  Horse,
  Horse.OctetStream,
  View.entidade.relatorio.produto,

  Model.Entidade.Produto.Interfaces,
  Model.DAO.Entidades.Interfaces;

type
  TProduto = class(TInterfacedObject, iEntidadeProduto)
    private
      [weak]
      FParent  : iDAOEntidades<iEntidadeProduto>;
      FId      : Integer;
      FNome    : String;

      procedure DoReportProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    public
      constructor Create(Parent : iDAOEntidades<iEntidadeProduto>);
      destructor Destroy; override;
      class function New(Parent : iDAOEntidades<iEntidadeProduto>) : iEntidadeProduto;

      function ID(Value : Integer)  : iEntidadeProduto; overload;
      function ID                   : Integer; overload;
      function Nome(Value : String) : iEntidadeProduto; overload;
      function Nome                 : String; overload;
      function Registry : iEntidadeProduto;


      function &End : iDAOEntidades<iEntidadeProduto>;
  end;

implementation

{ TProduto }

constructor TProduto.Create(Parent : iDAOEntidades<iEntidadeProduto>);
begin
  FParent := Parent;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

procedure TProduto.DoReportProduto(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  LReport : TRelatorioProduto;
begin
  LReport := TRelatorioProduto.Create(nil);
  try
    Res.Send<TFileReturn>(LReport.GetReport);
  finally
    FreeAndNil(LReport);
  end;

end;

class function TProduto.New(Parent : iDAOEntidades<iEntidadeProduto>) : iEntidadeProduto;
begin
  Result := Self.Create(Parent);
end;

function TProduto.ID(Value: Integer): iEntidadeProduto;
begin
  Result := Self;
  FId := Value;
end;

function TProduto.ID: Integer;
begin
  Result := FId;
end;

function TProduto.Nome(Value: String): iEntidadeProduto;
begin
  Result := Self;
  FNome := Value;
end;

function TProduto.Nome: String;
begin
  Result := FNome;
end;

function TProduto.Registry: iEntidadeProduto;
begin
  Result := Self;
  THorse.Get('/produtos', DoReportProduto);
end;

function TProduto.&End: iDAOEntidades<iEntidadeProduto>;
begin
  Result := FParent;
end;

end.
