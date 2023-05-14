unit Model.Imp.Controller;

interface

uses
  System.SysUtils,

  Model.Controller.Interfaces,
  Model.Factory.Entidades.Interfaces,
  Model.Imp.Factory.Entidades;

Type
  TController = class(TInterfacedObject, iController)
  private
    FFactoryEntidades : iFactoryEntidade;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Entidades: iFactoryEntidade;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  //
end;

destructor TController.Destroy;
begin
  //
  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Entidades: iFactoryEntidade;
begin
  if not Assigned(FFactoryEntidades) then
    FFactoryEntidades := TFactoryEntidade.New;

  Result := FFactoryEntidades;
end;

end.
