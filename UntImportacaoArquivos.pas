unit UntImportacaoArquivos;

interface

uses
  System.Classes, Windows , Data.DBXOdbc, Data.SqlExpr, System.SysUtils, Vcl.Dialogs, Vcl.Forms;

type
  TThreadImportCsv = class( TThread)
    private
      FQrAux   : TSQLQuery;
      FConn       : TSQLConnection;
      FArquivo    : string;
      FTabDestino : string;
      FArqId      : Integer;
      FCaminhoId  : Integer;

      procedure ImportArquivo;
      procedure ConfigureThread;
      procedure GravaArquivoImportado;
      procedure IniciaQuery;
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

//constructor TFrmImportCsv.Create(AArquivo, ATabDestino: string;
//  ACon: TSQLConnection; AOwner: TComponent);
//begin
//  inherited create(AOwner);
//  FCon        := ACon;
//  FQrInsReg   := TSQLQuery.Create(Self);
//  FArquivo    := AArquivo;
//  FTabDestino := ATabDestino;
//  FQrInsReg.SQLConnection := FCon;
//
//end;
//
//constructor TFrmImportCsv.Create(AOwner: TComponent);
//begin
//  inherited;
//{}
//end;

procedure TThreadImportCsv.ConfigureThread;
begin
  FQrAux   := TSQLQuery.Create(nil);
  FQrAux.SQLConnection := FConn;
  FreeOnTerminate := True;
end;

procedure TThreadImportCsv.Execute;
begin
  inherited;
  Application.ProcessMessages;
  ConfigureThread;
  GravaArquivoImportado;
  ImportArquivo;
  Self.Terminate;

end;

procedure TThreadImportCsv.GravaArquivoImportado;
begin
  IniciaQuery;
  FQrAux.SQL.Add('SELECT NEXTVAL('+QuotedStr('arquivos_importados_id_seq') + ')');
  FQrAux.Open;
  FArqId := FQrAux.FieldByName('NEXTVAL').AsInteger;
  IniciaQuery;
  FQrAux.SQL.Add('INSERT INTO arquivos_importados VALUES ( :id, :caminho_arquivo_id, :nome, :data_importacao, :qtde_registros )');
  FQrAux.ParamByName('id').AsInteger                 := FArqId;
  FQrAux.ParamByName('caminho_arquivo_id').AsInteger := FCaminhoId;
  FQrAux.ParamByName('nome').AsString                := FArquivo;
  FQrAux.ParamByName('data_importacao').AsDateTime   := Now;
  FQrAux.ParamByName('qtde_registros').AsInteger     := 0;
  FQrAux.ExecSQL(True);

end;

procedure TThreadImportCsv.ImportArquivo;
var
  LCVSFile    : TextFile;
  LLinha      : string;
  i,j         : Integer;
  LPosiTAbAnt : Integer;
  LLinIns     : string;
  LErros      : TStringList;
  Trans       : TTransactionDesc;
  LToken      : string;

begin
  LErros := TStringList.Create;
  LErros.Add('Logando erros de importação para arquivo: ' + FArquivo);

  AssignFile(LCVSFile, FArquivo);
  Reset(LCVSFile);
  i:= 0;

//  while not Eof(LCVSFile) do
  while i < 5 do
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

        IniciaQuery;
        FQrAux.SQL.Text :=
          'INSERT INTO "'+FTabDestino+'" '
            + ' VALUES ( default,' + QuotedStr(IntToStr(FArqId)) + ' ,' + LLinIns + ' )';

        FQrAux.ExecSQL;
        FConn.Commit(Trans);
      except
        on E: Exception do
        begin
          LErros.Add(e.Message + ' - Linha:' + IntToStr(i) + ' SQL:' + FQrAux.SQL.Text);
          FConn.Rollback(Trans);
        end;

      end;

      LLinIns := '';
    end;
    Inc(i);

  end;

  LErros.SaveToFile('ErrosImport ' + ExtractFileName(FArquivo) +'.txt');
  // Close the file for the last time
  CloseFile(LCVSFile);

  MoverArquivo(ExtractFileDir(FArquivo), ExtractFileDir(FArquivo) + '\Import', ExtractFileName(FArquivo) );

  FreeAndNil(LErros);
end;

procedure TThreadImportCsv.IniciaQuery;
begin
  FQrAux.Close;
  FQrAux.SQL.Clear;
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
