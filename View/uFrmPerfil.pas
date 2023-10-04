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
    BtnCheck: TSpeedButton;
    BtnUncheck: TSpeedButton;
    BtnInvert: TSpeedButton;
    BtnDefault: TSpeedButton;
    imgpermissao: TImageList;
    procedure BtnCheckClick(Sender: TObject);
    procedure BtnUncheckClick(Sender: TObject);
    procedure BtnInvertClick(Sender: TObject);
    procedure BtnDefaultClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ac_SalvarUpdate(Sender: TObject);
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

procedure TFrmPerfil.ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  BtnDefault.Enabled := TAction(Sender).Enabled;
  BtnCheck.Enabled := TAction(Sender).Enabled;
  BtnUncheck.Enabled := TAction(Sender).Enabled;
  BtnInvert.Enabled := TAction(Sender).Enabled;
end;

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

procedure TFrmPerfil.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'PERMISSAO' then
  begin
   DsDetail.DataSet.Edit;
   if Column.Field.AsString = 'V' then
    Column.Field.AsString := 'F'
   else
    Column.Field.AsString := 'V';

   DsDetail.DataSet.Post;
  end;
end;

procedure TFrmPerfil.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'PERMISSAO' then
  begin
   DBGrid2.Canvas.FillRect(Rect);
   imgpermissao.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top,-1);
   if Column.Field.AsString = 'V' then
    imgpermissao.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top,1)
   else
    imgpermissao.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top,0);
  end;
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

procedure TFrmPerfil.BtnCheckClick(Sender: TObject);
begin
  inherited;
  ChangePermissao(tpCheck);
end;

procedure TFrmPerfil.BtnUncheckClick(Sender: TObject);
begin
  inherited;
  ChangePermissao(tpUncheck);
end;

procedure TFrmPerfil.BtnInvertClick(Sender: TObject);
begin
  inherited;
   ChangePermissao(tpInvert);
end;

procedure TFrmPerfil.BtnDefaultClick(Sender: TObject);
begin
  inherited;
  LoadDefault;
end;

end.
