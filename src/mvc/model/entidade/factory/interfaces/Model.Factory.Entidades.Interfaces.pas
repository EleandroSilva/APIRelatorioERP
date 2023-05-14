unit Model.Factory.Entidades.Interfaces;

interface

uses
  Model.Entidade.Usuario.Interfaces,
  Model.Entidade.Produto.Interfaces;

type
  iFactoryEntidade = Interface
    ['{0B1D3897-0467-4B58-89A4-97ED1BA1DE52}']
    function Usuario : iEntidadeUsuario;
    function Produto : iEntidadeProduto;
  End;

implementation

end.
