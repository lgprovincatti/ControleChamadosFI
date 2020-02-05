object frmCadastroClientes: TfrmCadastroClientes
  Left = 819
  Top = 123
  Width = 519
  Height = 179
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  BorderWidth = 10
  Caption = 'FI Sistemas - Chamados [ Cadastro de Clientes ]'
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
    Width = 344
    Height = 121
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 86
      Height = 13
      Caption = 'TIPO CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 39
      Height = 13
      Caption = 'LOGIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 93
      Height = 13
      Caption = 'NOME CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTipoCliente: TComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      CharCase = ecUpperCase
      Enabled = False
      ItemHeight = 16
      TabOrder = 0
    end
    object edLogin: TEdit
      Left = 160
      Top = 32
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 30
      TabOrder = 1
    end
    object edCliente: TEdit
      Left = 8
      Top = 88
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 50
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 344
    Top = 0
    Width = 139
    Height = 121
    Align = alRight
    TabOrder = 1
    object btNovoRegistro: TBitBtn
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      Caption = '&Novo Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btNovoRegistroClick
    end
    object btGravar: TBitBtn
      Left = 8
      Top = 48
      Width = 121
      Height = 21
      Caption = '&Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btGravarClick
    end
    object btVoltar: TBitBtn
      Left = 8
      Top = 88
      Width = 121
      Height = 21
      Caption = '&Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btVoltarClick
    end
  end
end
