program Framework;

uses
  Vcl.Forms,
  Fwk.Frm.Padrao.Principal in 'Fwk.Frm.Padrao.Principal.pas' {FwkFrmPadraoPrincipal},
  Fwk.Dm.Padrao.Database in 'Fwk.Dm.Padrao.Database.pas' {FwkDmPadraoDatabase: TDataModule},
  Fwk.Dm.Padrao.Dados in 'Fwk.Dm.Padrao.Dados.pas' {FwkDmPadraoDados: TDataModule},
  Fwk.Frm.Padrao.Base in 'Fwk.Frm.Padrao.Base.pas' {FwkFrmPadraoBase},
  Fwk.Frm.Padrao.Cadastro in 'Fwk.Frm.Padrao.Cadastro.pas' {FwkFrmPadraoCadastro},
  Fwk.Frm.Padrao.Pesquisa in 'Fwk.Frm.Padrao.Pesquisa.pas' {FwkFrmPadraoPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFwkFrmPadraoPrincipal, FwkFrmPadraoPrincipal);
  Application.Run;
end.
