unit Fwk.Frm.Padrao.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client;

type
  TFwkFrmPadraoBase = class(TForm)
    PcDados: TPageControl;
    TabPesquisa: TTabSheet;
    GbPesquisa: TGroupBox;
    CmbCampos: TComboBox;
    LblCampo: TLabel;
    RgCriterio: TRadioGroup;
    LblTermo: TLabel;
    EdtTermo: TEdit;
    BtnPesquisar: TButton;
    BtnCancelar: TButton;
    GbRegistros: TGroupBox;
    GrdRegistros: TDBGrid;
    DsoRegistros: TDataSource;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GbRegistrosClick(Sender: TObject);
    procedure GrdRegistrosTitleClick(Column: TColumn);
  private
  procedure CarregarCamposPesquisa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FwkFrmPadraoBase: TFwkFrmPadraoBase;

implementation

{$R *.dfm}

procedure TFwkFrmPadraoBase.BtnCancelarClick(Sender: TObject);
begin
  TFDQuery(DsoRegistros.DataSet).Filtered := False;
  TFDQuery(DsoRegistros.DataSet).Filter := '';
end;

procedure TFwkFrmPadraoBase.BtnPesquisarClick(Sender: TObject);
{Este metodo verifica o campo selecionado no ComboBox
  e executa um filtro nele baseado nos critérios}
var
  vFieldName: string;
begin
  TFDQuery(DsoRegistros.DataSet).Filtered := False;

  vFieldName := TField(CmbCampos.Items.Objects[CmbCampos.ItemIndex]).FieldName;
  case RgCriterio.ItemIndex of
    0: TFDQuery(DsoRegistros.DataSet).Filter := vFieldName + ' = ' + QuotedStr(EdtTermo.Text); // Igual
    1: TFDQuery(DsoRegistros.DataSet).Filter := vFieldName + ' Like ' + QuotedStr(EdtTermo.Text + '%'); //Iniciando
    2: TFDQuery(DsoRegistros.DataSet).Filter := vFieldName + ' Like ' + QuotedStr('%' + EdtTermo.Text + '%');
  end;

  TFDQuery(DsoRegistros.DataSet).Filtered := True;

  if TFDQuery(DsoRegistros.DataSet).IsEmpty then
  begin
    ShowMessage('Nenhum registro foi localizado!');
    BtnCancelar.Click;
  end;
end;

procedure TFwkFrmPadraoBase.CarregarCamposPesquisa;
{Este método percorre os fields do DataSet
  e adiciona eles ao ComboBox para permitir
  pesquisar por ele}
var
  I:Integer;
begin
  CmbCampos.Items.Clear;
  for I := 0 to DsoRegistros.DataSet.FieldCount -1 do
    CmbCampos.Items.AddObject(DsoRegistros.DataSet.Fields[I].DisplayLabel, DsoRegistros.DataSet.Fields[I]);
  CmbCampos.ItemIndex := 0;
end;


procedure TFwkFrmPadraoBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if(ModalResult <> mrOK)then
    DsoRegistros.DataSet.Active := False;
end;

procedure TFwkFrmPadraoBase.FormShow(Sender: TObject);
begin
  // Verifica se foi informado algum DataSet pelo programador
  if (DsoRegistros.DataSet = nil) then
    raise Exception.Create('ATENÇÃO! Nenhum DataSet foi informado para o Form! ');

  // Se o DataSet não estiver aberto faz isso
  if not DsoRegistros.DataSet.Active then
    DsoRegistros.DataSet.Active := True;

  CarregarCamposPesquisa();


  CmbCampos.SetFocus;
end;



procedure TFwkFrmPadraoBase.GrdRegistrosTitleClick(Column: TColumn);
{Este método ordena o DataSet pelo campo clicado se
  ele não estiver vazio}
begin
  if not TFDQuery(DsoRegistros.DataSet).IsEmpty then
    TFDQuery(DsoRegistros.DataSet).IndexFieldNames := Column.FieldName;

end;

end.
