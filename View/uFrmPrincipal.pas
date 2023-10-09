unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ActnCtrls,
  Vcl.ActnMan, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.CustomizeDlg, Vcl.ActnColorMaps, Vcl.Imaging.GIFImg, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    Acoes: TActionManager;
    ActionMainMenuBar1: TActionMainMenuBar;
    Imagens: TImageList;
    ac_Cadastro_cliente: TAction;
    ac_Cadastro_produto: TAction;
    ac_Cadastro_usuario: TAction;
    ac_Cadastro_sair: TAction;
    ac_Ajuda_help: TAction;
    ac_Ajuda_sobre: TAction;
    ac_Consulta_movdiario: TAction;
    ac_Vendas_PDV: TAction;
    ac_Relatorios_listadeclientes: TAction;
    ac_Relatorios_vendaspordia: TAction;
    ac_Utilitarios_blocodenotas: TAction;
    ac_Utilitarios_calculadora: TAction;
    ac_Utilitarios_calendario: TAction;
    ac_Utilitarios_internet: TAction;
    ac_Seguranca_logoff: TAction;
    ac_Seguranca_perfil: TAction;
    BarraPadrao: TActionToolBar;
    PopupMenu1: TPopupMenu;
    CustomizeDlg1: TCustomizeDlg;
    Personalizar1: TMenuItem;
    XPColorMap1: TXPColorMap;
    procedure Personalizar1Click(Sender: TObject);
    procedure ac_Cadastro_clienteExecute(Sender: TObject);
    procedure ac_Cadastro_produtoExecute(Sender: TObject);
    procedure ac_Seguranca_perfilExecute(Sender: TObject);
    procedure ac_Cadastro_usuarioExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uFrmCliente, uFrmProduto, uFrmPerfil, uFrmUsuario, uFrmLogin;

procedure TFrmPrincipal.ac_Cadastro_clienteExecute(Sender: TObject);
begin
 FrmCliente := TFrmCliente.Create(Self);
 FrmCliente.ShowModal;
 FreeAndNil(FrmCliente);
end;

procedure TFrmPrincipal.ac_Cadastro_produtoExecute(Sender: TObject);
begin
 FrmProduto := TFrmProduto.Create(Self);
 FrmProduto.ShowModal;
 FreeAndNil(FrmProduto);
end;

procedure TFrmPrincipal.ac_Cadastro_usuarioExecute(Sender: TObject);
begin
 FrmUsuario := TFrmUsuario.Create(Self);
 FrmUsuario.ShowModal;
 FreeAndNil(FrmUsuario);
end;

procedure TFrmPrincipal.ac_Seguranca_perfilExecute(Sender: TObject);
begin
 FrmPerfil := TFrmPerfil.Create(Self, Acoes);
 FrmPerfil.ShowModal;
 FreeAndNil(Self);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
 FrmLogin := TFrmLogin.Create(Self);
 if FrmLogin.ShowModal <> mrOk then
 begin
  MessageDlg('Você não se logou corretamente. A aplicação será encerrada!',TMsgDlgType.mtInformation,[mbOK],0);
  Application.Terminate;
 end
 else
  FreeAndNil(FrmLogin);
end;

procedure TFrmPrincipal.Personalizar1Click(Sender: TObject);
begin
 CustomizeDlg1.Show;
end;

end.
