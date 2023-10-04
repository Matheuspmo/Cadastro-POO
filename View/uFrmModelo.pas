unit uFrmModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ToolWin, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmModelo = class(TForm)
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ac_incluir: TAction;
    ac_excluir: TAction;
    ac_alterar: TAction;
    ac_visualizar: TAction;
    ac_Imprimir: TAction;
    ac_Salvar: TAction;
    ac_Cancelar: TAction;
    ac_fechar: TAction;
    Manuteno1: TMenuItem;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    Action31: TMenuItem;
    Action41: TMenuItem;
    Action51: TMenuItem;
    N1: TMenuItem;
    Action81: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    PageControl1: TPageControl;
    tbCadastro: TTabSheet;
    tbConsulta: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    cbxField: TComboBox;
    edtvalor: TEdit;
    BtnPesquisar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Ds: TDataSource;
    Label3: TLabel;
    procedure ac_incluirExecute(Sender: TObject);
    procedure ac_excluirExecute(Sender: TObject);
    procedure ac_alterarExecute(Sender: TObject);
    procedure ac_visualizarExecute(Sender: TObject);
    procedure ac_ImprimirExecute(Sender: TObject);
    procedure ac_SalvarExecute(Sender: TObject);
    procedure ac_CancelarExecute(Sender: TObject);
    procedure ac_fecharExecute(Sender: TObject);
    procedure ac_incluirUpdate(Sender: TObject);
    procedure ac_SalvarUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModelo: TFrmModelo;

implementation

uses
  Datasnap.DBClient;

{$R *.dfm}

procedure TFrmModelo.ac_alterarExecute(Sender: TObject);
begin
 if Ds.DataSet.Active then
 begin
  PageControl1.ActivePage := tbCadastro;
  ds.DataSet.Edit;
 end;
end;

procedure TFrmModelo.ac_CancelarExecute(Sender: TObject);
begin
 TClientDataSet(Ds.DataSet).CancelUpdates;
 PageControl1.ActivePage := tbConsulta;
end;

procedure TFrmModelo.ac_excluirExecute(Sender: TObject);
begin
 if not Ds.DataSet.IsEmpty then
 begin
  Ds.DataSet.Delete;
  if Ds.DataSet is TClientDataSet then//Só irá dar o apply update caso o ds esteja apontado para um objeto do tipo TClientDataSet
   TClientDataSet(Ds.DataSet).ApplyUpdates(0);//Feito type casting para poder utilizar a função ApplyUpdates
 end
end;

procedure TFrmModelo.ac_fecharExecute(Sender: TObject);
begin
 Close;
end;

procedure TFrmModelo.ac_ImprimirExecute(Sender: TObject);
begin
 ShowMessage('Implementação Futura');
end;

procedure TFrmModelo.ac_incluirExecute(Sender: TObject);
begin
 PageControl1.ActivePage := tbCadastro;
 if not Ds.DataSet.Active then
  Ds.DataSet.Open;

 Ds.DataSet.Insert;//Usado um datasource no form modelo para que ele chame qualquer clientdataset que for vinculado em futuros formulários herdados
end;

procedure TFrmModelo.ac_incluirUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := Ds.DataSet.State in [dsInactive, dsBrowse];//type casting para poder utilizar a propriedade Enabled
end;

procedure TFrmModelo.ac_SalvarExecute(Sender: TObject);
begin
 TClientDataSet(Ds.DataSet).ApplyUpdates(0);
 PageControl1.ActivePage := tbConsulta;
end;

procedure TFrmModelo.ac_SalvarUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := Ds.DataSet.State in [dsInsert, dsEdit];//type casting para poder utilizar a propriedade Enabled
 Label3.Visible          := Ds.DataSet.Filtered;
end;

procedure TFrmModelo.ac_visualizarExecute(Sender: TObject);
begin
 if PageControl1.ActivePage = tbConsulta then
  PageControl1.ActivePage := tbCadastro
 else
  PageControl1.ActivePage := tbConsulta;
end;

procedure TFrmModelo.BtnPesquisarClick(Sender: TObject);
begin
 if (cbxField.Text <> EmptyStr) and
    (edtvalor.Text <> EmptyStr) then
 begin
  Ds.DataSet.Filter   := 'Upper(' + cbxField.Text + ') like ' + QuotedStr(UpperCase(edtvalor.Text) + '%');
  Ds.DataSet.Filtered := True;
  if not Ds.DataSet.Active then
   Ds.DataSet.Open;
 end;

end;

procedure TFrmModelo.FormCreate(Sender: TObject);
var
 I: Integer;
begin
 for I := 0 to Pred(Ds.DataSet.FieldCount) do //vinculando o nomes dos campos da tabela vinculada ao combobox
 begin
  if Ds.DataSet.Fields[I].DataType in [ftString, ftWideString, ftFixedChar] then
   cbxField.Items.Add(Ds.DataSet.Fields[I].FieldName);
 end;
end;

procedure TFrmModelo.Label3Click(Sender: TObject);
begin
 Ds.DataSet.Filtered := False;
end;

end.
