object frProduct: TfrProduct
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 440
  ClientWidth = 605
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 50
    Width = 605
    Height = 3
    Align = alTop
    Style = bsRaised
    ExplicitTop = 41
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 168
      Height = 44
      Align = alLeft
      Caption = 'Cadastro de Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 19
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 390
    Width = 605
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnSave: TAdvGlowButton
      AlignWithMargins = True
      Left = 500
      Top = 5
      Width = 100
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BorderStyle = bsNone
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Rounded = True
      TabOrder = 0
      OnClick = btnSaveClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.Color = clGreen
      Appearance.ColorTo = clGreen
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clGreen
      Appearance.ColorMirrorTo = clGreen
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
    end
    object btnCancel: TAdvGlowButton
      AlignWithMargins = True
      Left = 370
      Top = 5
      Width = 100
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 30
      Margins.Bottom = 5
      Align = alRight
      BorderStyle = bsNone
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Rounded = True
      TabOrder = 1
      OnClick = btnCancelClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.Color = clMaroon
      Appearance.ColorTo = clMaroon
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clMaroon
      Appearance.ColorMirrorTo = clMaroon
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 53
    Width = 605
    Height = 337
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Padding.Left = 5
    Padding.Right = 5
    ParentBackground = False
    TabOrder = 2
    object Label2: TLabel
      Left = 3
      Top = 40
      Width = 98
      Height = 16
      Caption = 'C'#243'digo de Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 259
      Top = 40
      Width = 33
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 3
      Top = 117
      Width = 32
      Height = 16
      Caption = 'Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 370
      Top = 117
      Width = 41
      Height = 16
      Caption = 'Sess'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 190
      Top = 117
      Width = 46
      Height = 16
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbSession: TcxImageComboBox
      Left = 370
      Top = 140
      ParentFont = False
      Properties.Items = <>
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 189
    end
    object edBarCode: TDBEdit
      Left = 3
      Top = 62
      Width = 200
      Height = 24
      DataField = 'BarCode'
      DataSource = dsProducts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edBarCodeExit
    end
    object edName: TDBEdit
      Left = 259
      Top = 62
      Width = 300
      Height = 24
      DataField = 'Name'
      DataSource = dsProducts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edNameExit
    end
    object edPrice: TDBEdit
      Left = 3
      Top = 140
      Width = 150
      Height = 24
      DataField = 'Price'
      DataSource = dsProducts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = edPriceExit
    end
    object cbUnity: TcxImageComboBox
      Left = 190
      Top = 140
      ParentFont = False
      Properties.Items = <
        item
          Description = 'UN'
          ImageIndex = 0
          Value = 'UN'
        end
        item
          Description = 'CX'
          Value = 'CX'
        end
        item
          Description = 'PC'
          Value = 'PC'
        end
        item
          Description = 'KG'
          Value = 'KG'
        end
        item
          Description = 'LT'
          Value = 'LT'
        end>
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 150
    end
  end
  object cdsProducts: TClientDataSet
    PersistDataPacket.Data = {
      940000009619E0BD010000001800000006000000000003000000940002496404
      00010000000000055072696365080004000000000005556E6974790100490000
      0001000557494454480200020014000953657373696F6E496404000100000000
      0007426172436F64650100490000000100055749445448020002003200044E61
      6D6501004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 248
    object cdsProductsId: TIntegerField
      DisplayWidth = 200
      FieldName = 'Id'
    end
    object cdsProductsPrice: TFloatField
      FieldName = 'Price'
      currency = True
    end
    object cdsProductsUnity: TStringField
      FieldName = 'Unity'
    end
    object cdsProductsSessionId: TIntegerField
      FieldName = 'SessionId'
    end
    object cdsProductsBarCode: TStringField
      FieldName = 'BarCode'
      Size = 50
    end
    object cdsProductsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsProducts: TDataSource
    DataSet = cdsProducts
    Left = 296
    Top = 248
  end
end
