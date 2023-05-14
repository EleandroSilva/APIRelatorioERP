unit Model.Imp.Conexao.Firedac.MySQL;

interface

uses
  Data.DB,
  System.SysUtils,
  System.JSON,

  FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Model.Conexao.Interfaces,
  Model.Conexao.Configuracoes.Interfaces,
  Model.Imp.Conexao.Configuracoes.MySQL;

type
  TModelConexaoFiredacMySQL = class(TInterfacedObject, iConexao)
    private
      FDConexao          : TFDConnection;
      FDriverMySQL       : TFDPhysMySQLDriverLink;
      FConfiguracaoMySQL : iConexaoConfiguracoesMySQL;

      procedure LerArquivoIni;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;

      function Conexao(Value : TFDConnection) : iConexao; overload;
      function Conexao : TFDConnection; overload;
      function StartTransaction : iConexao;
      function Commit           : iConexao;
      function Rollback         : iConexao;
  end;


implementation

{ TConexaoFiredacMySQL }

function TModelConexaoFiredacMySQL.Conexao: TFDConnection;
begin
  Result := FDConexao;
end;

constructor TModelConexaoFiredacMySQL.Create;
begin
  FDConexao          := TFDConnection.Create(nil);
  FDriverMySQL       := TFDPhysMySQLDriverLink.Create(nil);
  FConfiguracaoMySQL := TConexaoConfiguracoesMySQL.New;

  LerArquivoIni;
end;

destructor TModelConexaoFiredacMySQL.Destroy;
begin
  FreeAndNil(FDConexao);
  FreeAndNil(FDriverMySQL);
  inherited;
end;

class function TModelConexaoFiredacMySQL.New: iConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredacMySQL.Conexao(Value : TFDConnection) : iConexao;
begin
  Result    := Self;
  FDConexao := Value;
end;

function TModelConexaoFiredacMySQL.Commit: iConexao;
begin
  Result := Self;
  FDConexao.Commit;
end;

function TModelConexaoFiredacMySQL.Rollback: iConexao;
begin
  Result := Self;
  FDConexao.Rollback;
end;

function TModelConexaoFiredacMySQL.StartTransaction: iConexao;
begin
  Result := Self;
  FDConexao.StartTransaction;
end;

procedure TModelConexaoFiredacMySQL.LerArquivoIni;
begin
  try
    FDConexao          := TFDConnection.Create(nil);
    FDriverMySQL       := TFDPhysMySQLDriverLink.Create(nil);
    FConfiguracaoMySQL := TConexaoConfiguracoesMySQL.New;

    FDriverMySQL.VendorLib    := FConfiguracaoMySQL.VendorLib;
    FDConexao.Params.DriverID := FConfiguracaoMySQL.DriverName;
    FDConexao.Params.Database := FConfiguracaoMySQL.Database;
    FDConexao.Params.UserName := FConfiguracaoMySQL.UserName;
    FDConexao.Params.Password := FConfiguracaoMySQL.Password;
    FDConexao.Params.Add('Port='+FConfiguracaoMySQL.Port);
    FDConexao.Params.Add('utf8mb4');
    FDConexao.Params.Add('Server='+FConfiguracaoMySQL.ServerHost);
    FDConexao.LoginPrompt     := False;
    FDConexao.Connected;
  except
    on e: Exception do
    raise Exception.Create('Erro ao tentar se conectar com a base de dados: ' +e.Message);
  end;
end;

end.
