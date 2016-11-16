program Framework;

uses
  Vcl.Forms,
  Fwk.Frm.Padrao.Principal in 'Fwk.Frm.Padrao.Principal.pas' {FwkFrmPadraoPrincipal},
  Fwk.Dm.Padrao.Database in 'Fwk.Dm.Padrao.Database.pas' {FwkDmPadraoDatabase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFwkFrmPadraoPrincipal, FwkFrmPadraoPrincipal);
  Application.CreateForm(TFwkDmPadraoDatabase, FwkDmPadraoDatabase);
  Application.Run;
end.
