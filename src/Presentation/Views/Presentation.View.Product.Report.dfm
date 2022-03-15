object frProductReport: TfrProductReport
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 511
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 24
    Top = -16
    Width = 794
    Height = 1123
    DataSource = dsProductReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Produtos'
    Transparent = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 16
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 339
        Top = 0
        Width = 40
        Height = 16
        Align = faCenterTop
        Info = itTitle
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 590
        Top = 0
        Width = 128
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'g.:'
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 54
      Width = 718
      Height = 16
      BandType = btHeader
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object lbBarCode: TRLLabel
        Left = 0
        Top = 0
        Width = 114
        Height = 16
        Align = faTopOnly
        Caption = 'C'#243'digo de Barras'
        Transparent = False
      end
      object lbName: TRLLabel
        Left = 120
        Top = 0
        Width = 245
        Height = 16
        Align = faTopOnly
        Caption = 'Descri'#231#227'o'
        Transparent = False
      end
      object lbPrice: TRLLabel
        Left = 371
        Top = 0
        Width = 60
        Height = 16
        Align = faTopOnly
        Caption = 'Pre'#231'o'
        Transparent = False
      end
      object lbUnity: TRLLabel
        Left = 436
        Top = 0
        Width = 60
        Height = 16
        Align = faTopOnly
        Caption = 'Unidade'
        Transparent = False
      end
      object lbGroup: TRLLabel
        Left = 502
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Caption = 'Grupo'
        Transparent = False
      end
      object lbSession: TRLLabel
        Left = 611
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        Caption = 'Sess'#227'o'
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 70
      Width = 718
      Height = 16
      Transparent = False
      object DbTextBarCode: TRLDBText
        Left = 0
        Top = 0
        Width = 114
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'BarCode'
        DataSource = dsProductReport
        Holder = lbBarCode
        Text = ''
        Transparent = False
      end
      object dbTextName: TRLDBText
        Left = 120
        Top = 0
        Width = 245
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'Name'
        DataSource = dsProductReport
        Holder = lbName
        Text = ''
        Transparent = False
      end
      object dbTextPrice: TRLDBText
        Left = 371
        Top = 0
        Width = 60
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'Price'
        DataSource = dsProductReport
        Holder = lbPrice
        Text = ''
        Transparent = False
      end
      object dbTextUnity: TRLDBText
        Left = 436
        Top = 0
        Width = 60
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'Unity'
        DataSource = dsProductReport
        Holder = lbUnity
        Text = ''
        Transparent = False
      end
      object dbTextGroup: TRLDBText
        Left = 502
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'Group'
        DataSource = dsProductReport
        Holder = lbGroup
        Text = ''
        Transparent = False
      end
      object dbTextSession: TRLDBText
        Left = 611
        Top = 0
        Width = 100
        Height = 16
        Align = faTopOnly
        AutoSize = False
        DataField = 'Session'
        DataSource = dsProductReport
        Holder = lbSession
        Text = ''
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 86
      Width = 718
      Height = 16
      BandType = btFooter
      Transparent = False
      object RLSystemInfo3: TRLSystemInfo
        Left = 648
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
        Transparent = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 578
        Top = 0
        Width = 70
        Height = 16
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = faRightTop
        Text = 'Data:'
        Transparent = False
      end
    end
  end
  object dsProductReport: TDataSource
    Left = 424
    Top = 264
  end
end
