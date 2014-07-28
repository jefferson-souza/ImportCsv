program CsvImport;

uses
  Vcl.Forms,
  UntImportCsv in 'UntImportCsv.pas' {FrmImportCsv},
  UntImportacaoArquivos in 'UntImportacaoArquivos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmImportCsv, FrmImportCsv);
  Application.Run;
end.
