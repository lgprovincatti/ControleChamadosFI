object frmRelatorioAnual: TfrmRelatorioAnual
  Left = 835
  Top = 409
  BorderStyle = bsToolWindow
  BorderWidth = 10
  Caption = 'FI Sistemas - Relat'#243'rio de Chamados [ Ano ]'
  ClientHeight = 87
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 273
    Height = 87
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 23
      Height = 13
      Caption = 'Ano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 3
      Top = 27
      Width = 261
      Height = 13
      Caption = 
        '----------------------------------------------------------------' +
        '-----------------------'
    end
    object edAno: TMaskEdit
      Left = 48
      Top = 48
      Width = 169
      Height = 21
      EditMask = '!0000;1;_'
      MaxLength = 4
      TabOrder = 0
      Text = '    '
    end
    object rbTodos: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Todos '
      TabOrder = 1
    end
    object rbAberto: TRadioButton
      Left = 136
      Top = 16
      Width = 113
      Height = 17
      Caption = '"Em Aberto"'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 273
    Top = 0
    Width = 190
    Height = 87
    Align = alRight
    TabOrder = 1
    object btGerarRelatorio: TBitBtn
      Left = 16
      Top = 18
      Width = 161
      Height = 22
      Caption = '&Gerar Relat'#243'rio'
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
      Left = 16
      Top = 51
      Width = 161
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
