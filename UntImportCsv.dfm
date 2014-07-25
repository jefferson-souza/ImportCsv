object FrmImportCsv: TFrmImportCsv
  Left = 0
  Top = 0
  Caption = 'Importador de Arquivos CSV - Portal da Transpar'#234'ncia'
  ClientHeight = 596
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 72
    Width = 681
    Height = 225
    Caption = ' Despesas '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 189
      Height = 13
      Caption = 'Caminho do arquivo Pagamentos:'
    end
    object lbl4: TLabel
      Left = 32
      Top = 70
      Width = 237
      Height = 13
      Caption = 'Caminho do arquivo Diarias de Passagens:'
    end
    object lbl5: TLabel
      Left = 32
      Top = 116
      Width = 195
      Height = 13
      Caption = 'Caminho do arquivo Fornecedores:'
    end
    object lbl6: TLabel
      Left = 32
      Top = 162
      Width = 156
      Height = 13
      Caption = 'Caminho do arquivo Cartao:'
    end
    object edtPagamentos: TEdit
      Left = 32
      Top = 43
      Width = 481
      Height = 21
      TabOrder = 0
      OnDblClick = btnAbrirPgtoClick
    end
    object btnAbrirPgto: TButton
      Left = 519
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 1
      OnClick = btnAbrirPgtoClick
    end
    object btnImportar: TButton
      Left = 600
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 2
      OnClick = btnImportarClick
    end
    object edtDiarias: TEdit
      Left = 32
      Top = 89
      Width = 481
      Height = 21
      TabOrder = 3
      OnDblClick = btnAbrirDiariasClick
    end
    object edtFornecedores: TEdit
      Left = 32
      Top = 135
      Width = 481
      Height = 21
      TabOrder = 4
      OnDblClick = btnAbrirFornecedoresClick
    end
    object edtCartao: TEdit
      Left = 32
      Top = 181
      Width = 481
      Height = 21
      TabOrder = 5
      OnDblClick = btnCartaoClick
    end
    object btnAbrirDiarias: TButton
      Left = 519
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 6
      OnClick = btnAbrirDiariasClick
    end
    object btnAbrirFornecedores: TButton
      Left = 519
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 7
      OnClick = btnAbrirFornecedoresClick
    end
    object btnCartao: TBitBtn
      Left = 519
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 8
      OnClick = btnCartaoClick
    end
  end
  object StaticText1: TStaticText
    Left = 272
    Top = 32
    Width = 235
    Height = 23
    Caption = 'Importador de Arquivos CSV'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 312
    Width = 681
    Height = 217
    Caption = 'Dados Servidores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 32
      Top = 24
      Width = 196
      Height = 13
      Caption = 'Caminho do arquivo de Servidores:'
    end
    object lbl1: TLabel
      Left = 32
      Top = 70
      Width = 214
      Height = 13
      Caption = 'Caminho do arquivo de Remunera'#231#227'o:'
    end
    object lbl2: TLabel
      Left = 32
      Top = 116
      Width = 205
      Height = 13
      Caption = 'Caminho do arquivo de Observa'#231#245'es'
    end
    object lbl3: TLabel
      Left = 32
      Top = 162
      Width = 197
      Height = 13
      Caption = 'Caminho do arquivo de Honor'#225'rios:'
    end
    object edtCadServidores: TEdit
      Left = 32
      Top = 43
      Width = 481
      Height = 21
      TabOrder = 0
      OnDblClick = BtnAbrirServClick
    end
    object BtnAbrirServ: TButton
      Left = 519
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 1
      OnClick = BtnAbrirServClick
    end
    object BtnImportarServ: TButton
      Left = 600
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 2
      OnClick = BtnImportarServClick
    end
    object edtRemuneracao: TEdit
      Left = 32
      Top = 89
      Width = 481
      Height = 21
      TabOrder = 3
      OnDblClick = btnAbrRemuneracaoClick
    end
    object btnAbrRemuneracao: TButton
      Left = 519
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 4
      OnClick = btnAbrRemuneracaoClick
    end
    object btnImpRemuneracao: TButton
      Left = 600
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 5
      OnClick = btnImpRemuneracaoClick
    end
    object edtObservacoes: TEdit
      Left = 32
      Top = 135
      Width = 481
      Height = 21
      TabOrder = 6
      OnDblClick = btnAbrObservacoesClick
    end
    object edtHonorarios: TEdit
      Left = 32
      Top = 181
      Width = 481
      Height = 21
      TabOrder = 7
      OnDblClick = btnImpHonorariosClick
    end
    object btnAbrObservacoes: TButton
      Left = 519
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 8
      OnClick = btnAbrObservacoesClick
    end
    object btnAbrHonorarios: TButton
      Left = 519
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 9
      OnClick = btnAbrHonorariosClick
    end
    object btnImpObservacoes: TButton
      Left = 600
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 10
      OnClick = btnImpObservacoesClick
    end
    object btnImpHonorarios: TButton
      Left = 603
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 11
      OnClick = btnImpHonorariosClick
    end
  end
  object fllstAux: TFileListBox
    Left = 768
    Top = 200
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object btn1: TButton
    Left = 768
    Top = 303
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 4
    OnClick = btn1Click
  end
  object btnSalvarPath: TButton
    Left = 432
    Top = 535
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btnSalvarPathClick
  end
  object btnImport: TButton
    Left = 513
    Top = 535
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 6
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'PostgreSQLUfpb'
    DriverName = 'Odbc'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Odbc'
      'DriverUnit=Data.DBXOdbc'
      'DriverPackageLoader=TDBXOdbcDriverLoader,DBXOdbcDriver190.bpl'
      
        'MetaDataPackageLoader=TDBXOdbcMetaDataCommandFactory,DbxOdbcDriv' +
        'er190.bpl'
      'IsolationLevel=ReadCommitted'
      'RowSetSize=20'
      
        'DriverAssemblyLoader=Borland.Data.TDBXOdbcDriverLoader,Borland.D' +
        'ata.DbxOdbcDriver,Version=19.0.0.0,Culture=neutral,PublicKeyToke' +
        'n=91d62ebb5b0d1b1b'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXOdbcMetaDataCommandFacto' +
        'ry,Borland.Data.DbxOdbcDriver,Version=19.0.0.0,Culture=neutral,P' +
        'ublicKeyToken=91d62ebb5b0d1b1b'
      'Database=PostgreSQLUfpb'
      'User_Name=postgres'
      'Password=admin')
    Connected = True
    Left = 680
    Top = 8
  end
  object SQLTable1: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'UND_UFPB'
    Left = 776
    Top = 448
    object SQLTable1id: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLTable1descricao: TWideStringField
      FieldName = 'descricao'
      Size = 50
    end
    object SQLTable1codigo_siaf: TFMTBCDField
      FieldName = 'codigo_siaf'
      Precision = 10
      Size = 0
    end
    object SQLTable1sigla: TWideStringField
      FieldName = 'sigla'
      Size = 10
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLTable1
    Left = 808
    Top = 448
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 840
    Top = 448
    object ClientDataSet1id: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object ClientDataSet1descricao: TWideStringField
      FieldName = 'descricao'
      Size = 50
    end
    object ClientDataSet1codigo_siaf: TFMTBCDField
      FieldName = 'codigo_siaf'
      Precision = 10
      Size = 0
    end
    object ClientDataSet1sigla: TWideStringField
      FieldName = 'sigla'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 872
    Top = 448
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from "UND_UFPB"'
      'where sigla = '#39'UFPB'#39)
    SQLConnection = SQLConnection1
    Left = 776
    Top = 504
    object SQLQuery1id: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQLQuery1descricao: TWideStringField
      FieldName = 'descricao'
      Size = 50
    end
    object SQLQuery1codigo_siaf: TFMTBCDField
      FieldName = 'codigo_siaf'
      Precision = 10
      Size = 0
    end
    object SQLQuery1sigla: TWideStringField
      FieldName = 'sigla'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 872
    Top = 504
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery1
    ResolveToDataSet = True
    Options = [poReadOnly, poUseQuoteChar]
    Left = 808
    Top = 504
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 840
    Top = 504
  end
  object OpenDialog1: TOpenDialog
    Left = 544
    Top = 48
  end
  object sqlqryIns: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 592
    Top = 48
  end
end
