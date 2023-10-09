object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Tela de Login'
  ClientHeight = 197
  ClientWidth = 180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 25
    Top = 24
    Width = 40
    Height = 15
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 25
    Top = 74
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object EdtUsuario: TEdit
    Left = 25
    Top = 45
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object EdtSenha: TEdit
    Left = 25
    Top = 95
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnLogin: TBitBtn
    Left = 0
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BtnLoginClick
  end
  object BtnCancelar: TBitBtn
    Left = 96
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    NumGlyphs = 2
    TabOrder = 3
  end
end
