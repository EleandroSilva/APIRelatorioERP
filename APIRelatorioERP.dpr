program APIRelatorioERP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream,
  System.SysUtils,
  View.entidade.relatorio.base in 'src\mvc\view\entidade\relatorios\View.entidade.relatorio.base.pas' {RelatorioBase: TFrame},
  View.entidade.relatorio.base.simples in 'src\mvc\view\entidade\relatorios\View.entidade.relatorio.base.simples.pas' {RelatorioBaseSimples: TFrame},
  View.entidade.relatorio.usuario in 'src\mvc\view\entidade\relatorios\View.entidade.relatorio.usuario.pas' {RelatorioUsuario: TFrame},
  Model.Controller.Interfaces in 'src\mvc\controller\interfaces\Model.Controller.Interfaces.pas',
  Model.Imp.Controller in 'src\mvc\controller\imp\Model.Imp.Controller.pas',
  Model.Conexao.Configuracoes.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Configuracoes.Interfaces.pas',
  Model.Conexao.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Interfaces.pas',
  Model.Conexao.Query.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Query.Interfaces.pas',
  Model.Imp.Conexao.Configuracoes.MySQL in 'src\mvc\model\conexao\imp\Model.Imp.Conexao.Configuracoes.MySQL.pas',
  Model.Imp.Conexao.FDQuery in 'src\mvc\model\conexao\imp\Model.Imp.Conexao.FDQuery.pas',
  Model.Imp.Conexao.Firedac.MySQL in 'src\mvc\model\conexao\imp\Model.Imp.Conexao.Firedac.MySQL.pas',
  Model.DAO.Entidades.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Entidades.Interfaces.pas',
  Model.DAO.Imp.Entidade.Usuario in 'src\mvc\model\dao\imp\Model.DAO.Imp.Entidade.Usuario.pas',
  Model.DAO.Imp.Entidade.Produto in 'src\mvc\model\dao\imp\Model.DAO.Imp.Entidade.Produto.pas',
  Model.Factory.Entidades.Interfaces in 'src\mvc\model\entidade\factory\interfaces\Model.Factory.Entidades.Interfaces.pas',
  Model.Imp.Factory.Entidades in 'src\mvc\model\entidade\factory\imp\Model.Imp.Factory.Entidades.pas',
  Model.Entidade.Produto.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Produto.Interfaces.pas',
  Model.Entidade.Usuario.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Usuario.Interfaces.pas',
  Model.Entidade.Produto in 'src\mvc\model\entidade\imp\Model.Entidade.Produto.pas',
  Model.Entidade.Usuario in 'src\mvc\model\entidade\imp\Model.Entidade.Usuario.pas',
  View.entidade.relatorio.produto in 'src\mvc\view\entidade\relatorios\View.entidade.relatorio.produto.pas' {RelatorioProduto: TFrame};

var
  FController : iController;

begin
  THorse.Use(OctetStream);
  try

    FController := TController.New;
    FController.Entidades.Usuario.Registry;
    FController.Entidades.Produto.Registry;

    THorse.Listen(9000);
  finally

  end;
end.
