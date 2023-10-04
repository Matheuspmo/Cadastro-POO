inherited FrmProduto: TFrmProduto
  Caption = 'Cadastro de Produto'
  TextHeight = 15
  inherited PageControl1: TPageControl
    ActivePage = tbCadastro
    inherited tbCadastro: TTabSheet
      object Label4: TLabel
        Left = 3
        Top = 3
        Width = 63
        Height = 15
        Caption = 'DESCRICAO'
        FocusControl = DBEdit1
      end
      object Label5: TLabel
        Left = 3
        Top = 51
        Width = 49
        Height = 15
        Caption = 'ESTOQUE'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 3
        Top = 99
        Width = 37
        Height = 15
        Caption = 'PRECO'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 19
        Width = 350
        Height = 23
        DataField = 'DESCRICAO'
        DataSource = Ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 67
        Width = 100
        Height = 23
        DataField = 'ESTOQUE'
        DataSource = Ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 115
        Width = 120
        Height = 23
        DataField = 'PRECO'
        DataSource = Ds
        TabOrder = 2
      end
    end
  end
  inherited Ds: TDataSource
    DataSet = DM.cdsProduto
    Top = 3
  end
end
