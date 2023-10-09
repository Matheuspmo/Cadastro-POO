unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnLogin: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure BtnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses uUsuario, uFrmPrincipal;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);
begin
 if TUsuario.GetInstance.Login(EdtUsuario.Text, EdtSenha.Text, FrmPrincipal.Acoes) then
 begin
  ModalResult := mrOk;
 end
 else
  MessageDlg('Usuário ou senha inválidos. Por favor tente novamente!',TMsgDlgType.mtWarning,[mbOK],0);
end;

end.
