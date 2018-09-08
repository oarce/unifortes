object frmPsqBase: TfrmPsqBase
  Left = 0
  Top = 0
  Caption = 'frmPsqBase'
  ClientHeight = 442
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1034
    Height = 60
    Align = alTop
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 14
      Top = 7
      Width = 59
      Height = 17
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6640172
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescricao: TEdit
      Left = 14
      Top = 27
      Width = 235
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnFiltrar: TBitBtn
      Left = 255
      Top = 14
      Width = 86
      Height = 34
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFiltrarClick
    end
  end
  object spwMenu: TSplitView
    Left = 0
    Top = 60
    Width = 200
    Height = 382
    CloseStyle = svcCompact
    CompactWidth = 55
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 1
    object lvwActions: TListView
      Left = 0
      Top = 0
      Width = 200
      Height = 382
      Align = alClient
      Color = 9861697
      Columns = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      FlatScrollBars = True
      Items.ItemData = {
        05A80000000400000005000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
        000520004E006F0076006F0000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF
        0000000008200041006C007400650072006100720004000000FFFFFFFFFFFFFF
        FF00000000FFFFFFFF000000000820004500780063006C007500690072000800
        0000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000000B200056006900730075
        0061006C0069007A0061007200}
      ReadOnly = True
      ParentFont = False
      ShowColumnHeaders = False
      SmallImages = frmPrincipal.iml48white
      TabOrder = 0
      TabStop = False
      ViewStyle = vsList
      OnClick = lvwActionsClick
    end
  end
  object pnl2: TPanel
    Left = 200
    Top = 60
    Width = 834
    Height = 382
    Align = alClient
    Caption = 'pnl2'
    TabOrder = 2
    object grdPesquisa: TDBGrid
      Left = 1
      Top = 1
      Width = 832
      Height = 380
      Align = alClient
      DataSource = dtsPesquisa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = 6640172
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Pitch = fpFixed
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_PESQUISA'
          Width = 361
          Visible = True
        end>
    end
  end
  object dtsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 664
    Top = 168
  end
  object qryPesquisa: TFDQuery
    Connection = frmPrincipal.conConexao
    Left = 640
    Top = 176
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaCAMPO_PESQUISA: TStringField
      FieldName = 'CAMPO_PESQUISA'
      Size = 100
    end
  end
end
