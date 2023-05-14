inherited RelatorioUsuario: TRelatorioUsuario
  inherited Report: TRLReport
    DataSource = dsReport
    BeforePrint = ReportBeforePrint
    inherited RLBand2: TRLBand
      Top = 145
      ExplicitTop = 145
    end
    inherited BandaCabecalho: TRLBand
      object rllIdUsuario: TRLLabel
        Left = 3
        Top = 1
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Id Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rllNomeUsuario: TRLLabel
        Left = 73
        Top = 0
        Width = 90
        Height = 16
        Caption = 'Nome Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    inherited BandaDados: TRLBand
      Height = 24
      ExplicitHeight = 24
      object rbIdUsuario: TRLDBText
        Left = 7
        Top = 6
        Width = 62
        Height = 16
        Alignment = taRightJustify
        DataField = 'id'
        DataSource = dsReport
        Text = ''
      end
      object dbNomeUsuario: TRLDBText
        Left = 75
        Top = 6
        Width = 374
        Height = 16
        DataField = 'nome'
        DataSource = dsReport
        Text = ''
      end
    end
  end
  object dsReport: TDataSource
    Left = 320
    Top = 312
  end
end
