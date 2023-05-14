unit Model.Entidade.Usuario.Interfaces;

interface

uses
  Model.DAO.Entidades.Interfaces;

type
  iEntidadeUsuario = interface
    ['{3C3CDB15-1AD5-4A50-90A4-43AA9A5AB87B}']
    function Id(Value : Integer) : iEntidadeUsuario; overload;
    function Id : Integer; overload;
    function IdEmpresa(Value : Integer) : iEntidadeUsuario; overload;
    function IdEmpresa : Integer; overload;
    function Nome(Value : String) : iEntidadeUsuario; overload;
    function Nome : String; overload;
    function Email(Value : String) : iEntidadeUsuario; overload;
    function Email : String; overload;
    function Senha(Value : String) : iEntidadeUsuario; overload;
    function Senha : String; overload;
    function Registry : iEntidadeUsuario;

    function &End  : iDAOEntidades<iEntidadeUsuario>;
  end;

implementation

end.
