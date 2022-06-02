object DMCadastro: TDMCadastro
  OldCreateOrder = False
  Height = 370
  Width = 534
  object QProduto: TFDQuery
    Connection = DMCon.FDConnect
    SQL.Strings = (
      'select * '
      'from produto p'
      'where p.ID_PRODUTO = :id_produto')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    object QProdutoID_PRODUTO: TFDAutoIncField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QProdutoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object QProdutoPR_VENDA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
    end
  end
  object QCliente: TFDQuery
    Connection = DMCon.FDConnect
    SQL.Strings = (
      'select * '
      'from cliente c'
      'where c.ID_CLIENTE = :id')
    Left = 144
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QClienteID_CLIENTE: TFDAutoIncField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QClienteNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 255
    end
    object QClienteCIDADE_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE_CLIENTE'
      Origin = 'CIDADE_CLIENTE'
      Size = 50
    end
    object QClienteUF_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF_CLIENTE'
      Origin = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
  end
end
