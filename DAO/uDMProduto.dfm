object dmProdutos: TdmProdutos
  Height = 467
  Width = 572
  object fdqryPesquisar: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      
        'SELECT COD_PRODUTO, DESCRICAO, PRECOVENDA, IMAGEM1, IMAGEM2, IMA' +
        'GEM3'
      '  FROM wktechnology.PRODUTOS'
      ' WHERE DESCRICAO LIKE (:DESCRICAO)')
    Left = 90
    Top = 136
    ParamData = <
      item
        Position = 1
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
        Value = '%%'
      end>
    ProviderName = 'dspPesquisar'
    Left = 88
    Top = 272
    object cdsPesquisarCOD_PRODUTO: TAutoIncField
      FieldName = 'COD_PRODUTO'
      ReadOnly = True
    end
    object cdsPesquisarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsPesquisarPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      Precision = 19
      Size = 2
    end
    object cdsPesquisarIMAGEM1: TStringField
      FieldName = 'IMAGEM1'
      Size = 250
    end
    object cdsPesquisarIMAGEM2: TStringField
      FieldName = 'IMAGEM2'
      Size = 250
    end
    object cdsPesquisarIMAGEM3: TStringField
      FieldName = 'IMAGEM3'
      Size = 250
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = fdqryPesquisar
    Left = 89
    Top = 205
  end
  object fdqryInserir: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      
        'INSERT INTO wktechnology.PRODUTOS (DESCRICAO, PRECOVENDA, IMAGEM' +
        '1, IMAGEM2, IMAGEM3)  '
      ' VALUES (:DESCRICAO, :PRECOVENDA, :IMAGEM1, :IMAGEM2, :IMAGEM3)')
    Left = 194
    Top = 136
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRECOVENDA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IMAGEM1'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = Null
      end
      item
        Name = 'IMAGEM2'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = Null
      end
      item
        Name = 'IMAGEM3'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = Null
      end>
  end
  object fdqryAlterar: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      'UPDATE PRODUTOS'
      '   SET DESCRICAO   ='#9':DESCRICAO,'
      '       PRECOVENDA  ='#9':PRECOVENDA,'
      '       IMAGEM1'#9'   ='#9':IMAGEM1,'
      '       IMAGEM2'#9'   ='#9':IMAGEM2,'
      '       IMAGEM3'#9'   ='#9':IMAGEM3'
      ' WHERE COD_PRODUTO    = :COD_PRODUTO')
    Left = 282
    Top = 136
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'PRECOVENDA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IMAGEM1'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = ''
      end
      item
        Name = 'IMAGEM2'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = ''
      end
      item
        Name = 'IMAGEM3'
        DataType = ftString
        ParamType = ptInput
        Size = 250
        Value = ''
      end
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqryExcluir: TFDQuery
    Connection = dmConexao.con1
    SQL.Strings = (
      
        'DELETE FROM wktechnology.produtos WHERE COD_PRODUTO = :COD_PRODU' +
        'TO')
    Left = 370
    Top = 136
    ParamData = <
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
