object dmDados: TdmDados
  OldCreateOrder = False
  Left = 392
  Top = 124
  Height = 571
  Width = 928
  object cn: TSQLConnection
    ConnectionName = 'ProducaoControleFirebird'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=192.168.1.235:X:\bancos\Suporte\FI_CHAMADOS.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 16
    Top = 16
  end
  object dsAcessoSQL: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 96
    Top = 16
  end
  object dsCarregarDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 184
    Top = 16
  end
  object dsGetDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 328
    Top = 16
  end
  object dsKanbanInsert: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 416
    Top = 16
  end
  object dsInsertDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 256
    Top = 16
  end
  object dsRelCliFec: TSQLDataSet
    CommandText = 
      'select CS.ID as IDCLIENTE, C.TICKET as TICKET, CS.LOGIN as LOGIN' +
      ', CS.NOMECLIENTE as CLIENTE,'#13#10'       CST.DESCRICAO as TIPOCLIENT' +
      'E, TR.DESCRICAO as TIPOREGISTRO, TT.DESCRICAO as TIPOTICKET, C.D' +
      'ATA as DATA,'#13#10'       C.TEMPO as TEMPO, C.DESCRICAO as DESCRICAO,' +
      ' C.ASSUNTO'#13#10'from CONTROLE C'#13#10'join CLIENTES CS on CS.ID = C.FK_CL' +
      'IENTE'#13#10'join CLIENTES_TIPO CST on CST.ID = CS.FK_CLIENTES_TIPO'#13#10'j' +
      'oin TIPO_REGISTRO TR on TR.ID = C.FK_TIPO_REGISTRO'#13#10'join TICKET_' +
      'TIPO TT on TT.ID = C.FK_TIPO_TICKET'#13#10'where C.FK_CLIENTE = 170 an' +
      'd'#13#10'      TT.ID not in (1, 4) and'#13#10'      C.DATA between '#39'08/01/20' +
      '19'#39' and '#39'08/30/2019'#39#13#10'order by TIPOREGISTRO, TIPOTICKET asc  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 24
    Top = 80
  end
  object dspRelCliFec: TDataSetProvider
    DataSet = dsRelCliFec
    Left = 24
    Top = 136
  end
  object cdsRelCliFec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelCliFec'
    Left = 24
    Top = 192
    object cdsRelCliFecIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object cdsRelCliFecTICKET: TStringField
      FieldName = 'TICKET'
      Required = True
      Size = 25
    end
    object cdsRelCliFecLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object cdsRelCliFecCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object cdsRelCliFecTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      Size = 50
    end
    object cdsRelCliFecTIPOREGISTRO: TStringField
      FieldName = 'TIPOREGISTRO'
      Size = 50
    end
    object cdsRelCliFecTIPOTICKET: TStringField
      FieldName = 'TIPOTICKET'
      Size = 50
    end
    object cdsRelCliFecDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsRelCliFecTEMPO: TStringField
      FieldName = 'TEMPO'
      Required = True
      Size = 6
    end
    object cdsRelCliFecDESCRICAO: TGraphicField
      FieldName = 'DESCRICAO'
      BlobType = ftGraphic
    end
  end
  object dsRelParcialCli: TSQLDataSet
    CommandText = 
      'select distinct(C.FK_CLIENTE) as IDCLIENTE,'#13#10'               (sel' +
      'ect CLS.NOMECLIENTE'#13#10'                from CLIENTES CLS'#13#10'        ' +
      '        where CLS.ID = C.FK_CLIENTE and'#13#10'                      C' +
      'LS.STATUS = '#39'A'#39') as NOMECLIENTE,'#13#10'               (select CTO.DES' +
      'CRICAO'#13#10'                from CLIENTES_TIPO CTO'#13#10'                ' +
      'where CTO.ID = C.FK_CLIENTE_TIPO) as TIPOCLIENTE,'#13#10'             ' +
      '  (select count(C1.ID)'#13#10'                from CONTROLE C1'#13#10'      ' +
      '          where C1.FK_CLIENTE = C.FK_CLIENTE and'#13#10'              ' +
      '        C1.FK_TIPO_TICKET = 2) as ME,'#13#10'               (select co' +
      'unt(C2.ID)'#13#10'                from CONTROLE C2'#13#10'                wh' +
      'ere C2.FK_CLIENTE = C.FK_CLIENTE and'#13#10'                      C2.F' +
      'K_TIPO_TICKET = 3) as TR,'#13#10'               (select count(C3.ID)'#13#10 +
      '                from CONTROLE C3'#13#10'                where C3.FK_CL' +
      'IENTE = C.FK_CLIENTE and'#13#10'                      C3.FK_TIPO_TICKE' +
      'T = 5) as SPAT,'#13#10'               (select count(C4.ID)'#13#10'          ' +
      '      from CONTROLE C4'#13#10'                where C4.FK_CLIENTE = C.' +
      'FK_CLIENTE and'#13#10'                      C4.FK_TIPO_TICKET = 6) as ' +
      'SPEMER,'#13#10'               (select count(C5.ID)'#13#10'                fr' +
      'om CONTROLE C5'#13#10'                where C5.FK_CLIENTE = C.FK_CLIEN' +
      'TE and'#13#10'                      C5.FK_TIPO_TICKET = 1) as BG,'#13#10'   ' +
      '            (select count(C6.ID)'#13#10'                from CONTROLE ' +
      'C6'#13#10'                where C6.FK_CLIENTE = C.FK_CLIENTE and'#13#10'    ' +
      '                  C6.FK_TIPO_TICKET = 4) as DV'#13#10'from CONTROLE C'#13 +
      #10'where C.DATA between '#39'07/01/2019'#39' and '#39'12/31/2019'#39#13#10'order by TI' +
      'POCLIENTE, NOMECLIENTE asc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 208
    Top = 80
  end
  object dspRelParcialCli: TDataSetProvider
    DataSet = dsRelParcialCli
    Left = 208
    Top = 136
  end
  object cdsRelParcialCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelParcialCli'
    Left = 208
    Top = 192
    object cdsRelParcialCliIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object cdsRelParcialCliNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ReadOnly = True
      Size = 50
    end
    object cdsRelParcialCliTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      ReadOnly = True
      Size = 50
    end
    object cdsRelParcialCliME: TIntegerField
      FieldName = 'ME'
      ReadOnly = True
    end
    object cdsRelParcialCliTR: TIntegerField
      FieldName = 'TR'
      ReadOnly = True
    end
    object cdsRelParcialCliSPAT: TIntegerField
      FieldName = 'SPAT'
      ReadOnly = True
    end
    object cdsRelParcialCliSPEMER: TIntegerField
      FieldName = 'SPEMER'
      ReadOnly = True
    end
  end
  object cnOTRS: TADOConnection
    Left = 800
    Top = 16
  end
  object dsAuxiliar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 488
    Top = 16
  end
  object dspAuxiliarDados: TDataSetProvider
    DataSet = dsAuxiliarDados
    Left = 104
    Top = 136
  end
  object dsAuxiliarDados: TSQLDataSet
    CommandText = 'select * from REL_PARCIAL_HORAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 104
    Top = 80
  end
  object cdsAuxiliarDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuxiliarDados'
    Left = 104
    Top = 192
    object cdsAuxiliarDadosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAuxiliarDadosDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object cdsAuxiliarDadosDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object cdsAuxiliarDadosFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
    end
    object cdsAuxiliarDadosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 150
    end
    object cdsAuxiliarDadosTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Size = 50
    end
    object cdsAuxiliarDadosTEMPO_TOTAL: TStringField
      FieldName = 'TEMPO_TOTAL'
      Size = 10
    end
    object cdsAuxiliarDadosTEMPO_MELHORIA: TStringField
      FieldName = 'TEMPO_MELHORIA'
      Size = 10
    end
    object cdsAuxiliarDadosTEMPO_SUPORTE: TStringField
      FieldName = 'TEMPO_SUPORTE'
      Size = 10
    end
    object cdsAuxiliarDadosTEMPO_TREINAMENTO: TStringField
      FieldName = 'TEMPO_TREINAMENTO'
      Size = 10
    end
    object cdsAuxiliarDadosOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
  end
  object dsParcial_Horas: TSQLDataSet
    CommandText = 
      'select * '#13#10'from REL_PARCIAL_HORAS'#13#10'where DATA_INICIO = '#39'11/01/20' +
      '19'#39' and'#13#10'      DATA_FINAL = '#39'11/26/2019'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 320
    Top = 80
  end
  object dspParcial_Horas: TDataSetProvider
    DataSet = dsParcial_Horas
    Left = 320
    Top = 136
  end
  object cdsParcial_Horas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcial_Horas'
    Left = 320
    Top = 192
    object cdsParcial_HorasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsParcial_HorasDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object cdsParcial_HorasDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object cdsParcial_HorasFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
    end
    object cdsParcial_HorasNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 150
    end
    object cdsParcial_HorasTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Size = 50
    end
    object cdsParcial_HorasTEMPO_TOTAL: TStringField
      FieldName = 'TEMPO_TOTAL'
      Size = 10
    end
    object cdsParcial_HorasTEMPO_MELHORIA: TStringField
      FieldName = 'TEMPO_MELHORIA'
      Size = 10
    end
    object cdsParcial_HorasTEMPO_SUPORTE: TStringField
      FieldName = 'TEMPO_SUPORTE'
      Size = 10
    end
    object cdsParcial_HorasTEMPO_TREINAMENTO: TStringField
      FieldName = 'TEMPO_TREINAMENTO'
      Size = 10
    end
    object cdsParcial_HorasOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object cdsParcial_HorasDESCONTO_TOTAL: TStringField
      FieldName = 'DESCONTO_TOTAL'
      Size = 10
    end
    object cdsParcial_HorasCOBRAR_HORAS: TStringField
      FieldName = 'COBRAR_HORAS'
      Size = 10
    end
  end
  object dsFechamentoNovo: TSQLDataSet
    CommandText = 
      'select C.FK_CLIENTE,'#13#10'       (select CS.LOGIN || '#39' - '#39' || CS.NOM' +
      'ECLIENTE'#13#10'        from CLIENTES CS'#13#10'        where CS.ID = C.FK_C' +
      'LIENTE) as NOMECLIENTE, C.FK_CLIENTE_TIPO,'#13#10'       (select CTO.D' +
      'ESCRICAO'#13#10'        from CLIENTES_TIPO CTO'#13#10'        where CTO.ID =' +
      ' C.FK_CLIENTE_TIPO) as TIPOCLIENTE, C.TICKET, C.ASSUNTO_CHAMADO,' +
      ' C.FK_TIPO_TICKET,'#13#10'       (select TT.DESCRICAO'#13#10'        from TI' +
      'CKET_TIPO TT'#13#10'        where TT.ID = C.FK_TIPO_TICKET) as TIPOCHA' +
      'MADO, C.TEMPO'#13#10'from CONTROLE C'#13#10'where C.FK_TIPO_TICKET not in (1' +
      ', 4) and'#13#10'      C.FK_CLIENTE not in (158) and C.DATA between '#39'11' +
      '/01/2019'#39' and '#39'11/29/2019'#39'  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 424
    Top = 80
  end
  object dspFechamentoNovo: TDataSetProvider
    DataSet = dsFechamentoNovo
    Left = 420
    Top = 136
  end
  object cdsFechamentoNovo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFechamentoNovo'
    Left = 424
    Top = 192
    object cdsFechamentoNovoFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Required = True
    end
    object cdsFechamentoNovoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ReadOnly = True
      Size = 83
    end
    object cdsFechamentoNovoFK_CLIENTE_TIPO: TIntegerField
      FieldName = 'FK_CLIENTE_TIPO'
      ReadOnly = True
      Required = True
    end
    object cdsFechamentoNovoTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      ReadOnly = True
      Size = 50
    end
    object cdsFechamentoNovoTICKET: TStringField
      FieldName = 'TICKET'
      ReadOnly = True
      Required = True
      Size = 25
    end
    object cdsFechamentoNovoASSUNTO_CHAMADO: TStringField
      FieldName = 'ASSUNTO_CHAMADO'
      ReadOnly = True
      Size = 200
    end
    object cdsFechamentoNovoFK_TIPO_TICKET: TIntegerField
      FieldName = 'FK_TIPO_TICKET'
      ReadOnly = True
    end
    object cdsFechamentoNovoTIPOCHAMADO: TStringField
      FieldName = 'TIPOCHAMADO'
      ReadOnly = True
      Size = 50
    end
    object cdsFechamentoNovoTEMPO: TStringField
      FieldName = 'TEMPO'
      ReadOnly = True
      Required = True
      Size = 6
    end
  end
  object dsRel_Periodo: TSQLDataSet
    CommandText = 'select * from REL_CHAMADOS_FI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 552
    Top = 80
  end
  object cdsRel_Periodo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Periodo'
    Left = 552
    Top = 192
    object cdsRel_PeriodoSERVICO_NOME: TStringField
      FieldName = 'SERVICO_NOME'
      Size = 250
    end
    object cdsRel_PeriodoCRIADOS: TIntegerField
      FieldName = 'CRIADOS'
    end
    object cdsRel_PeriodoUNCLASSIFIED: TIntegerField
      FieldName = 'UNCLASSIFIED'
    end
    object cdsRel_PeriodoINCIDENTE: TIntegerField
      FieldName = 'INCIDENTE'
    end
    object cdsRel_PeriodoPROBLEMA: TIntegerField
      FieldName = 'PROBLEMA'
    end
    object cdsRel_PeriodoMELHORIA: TIntegerField
      FieldName = 'MELHORIA'
    end
    object cdsRel_PeriodoTREINAMENTO: TIntegerField
      FieldName = 'TREINAMENTO'
    end
    object cdsRel_PeriodoDADOS: TIntegerField
      FieldName = 'DADOS'
    end
    object cdsRel_PeriodoTREINAMENTOONLINE: TIntegerField
      FieldName = 'TREINAMENTOONLINE'
    end
    object cdsRel_PeriodoINSTALACAO: TIntegerField
      FieldName = 'INSTALACAO'
    end
    object cdsRel_PeriodoCRIADO_AB: TIntegerField
      FieldName = 'CRIADO_AB'
    end
    object cdsRel_PeriodoUNCLASSIFIED_AB: TIntegerField
      FieldName = 'UNCLASSIFIED_AB'
    end
    object cdsRel_PeriodoINCIDENTE_AB: TIntegerField
      FieldName = 'INCIDENTE_AB'
    end
    object cdsRel_PeriodoPROBLEMA_AB: TIntegerField
      FieldName = 'PROBLEMA_AB'
    end
    object cdsRel_PeriodoMELHORIA_AB: TIntegerField
      FieldName = 'MELHORIA_AB'
    end
    object cdsRel_PeriodoTREINAMENTO_AB: TIntegerField
      FieldName = 'TREINAMENTO_AB'
    end
    object cdsRel_PeriodoDADOS_AB: TIntegerField
      FieldName = 'DADOS_AB'
    end
    object cdsRel_PeriodoTREINAMENTOONLINE_AB: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB'
    end
    object cdsRel_PeriodoINSTALACAO_AB: TIntegerField
      FieldName = 'INSTALACAO_AB'
    end
    object cdsRel_PeriodoDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object cdsRel_PeriodoDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
  end
  object dspRel_Periodo: TDataSetProvider
    DataSet = dsRel_Periodo
    Left = 552
    Top = 136
  end
  object dsRel_Anual_Todos: TSQLDataSet
    CommandText = 
      'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE,' +
      ' PROBLEMA, MELHORIA, TREINAMENTO, DADOS,'#13#10'               TREINAM' +
      'ENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, INCIDENTE_AB' +
      ', PROBLEMA_AB, MELHORIA_AB,'#13#10'               TREINAMENTO_AB, DADO' +
      'S_AB, TREINAMENTOONLINE_AB, DADOS_AB, TREINAMENTOONLINE_AB, INST' +
      'ALACAO_AB,'#13#10'               ANO_SELECIONADO'#13#10'from REL_CHAMADOS_FI' +
      '_ANO'#13#10'where ANO_SELECIONADO = 12/01/2019 and  CRIADOS <> 0'#13#10'orde' +
      'r by CRIADOS desc  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 680
    Top = 80
  end
  object dsRel_Anual_Abertos: TSQLDataSet
    CommandText = 
      'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE,' +
      ' PROBLEMA, MELHORIA, TREINAMENTO, DADOS,'#13#10'               TREINAM' +
      'ENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, INCIDENTE_AB' +
      ', PROBLEMA_AB, MELHORIA_AB,'#13#10'               TREINAMENTO_AB, DADO' +
      'S_AB, TREINAMENTOONLINE_AB, DADOS_AB, TREINAMENTOONLINE_AB, INST' +
      'ALACAO_AB,'#13#10'               ANO_SELECIONADO'#13#10'from REL_CHAMADOS_FI' +
      '_ANO'#13#10'where ANO_SELECIONADO = 12/01/2019 and  CRIADOS <> 0'#13#10'orde' +
      'r by CRIADOS desc  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 800
    Top = 80
  end
  object dspRel_Anual_Todos: TDataSetProvider
    DataSet = dsRel_Anual_Todos
    Left = 680
    Top = 136
  end
  object dspRel_Anual_Abertos: TDataSetProvider
    DataSet = dsRel_Anual_Abertos
    Left = 800
    Top = 136
  end
  object cdsRel_Anual_Todos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Anual_Todos'
    Left = 680
    Top = 192
    object cdsRel_Anual_TodosSERVICO_NOME: TStringField
      FieldName = 'SERVICO_NOME'
      Size = 250
    end
    object cdsRel_Anual_TodosCRIADOS: TIntegerField
      FieldName = 'CRIADOS'
    end
    object cdsRel_Anual_TodosUNCLASSIFIED: TIntegerField
      FieldName = 'UNCLASSIFIED'
    end
    object cdsRel_Anual_TodosINCIDENTE: TIntegerField
      FieldName = 'INCIDENTE'
    end
    object cdsRel_Anual_TodosPROBLEMA: TIntegerField
      FieldName = 'PROBLEMA'
    end
    object cdsRel_Anual_TodosMELHORIA: TIntegerField
      FieldName = 'MELHORIA'
    end
    object cdsRel_Anual_TodosTREINAMENTO: TIntegerField
      FieldName = 'TREINAMENTO'
    end
    object cdsRel_Anual_TodosDADOS: TIntegerField
      FieldName = 'DADOS'
    end
    object cdsRel_Anual_TodosTREINAMENTOONLINE: TIntegerField
      FieldName = 'TREINAMENTOONLINE'
    end
    object cdsRel_Anual_TodosINSTALACAO: TIntegerField
      FieldName = 'INSTALACAO'
    end
    object cdsRel_Anual_TodosCRIADO_AB: TIntegerField
      FieldName = 'CRIADO_AB'
    end
    object cdsRel_Anual_TodosUNCLASSIFIED_AB: TIntegerField
      FieldName = 'UNCLASSIFIED_AB'
    end
    object cdsRel_Anual_TodosINCIDENTE_AB: TIntegerField
      FieldName = 'INCIDENTE_AB'
    end
    object cdsRel_Anual_TodosPROBLEMA_AB: TIntegerField
      FieldName = 'PROBLEMA_AB'
    end
    object cdsRel_Anual_TodosMELHORIA_AB: TIntegerField
      FieldName = 'MELHORIA_AB'
    end
    object cdsRel_Anual_TodosTREINAMENTO_AB: TIntegerField
      FieldName = 'TREINAMENTO_AB'
    end
    object cdsRel_Anual_TodosDADOS_AB: TIntegerField
      FieldName = 'DADOS_AB'
    end
    object cdsRel_Anual_TodosTREINAMENTOONLINE_AB: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB'
    end
    object cdsRel_Anual_TodosDADOS_AB_1: TIntegerField
      FieldName = 'DADOS_AB_1'
    end
    object cdsRel_Anual_TodosTREINAMENTOONLINE_AB_1: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB_1'
    end
    object cdsRel_Anual_TodosINSTALACAO_AB: TIntegerField
      FieldName = 'INSTALACAO_AB'
    end
    object cdsRel_Anual_TodosANO_SELECIONADO: TIntegerField
      FieldName = 'ANO_SELECIONADO'
    end
  end
  object cdsRel_Anual_Abertos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Anual_Abertos'
    Left = 800
    Top = 192
    object cdsRel_Anual_AbertosSERVICO_NOME: TStringField
      FieldName = 'SERVICO_NOME'
      Size = 250
    end
    object cdsRel_Anual_AbertosCRIADOS: TIntegerField
      FieldName = 'CRIADOS'
    end
    object cdsRel_Anual_AbertosUNCLASSIFIED: TIntegerField
      FieldName = 'UNCLASSIFIED'
    end
    object cdsRel_Anual_AbertosINCIDENTE: TIntegerField
      FieldName = 'INCIDENTE'
    end
    object cdsRel_Anual_AbertosPROBLEMA: TIntegerField
      FieldName = 'PROBLEMA'
    end
    object cdsRel_Anual_AbertosMELHORIA: TIntegerField
      FieldName = 'MELHORIA'
    end
    object cdsRel_Anual_AbertosTREINAMENTO: TIntegerField
      FieldName = 'TREINAMENTO'
    end
    object cdsRel_Anual_AbertosDADOS: TIntegerField
      FieldName = 'DADOS'
    end
    object cdsRel_Anual_AbertosTREINAMENTOONLINE: TIntegerField
      FieldName = 'TREINAMENTOONLINE'
    end
    object cdsRel_Anual_AbertosINSTALACAO: TIntegerField
      FieldName = 'INSTALACAO'
    end
    object cdsRel_Anual_AbertosCRIADO_AB: TIntegerField
      FieldName = 'CRIADO_AB'
    end
    object cdsRel_Anual_AbertosUNCLASSIFIED_AB: TIntegerField
      FieldName = 'UNCLASSIFIED_AB'
    end
    object cdsRel_Anual_AbertosINCIDENTE_AB: TIntegerField
      FieldName = 'INCIDENTE_AB'
    end
    object cdsRel_Anual_AbertosPROBLEMA_AB: TIntegerField
      FieldName = 'PROBLEMA_AB'
    end
    object cdsRel_Anual_AbertosMELHORIA_AB: TIntegerField
      FieldName = 'MELHORIA_AB'
    end
    object cdsRel_Anual_AbertosTREINAMENTO_AB: TIntegerField
      FieldName = 'TREINAMENTO_AB'
    end
    object cdsRel_Anual_AbertosDADOS_AB: TIntegerField
      FieldName = 'DADOS_AB'
    end
    object cdsRel_Anual_AbertosTREINAMENTOONLINE_AB: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB'
    end
    object cdsRel_Anual_AbertosDADOS_AB_1: TIntegerField
      FieldName = 'DADOS_AB_1'
    end
    object cdsRel_Anual_AbertosTREINAMENTOONLINE_AB_1: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB_1'
    end
    object cdsRel_Anual_AbertosINSTALACAO_AB: TIntegerField
      FieldName = 'INSTALACAO_AB'
    end
    object cdsRel_Anual_AbertosANO_SELECIONADO: TIntegerField
      FieldName = 'ANO_SELECIONADO'
    end
  end
  object dsRel_PeriodoAberto: TSQLDataSet
    CommandText = 'select * from REL_CHAMADOS_FI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 280
    Top = 264
  end
  object cdsRel_PeriodoAberto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_PeriodoAberto'
    Left = 280
    Top = 376
    object StringField1: TStringField
      FieldName = 'SERVICO_NOME'
      Size = 250
    end
    object IntegerField1: TIntegerField
      FieldName = 'CRIADOS'
    end
    object IntegerField2: TIntegerField
      FieldName = 'UNCLASSIFIED'
    end
    object IntegerField3: TIntegerField
      FieldName = 'INCIDENTE'
    end
    object IntegerField4: TIntegerField
      FieldName = 'PROBLEMA'
    end
    object IntegerField5: TIntegerField
      FieldName = 'MELHORIA'
    end
    object IntegerField6: TIntegerField
      FieldName = 'TREINAMENTO'
    end
    object IntegerField7: TIntegerField
      FieldName = 'DADOS'
    end
    object IntegerField8: TIntegerField
      FieldName = 'TREINAMENTOONLINE'
    end
    object IntegerField9: TIntegerField
      FieldName = 'INSTALACAO'
    end
    object IntegerField10: TIntegerField
      FieldName = 'CRIADO_AB'
    end
    object IntegerField11: TIntegerField
      FieldName = 'UNCLASSIFIED_AB'
    end
    object IntegerField12: TIntegerField
      FieldName = 'INCIDENTE_AB'
    end
    object IntegerField13: TIntegerField
      FieldName = 'PROBLEMA_AB'
    end
    object IntegerField14: TIntegerField
      FieldName = 'MELHORIA_AB'
    end
    object IntegerField15: TIntegerField
      FieldName = 'TREINAMENTO_AB'
    end
    object IntegerField16: TIntegerField
      FieldName = 'DADOS_AB'
    end
    object IntegerField17: TIntegerField
      FieldName = 'TREINAMENTOONLINE_AB'
    end
    object IntegerField18: TIntegerField
      FieldName = 'INSTALACAO_AB'
    end
    object DateField1: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object DateField2: TDateField
      FieldName = 'DATA_FINAL'
    end
  end
  object dspRel_PeriodoAberto: TDataSetProvider
    DataSet = dsRel_PeriodoAberto
    Left = 280
    Top = 320
  end
  object dsRelatorioOTRS_AbertosGeral: TSQLDataSet
    CommandText = 'select * from REL_ABERTOS_GERAL_OTRS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 104
    Top = 264
  end
  object dspRelatorioOTRS_AbertosGeral: TDataSetProvider
    DataSet = dsRelatorioOTRS_AbertosGeral
    Left = 104
    Top = 320
  end
  object cdsRelatorioOTRS_AbertosGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorioOTRS_AbertosGeral'
    Left = 104
    Top = 376
    object cdsRelatorioOTRS_AbertosGeralID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRelatorioOTRS_AbertosGeralANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsRelatorioOTRS_AbertosGeralMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsRelatorioOTRS_AbertosGeralDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsRelatorioOTRS_AbertosGeralTICKET: TStringField
      FieldName = 'TICKET'
      Size = 50
    end
    object cdsRelatorioOTRS_AbertosGeralASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 250
    end
    object cdsRelatorioOTRS_AbertosGeralCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object cdsRelatorioOTRS_AbertosGeralANALISTA: TStringField
      FieldName = 'ANALISTA'
      Size = 50
    end
    object cdsRelatorioOTRS_AbertosGeralSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 30
    end
    object cdsRelatorioOTRS_AbertosGeralTIPOCHAMADO: TStringField
      FieldName = 'TIPOCHAMADO'
      Size = 30
    end
    object cdsRelatorioOTRS_AbertosGeralBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 30
    end
    object cdsRelatorioOTRS_AbertosGeralIDSERVICO: TIntegerField
      FieldName = 'IDSERVICO'
    end
    object cdsRelatorioOTRS_AbertosGeralSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 250
    end
    object cdsRelatorioOTRS_AbertosGeralFILA: TStringField
      FieldName = 'FILA'
      Size = 150
    end
  end
  object dsRel_Abertos_Fila: TSQLDataSet
    CommandText = 'select *  from REL_ABERTOS_GERAL_POR_FILA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 424
    Top = 264
  end
  object dspRel_Abertos_Fila: TDataSetProvider
    DataSet = dsRel_Abertos_Fila
    Left = 424
    Top = 320
  end
  object cdsRel_Abertos_Fila: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Abertos_Fila'
    Left = 424
    Top = 376
    object cdsRel_Abertos_FilaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRel_Abertos_FilaDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsRel_Abertos_FilaMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsRel_Abertos_FilaANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsRel_Abertos_FilaID_CHAMADO: TIntegerField
      FieldName = 'ID_CHAMADO'
    end
    object cdsRel_Abertos_FilaCHAMADO: TStringField
      FieldName = 'CHAMADO'
      Size = 30
    end
    object cdsRel_Abertos_FilaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 50
    end
    object cdsRel_Abertos_FilaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 100
    end
    object cdsRel_Abertos_FilaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 50
    end
    object cdsRel_Abertos_FilaFILA: TStringField
      FieldName = 'FILA'
      Size = 100
    end
    object cdsRel_Abertos_FilaCLIENTE_ID: TStringField
      FieldName = 'CLIENTE_ID'
      Size = 30
    end
    object cdsRel_Abertos_FilaCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 100
    end
    object cdsRel_Abertos_FilaANALISTA: TStringField
      FieldName = 'ANALISTA'
      Size = 100
    end
  end
  object dsRel_QtdeAnalistas: TSQLDataSet
    CommandText = 'select *  from REL_ANALISTA_QTDE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 552
    Top = 264
  end
  object dspRel_QtdeAnalistas: TDataSetProvider
    DataSet = dsRel_QtdeAnalistas
    Left = 552
    Top = 320
  end
  object cdsRel_QtdeAnalistas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_QtdeAnalistas'
    Left = 552
    Top = 376
    object cdsRel_QtdeAnalistasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRel_QtdeAnalistasID_ANALISTA: TIntegerField
      FieldName = 'ID_ANALISTA'
    end
    object cdsRel_QtdeAnalistasLOGIN_ANALISTA: TStringField
      FieldName = 'LOGIN_ANALISTA'
      Size = 100
    end
    object cdsRel_QtdeAnalistasQTDE_BLOQUEADO: TIntegerField
      FieldName = 'QTDE_BLOQUEADO'
    end
    object cdsRel_QtdeAnalistasQTDE_DESBLOQUEADO: TIntegerField
      FieldName = 'QTDE_DESBLOQUEADO'
    end
    object cdsRel_QtdeAnalistasQTDE_TOTAL: TIntegerField
      FieldName = 'QTDE_TOTAL'
    end
    object cdsRel_QtdeAnalistasQTDE_MELHORIA_TIPO: TIntegerField
      FieldName = 'QTDE_MELHORIA_TIPO'
    end
    object cdsRel_QtdeAnalistasQTDE_MELHORIA_FILA: TIntegerField
      FieldName = 'QTDE_MELHORIA_FILA'
    end
  end
  object dsRel_QtdeAnalistasDet: TSQLDataSet
    CommandText = 'select *  from REL_ANALISTA_QTDE_DET'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cn
    Left = 696
    Top = 264
  end
  object dspRel_QtdeAnalistasDet: TDataSetProvider
    DataSet = dsRel_QtdeAnalistasDet
    Left = 696
    Top = 320
  end
  object cdsRel_QtdeAnalistasDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_QtdeAnalistasDet'
    Left = 696
    Top = 376
    object cdsRel_QtdeAnalistasDetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRel_QtdeAnalistasDetCHAMADO: TStringField
      FieldName = 'CHAMADO'
      Size = 100
    end
    object cdsRel_QtdeAnalistasDetASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 250
    end
    object cdsRel_QtdeAnalistasDetID_CLIENTE: TStringField
      FieldName = 'ID_CLIENTE'
      Size = 100
    end
    object cdsRel_QtdeAnalistasDetNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 200
    end
    object cdsRel_QtdeAnalistasDetFILA: TStringField
      FieldName = 'FILA'
      Size = 100
    end
    object cdsRel_QtdeAnalistasDetTIPO: TStringField
      FieldName = 'TIPO'
      Size = 100
    end
    object cdsRel_QtdeAnalistasDetANALISTA: TStringField
      FieldName = 'ANALISTA'
      Size = 100
    end
  end
end
