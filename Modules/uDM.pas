unit uDM;

interface

uses
 System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.FMTBcd,
 Datasnap.DBClient, Datasnap.Provider, FireDAC.Stan.Intf, FireDAC.Stan.Option,
 FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
 FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
 FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
 FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Dialogs;

type
 TDM = class(TDataModule)
  dspCliente: TDataSetProvider;
  cdsCliente: TClientDataSet;
  cdsProduto: TClientDataSet;
  dspProduto: TDataSetProvider;
  cdsUsuario: TClientDataSet;
  dspUsuario: TDataSetProvider;
  cdsPerfil: TClientDataSet;
  dspPerfil: TDataSetProvider;
  cdsVendas: TClientDataSet;
  dspVendas: TDataSetProvider;
  DbvendasConnection: TFDConnection;
  sdsCliente: TFDQuery;
  sdsProduto: TFDQuery;
  sdsUsuario: TFDQuery;
  cdsClienteCLIENTEID: TIntegerField;
  cdsClienteNOME: TStringField;
  cdsClienteENDERECO: TStringField;
  cdsClienteBAIRRO: TStringField;
  cdsClienteCIDADE: TStringField;
  cdsClienteCEP: TStringField;
  cdsClienteUF: TStringField;
  cdsClienteEMAIL: TStringField;
  cdsClienteTELEFONE: TStringField;
  sdsPerfil: TFDQuery;
  sdsVendas: TFDQuery;
  cdsProdutoPRODUTOID: TIntegerField;
  cdsProdutoDESCRICAO: TStringField;
  cdsProdutoESTOQUE: TSingleField;
  cdsProdutoPRECO: TSingleField;
  cdsProdutoFABRICANTE: TIntegerField;
  cdsProdutoCATEGORIA: TIntegerField;
  cdsProdutoDATAINCLUSAO: TSQLTimeStampField;
  cdsUsuarioUSUARIOID: TIntegerField;
  cdsUsuarioPERFILID: TIntegerField;
  cdsUsuarioNOME: TStringField;
  cdsUsuarioEMAIL: TStringField;
  cdsUsuarioLOGIN: TStringField;
  cdsUsuarioSENHA: TStringField;
  cdsUsuarioVENDEDOR: TStringField;
  cdsUsuarioMASTER: TStringField;
  cdsVendasVENDAID: TIntegerField;
  cdsVendasCLIENTEID: TIntegerField;
  cdsVendasUSUARIOID: TIntegerField;
  cdsVendasDATA: TDateField;
  cdsPerfilNOME: TStringField;
  cdsPerfilDESCRICAO: TStringField;
  cdsPerfilPERFILID: TIntegerField;
  dsdPerfilConf: TFDQuery;
  DsPerfil_PerfilConf: TDataSource;
  cdsPerfilConf: TClientDataSet;
  cdsPerfildsdPerfilConf: TDataSetField;
  sdsItens: TFDQuery;
  DsVenda_Itens: TDataSource;
  cdsVendassdsItens: TDataSetField;
  cdsItens: TClientDataSet;
    cdsUsuarioPerfil: TStringField;
    procedure DataModuleCreate(Sender: TObject);
 private
  { Private declarations }
  function GenID(tablename: String): Integer;
  procedure GetID(Dataset: TDataSet);
  procedure GetError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
 public
  { Public declarations }
 end;

var
 DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM }


procedure TDM.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
 for I := 0 to Pred(ComponentCount) do
  if Components[I] is TClientDataSet then
  begin
   TClientDataSet(Components[I]).OnNewRecord := GetID;
   TClientDataSet(Components[I]).OnReconcileError := GetError;
  end;
  cdsPerfilConf.OnNewRecord := nil;
  cdsItens.OnNewRecord := nil;
end;

function TDM.GenID(tablename: String): Integer;
var
 Qry: TFDQuery;
begin
 Qry := TFDQuery.Create(Self);
 Qry.Connection := DbvendasConnection;
 Qry.SQL.Add('SELECT GEN_ID(GEN_' + tablename + '_ID,1) FROM RDB$DATABASE');
 Qry.Open;
 Result := Qry.Fields[0].AsInteger;
end;

procedure TDM.GetError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 ShowMessage('Um Erro Ocorreu ao tentar gravar o registro ' + #13 +
             'Mensagem Original ' + E.Message);
end;

procedure TDM.GetID(Dataset: TDataSet);
begin
 Dataset.Fields[0].AsInteger := GenID(Copy(Dataset.Name,4));
end;

end.
