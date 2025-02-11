unit UntImportCsv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXOdbc, Data.FMTBcd, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Buttons, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Contnrs, Vcl.Samples.Gauges;

type
  TFrmImportCsv = class(TForm)
    SQLConnection1: TSQLConnection;
    dtstprvdrCaminho: TDataSetProvider;
    dsCaminho: TDataSource;
    dsArqImportados: TDataSource;
    dtstprvdrArqImportados: TDataSetProvider;
    CdsArqImportados: TClientDataSet;
    OpenDialog1: TOpenDialog;
    sqlqryIns: TSQLQuery;
    txtTitulo: TStaticText;
    btnSalvarPath: TButton;
    btnImport: TButton;
    pgc1: TPageControl;
    ts3: TTabSheet;
    tsArqImportados: TTabSheet;
    btn2: TButton;
    btn3: TButton;
    dbgrdArqImportados: TDBGrid;
    dbgrd1: TDBGrid;
    CdsCaminho: TClientDataSet;
    dbnvgr1: TDBNavigator;
    dbedtcaminho: TDBEdit;
    dbcbbativado: TDBComboBox;
    intgrfldCdsArqImportid: TIntegerField;
    wdstrngfldCdsArqImportcaminho: TWideStringField;
    wdstrngfldCdsArqImportativado: TWideStringField;
    wdstrngfldCdsArqImporttabela_destino: TWideStringField;
    sqldtstCaminho: TSQLDataSet;
    intgrfldTeste1id: TIntegerField;
    wdstrngfldTeste1caminho: TWideStringField;
    wdstrngfldTeste1ativado: TWideStringField;
    wdstrngfldTeste1tabela_destino: TWideStringField;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    sqldtstArqImportados: TSQLDataSet;
    intgrfldArqImportadosid: TIntegerField;
    intgrfldArqImportadoscaminho_arquivo_id: TIntegerField;
    wdstrngfldArqImportadosnome: TWideStringField;
    sqldtstArqImportadosdata_importacao: TSQLTimeStampField;
    fmtbcdfldArqImportadosqtde_registros: TFMTBCDField;
    intgrfldCdsArqImportadosid: TIntegerField;
    wdstrngfldCdsArqImportadosnome: TWideStringField;
    CdsArqImportadosdata_importacao: TSQLTimeStampField;
    fmtbcdfldCdsArqImportadosqtde_registros: TFMTBCDField;
    intgrfldCdsArqImportadoscaminho_arquivo_id: TIntegerField;
    tmrDispImport: TTimer;
    sqlqryCaminhos: TSQLQuery;
    sqlqryCaminhosid: TIntegerField;
    sqlqryCaminhoscaminho: TWideStringField;
    sqlqryCaminhosativado: TWideStringField;
    sqlqryCaminhostabela_destino: TWideStringField;
    txtQtdArqImportando: TStaticText;
    dbcbbtabela_destino: TDBComboBox;
    gauProgresso: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarPathClick(Sender: TObject);
    procedure CdsCaminhoAfterPost(DataSet: TDataSet);
    procedure CdsCaminhoAfterInsert(DataSet: TDataSet);
    procedure dbedtcaminhoDblClick(Sender: TObject);
    procedure tmrDispImportTimer(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure atualizaCaminhos;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    FIsPodeImportar: Boolean;
    FIsLimiteThread: Boolean;
  public
    { Public declarations }

  end;

var
  FrmImportCsv: TFrmImportCsv;
  FListaThrad:   TObjectList;

const
  LimiteThread = 15;

implementation

{$R *.dfm}

uses UntImportacaoArquivos;

procedure TFrmImportCsv.atualizaCaminhos;
begin
  sqlqryCaminhos.Close;
  sqlqryCaminhos.Open;
end;

procedure TFrmImportCsv.btn2Click(Sender: TObject);
var
  i : Integer;
begin
  FIsPodeImportar       := False;
  tmrDispImport.Enabled := False;
  btnImport.Enabled     := True;
  tmrDispImport.Interval:= 100;

  for I := 0 to FListaThrad.Count - 1 do
  begin
    if Assigned(FListaThrad[i]) then
    begin
      FListaThrad.Remove(FListaThrad[i]);
    end;
  end;

end;

procedure TFrmImportCsv.btnImportClick(Sender: TObject);
begin
  btnImport.Enabled     := False;
  FIsPodeImportar       := True;
  tmrDispImport.Enabled := True;
  txtQtdArqImportando.Caption := 'Prepearando Importação';
end;

procedure TFrmImportCsv.btnSalvarPathClick(Sender: TObject);
var
  LIsEmpty: Boolean;
begin
  if CdsCaminho.State in [dsInsert, dsEdit] then
    CdsCaminho.ApplyUpdates(0);

//  sqlqryIns.SQL.Clear;
//  sqlqryIns.SQL.Add('Select 1 from "caminho_arquivos" ');
//  sqlqryIns.Open;
//  LIsEmpty := sqlqryIns.IsEmpty;
//  sqlqryIns.Close;
//  sqlqryIns.SQL.Clear;
//
//  if LIsEmpty then
//  begin
//    sqlqryIns.SQL.Add(
//        'INSERT INTO "caminho_arquivos" VALUES '
//      + '( :gastos_pagamentos, :gastos_cartao, :gastos_diarias_passagens, :gastos_fornecedores, '
//      + '  :servidores_cadastro, :servidores_remuneracoes, :servidores_honorarios, '
//      + '  :servidores_observacoes )' );
//  end
//  else
//  begin
//    sqlqryIns.SQL.Add(
//        'UPDATE "caminho_arquivos" SET '
//      + 'gastos_pagamentos=:gastos_pagamentos, gastos_cartao=:gastos_cartao, gastos_diarias_passagens=:gastos_diarias_passagens, '
//      + 'gastos_fornecedores=:gastos_fornecedores, servidores_cadastro=:servidores_cadastro, servidores_remuneracoes=:servidores_remuneracoes, '
//      + 'servidores_honorarios=:servidores_honorarios, servidores_observacoes=:servidores_observacoes ');
//  end;
//
//  sqlqryIns.ParamByName('gastos_pagamentos').AsString         := edtPagamentos.Text;
//  sqlqryIns.ParamByName('gastos_cartao').AsString             := edtCartao.Text;
//  sqlqryIns.ParamByName('gastos_diarias_passagens').AsString  := edtDiarias.Text;
//  sqlqryIns.ParamByName('gastos_fornecedores').AsString       := edtFornecedores.Text;
//
//  sqlqryIns.ParamByName('servidores_cadastro').AsString       := edtCadServidores.Text;
//  sqlqryIns.ParamByName('servidores_remuneracoes').AsString   := edtRemuneracao.Text;
//  sqlqryIns.ParamByName('servidores_honorarios').AsString     := edtHonorarios.Text;
//  sqlqryIns.ParamByName('servidores_observacoes').AsString    := edtObservacoes.Text;
//
//  sqlqryIns.ExecSQL;

end;

procedure TFrmImportCsv.CdsCaminhoAfterInsert(DataSet: TDataSet);
begin
  sqlqryIns.Close;
  sqlqryIns.SQL.Clear;
  sqlqryIns.SQL.Add('SELECT NEXTVAL('+QuotedStr('caminho_arquivos_id_seq') + ')');
  sqlqryIns.Open;
  CdsCaminho.FieldByName('id').AsInteger := sqlqryIns.FieldByName('nextval').AsInteger;
end;

procedure TFrmImportCsv.CdsCaminhoAfterPost(DataSet: TDataSet);
begin
  CdsCaminho.ApplyUpdates(0);
end;

procedure TFrmImportCsv.dbedtcaminhoDblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    CdsCaminho.Edit;
    CdsCaminho.FieldByName('caminho').AsString := ExtractFileDir(OpenDialog1.FileName);
  end;
end;

procedure TFrmImportCsv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQLConnection1.Close;
  sqlqryIns.Close;
  sqldtstCaminho.Close;
  CdsCaminho.Close;
  sqldtstArqImportados.Active := False;
  CdsArqImportados.Active := False;
end;

procedure TFrmImportCsv.FormShow(Sender: TObject);
begin
  SQLConnection1.Open;
  sqldtstCaminho.Open;
  CdsCaminho.Open;

  sqldtstArqImportados.Active := True;
  CdsArqImportados.Active := True;
  FIsPodeImportar:= False;
  FListaThrad := TObjectList.Create(True);
  txtQtdArqImportando.Caption := '0 - Arquivos Sendo Importados';
  FIsLimiteThread := False;

  sqlqryIns.close;
  sqlqryIns.SQL.Clear;

  sqlqryIns.SQL.add(  'SELECT tablename FROM pg_catalog.pg_tables '
                      +   'WHERE schemaname NOT IN (     '
                      +     QuotedStr('pg_catalog')         +' , '
                      +     QuotedStr('information_schema') + ' , '
                      +     QuotedStr('pg_toast')           + ' ) '
                      +   ' ORDER BY tablename');
  sqlqryIns.Open;
  while not sqlqryIns.EOF do
  begin
     dbcbbtabela_destino.Items.Add(sqlqryIns.FieldByName('tablename').AsString);
     sqlqryIns.Next;
  end;
end;

procedure TFrmImportCsv.tmrDispImportTimer(Sender: TObject);
var
  LIsTemImport      : Boolean;
  i : Integer;
  LThreadImport: TThreadImportCsv;

  j          : Integer;
  LSearchRec : TSearchRec;
begin

  sqldtstArqImportados.Refresh;
  CdsArqImportados.Refresh;
  txtQtdArqImportando.Caption := IntToStr(FListaThrad.Count) + ' - Arquivos Sendo Importados';
  tmrDispImport.Interval := 10000;

  LIsTemImport := False;
  try
    for I := 0 to FListaThrad.Count - 1 do
    begin
      if (FListaThrad.Count > 0) and Assigned(FListaThrad[i]) then
      begin
        LIsTemImport := TThreadImportCsv(FListaThrad[i]).Started;

        if (TThreadImportCsv(FListaThrad[i]).Terminado = True) then
        begin
          FListaThrad.Remove(FListaThrad[i]);
          gauProgresso.Progress := gauProgresso.Progress + 1;
          Refresh;
        end;

      end;
    end;
  except
    on E: Exception do
    begin
      LIsTemImport := True;
    end;

  end;

  if FListaThrad.Count = 0 then
  begin
    LIsTemImport    := False;
    FIsPodeImportar := True;
    gauProgresso.Progress := 0;
    FIsLimiteThread := False;
  end;

  if FIsPodeImportar and not LIsTemImport and not FIsLimiteThread then
  begin
    FIsPodeImportar := False;
    atualizaCaminhos;
    while (not sqlqryCaminhos.Eof) do
    begin
      if (sqlqryCaminhos.FieldByName('ativado').AsString = 'T') then
      begin
        i := FindFirst(sqlqryCaminhos.FieldByName('caminho').AsString + '\' + '*.csv', 0, LSearchRec);
        while i = 0 do
        begin
          LThreadImport := TThreadImportCsv.create(SQLConnection1);
          LThreadImport.CaminhoId := sqlqryCaminhos.FieldByName('id').AsInteger;
          LThreadImport.Arquivo   := sqlqryCaminhos.FieldByName('caminho').AsString + '\' +  LSearchRec.Name;
          LThreadImport.TabDestino:= sqlqryCaminhos.FieldByName('tabela_destino').AsString;
          FListaThrad.Add(LThreadImport);
          LThreadImport.Start;
          i := FindNext(LSearchRec);
          if LimiteThread = FListaThrad.Count then
            FIsLimiteThread := True;

          if FIsLimiteThread then
            Break;
        end;
      end;
      sqlqryCaminhos.Next;

      if FIsLimiteThread then
        Break;
    end;
    gauProgresso.MaxValue := FListaThrad.Count;
  end;

end;

end.

