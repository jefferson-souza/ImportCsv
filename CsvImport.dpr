program CsvImport;

uses
  Vcl.Forms, windows, System.Win.ComObj,
  UntImportCsv in 'UntImportCsv.pas' {FrmImportCsv},
  UntImportacaoArquivos in 'UntImportacaoArquivos.pas';

{$R *.res}

begin
  CoInitializeEx(nil, 0);
  CoInitFlags := 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmImportCsv, FrmImportCsv);
  Application.Run;
end.
