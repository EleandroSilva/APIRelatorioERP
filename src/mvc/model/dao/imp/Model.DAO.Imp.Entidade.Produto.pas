unit Model.DAO.Imp.Entidade.Produto;

interface

uses
  Data.DB,

  System.SysUtils,

  Model.Conexao.Interfaces,
  Model.DAO.Entidades.Interfaces,
  Model.Entidade.Produto.Interfaces,
  Model.Entidade.Produto,
  Model.Imp.Conexao.Firedac.MySQL,
  Model.Conexao.Query.Interfaces,
  Model.Imp.Conexao.FDQuery;

type
  TDAOProduto = class(TInterfacedObject, iDAOEntidades<iEntidadeProduto>)
    private
      FProduto  : iEntidadeProduto;
      FDConexao : iConexao;
      FDQuery   : iQuery;
      FDataSet  : TDataSet;
      FSQL      : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntidades<iEntidadeProduto>;

      function DataSet(DataSource : TDataSource): iDAOEntidades<iEntidadeProduto>; overload;
      function DataSet: TDataSet; overload;
      function Inserir     : iDAOEntidades<iEntidadeProduto>;
      function ListarTodos : iDAOEntidades<iEntidadeProduto>;

      function This        : iEntidadeProduto;
  end;


implementation

{ TDAProduto }

constructor TDAOProduto.Create;
begin
  FProduto  := TProduto.New(Self);
  FDConexao := TModelConexaoFiredacMySQL.New;
  FDQuery   := TModelFDQuery.New;
end;

destructor TDAOProduto.Destroy;
begin
  inherited;
end;

class function TDAOProduto.New: iDAOEntidades<iEntidadeProduto>;
begin
  Result := Self.Create;
end;

function TDAOProduto.DataSet(DataSource: TDataSource): iDAOEntidades<iEntidadeProduto>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FDQuery.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

function TDAOProduto.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TDAOProduto.Inserir: iDAOEntidades<iEntidadeProduto>;
begin
  Result := Self;
  FSQL :='';
  FDConexao.StartTransaction;
  try
    FSQL :='insert into produto values (?, ?)';

    FDConexao.Commit;
  except
    FDConexao.Rollback;
    raise Exception.Create('Erro ao tentar gravar o registro.');
  end;
end;


function TDAOProduto.ListarTodos: iDAOEntidades<iEntidadeProduto>;
begin
  Result := Self;
  FSQL :='select * from produto';
  FDataSet:= FDQuery
             .SQL(FSQL)
             .Open
             .DataSet;
end;

function TDAOProduto.This: iEntidadeProduto;
begin
  Result := FProduto;
end;

end.
