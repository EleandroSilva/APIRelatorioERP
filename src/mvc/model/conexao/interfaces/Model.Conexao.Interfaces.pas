unit Model.Conexao.Interfaces;

interface

uses
  Data.DB,
  FireDAC.Comp.Client;

type
  iConexao = interface
    ['{823AF268-3D7B-4799-8271-61C9904AF4CF}']
    function Conexao(Value : TFDConnection) : iConexao; overload;
    function Conexao : TFDConnection; overload;
    function StartTransaction : iConexao;
    function Commit           : iConexao;
    function Rollback         : iConexao;
  end;

implementation

end.
