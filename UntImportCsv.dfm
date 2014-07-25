object FrmImportCsv: TFrmImportCsv
  Left = 0
  Top = 0
  Caption = 'Importador de Arquivos CSV - Portal da Transpar'#234'ncia'
  ClientHeight = 430
  ClientWidth = 926
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
    TabOrder = 0
  end
  object fllstAux: TFileListBox
    Left = 768
    Top = 200
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 1
  end
  object btn1: TButton
    Left = 768
    Top = 303
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btnSalvarPath: TButton
    Left = 393
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarPathClick
  end
  object btnImport: TButton
    Left = 476
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 4
  end
  object pgc1: TPageControl
    Left = 25
    Top = 61
    Width = 712
    Height = 300
    ActivePage = tsDespesas
    TabOrder = 5
    object tsDespesas: TTabSheet
      Caption = 'Despesas'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object grp1: TGroupBox
        Left = 12
        Top = 26
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
        object lbl7: TLabel
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
    end
    object tsServidores: TTabSheet
      Caption = 'Servidores'
      ImageIndex = 1
      ExplicitWidth = 709
      ExplicitHeight = 273
      object grp2: TGroupBox
        Left = 12
        Top = 26
        Width = 681
        Height = 217
        Caption = 'Dados Servidores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lbl8: TLabel
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
          OnDblClick = btnBtnAbrirServClick
        end
        object btnBtnAbrirServ: TButton
          Left = 519
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Abrir'
          TabOrder = 1
          OnClick = btnBtnAbrirServClick
        end
        object btnBtnImportarServ: TButton
          Left = 600
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Importar'
          TabOrder = 2
          OnClick = btnBtnImportarServClick
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
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      ImageIndex = 3
    end
    object tsArqImportados: TTabSheet
      Caption = 'Arq. Importados'
      ImageIndex = 4
    end
  end
  object btn2: TButton
    Left = 559
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 6
  end
  object btn3: TButton
    Left = 643
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Para Tray'
    TabOrder = 7
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
    Top = 96
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
    Top = 96
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 840
    Top = 96
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
    Top = 96
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from "UND_UFPB"'
      'where sigla = '#39'UFPB'#39)
    SQLConnection = SQLConnection1
    Left = 776
    Top = 152
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
    Top = 152
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery1
    ResolveToDataSet = True
    Options = [poReadOnly, poUseQuoteChar]
    Left = 808
    Top = 152
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 840
    Top = 152
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
