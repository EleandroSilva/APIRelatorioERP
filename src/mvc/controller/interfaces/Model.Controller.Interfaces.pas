unit Model.Controller.Interfaces;

interface

uses
  Model.Factory.Entidades.Interfaces;


type
  iController = interface
    ['{2C68B923-31AB-475E-8D4D-06EAAB66DB77}']
    function Entidades : iFactoryEntidade;
  end;

implementation

end.
