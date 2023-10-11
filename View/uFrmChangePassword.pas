unit uFrmChangePassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TFrmChangePassaword = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtSenhaAtual: TLabeledEdit;
    EdtNovaSenha: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChangePassaword: TFrmChangePassaword;

implementation

uses uUsuario;

{$R *.dfm}

procedure TFrmChangePassaword.BitBtn1Click(Sender: TObject);
begin
 if TUsuario.GetInstance.ChangePassword(EdtSenhaAtual.Text,
                                     EdtNovaSenha.Text) then
 begin
   MessageDlg('Senha Alterada com Sucesso !!!!', mtInformation, [mbOK], 0);
 end
 else
 begin
   MessageDlg('Não foi possível alterar a senha. Tente novamente mais tarde !!!!', mtError, [mbOK], 0);
 end;
 Close;
end;

procedure TFrmChangePassaword.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

end.
