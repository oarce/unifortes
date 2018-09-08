object frmDefRelatorios: TfrmDefRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rios'
  ClientHeight = 183
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescricao: TLabel
    Left = 24
    Top = 65
    Width = 33
    Height = 17
    Caption = 'Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 17
    Width = 107
    Height = 17
    Caption = 'Modelo Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6640172
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbbFiltro: TComboBox
    Left = 24
    Top = 85
    Width = 305
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'TODOS'
    Items.Strings = (
      'TODOS'
      'APROVADOS'
      'REPROVADOS')
  end
  object cbbTipo: TComboBox
    Left = 24
    Top = 37
    Width = 305
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'AGRUPADO POR ALUNO'
    Items.Strings = (
      'AGRUPADO POR ALUNO'
      'ALUNOS POR PROFESSOR')
  end
  object btnAlterar: TBitBtn
    Left = 98
    Top = 125
    Width = 136
    Height = 34
    Caption = 'Gerar Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3355443
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAlterarClick
  end
end
