unit Fwk.Frm.Padrao.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Fwk.Frm.Padrao.Base, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Comp.Client;

type
  TFwkFrmPadraoPesquisa = class(TFwkFrmPadraoBase)
    BtnConfirmar: TButton;
    BtnFechar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function Pesquisar(const pDataSet: TFDQuery): TFDQuery;
var
  FwkFrmPadraoPesquisa: TFwkFrmPadraoPesquisa;

implementation

{$R *.dfm}

function Pesquisar(const pDataSet: TFDQuery): TFDQuery;
var
  vFrm: TFwkFrmPadraoPesquisa;
begin
  vFrm := TFwkFrmPadraoPesquisa.Create(nil);
  try
    vFrm.DsoRegistros.DataSet := pDataSet;

    if (vFrm.ShowModal <> mrOk) then
      pDataSet.Close;

    Result := pDataSet;
  finally
    FreeAndNil(vFrm);
  end;
end;

end.
