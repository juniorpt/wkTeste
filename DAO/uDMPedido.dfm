object dmPedido: TdmPedido
  Height = 568
  Width = 689
  object qryGeraPedido: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'SELECT COUNT(*) FROM pedidos_dados_gerais;')
    Left = 216
    Top = 104
    object qryGeraPedidoCOUNT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'COUNT(*)'
      Origin = '`COUNT(*)`'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryFechaPedido: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'INSERT INTO pedidos_dados_gerais('#10
      ' COD_PEDIDO,'#9#10'    '
      ' DATA_EMISSAO,'#10'    '
      ' COD_CLIENTE,'#10'    '
      ' VALOR_TOTAL'
      #10') VALUES (:COD_PEDIDO, Now(),:COD_CLIENTE,:VALOR_TOTAL)')
    Left = 217
    Top = 232
    ParamData = <
      item
        Name = 'COD_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryItemVenda: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'INSERT INTO pedidos_produtos('#10
      ' Cod_Pedido,'#10'    '
      ' Cod_Produto,'#10'    '
      ' Quantidade,'#10'    '
      ' Vlr_Unitario,'#10'    '
      ' Vlr_Total'
      
        ')VALUES (:Cod_Pedido, :Cod_Produto, :Quantidade, :Vlr_Unitario, ' +
        ':Vlr_Total)')
    Left = 369
    Top = 288
    ParamData = <
      item
        Name = 'COD_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLR_UNITARIO'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLR_TOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryProdutos: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'SELECT '
      '  PRODUTOS.Cod_Produto,'
      '  PRODUTOS.DESCRICAO,'
      '  PRODUTOS.PRECOVENDA  '
      'FROM'
      '  PRODUTOS'
      'WHERE'
      '  PRODUTOS.Cod_Produto = :cod')
    Left = 368
    Top = 80
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryClientes: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.Cod_Cliente,'
      '  CLIENTES.NOME,'
      '  CLIENTES.CIDADE,'
      '  CLIENTES.UF'
      'FROM'
      '  CLIENTES'
      'WHERE'
      '  CLIENTES.Cod_Cliente = :cod')
    Left = 368
    Top = 184
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqryPesquisar: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      
        'SELECT pdg.Cod_Pedido, cli.Nome, pdg.Data_Emissao, sum(pro.Vlr_T' +
        'otal) Vlr_Total'
      '  from pedidos_dados_gerais pdg'
      
        '  JOIN pedidos_produtos     pro ON pdg.Cod_Pedido  = pro.Cod_Ped' +
        'ido'
      
        '  JOIN clientes             cli ON pdg.Cod_Cliente = cli.COD_CLI' +
        'ENTE'
      ' WHERE pdg.Cod_Pedido LIKE :cod_pedido'
      ' GROUP BY cod_pedido')
    Left = 82
    Top = 80
    ParamData = <
      item
        Position = 1
        Name = 'cod_pedido'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'cod_pedido'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 64
    Top = 296
    object cdsPesquisarCod_Pedido: TIntegerField
      FieldName = 'Cod_Pedido'
      Required = True
    end
    object cdsPesquisarNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 255
    end
    object cdsPesquisarData_Emissao: TDateField
      FieldName = 'Data_Emissao'
    end
    object cdsPesquisarVlr_Total: TFMTBCDField
      FieldName = 'Vlr_Total'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = fdqryPesquisar
    Left = 65
    Top = 181
  end
end
