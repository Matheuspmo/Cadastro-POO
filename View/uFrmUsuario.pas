unit uFrmUsuario;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
 System.Classes, Vcl.Graphics,
 Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmModelo, Data.DB, System.ImageList,
 Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
 Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, uDM,
  Vcl.Mask, Vcl.DBCtrls;

type
 TFrmUsuario = class(TFrmModelo)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
 private
  { Private declarations }
 public
  { Public declarations }
 end;

var
 FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

end.
