object DmCliente: TDmCliente
  OldCreateOrder = False
  Height = 492
  Width = 642
  object sqlExcluir: TSQLDataSet
    CommandText = 'delete from cliente'#13#10'where (id = :id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 328
    Top = 24
  end
  object sqlPesquisar: TSQLDataSet
    CommandText = 'select id, nome, telefone from cliente'#13#10'where (nome like :nome)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 40
    Top = 24
  end
  object sqlInserir: TSQLDataSet
    CommandText = 
      'insert into cliente (id, nome, tipo, documento, telefone)'#13#10'value' +
      's (:id, :nome, :tipo, :documento, :telefone)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'documento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefone'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 136
    Top = 24
  end
  object sqlAlterar: TSQLDataSet
    CommandText = 
      'update cliente'#13#10' set nome = :nome,'#13#10' tipo = :tipo,'#13#10' documento =' +
      ' :documento,'#13#10' telefone = :telefone'#13#10' where (id = :id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'documento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefone'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 232
    Top = 24
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 40
    Top = 128
  end
  object cdsPesquisar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 40
    Top = 216
    object cdsPesquisarID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 10
    end
  end
end
