unit Model.Entidade.Produto.Interfaces;

interface

uses
  Model.DAO.Entidades.Interfaces;


type
  iEntidadeProduto = interface
    ['{67D38973-8903-4910-B737-4D9D3FEB21DE}']
    function ID(Value : Integer)  : iEntidadeProduto; overload;
    function ID                   : Integer; overload;
    function Nome(Value : String) : iEntidadeProduto; overload;
    function Nome                 : String; overload;
    function Registry : iEntidadeProduto;

    function &End : iDAOEntidades<iEntidadeProduto>;
  end;

implementation

end.
