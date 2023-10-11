program Comercial;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {FrmPrincipal},
  uDM in 'Modules\uDM.pas' {DM: TDataModule},
  uFrmModelo in 'View\uFrmModelo.pas' {FrmModelo},
  uFrmCliente in 'View\uFrmCliente.pas' {FrmCliente},
  uFrmProduto in 'View\uFrmProduto.pas' {FrmProduto},
  uFrmUsuario in 'View\uFrmUsuario.pas' {FrmUsuario},
  uFrmPerfil in 'View\uFrmPerfil.pas' {FrmPerfil},
  uUsuario in 'Model\uUsuario.pas',
  uFrmLogin in 'View\uFrmLogin.pas' {FrmLogin},
  uFrmChangePassword in 'View\uFrmChangePassword.pas' {FrmChangePassaword};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema Comercial';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmChangePassaword, FrmChangePassaword);
  Application.Run;
end.
