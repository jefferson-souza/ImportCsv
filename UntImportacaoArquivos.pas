unit UntImportacaoArquivos;

interface

uses
  System.Classes, Windows , Data.DBXOdbc, Data.SqlExpr, System.SysUtils, Vcl.Dialogs, Vcl.Forms;

type
  TThreadImportCsv = class( TThread)
    private
      FQrAux      : TSQLQuery;
      FConn       : TSQLConnection;
      FArquivo    : string;
      FTabDestino : string;
      FArqId      : Integer;
      FCaminhoId  : Integer;
      FErros      : TStringList;

      procedure ImportArquivo;
      procedure ConfigureThread;
      procedure GravaArquivoImportado;
      procedure IniciaQuery(AQuery: TSQLQuery);
      procedure MoverArquivo(Origem, Destino,Arquivo: String);
    public
     procedure Execute; override;
     property CaminhoId  : Integer read FCaminhoId write FCaminhoId;
     property Arquivo    : string  read FArquivo write FArquivo;
     property TabDestino : string  read FTabDestino write FTabDestino;
     property Conn       : TSQLConnection write FConn;

  end;

var
  ControleGravacao, ControleId : TRTLCriticalSection;

implementation

{ TFrmImportCsv }
procedure TThreadImportCsv.ConfigureThread;
begin
  FQrAux   := TSQLQuery.Create(nil);
  FQrAux.SQLConnection := FConn;
  FreeOnTerminate := True;
  FErros := TStringList.Create;
end;

procedure TThreadImportCsv.Execute;
begin
  inherited;

  while not Terminated do
  begin
    try
      try
        Application.ProcessMessages;
        ConfigureThread;


        EnterCriticalSection(ControleId);
        GravaArquivoImportado;
        LeaveCriticalSection(ControleId);

        ImportArquivo;
      except
        on E: Exception do
        begin
          FErros.Add('Erro: ' + e.Message );
        end;

      end;

    finally
      FErros.SaveToFile('ErrosImport ' + ExtractFileName(FArquivo) +'.txt');

      FreeAndNil(FErros);
      Terminate;
    end;
  end;


end;

procedure TThreadImportCsv.GravaArquivoImportado;
var
  LQrAux : TSQLQuery;
begin
  FErros.Add('Logando dados de importa��o para arquivo: ' + FArquivo);
  LQrAux := TSQLQuery.Create(nil);
  LQrAux.SQLConnection := FConn;

  LQrAux.SQL.Add('select 1 from arquivos_importados where nome = ' + QuotedStr(FArquivo) );
  LQrAux.Open;

  if not LQrAux.IsEmpty then
    raise Exception.Create('Arquivo "' + FArquivo + '" J� Importado');

  IniciaQuery(LQrAux);

  LQrAux.SQL.Add('SELECT NEXTVAL('+QuotedStr('arquivos_importados_id_seq') + ')');
  LQrAux.Open;
  FArqId := LQrAux.FieldByName('NEXTVAL').AsInteger;
  IniciaQuery(LQrAux);

  LQrAux.SQL.Add('INSERT INTO arquivos_importados VALUES ( + '
                  + IntToStr(FArqId) + ', '
                  + IntToStr(FCaminhoId) + ', '
                  + QuotedStr(FArquivo) + ', '
                  + QuotedStr(DateToStr(Now)) + ', '
                  + '0' + ')');
  LQrAux.ExecSQL;

  FreeAndNil(LQrAux);

end;

procedure TThreadImportCsv.ImportArquivo;
var
  LCVSFile    : TextFile;
  LLinha      : string;
  i,j         : Integer;
  LPosiTAbAnt : Integer;
  LLinIns     : string;
  Trans       : TTransactionDesc;
  LToken      : string;
  LIsImportado: Boolean;

begin

  AssignFile(LCVSFile, FArquivo);
  Reset(LCVSFile);
  i:= 0;

  while not Eof(LCVSFile) do
//  while (i < 10000) do
  begin
    ReadLn(LCVSFile, LLinha);
    LPosiTAbAnt := 0;

    if (i <> 0) then
    begin
      j := 1;

     for j := 1 to Length(LLinha) do
      begin
        if (LLinha[j] = ',') then LLinha[j] := '.';

        if (LLinha[j] = #9 ) or ( j = Length(LLinha)) then
        begin
          if ( LPosiTAbAnt = 0)    then
          begin
            LToken  := Copy(LLinha, LPosiTAbAnt   , j-1);
            if (LToken = #0) then
            begin
              LToken := 'null';
              LLinIns := LLinIns + LToken + ',';
            end
            else
              LLinIns := LLinIns + QuotedStr(LToken) + ',';
          end
          else
          if ( j = Length(LLinha)) then
          begin
            LToken  := Copy(LLinha, LPosiTAbAnt+1 , j-LPosiTAbAnt);
            if (LToken = #0) then
            begin
              LToken := 'null';
              LLinIns := LLinIns + LToken;
            end
            else
              LLinIns := LLinIns + QuotedStr(LToken);
          end
          else
          begin
            LToken  := Copy(LLinha, LPosiTAbAnt+1 , j-1-LPosiTAbAnt);
            if (LToken = #0)then
            begin
              LToken := 'null';
              LLinIns := LLinIns + LToken + ',';
            end
            else
              LLinIns := LLinIns + QuotedStr(LToken) + ',';

          end;

          LPosiTAbAnt := j;
        end;
      end;
      try
        Trans.TransactionID := 1;
        Trans.IsolationLevel := xilREADCOMMITTED;
        FConn.StartTransaction( Trans );

        IniciaQuery(FQrAux);

        EnterCriticalSection(ControleGravacao);
        FQrAux.SQL.Text :=
          'INSERT INTO "'+FTabDestino+'" '
            + ' VALUES ( default,' + QuotedStr(IntToStr(FArqId)) + ' ,' + LLinIns + ' )';

        FQrAux.ExecSQL;
        FConn.Commit(Trans);
        LeaveCriticalSection(ControleGravacao);
      except
        on E: Exception do
        begin
          FErros.Add(e.Message + ' - Linha:' + IntToStr(i) + ' SQL:' + FQrAux.SQL.Text);
          FConn.Rollback(Trans);
          LeaveCriticalSection(ControleGravacao);
        end;

      end;

      LLinIns := '';
    end;
    Inc(i);

  end;

  EnterCriticalSection(ControleGravacao);
  IniciaQuery(FQrAux);
  FQrAux.SQL.Add('update arquivos_importados set qtde_registros = ' + QuotedStr(IntToStr(i - 1)) + ' where id = ' + QuotedStr(IntToStr(FArqId)) );
  FQrAux.ExecSQL;
  LeaveCriticalSection(ControleGravacao);

  // Close the file for the last time
  CloseFile(LCVSFile);
  MoverArquivo(ExtractFileDir(FArquivo), ExtractFileDir(FArquivo) + '\Import', ExtractFileName(FArquivo) );


end;

procedure TThreadImportCsv.IniciaQuery(AQuery: TSQLQuery);
begin
  AQuery.Close;
  AQuery.SQL.Clear;
end;

procedure TThreadImportCsv.MoverArquivo(Origem, Destino,Arquivo: String);
var
  o, d: PWideChar;
begin
  o:= PWideChar(Origem + '\' + Arquivo);
  d:= PWideChar(Destino + '\' + Arquivo);
  MoveFile(o,d);
end;

initialization
  InitializeCriticalSection(ControleGravacao);
  InitializeCriticalSection(ControleId);

finalization
  DeleteCriticalSection(ControleGravacao);
  DeleteCriticalSection(ControleId);

end.
