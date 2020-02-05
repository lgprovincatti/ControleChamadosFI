object frmRelatorioPeriodoFiltro: TfrmRelatorioPeriodoFiltro
  Left = 714
  Top = 562
  BorderIcons = []
  BorderStyle = bsToolWindow
  BorderWidth = 10
  Caption = 'FI Sistemas - Relat'#243'rio de Chamados [ Per'#237'odo ]'
  ClientHeight = 102
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 420
    Height = 102
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 26
      Width = 411
      Height = 13
      Caption = 
        '----------------------------------------------------------------' +
        '----------------------------------------------------------------' +
        '---------'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rbTodos: TRadioButton
      Left = 8
      Top = 16
      Width = 193
      Height = 17
      Caption = 'Todos os Chamados Criados'
      TabOrder = 0
    end
    object rbAbertos: TRadioButton
      Left = 216
      Top = 16
      Width = 193
      Height = 17
      Caption = 'Todos os Chamados "Em Aberto"'
      TabOrder = 1
    end
    object edDataInicial: TMaskEdit
      Left = 8
      Top = 64
      Width = 119
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object edDataFinal: TMaskEdit
      Left = 136
      Top = 64
      Width = 119
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 420
    Top = 0
    Width = 163
    Height = 102
    Align = alRight
    TabOrder = 1
    object btGerarRelatorio: TBitBtn
      Left = 8
      Top = 16
      Width = 145
      Height = 22
      Caption = 'Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btGerarRelatorioClick
    end
    object btVoltar: TBitBtn
      Left = 8
      Top = 64
      Width = 145
      Height = 22
      Caption = '&Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btVoltarClick
    end
  end
end
