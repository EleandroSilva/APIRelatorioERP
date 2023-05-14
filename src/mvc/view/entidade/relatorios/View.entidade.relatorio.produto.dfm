inherited RelatorioProduto: TRelatorioProduto
  inherited Report: TRLReport
    DataSource = dsReport
    BeforePrint = ReportBeforePrint
    inherited BandaCabecalho: TRLBand
      object rllIdProduto: TRLLabel
        Left = 2
        Top = 0
        Width = 67
        Height = 16
        Alignment = taRightJustify
        Caption = 'Id Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rllNomeProduto: TRLLabel
        Left = 73
        Top = 0
        Width = 91
        Height = 16
        Caption = 'Nome Produto:'
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
      object rbIdUsuario: TRLDBText
        Left = 7
        Top = 0
        Width = 62
        Height = 16
        Alignment = taRightJustify
        DataField = 'id'
        DataSource = dsReport
        Text = ''
      end
      object dbNomeUsuario: TRLDBText
        Left = 75
        Top = 0
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
