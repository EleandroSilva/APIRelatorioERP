unit Model.Entidade.Usuario;

interface

uses
  System.SysUtils,
  System.Classes,

  Horse,
  Horse.OctetStream,

  Model.Entidade.Usuario.Interfaces,
  Model.DAO.Entidades.Interfaces,

  View.entidade.relatorio.usuario;


type
  TUsuario = class(TInterfacedObject, iEntidadeUsuario)
  private
    [weak]
    FParent    : iDAOEntidades<iEntidadeUsuario>;
    FId        : Integer;
    FIdEmpresa : Integer;
    FNome      : String;
    FEMail     : String;
    FSenha     : String;

    procedure DoReportUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  public
    constructor Create(Parent : iDAOEntidades<iEntidadeUsuario>);
    destructor Destroy; override;
    class function New(Parent : iDAOEntidades<iEntidadeUsuario>) : iEntidadeUsuario;

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
    function Registry :iEntidadeUsuario;

    function &End  : iDAOEntidades<iEntidadeUsuario>;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create(Parent: iDAOEntidades<iEntidadeUsuario>);
begin
  FParent := Parent;
end;

destructor TUsuario.Destroy;
begin
  inherited;
end;

class function TUsuario.New(Parent: iDAOEntidades<iEntidadeUsuario>): iEntidadeUsuario;
begin
  Result := Self.Create(Parent);
end;

procedure TUsuario.DoReportUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LReport : TRelatorioUsuario;
begin
  LReport := TRelatorioUsuario.Create(nil);
  try
    Res.Send<TFileReturn>(LReport.GetReport);
  finally
    FreeAndNil(LReport);
  end;
end;

function TUsuario.Registry: iEntidadeUsuario;
begin
  Result := Self;
  THorse.Get('/usuarios', DoReportUsuario);
end;

function TUsuario.Id(Value: Integer): iEntidadeUsuario;
begin
  Result := Self;
  FId := Value;
end;

function TUsuario.Id: Integer;
begin
  Result := FId;
end;

function TUsuario.IdEmpresa(Value: Integer): iEntidadeUsuario;
begin
  Result := Self;
  FIdEmpresa := Value;
end;

function TUsuario.IdEmpresa: Integer;
begin
  Result := FIdEmpresa;
end;

function TUsuario.Nome(Value: String): iEntidadeUsuario;
begin
  Result := Self;
  FNome := Value;
end;

function TUsuario.Nome: String;
begin
  Result := FNome;
end;

function TUsuario.Email(Value: String): iEntidadeUsuario;
begin
  Result := Self;
  FEmail := Value;
end;

function TUsuario.Email: String;
begin
  Result := FEmail;
end;

function TUsuario.Senha(Value: String): iEntidadeUsuario;
begin
  Result := Self;
  FSenha := Value;
end;

function TUsuario.Senha: String;
begin
  Result := FSenha;
end;

function TUsuario.&End: iDAOEntidades<iEntidadeUsuario>;
begin
  Result := FParent;
end;


end.
