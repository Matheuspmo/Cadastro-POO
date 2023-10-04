object DM: TDM
  OnCreate = DataModuleCreate
  Height = 693
  Width = 780
  object dspCliente: TDataSetProvider
    DataSet = sdsCliente
    Left = 400
    Top = 48
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspCliente'
    Left = 496
    Top = 48
    object cdsClienteCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Required = True
    end
    object cdsClienteNOME: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME'
      Size = 75
    end
    object cdsClienteENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 75
    end
    object cdsClienteBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
    end
    object cdsClienteCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsClienteEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 75
    end
    object cdsClienteTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      EditMask = '!\(999\)00000-0000;1;_'
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 496
    Top = 128
    object cdsProdutoPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Required = True
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 75
    end
    object cdsProdutoESTOQUE: TSingleField
      FieldName = 'ESTOQUE'
    end
    object cdsProdutoPRECO: TSingleField
      FieldName = 'PRECO'
      currency = True
    end
    object cdsProdutoFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
      Required = True
    end
    object cdsProdutoCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Required = True
    end
    object cdsProdutoDATAINCLUSAO: TSQLTimeStampField
      FieldName = 'DATAINCLUSAO'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 400
    Top = 128
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 496
    Top = 208
    object cdsUsuarioUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Required = True
    end
    object cdsUsuarioPERFILID: TIntegerField
      FieldName = 'PERFILID'
    end
    object cdsUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 75
    end
    object cdsUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 75
    end
    object cdsUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object cdsUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object cdsUsuarioVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      FixedChar = True
      Size = 1
    end
    object cdsUsuarioMASTER: TStringField
      FieldName = 'MASTER'
      FixedChar = True
      Size = 1
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sdsUsuario
    Left = 400
    Top = 208
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfil'
    Left = 296
    Top = 320
    object cdsPerfilNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsPerfilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 75
    end
    object cdsPerfilPERFILID: TIntegerField
      FieldName = 'PERFILID'
      Required = True
    end
    object cdsPerfildsdPerfilConf: TDataSetField
      FieldName = 'dsdPerfilConf'
    end
  end
  object dspPerfil: TDataSetProvider
    DataSet = sdsPerfil
    Left = 200
    Top = 320
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    MasterSource = DsVenda_Itens
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspVendas'
    Left = 688
    Top = 320
    object cdsVendasVENDAID: TIntegerField
      FieldName = 'VENDAID'
      Required = True
    end
    object cdsVendasCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Required = True
    end
    object cdsVendasUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Required = True
    end
    object cdsVendasDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsVendassdsItens: TDataSetField
      FieldName = 'sdsItens'
    end
  end
  object dspVendas: TDataSetProvider
    DataSet = sdsVendas
    Left = 592
    Top = 320
  end
  object DbvendasConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=DBVendas')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 46
  end
  object sdsCliente: TFDQuery
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 304
    Top = 48
  end
  object sdsProduto: TFDQuery
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 304
    Top = 128
  end
  object sdsUsuario: TFDQuery
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 304
    Top = 208
  end
  object sdsPerfil: TFDQuery
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM PERFIL')
    Left = 104
    Top = 320
  end
  object sdsVendas: TFDQuery
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM VENDAS')
    Left = 496
    Top = 320
  end
  object dsdPerfilConf: TFDQuery
    Active = True
    MasterSource = DsPerfil_PerfilConf
    Connection = DbvendasConnection
    SQL.Strings = (
      'SELECT * FROM PERFIL_CONF WHERE PERFILID = :PERFIL_ID')
    Left = 104
    Top = 408
    ParamData = <
      item
        Name = 'PERFIL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DsPerfil_PerfilConf: TDataSource
    DataSet = sdsPerfil
    Left = 40
    Top = 368
  end
  object cdsPerfilConf: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPerfildsdPerfilConf
    Params = <>
    Left = 296
    Top = 408
  end
  object sdsItens: TFDQuery
    Active = True
    MasterSource = DsVenda_Itens
    MasterFields = 'VENDAID'
    DetailFields = 'VENDAID'
    Connection = DbvendasConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM VENDAITEM WHERE VENDAID = :VENDAID')
    Left = 496
    Top = 408
    ParamData = <
      item
        Name = 'VENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 17
      end>
  end
  object DsVenda_Itens: TDataSource
    DataSet = sdsVendas
    Left = 432
    Top = 376
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsVendassdsItens
    Params = <>
    Left = 688
    Top = 408
  end
end
