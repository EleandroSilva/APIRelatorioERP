unit View.entidade.relatorio.base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLReport,
  RLFilters,
  RLPDFFilter,
  Horse.OctetStream;

type
  TRelatorioBase = class(TFrame)
    Report: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLPDFFilter: TRLPDFFilter;
  private
    FReportName : String;
    FReportDirectory : String;

    function GetTempDirectory : String;
    function GetReportFilePath : String;
    function GetReportStream : TMemoryStream;
    procedure SaveReportToFile;
  protected
    function GetReportName : String; virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetReport : TFileReturn;
  end;

implementation

{$R *.dfm}

{ TRelatorioBase }

constructor TRelatorioBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FReportName := Format('%s%s.pdf', [GetReportName, FormatDateTime('ddmmyyhhmmss', Now)]);
  FReportDirectory := GetTempDirectory;
end;

destructor TRelatorioBase.Destroy;
begin
  if FileExists(GetReportFilePath) then
    DeleteFile(GetReportFilePath);

  inherited;
end;

function TRelatorioBase.GetReport: TFileReturn;
begin
  SaveReportToFile;
  Result := TFileReturn.Create(GetReportName+'.pdf', GetReportStream);
end;

function TRelatorioBase.GetReportFilePath: String;
begin
  Result := FReportDirectory + FReportName;
end;

function TRelatorioBase.GetReportName: String;
begin
  Result :='Report';
end;

function TRelatorioBase.GetReportStream: TMemoryStream;
begin
  Result := TMemoryStream.Create;
  Result.LoadFromFile(GetReportFilePath);
end;

function TRelatorioBase.GetTempDirectory: String;
var
  LTempFolder : array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @LTempFolder);
  Result := StrPas(LTempFolder);
  if not Result.EndsWith('\') then
    Result := Result + '\';
end;

procedure TRelatorioBase.SaveReportToFile;
begin
  RLPDFFilter.ShowProgress := False;
  Report.PrintDialog := False;
  Report.ShowProgress := False;

  Report.Prepare;
  Report.SaveToFile(GetReportFilePath);
end;

end.