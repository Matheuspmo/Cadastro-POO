inherited FrmCliente: TFrmCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 532
  ExplicitWidth = 830
  ExplicitHeight = 590
  TextHeight = 15
  inherited ToolBar1: TToolBar
    ExplicitWidth = 814
  end
  inherited PageControl1: TPageControl
    Height = 483
    ActivePage = tbCadastro
    ExplicitWidth = 814
    ExplicitHeight = 482
    inherited tbCadastro: TTabSheet
      ExplicitHeight = 473
      object Label4: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 15
        Caption = 'NOME'
        FocusControl = DBEdit1
      end
      object Label5: TLabel
        Left = 3
        Top = 51
        Width = 59
        Height = 15
        Caption = 'ENDERECO'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 3
        Top = 99
        Width = 41
        Height = 15
        Caption = 'BAIRRO'
        FocusControl = DBEdit3
      end
      object Label7: TLabel
        Left = 3
        Top = 147
        Width = 41
        Height = 15
        Caption = 'CIDADE'
        FocusControl = DBEdit4
      end
      object Label8: TLabel
        Left = 3
        Top = 195
        Width = 21
        Height = 15
        Caption = 'CEP'
        FocusControl = DBEdit5
      end
      object Label9: TLabel
        Left = 3
        Top = 243
        Width = 14
        Height = 15
        Caption = 'UF'
        FocusControl = DBEdit6
      end
      object Label10: TLabel
        Left = 3
        Top = 291
        Width = 34
        Height = 15
        Caption = 'EMAIL'
        FocusControl = DBEdit7
      end
      object Label11: TLabel
        Left = 0
        Top = 339
        Width = 54
        Height = 15
        Caption = 'TELEFONE'
        FocusControl = DBEdit8
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 19
        Width = 300
        Height = 23
        DataField = 'NOME'
        DataSource = Ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 70
        Width = 350
        Height = 23
        DataField = 'ENDERECO'
        DataSource = Ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 115
        Width = 180
        Height = 23
        DataField = 'BAIRRO'
        DataSource = Ds
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 163
        Width = 209
        Height = 23
        DataField = 'CIDADE'
        DataSource = Ds
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 211
        Width = 73
        Height = 23
        DataField = 'CEP'
        DataSource = Ds
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 3
        Top = 259
        Width = 34
        Height = 23
        DataField = 'UF'
        DataSource = Ds
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 3
        Top = 307
        Width = 300
        Height = 23
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = Ds
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 3
        Top = 355
        Width = 150
        Height = 23
        DataField = 'TELEFONE'
        DataSource = Ds
        TabOrder = 7
      end
    end
    inherited tbConsulta: TTabSheet
      ExplicitHeight = 473
      inherited DBGrid1: TDBGrid
        Height = 400
      end
    end
  end
  inherited Ds: TDataSource
    DataSet = DM.cdsCliente
    Top = 3
  end
end
