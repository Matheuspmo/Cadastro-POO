unit uUsuario;

interface

uses
  Vcl.ActnList, DBXCommon;

type
 TUsuario = class
 private
    FID: Integer;
    FSenha: String;
    FLogin: String;
    FNome: String;
    FPerfilID: Integer;
  { private declarations }
 protected
  { protected declarations }
  function LoadProfile: Boolean;
 public
  { public declarations }
  function Login(AUsuario, ASenha: String; Acoes: TCustomActionList): Boolean;
  function GetPerfilName: String;
  function GetPerfilDescription: String;
  function ChangePassword(strOldPassword, strNewPassword: String): Boolean;
 published
  { published declarations }
  property ID: Integer read FID;
  property Nome: String read FNome;
  property Usuario: String read FLogin;
  property Senha: String read FSenha;
  property PerfilID: Integer read FPerfilID;
 end;

implementation

uses
  System.SysUtils;

{ TUsuario }

{ TUsuario }

function TUsuario.ChangePassword(strOldPassword,
  strNewPassword: String): Boolean;
begin

end;

function TUsuario.GetPerfilDescription: String;
begin

end;

function TUsuario.GetPerfilName: String;
begin

end;

function TUsuario.LoadProfile: Boolean;
begin

end;

function TUsuario.Login(AUsuario, ASenha: String;
  Acoes: TCustomActionList): Boolean;
var
 DBCon: TDBXConnection;
 Command: TDBXCommand;
 Reader: TDBXReader;
begin
 DBcon := TDBXConnectionFactory.GetConnectionFactory.GetConnection('DbvendasConnection','SYSDBA','masterkey');
 Command  := DbCon.CreateCommand;
 Command.Text := 'SELECT * FROM USUARIOS WHERE LOGIN = ' + QuotedStr(AUsuario) +
                                         ' AND SENHA = ' + QuotedStr(ASenha);
 Reader := Command.ExecuteQuery;
end;

end.
