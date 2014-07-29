program CsvImport;

uses
  Vcl.Forms, windows, System.Win.ComObj,
  UntImportCsv in 'UntImportCsv.pas' {FrmImportCsv},
  UntImportacaoArquivos in 'UntImportacaoArquivos.pas';

{$R *.res}

begin
  CoInitFlags := 4;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmImportCsv, FrmImportCsv);
  Application.Run;
end.
