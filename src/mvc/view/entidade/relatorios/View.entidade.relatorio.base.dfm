object RelatorioBase: TRelatorioBase
  Left = 0
  Top = 0
  Width = 794
  Height = 1123
  TabOrder = 0
  object Report: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      Color = clWindowFrame
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 573
        Top = 21
        Width = 127
        Height = 22
        Alignment = taRightJustify
        Caption = 'Rede Infocon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 40
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 7
        Top = 16
        Width = 70
        Height = 16
        Text = 'Data-'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 127
        Top = 15
        Width = 70
        Height = 16
        Info = itHour
        Text = 'Hora-'
      end
    end
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 320
    Top = 248
  end
end
