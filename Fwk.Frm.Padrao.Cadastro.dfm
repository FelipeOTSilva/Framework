inherited FwkFrmPadraoCadastro: TFwkFrmPadraoCadastro
  Caption = 'Framework - Form Padr'#227'o de Cadastro '
  ClientHeight = 443
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited PcDados: TPageControl
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited GbRegistros: TGroupBox
        inherited GrdRegistros: TDBGrid
          OnDblClick = GrdRegistrosDblClick
          OnKeyDown = GrdRegistrosKeyDown
        end
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 16
      object GbEdicao: TGroupBox
        Left = 3
        Top = 0
        Width = 731
        Height = 65
        Caption = 'Manipula'#231#227'o do Registro'
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 23
          Width = 720
          Height = 39
          DataSource = DsoRegistros
          TabOrder = 0
        end
      end
      object GbRegistro: TGroupBox
        Left = 3
        Top = 71
        Width = 731
        Height = 289
        Caption = 'Registro'
        TabOrder = 1
      end
      object BtnFechar: TButton
        Left = 605
        Top = 384
        Width = 129
        Height = 33
        Caption = 'Fechar'
        TabOrder = 2
        OnClick = BtnFecharClick
      end
    end
  end
end
