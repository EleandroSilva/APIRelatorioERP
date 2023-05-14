unit Model.Imp.Factory.Entidades;

interface

uses
  Model.Factory.Entidades.Interfaces,
  Model.Entidade.Usuario.Interfaces,
  Model.Entidade.Usuario,
  Model.DAO.Entidades.Interfaces,
  Model.DAO.Imp.Entidade.Usuario,
  Model.Entidade.Produto.Interfaces,
  Model.Entidade.Produto,
  Model.DAO.Imp.Entidade.Produto;

type
  TFactoryEntidade = class(TInterfacedObject, iFactoryEntidade)
  private
    FDAOUsuario : iDAOEntidades<iEntidadeUsuario>;
    FDAOProduto : iDAOEntidades<iEntidadeProduto>;

    FUsuario : iEntidadeUsuario;
    FProduto : iEntidadeProduto;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryEntidade;

    function Usuario : iEntidadeUsuario;
    function Produto : iEntidadeProduto;
  end;

implementation

{ TFactoryEntidade }

constructor TFactoryEntidade.Create;
begin
  FDAOUsuario := TDAOUsuario.New;
  FDAOProduto := TDAOProduto.New;
end;

destructor TFactoryEntidade.Destroy;
begin
  inherited;
end;

class function TFactoryEntidade.New: iFactoryEntidade;
begin
  Result := Self.Create;
end;

function TFactoryEntidade.Produto: iEntidadeProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TProduto.New(FDAOProduto);

  Result := FProduto;
end;

function TFactoryEntidade.Usuario : iEntidadeUsuario;
begin
  if not Assigned(FUsuario) then
    FUsuario := TUsuario.New(FDAOUsuario);

  Result := FUsuario;
end;

end.
