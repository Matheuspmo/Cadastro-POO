inherited FrmUsuario: TFrmUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientWidth = 818
  ExplicitWidth = 830
  TextHeight = 15
  inherited ToolBar1: TToolBar
    Width = 818
  end
  inherited PageControl1: TPageControl
    Width = 818
    ActivePage = tbCadastro
    inherited tbCadastro: TTabSheet
      ExplicitWidth = 810
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
        Width = 34
        Height = 15
        Caption = 'EMAIL'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 3
        Top = 99
        Width = 35
        Height = 15
        Caption = 'LOGIN'
        FocusControl = DBEdit3
      end
      object Label7: TLabel
        Left = 3
        Top = 147
        Width = 38
        Height = 15
        Caption = 'SENHA'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 19
        Width = 400
        Height = 23
        DataField = 'NOME'
        DataSource = Ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 67
        Width = 350
        Height = 23
        DataField = 'EMAIL'
        DataSource = Ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 115
        Width = 154
        Height = 23
        DataField = 'LOGIN'
        DataSource = Ds
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 163
        Width = 154
        Height = 23
        DataField = 'SENHA'
        DataSource = Ds
        TabOrder = 3
      end
      object DBCheckBox1: TDBCheckBox
        Left = 3
        Top = 208
        Width = 97
        Height = 17
        Caption = 'Vendedor'
        DataField = 'VENDEDOR'
        DataSource = Ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited tbConsulta: TTabSheet
      ExplicitWidth = 810
      inherited Panel1: TPanel
        Width = 810
      end
      inherited DBGrid1: TDBGrid
        Width = 810
      end
    end
  end
  inherited Ds: TDataSource
    DataSet = DM.cdsUsuario
  end
end
