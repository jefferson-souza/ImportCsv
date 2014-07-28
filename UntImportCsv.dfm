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
    Mask = '*.dll'
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
    ActivePage = tsArqImportados
    TabOrder = 5
    object tsDespesas: TTabSheet
      Caption = 'Despesas'
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
      Caption = 'Caminho dos Arquivos'
      ImageIndex = 2
      object lbl9: TLabel
        Left = 24
        Top = 16
        Width = 135
        Height = 13
        Caption = 'Caminho dos Arquivos  .CSV'
      end
      object lbl10: TLabel
        Left = 447
        Top = 16
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object lbl11: TLabel
        Left = 543
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Tabela:'
      end
      object dbgrd1: TDBGrid
        Left = 24
        Top = 64
        Width = 641
        Height = 174
        DataSource = dsCaminho
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            ReadOnly = True
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'caminho'
            Title.Caption = 'Caminho'
            Width = 365
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativado'
            PickList.Strings = (
              'T'
              'F')
            Title.Caption = 'Ativado'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tabela_destino'
            Title.Caption = 'Tabela Destino'
            Width = 119
            Visible = True
          end>
      end
      object dbnvgr1: TDBNavigator
        Left = 24
        Top = 244
        Width = 300
        Height = 25
        DataSource = dsCaminho
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
      object dbedtcaminho: TDBEdit
        Left = 24
        Top = 32
        Width = 415
        Height = 21
        DataField = 'caminho'
        DataSource = dsCaminho
        TabOrder = 2
        OnDblClick = dbedtcaminhoDblClick
      end
      object dbcbbativado: TDBComboBox
        Left = 447
        Top = 32
        Width = 90
        Height = 21
        DataField = 'ativado'
        DataSource = dsCaminho
        Items.Strings = (
          'T'
          'F')
        TabOrder = 3
      end
      object dbedttabela_destino: TDBEdit
        Left = 543
        Top = 32
        Width = 122
        Height = 21
        DataField = 'tabela_destino'
        DataSource = dsCaminho
        TabOrder = 4
      end
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      ImageIndex = 3
    end
    object tsArqImportados: TTabSheet
      Caption = 'Arq. Importados'
      ImageIndex = 4
      object dbgrdArqImportados: TDBGrid
        Left = 12
        Top = 26
        Width = 681
        Height = 217
        DataSource = dsArqImportados
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome do Arquivo'
            Width = 354
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_importacao'
            Title.Caption = 'Data da Importa'#231#227'o'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_registros'
            Title.Caption = 'Qtde Registros'
            Width = 85
            Visible = True
          end>
      end
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
  object dtstprvdrCaminho: TDataSetProvider
    DataSet = sqldtstCaminho
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poUseQuoteChar]
    Left = 808
    Top = 64
  end
  object dsCaminho: TDataSource
    DataSet = CdsCaminho
    Left = 872
    Top = 64
  end
  object dsArqImportados: TDataSource
    DataSet = CdsArqImportados
    Left = 872
    Top = 152
  end
  object dtstprvdrArqImportados: TDataSetProvider
    DataSet = sqldtstArqImportados
    ResolveToDataSet = True
    Options = [poReadOnly, poUseQuoteChar]
    Left = 808
    Top = 152
  end
  object CdsArqImportados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprvdrArqImportados'
    Left = 840
    Top = 152
    object intgrfldCdsArqImportadosid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
      ReadOnly = True
      Required = True
    end
    object wdstrngfldCdsArqImportadosnome: TWideStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 200
    end
    object CdsArqImportadosdata_importacao: TSQLTimeStampField
      FieldName = 'data_importacao'
      ReadOnly = True
    end
    object fmtbcdfldCdsArqImportadosqtde_registros: TFMTBCDField
      FieldName = 'qtde_registros'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object intgrfldCdsArqImportadoscaminho_arquivo_id: TIntegerField
      FieldName = 'caminho_arquivo_id'
      ReadOnly = True
    end
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
  object CdsCaminho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprvdrCaminho'
    AfterInsert = CdsCaminhoAfterInsert
    AfterPost = CdsCaminhoAfterPost
    Left = 840
    Top = 64
    object intgrfldCdsArqImportid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      KeyFields = 'id'
      Required = True
    end
    object wdstrngfldCdsArqImportcaminho: TWideStringField
      FieldName = 'caminho'
      Size = 200
    end
    object wdstrngfldCdsArqImportativado: TWideStringField
      FieldName = 'ativado'
      FixedChar = True
      Size = 1
    end
    object wdstrngfldCdsArqImporttabela_destino: TWideStringField
      FieldName = 'tabela_destino'
      Size = 200
    end
  end
  object sqldtstCaminho: TSQLDataSet
    SchemaName = 'postgres'
    CommandText = 'select * from "caminho_arquivos"  order by id limit 200'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 768
    Top = 64
    object intgrfldTeste1id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      KeyFields = 'id'
      Required = True
    end
    object wdstrngfldTeste1caminho: TWideStringField
      FieldName = 'caminho'
      Size = 200
    end
    object wdstrngfldTeste1ativado: TWideStringField
      FieldName = 'ativado'
      FixedChar = True
      Size = 1
    end
    object wdstrngfldTeste1tabela_destino: TWideStringField
      FieldName = 'tabela_destino'
      Size = 200
    end
  end
  object sqldtstArqImportados: TSQLDataSet
    SchemaName = 'postgres'
    CommandText = 
      'select * from "arquivos_importados"  order by  "data_importacao"' +
      ' limit 200'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 776
    Top = 152
    object intgrfldArqImportadosid: TIntegerField
      FieldName = 'id'
      KeyFields = 'caminho_arquivo_id'
      Required = True
    end
    object intgrfldArqImportadoscaminho_arquivo_id: TIntegerField
      FieldName = 'caminho_arquivo_id'
    end
    object wdstrngfldArqImportadosnome: TWideStringField
      FieldName = 'nome'
      Size = 200
    end
    object sqldtstArqImportadosdata_importacao: TSQLTimeStampField
      FieldName = 'data_importacao'
    end
    object fmtbcdfldArqImportadosqtde_registros: TFMTBCDField
      FieldName = 'qtde_registros'
      Precision = 10
      Size = 0
    end
  end
end
