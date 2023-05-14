unit Model.DAO.Entidades.Interfaces;

interface

uses
  Data.DB;

type
  iDAOEntidades<T> = interface
    ['{5877DE66-1DA8-4961-8F50-4E877933D01B}']
    function DataSet(DataSource: TDataSource): iDAOEntidades<T>; overload;
    function DataSet     : TDataSet; overload;
    function ListarTodos : iDAOEntidades<T>;

    function This        : T;
  end;

implementation

end.
