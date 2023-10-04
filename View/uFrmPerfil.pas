unit uFrmPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmModelo, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, uDM,
  Vcl.Mask, Vcl.DBCtrls;

type
  TTipoPermissao = (tpCheck, tpUncheck, tpInvert);

  TFrmPerfil = class(TFrmModelo)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBGrid2: TDBGrid;
    DsDetail: TDataSource;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    FAcoes: TCustomActionList;
    procedure LoadDefault;
    procedure ChangePermissao (TipoPermissao: TTipoPermissao);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ActionList: TCustomActionList); reintroduce;
  end;

var
  FrmPerfil: TFrmPerfil;

implementation

uses
  Datasnap.DBClient;

{$R *.dfm}

{ TFrmPerfil }

procedure TFrmPerfil.ChangePermissao(TipoPermissao: TTipoPermissao);
begin
 with DsDetail.DataSet do
 begin
  if not IsEmpty then
  begin
   First;
   DisableControls;
   while not Eof do
   begin
    Edit;
    case tipopermissao of
     tpCheck: FieldByName('PERMISSAO').AsString := 'V';
     tpUncheck: FieldByName('PERMISSAO').AsString := 'f';
     tpInvert: if FieldByName('PERMISSAO').AsString = 'V' then
                  FieldByName('PERMISSAO').AsString := 'F'
               else
                  FieldByName('PERMISSAO').AsString := 'V';
    end;
    Post;
    Next;
   end;
   EnableControls;
  end;
 end;
end;

constructor TFrmPerfil.Create(AOwner: TComponent; ActionList: TCustomActionList);
begin
  inherited Create(AOwner);
  FAcoes := ActionList;
end;

procedure TFrmPerfil.LoadDefault;
var
  I: Integer;
begin
 TClientDataSet(DsDetail.DataSet).EmptyDataSet;
 for I := 0 to Pred(FAcoes.ActionCount) do
 begin
  with DsDetail.DataSet do
  begin
   Append;
   FieldByName('NAME').AsString := TAction(FAcoes.Actions[I]).Name;
   FieldByName('CAPTION').AsString := TAction(FAcoes.Actions[I]).Caption;
   FieldByName('PERMISSAO').AsString := 'F';
   Post;
  end;
 end;

end;

procedure TFrmPerfil.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ChangePermissao(tpCheck);
end;

procedure TFrmPerfil.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ChangePermissao(tpUncheck);
end;

procedure TFrmPerfil.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   ChangePermissao(tpInvert);
end;

procedure TFrmPerfil.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  LoadDefault;
end;

end.
