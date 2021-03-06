object DMPedido: TDMPedido
  OldCreateOrder = False
  Height = 576
  Width = 911
  object QPedido: TFDQuery
    AfterScroll = QPedidoAfterScroll
    CachedUpdates = True
    Connection = DMCon.FDConnect
    UpdateOptions.AssignedValues = [uvLockMode, uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'wk.pedido'
    SQL.Strings = (
      'select *'
      
        ', (select c.NOME_CLIENTE from cliente c where c.ID_CLIENTE = p.I' +
        'D_CLIENTE) as NOME_CLIENTE'
      'from pedido p')
    Left = 24
    Top = 8
    object QPedidoID_PEDIDO: TFDAutoIncField
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPedidoID_CLIENTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object QPedidoPEDIDO_VALOR: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PEDIDO_VALOR'
      Origin = 'PEDIDO_VALOR'
    end
    object QPedidoDATA_EMISSAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object QPedidoNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object DSPedido: TDataSource
    DataSet = QPedido
    Left = 24
    Top = 64
  end
  object QPedidoItem: TFDQuery
    CachedUpdates = True
    Connection = DMCon.FDConnect
    UpdateOptions.AssignedValues = [uvLockMode]
    SQL.Strings = (
      'select *'
      
        ', (select p.DESCRICAO from produto p where p.ID_PRODUTO = pi.COD' +
        '_PRODUTO) DESCRICAO'
      'from pedido_item pi'
      'where pi.ID_PEDIDO = :pedido')
    Left = 112
    Top = 8
    ParamData = <
      item
        Name = 'PEDIDO'
        ParamType = ptInput
        Value = Null
      end>
    object QPedidoItemITEM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPedidoItemID_PEDIDO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPedidoItemCOD_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
    end
    object QPedidoItemQUANTIDADE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QPedidoItemVALOR_UNITARIO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
    end
    object QPedidoItemVALOR_TOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object QPedidoItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DSPedidoItem: TDataSource
    DataSet = QPedidoItem
    Left = 112
    Top = 64
  end
  object QPedidoTotais: TFDQuery
    CachedUpdates = True
    Connection = DMCon.FDConnect
    SQL.Strings = (
      'select sum(pi.VALOR_TOTAL) TOTAL'
      'from pedido_item pi'
      'where pi.ID_PEDIDO = :pedido')
    Left = 24
    Top = 120
    ParamData = <
      item
        Name = 'PEDIDO'
        ParamType = ptInput
        Value = Null
      end>
    object QPedidoTotaisTOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSQPedidoTotais: TDataSource
    DataSet = QPedidoTotais
    Left = 24
    Top = 168
  end
end
