inherited FwkFrmPadraoPesquisa: TFwkFrmPadraoPesquisa
  Caption = 'Framework - Form Padr'#227'o de Pesquisa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PcDados: TPageControl
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited GbPesquisa: TGroupBox
        Height = 366
        ExplicitHeight = 366
      end
      inherited GbRegistros: TGroupBox
        inherited GrdRegistros: TDBGrid
          Height = 342
        end
      end
      object BtnConfirmar: TButton
        Left = 472
        Top = 408
        Width = 121
        Height = 26
        Caption = 'Confirmar'
        ModalResult = 1
        TabOrder = 2
      end
      object BtnFechar: TButton
        Left = 599
        Top = 408
        Width = 121
        Height = 26
        Caption = 'Fechar'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
end
