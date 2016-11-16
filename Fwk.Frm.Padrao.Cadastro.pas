unit Fwk.Frm.Padrao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Fwk.Frm.Padrao.Base, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFwkFrmPadraoCadastro = class(TFwkFrmPadraoBase)
    TabCadastro: TTabSheet;
    GbEdicao: TGroupBox;
    DBNavigator1: TDBNavigator;
    GbRegistro: TGroupBox;
    BtnFechar: TButton;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdRegistrosDblClick(Sender: TObject);
    procedure GrdRegistrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FwkFrmPadraoCadastro: TFwkFrmPadraoCadastro;

implementation

{$R *.dfm}

procedure TFwkFrmPadraoCadastro.BtnFecharClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TFwkFrmPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  PcDados.ActivePage := TabPesquisa;
end;

procedure TFwkFrmPadraoCadastro.GrdRegistrosDblClick(Sender: TObject);
begin
  inherited;
  PcDados.ActivePage := TabCadastro;
end;

procedure TFwkFrmPadraoCadastro.GrdRegistrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_RETURN)then
    PcDados.ActivePage :=  TabCadastro;
end;

end.
