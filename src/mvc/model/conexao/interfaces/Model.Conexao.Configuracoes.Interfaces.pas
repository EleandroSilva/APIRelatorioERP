unit Model.Conexao.Configuracoes.Interfaces;

interface

type
  iConexaoConfiguracoesMySQL = interface
    ['{1775460D-EE6B-4579-B485-EAF957ABA50F}']
    function ServerHost     : String;
    function Port           : String;
    function Database       : String;
    function Password       : String;
    function UserName       : String;
    function DriverName     : String;
    function LibraryName    : String;
    function VendorLib      : String;
    function ConnectionName : String;
    function GetDriveFunc   : String;
  end;

implementation

end.
