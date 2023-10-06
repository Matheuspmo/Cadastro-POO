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
    FLogado: Boolean;
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
  System.SysUtils, Vcl.Dialogs;

{ TUsuario }

{ TUsuario }

function TUsuario.ChangePassword(strOldPassword,
  strNewPassword: String): Boolean;
var
 DBCon:   TDBXConnection;
 Command: TDBXCommand;
 T: TDBXTransaction;
begin
 if FLogado then
 begin
  if FSenha = strOldPassword then
  begin
   try
    DBcon        := TDBXConnectionFactory.GetConnectionFactory.GetConnection('DbvendasConnection','SYSDBA','masterkey');
    T := DBCon.BeginTransaction;
    Command      := DbCon.CreateCommand;
    Command.Text := 'UPDATE USUARIOS SET SENHA = ' + QuotedStr(strNewPassword) +
                             ' WHERE USUARIOID = ' + IntToStr(FID);
    Command.ExecuteUpdate;
    DBCon.CommitFreeAndNil(T);
    Result := True;
   except
    DBCon.RollbackFreeAndNil(T);
   end;
  end
  else
   MessageDlg('A senha antiga n�o confere',TMsgDlgType.mtInformation,[mbOK],0);
 end
 else
  MessageDlg('� necess�rio estar logado para invocar este m�todo',TMsgDlgType.mtWarning,[mbOK],0);
end;

function TUsuario.GetPerfilDescription: String;
var
 DBCon:   TDBXConnection;
 Command: TDBXCommand;
 Reader:  TDBXReader;
begin
 if FLogado then
 begin
  DBcon        := TDBXConnectionFactory.GetConnectionFactory.GetConnection('DbvendasConnection','SYSDBA','masterkey');
  Command      := DbCon.CreateCommand;
  Command.Text := 'SELECT DESCRICAO FROM PERFIL WHERE PERFILID = ' + IntToStr(FPerfilID);
  Reader := Command.ExecuteQuery;
  if Reader.Next then
   Result := Reader.Value[0].GetAnsiString;
 end
 else
  MessageDlg('� necess�rio estar logado para invocar este m�todo',TMsgDlgType.mtWarning,[mbOK],0);
end;

function TUsuario.GetPerfilName: String;
var
 DBCon:   TDBXConnection;
 Command: TDBXCommand;
 Reader:  TDBXReader;
begin
 if FLogado then
 begin
  DBcon        := TDBXConnectionFactory.GetConnectionFactory.GetConnection('DbvendasConnection','SYSDBA','masterkey');
  Command      := DbCon.CreateCommand;
  Command.Text := 'SELECT NOME FROM PERFIL WHERE PERFILID = ' + IntToStr(FPerfilID);
  Reader := Command.ExecuteQuery;
  if Reader.Next then
   Result := Reader.Value[0].GetAnsiString;
 end
 else
  MessageDlg('� necess�rio estar logado para invocar este m�todo',TMsgDlgType.mtWarning,[mbOK],0);
end;

function TUsuario.LoadProfile: Boolean;
begin

end;

function TUsuario.Login(AUsuario, ASenha: String;
  Acoes: TCustomActionList): Boolean;
var
 DBCon:   TDBXConnection;
 Command: TDBXCommand;
 Reader:  TDBXReader;
begin
 DBcon        := TDBXConnectionFactory.GetConnectionFactory.GetConnection('DbvendasConnection','SYSDBA','masterkey');
 Command      := DbCon.CreateCommand;
 Command.Text := 'SELECT * FROM USUARIOS WHERE LOGIN = ' + QuotedStr(AUsuario) +
                                         ' AND SENHA = ' + QuotedStr(ASenha);
 Reader := Command.ExecuteQuery;
 if Reader.Next then
  begin
   FID       := Reader.Value[0].GetInt32;
   FPerfilID := Reader.Value[1].GetInt32;
   FNome     := Reader.Value[2].GetAnsiString;
   FLogin    := Reader.Value[3].GetAnsiString;
   FSenha    := Reader.Value[4].GetAnsiString;
   FLogado   := True;
   Result    := True;
  end;
end;

end.
