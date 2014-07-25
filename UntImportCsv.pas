unit UntImportCsv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXOdbc, Data.FMTBcd, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmImportCsv = class(TForm)
    SQLConnection1: TSQLConnection;
    SQLTable1: TSQLTable;
    DataSetProvider1: TDataSetProvider;
    SQLTable1id: TIntegerField;
    SQLTable1descricao: TWideStringField;
    SQLTable1codigo_siaf: TFMTBCDField;
    SQLTable1sigla: TWideStringField;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1id: TIntegerField;
    ClientDataSet1descricao: TWideStringField;
    ClientDataSet1codigo_siaf: TFMTBCDField;
    ClientDataSet1sigla: TWideStringField;
    SQLQuery1: TSQLQuery;
    DataSource2: TDataSource;
    SQLQuery1id: TIntegerField;
    SQLQuery1descricao: TWideStringField;
    SQLQuery1codigo_siaf: TFMTBCDField;
    SQLQuery1sigla: TWideStringField;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    OpenDialog1: TOpenDialog;
    sqlqryIns: TSQLQuery;
    StaticText1: TStaticText;
    fllstAux: TFileListBox;
    btn1: TButton;
    btnSalvarPath: TButton;
    btnImport: TButton;
    pgc1: TPageControl;
    tsDespesas: TTabSheet;
    tsServidores: TTabSheet;
    ts3: TTabSheet;
    grp1: TGroupBox;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPagamentos: TEdit;
    btnAbrirPgto: TButton;
    btnImportar: TButton;
    edtDiarias: TEdit;
    edtFornecedores: TEdit;
    edtCartao: TEdit;
    btnAbrirDiarias: TButton;
    btnAbrirFornecedores: TButton;
    btnCartao: TBitBtn;
    grp2: TGroupBox;
    lbl8: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtCadServidores: TEdit;
    btnBtnAbrirServ: TButton;
    btnBtnImportarServ: TButton;
    edtRemuneracao: TEdit;
    btnAbrRemuneracao: TButton;
    btnImpRemuneracao: TButton;
    edtObservacoes: TEdit;
    edtHonorarios: TEdit;
    btnAbrObservacoes: TButton;
    btnAbrHonorarios: TButton;
    btnImpObservacoes: TButton;
    btnImpHonorarios: TButton;
    ts1: TTabSheet;
    tsArqImportados: TTabSheet;
    btn2: TButton;
    btn3: TButton;
    procedure btnAbrirPgtoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBtnAbrirServClick(Sender: TObject);
    procedure ImportArqCsv(ATabDestino: string; APathFile:string);
    procedure btnBtnImportarServClick(Sender: TObject);
    procedure btnAbrRemuneracaoClick(Sender: TObject);
    procedure btnImpRemuneracaoClick(Sender: TObject);
    procedure btnAbrObservacoesClick(Sender: TObject);
    procedure btnImpObservacoesClick(Sender: TObject);
    procedure btnAbrHonorariosClick(Sender: TObject);
    procedure btnImpHonorariosClick(Sender: TObject);
    procedure MoverArquivo(Origem, Destino,Arquivo: String);
    procedure btn1Click(Sender: TObject);
    procedure btnSalvarPathClick(Sender: TObject);
    procedure btnAbrirDiariasClick(Sender: TObject);
    procedure btnAbrirFornecedoresClick(Sender: TObject);
    procedure btnCartaoClick(Sender: TObject);
    procedure edtCadServidoresDblClick(Sender: TObject);
    procedure LoadEdits;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImportCsv: TFrmImportCsv;

implementation

{$R *.dfm}

procedure TFrmImportCsv.btnImpHonorariosClick(Sender: TObject);
begin
  ImportArqCsv('observacoes_servidores',edtObservacoes.Text);
end;

procedure TFrmImportCsv.btnImpObservacoesClick(Sender: TObject);
begin
  ImportArqCsv('honorarios_servidores',edtHonorarios.Text);
end;

procedure TFrmImportCsv.btn1Click(Sender: TObject);
begin
  fllstAux.ApplyFilePath('c:\');
end;

procedure TFrmImportCsv.btnAbrHonorariosClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtHonorarios.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnAbrirDiariasClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtDiarias.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnAbrirFornecedoresClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtFornecedores.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnAbrirPgtoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    EdtPagamentos.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnBtnAbrirServClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    EdtCadServidores.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnAbrObservacoesClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtObservacoes.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnAbrRemuneracaoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtRemuneracao.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnCartaoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtCartao.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.btnImportarClick(Sender: TObject);
var
  LCVSFile    : TextFile;
  LLinha      : string;
  i,j         : Integer;
  LQtTab      : Integer;
  LPosiTAbAnt : Integer;
  LLinIns     : string;
  LErros      : TStringList;
  Trans       : TTransactionDesc;  
  
begin
  LErros := TStringList.Create;
  LErros.Add('Logando erros de importação');
 
  AssignFile(LCVSFile, EdtPagamentos.Text);
  Reset(LCVSFile);
  LQtTab :=0;
  i:= 0;

  while not Eof(LCVSFile) do
  begin
    ReadLn(LCVSFile, LLinha);
    LQtTab      := 0;
    LPosiTAbAnt := 0;
    
    if (i <> 0) then
    begin

     for j := 1 to Length(LLinha) do
      begin
        if (LLinha[j] = ',') then LLinha[j] := '.'
        else if (LLinha[j] = #0) then LLinha[j] := '0';

        if (LLinha[j] = #9 ) or ( j = Length(LLinha)) then
        begin

          if ( LPosiTAbAnt = 0)    then
            LLinIns := LLinIns + QuotedStr(Copy(LLinha, LPosiTAbAnt   , j-1)) + ','
          else 
          if ( j = Length(LLinha)) then
            LLinIns := LLinIns + QuotedStr(Copy(LLinha, LPosiTAbAnt+1 , j-LPosiTAbAnt))   
          else
            LLinIns := LLinIns + QuotedStr(Copy(LLinha, LPosiTAbAnt+1 , j-1-LPosiTAbAnt)) + ',';            
            
          LPosiTAbAnt := j;             
        end;
      end;
      try
        Trans.TransactionID := 1;
        Trans.IsolationLevel := xilREADCOMMITTED;
        SQLConnection1.StartTransaction( Trans );
   
        sqlqryIns.SQL.Clear;
        sqlqryIns.SQL.Text :=
          'INSERT INTO "despesas_gastos_diretos" '
            + ' VALUES ( default, ' + LLinIns + ' )'; 
    
//        ShowMessage(IntToStr(i)+ '  - ' + sqlqryIns.SQL.Text);
        sqlqryIns.ExecSQL;
        SQLConnection1.Commit(Trans);
      except
        on E: Exception do
        begin
          LErros.Add(e.Message + ' - Linha:' + IntToStr(i) + ' SQL:' + sqlqryIns.SQL.Text);
          SQLConnection1.Rollback(Trans);
        end;

      end;

      LLinIns := '';      
    end;
    Inc(i);

  end;
    
  LErros.SaveToFile('ErrosImport.txt');
  // Close the file for the last time
  CloseFile(LCVSFile);

  Beep;
  ShowMessage('Arquivo importado com sucesso!!');

  FreeAndNil(LErros);

end;

procedure TFrmImportCsv.btnBtnImportarServClick(Sender: TObject);
begin
  ImportArqCsv('cadastro_servidores',edtCadServidores.Text);
end;

procedure TFrmImportCsv.btnImpRemuneracaoClick(Sender: TObject);
begin
  ImportArqCsv('remuneracao_servidores',edtRemuneracao.Text);
end;

procedure TFrmImportCsv.btnSalvarPathClick(Sender: TObject);
var
  LIsEmpty: Boolean;
begin
  sqlqryIns.SQL.Clear;
  sqlqryIns.SQL.Add('Select 1 from "caminho_arquivos" ');
  sqlqryIns.Open;
  LIsEmpty := sqlqryIns.IsEmpty;
  sqlqryIns.Close;
  sqlqryIns.SQL.Clear;

  if LIsEmpty then
  begin
    sqlqryIns.SQL.Add(
        'INSERT INTO "caminho_arquivos" VALUES '
      + '( :gastos_pagamentos, :gastos_cartao, :gastos_diarias_passagens, :gastos_fornecedores, '
      + '  :servidores_cadastro, :servidores_remuneracoes, :servidores_honorarios, '
      + '  :servidores_observacoes )' );
  end
  else
  begin
    sqlqryIns.SQL.Add(
        'UPDATE "caminho_arquivos" SET '
      + 'gastos_pagamentos=:gastos_pagamentos, gastos_cartao=:gastos_cartao, gastos_diarias_passagens=:gastos_diarias_passagens, '
      + 'gastos_fornecedores=:gastos_fornecedores, servidores_cadastro=:servidores_cadastro, servidores_remuneracoes=:servidores_remuneracoes, '
      + 'servidores_honorarios=:servidores_honorarios, servidores_observacoes=:servidores_observacoes ');
  end;

  sqlqryIns.ParamByName('gastos_pagamentos').AsString         := edtPagamentos.Text;
  sqlqryIns.ParamByName('gastos_cartao').AsString             := edtCartao.Text;
  sqlqryIns.ParamByName('gastos_diarias_passagens').AsString  := edtDiarias.Text;
  sqlqryIns.ParamByName('gastos_fornecedores').AsString       := edtFornecedores.Text;

  sqlqryIns.ParamByName('servidores_cadastro').AsString       := edtCadServidores.Text;
  sqlqryIns.ParamByName('servidores_remuneracoes').AsString   := edtRemuneracao.Text;
  sqlqryIns.ParamByName('servidores_honorarios').AsString     := edtHonorarios.Text;
  sqlqryIns.ParamByName('servidores_observacoes').AsString    := edtObservacoes.Text;

  sqlqryIns.ExecSQL;

end;

procedure TFrmImportCsv.edtCadServidoresDblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtCadServidores.Text := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQLConnection1.Close;
  sqlqryIns.Close;
end;

procedure TFrmImportCsv.FormShow(Sender: TObject);
begin
  SQLConnection1.Open;
  LoadEdits;

end;

procedure TFrmImportCsv.ImportArqCsv(ATabDestino, APathFile: string);
var
  LCVSFile    : TextFile;
  LLinha      : string;
  i,j         : Integer;
  LQtTab      : Integer;
  LPosiTAbAnt : Integer;
  LLinIns     : string;
  LErros      : TStringList;
  Trans       : TTransactionDesc;
  LToken      : string;

begin
  LErros := TStringList.Create;
  LErros.Add('Logando erros de importação');

  AssignFile(LCVSFile, APathFile);
  Reset(LCVSFile);
  LQtTab :=0;
  i:= 0;

//  while not Eof(LCVSFile) do
  while i < 5 do
  begin
    ReadLn(LCVSFile, LLinha);
    LQtTab      := 0;
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
        SQLConnection1.StartTransaction( Trans );

        sqlqryIns.SQL.Clear;
        sqlqryIns.SQL.Text :=
          'INSERT INTO "'+ATabDestino+'" '
            + ' VALUES ( default, ' + LLinIns + ' )';

//        ShowMessage(IntToStr(i)+ '  - ' + sqlqryIns.SQL.Text);
        sqlqryIns.ExecSQL;
        SQLConnection1.Commit(Trans);
      except
        on E: Exception do
        begin
          LErros.Add(e.Message + ' - Linha:' + IntToStr(i) + ' SQL:' + sqlqryIns.SQL.Text);
          SQLConnection1.Rollback(Trans);
        end;

      end;

      LLinIns := '';
    end;
    Inc(i);

  end;

  LErros.SaveToFile('ErrosImport.txt');
  // Close the file for the last time
  CloseFile(LCVSFile);

  Beep;
  ShowMessage('Arquivo importado com sucesso!!');

  FreeAndNil(LErros);

end;

procedure TFrmImportCsv.LoadEdits;
begin
  sqlqryIns.Close;
  sqlqryIns.sql.Clear;
  sqlqryIns.SQL.Add('select * from "caminho_arquivos"');
  sqlqryIns.Open;

  edtPagamentos.Text    := sqlqryIns.FieldByName('gastos_pagamentos').AsString;
  edtCartao.Text        := sqlqryIns.FieldByName('gastos_cartao').AsString;
  edtDiarias.Text       := sqlqryIns.FieldByName('gastos_diarias_passagens').AsString;
  edtFornecedores.Text  := sqlqryIns.FieldByName('gastos_fornecedores').AsString;

  edtCadServidores.Text := sqlqryIns.FieldByName('servidores_cadastro').AsString;
  edtRemuneracao.Text   := sqlqryIns.FieldByName('servidores_remuneracoes').AsString;
  edtHonorarios.Text    := sqlqryIns.FieldByName('servidores_honorarios').AsString;
  edtObservacoes.Text   := sqlqryIns.FieldByName('servidores_observacoes').AsString;

end;

procedure TFrmImportCsv.MoverArquivo(Origem, Destino,Arquivo: String);
var
  o, d: PWideChar;
begin
  o:= PWideChar(Origem + '\' + Arquivo);
  d:= PWideChar(Destino + '\' + Arquivo);
  MoveFile(o,d);
end;

end.
