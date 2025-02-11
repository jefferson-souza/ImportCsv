object FrmImportCsv: TFrmImportCsv
  Left = 0
  Top = 312
  Caption = 'Importador de Arquivos CSV - Portal da Transpar'#234'ncia'
  ClientHeight = 537
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gauProgresso: TGauge
    Left = 433
    Top = 47
    Width = 297
    Height = 14
    Progress = 0
  end
  object txtTitulo: TStaticText
    Left = 22
    Top = 24
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
  object btnSalvarPath: TButton
    Left = 409
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarPathClick
  end
  object btnImport: TButton
    Left = 490
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 2
    OnClick = btnImportClick
  end
  object pgc1: TPageControl
    Left = 22
    Top = 61
    Width = 712
    Height = 428
    ActivePage = ts3
    TabOrder = 3
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
        Height = 302
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
        Top = 372
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
      object dbcbbtabela_destino: TDBComboBox
        Left = 543
        Top = 35
        Width = 122
        Height = 21
        DataField = 'tabela_destino'
        DataSource = dsCaminho
        TabOrder = 4
      end
    end
    object tsArqImportados: TTabSheet
      Caption = 'Arq. Importados'
      ImageIndex = 4
      object dbgrdArqImportados: TDBGrid
        Left = 24
        Top = 26
        Width = 641
        Height = 359
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
            Width = 52
            Visible = True
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
    Left = 575
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 4
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 659
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Para Tray'
    TabOrder = 5
  end
  object txtQtdArqImportando: TStaticText
    Left = 433
    Top = 24
    Width = 297
    Height = 23
    Alignment = taRightJustify
    AutoSize = False
    Caption = '|||'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
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
    Left = 456
    Top = 72
  end
  object dtstprvdrCaminho: TDataSetProvider
    DataSet = sqldtstCaminho
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poUseQuoteChar]
    Left = 56
    Top = 464
  end
  object dsCaminho: TDataSource
    DataSet = CdsCaminho
    Left = 120
    Top = 464
  end
  object dsArqImportados: TDataSource
    DataSet = CdsArqImportados
    Left = 120
    Top = 504
  end
  object dtstprvdrArqImportados: TDataSetProvider
    DataSet = sqldtstArqImportados
    ResolveToDataSet = True
    Options = [poReadOnly, poUseQuoteChar]
    Left = 56
    Top = 504
  end
  object CdsArqImportados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprvdrArqImportados'
    Left = 88
    Top = 504
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
    Left = 392
    Top = 72
  end
  object sqlqryIns: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 528
    Top = 72
  end
  object CdsCaminho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprvdrCaminho'
    AfterInsert = CdsCaminhoAfterInsert
    AfterPost = CdsCaminhoAfterPost
    Left = 88
    Top = 464
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
    Left = 24
    Top = 464
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
    Left = 24
    Top = 504
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
  object tmrDispImport: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrDispImportTimer
    Left = 312
    Top = 72
  end
  object sqlqryCaminhos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from caminho_arquivos where ativado = '#39'T'#39)
    SQLConnection = SQLConnection1
    Left = 592
    Top = 72
    object sqlqryCaminhosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlqryCaminhoscaminho: TWideStringField
      FieldName = 'caminho'
      Size = 200
    end
    object sqlqryCaminhosativado: TWideStringField
      FieldName = 'ativado'
      FixedChar = True
      Size = 1
    end
    object sqlqryCaminhostabela_destino: TWideStringField
      FieldName = 'tabela_destino'
      Size = 200
    end
  end
end
