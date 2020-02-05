unit uRelatorioClientesParcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TfrmRelatorioClientesParcial = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edDataInicial: TMaskEdit;
    edDataFinal: TMaskEdit;
    Label2: TLabel;
    cbCliente: TComboBox;
    btGerarRelatorio: TBitBtn;
    btVoltar: TBitBtn;
    btParcialHoras: TBitBtn;
    Label3: TLabel;
    procedure btVoltarClick(Sender: TObject);
    procedure btGerarRelatorioClick(Sender: TObject);
    procedure btParcialHorasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function f_CarregarDadosClientes():Boolean;
  end;

var
  frmRelatorioClientesParcial: TfrmRelatorioClientesParcial;

implementation
  uses uDmDados, uRelatorioParcial_Horas, DB, uRelatorioParcialClientesForm, Math;
  
{$R *.dfm}

procedure TfrmRelatorioClientesParcial.btVoltarClick(Sender: TObject);
begin
  Close;
end;

function TfrmRelatorioClientesParcial.f_CarregarDadosClientes: Boolean;
var
  qSql  : String;
  Status  : String;
begin
  Status  :=  'A';
  qSql  :=  '';
  qSql  :=  'SELECT DISTINCT(C.fk_cliente) AS IDCLIENTE, CS.login as LOGIN, CS.nomecliente AS CLIENTE, CST.descricao as TIPOCLIENTE ';
  qSql  :=  qSql  + 'FROM CONTROLE C ';
  qSql  :=  qSql  + 'JOIN CLIENTES CS ON CS.id = C.fk_cliente ';
  qSql  :=  qSql  + 'JOIN CLIENTES_TIPO CST ON CST.id = CS.fk_clientes_tipo ';
  qSql  :=  qSql  + 'where CS.STATUS = '+QuotedStr(Status);
//  qSql  :=  qSql  + 'GROUP BY 1,2,3 ';
  qSql  :=  qSql  + 'ORDER BY TIPOCLIENTE ASC ';

  dmDados.dsGetDados.CommandText  :=  '';
  dmDados.dsGetDados.CommandText  :=  qSql;
  dmDados.dsGetDados.Open;
  dmDados.dsGetDados.First;

  while not dmDados.dsGetDados.Eof do
    begin
      cbCliente.Items.Add(dmDados.dsGetDados.FieldByName('LOGIN').AsString);
      dmDados.dsGetDados.Next;
    end;
  dmDados.dsGetDados.Close;
  result  :=  True;
end;

procedure TfrmRelatorioClientesParcial.btGerarRelatorioClick(
  Sender: TObject);
var
  qSql                                      : String;
  DataAux                                   : TDate;
  DataIni, DataFim                          : String;
  DataIni_1, DataFim_1                      : String;
  Status                                    : String;
  qtdMelhoria, qtdTreinamento               : Integer;
  qtdSpATD, qtdSpEmer                       : Integer;
  qtdBug, qtdDuvida                         : integer;
  qtdTotal                                  : Integer;
  qAuxPorcentagem                           : Real;
  HoraBug, MinutoBug                        : Integer;
  HoraDuvida, MinutoDuvida                  : Integer;
  HoraMelhoria, MinutoMelhoria              : Integer;
  HoraTreinamento, MinutoTreinamento        : Integer;
  HoraSPAT, MinutoSPAT                      : Integer;
  HoraSPEMER, MinutoSPEMER                  : Integer;
  TempoBugFix, TempoDuvida, TempoMelhoria   : String;
  TempoTreinamento, TempoSPAT, TempoSPEMER  : String;
  TempoTotalUtilizado                       : String;
  TempoTotalHoras, TempoTotalMinutos        : Integer;
begin
  Status  :=  'A';
  DataAux :=  StrToDate(edDataInicial.Text);
  DataIni :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux :=  null;
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFim :=  FormatDateTime('MM/DD/YYYY', DataAux);

  qSql  :=  '';
  qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE, ';
  qSql  :=  qSql  + '(select CLS.NOMECLIENTE ';
  qSql  :=  qSql  + 'from CLIENTES CLS ';
  qSql  :=  qSql  + 'where CLS.ID = C.FK_CLIENTE and ';
  qSql  :=  qSql  + 'CLS.STATUS = '+QuotedStr(Status)+') as NOMECLIENTE, ';
  qSql  :=  qSql  + '(select CTO.DESCRICAO ';
  qSql  :=  qSql  + 'from CLIENTES_TIPO CTO ';
  qSql  :=  qSql  + 'where CTO.ID = C.FK_CLIENTE_TIPO) as TIPOCLIENTE, ';
  qSql  :=  qSql  + '(select count(C1.ID) ';
  qSql  :=  qSql  + 'from CONTROLE C1 ';
  qSql  :=  qSql  + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql  + 'C1.FK_TIPO_TICKET = 2) as ME, '; //MELHORIA
  qSql  :=  qSql  + '(select count(C2.ID) ';
  qSql  :=  qSql  + 'from CONTROLE C2 ';
  qSql  :=  qSql  + 'where C2.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql  + 'C2.FK_TIPO_TICKET = 3) as TR, '; //TREINAMENTO
  qSql  :=  qSql  + '(select count(C3.ID) ';
  qSql  :=  qSql  + 'from CONTROLE C3 ';
  qSql  :=  qSql  + 'where C3.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql  + 'C3.FK_TIPO_TICKET = 5) as SPAT, ';  //SUPORTE ATENDIMENTO
  qSql  :=  qSql  + '(select count(C4.ID) ';
  qSql  :=  qSql  + 'from CONTROLE C4 ';
  qSql  :=  qSql  + 'where C4.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql  + 'C4.FK_TIPO_TICKET = 6) as SPEMER '; //SUPORTE EMERGENCIA
  qSql  :=  qSql  + 'from CONTROLE C ';
  qSql  :=  qSql  + 'where C.DATA between '+QuotedStr(DataIni)+' and '+QuotedStr(DataFim)+' ';
  qSql  :=  qSql  + 'order by TIPOCLIENTE, NOMECLIENTE asc';

  dmDados.dsRelParcialCli.CommandText :=  '';
  dmDados.dsRelParcialCli.CommandText :=  qSql;

  dmDados.dsGetDados.CommandText      :=  '';
  dmDados.dsGetDados.CommandText      :=  qSql;
  dmDados.dsGetDados.Close;
  dmDados.dsGetDados.Open;
  dmDados.dsGetDados.First;
  qtdMelhoria     :=  0;
  qtdTreinamento  :=  0;
  qtdSpATD        :=  0;
  qtdSpEmer       :=  0;

  with dmDados.dsGetDados do
    begin
      while not Eof do
        begin
          qtdMelhoria     :=  qtdMelhoria + FieldByName('ME').AsInteger;
          qtdTreinamento  :=  qtdTreinamento + FieldByName('TR').AsInteger;
          qtdSpATD        :=  qtdSpATD + FieldByName('SPAT').AsInteger;
          qtdSpEmer       :=  qtdSpEmer + FieldByName('SPEMER').AsInteger;
          Next;
        end;
    end;

  DataAux :=  StrToDate(edDataInicial.Text);
  DataIni :=  FormatDateTime('DD/MM/YYYY', DataAux);
  DataAux :=  null;
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFim :=  FormatDateTime('DD/MM/YYYY', DataAux);

  frmRelatorioParcialClientes.qrPeriodo.Caption :=  DataIni+' � '+DataFim;
  qtdTotal  :=  0;
  qtdTotal  :=  qtdMelhoria + qtdTreinamento  + qtdSpATD  + qtdSpEmer;

  if (qtdMelhoria < 10) then
    frmRelatorioParcialClientes.qrMelhoria.Caption          :=  '00'+IntToStr(qtdMelhoria);
  if (qtdMelhoria > 9) and (qtdMelhoria < 100) then
    frmRelatorioParcialClientes.qrMelhoria.Caption          :=  '0'+IntToStr(qtdMelhoria);
  if (qtdMelhoria > 99) then
    frmRelatorioParcialClientes.qrMelhoria.Caption          :=  IntToStr(qtdMelhoria);

  if (qtdTreinamento < 10) then
    frmRelatorioParcialClientes.qrTreinamento.Caption       :=  '00'+IntToStr(qtdTreinamento);
  if (qtdMelhoria > 9) and (qtdMelhoria < 100) then
    frmRelatorioParcialClientes.qrTreinamento.Caption       :=  '0'+IntToStr(qtdTreinamento);
  if (qtdMelhoria > 99) then
    frmRelatorioParcialClientes.qrTreinamento.Caption       :=  IntToStr(qtdTreinamento);

  if (qtdSpATD < 10) then
    frmRelatorioParcialClientes.qrSuporteAT.Caption         :=  '00'+IntToStr(qtdSpATD);
  if (qtdSpATD > 9) and (qtdSpATD < 100) then
    frmRelatorioParcialClientes.qrSuporteAT.Caption         :=  '0'+IntToStr(qtdSpATD);
  if (qtdSpATD > 99) then
    frmRelatorioParcialClientes.qrSuporteAT.Caption         :=  IntToStr(qtdSpATD);

  if (qtdSpEmer < 10) then
    frmRelatorioParcialClientes.qrSuporteEmer.Caption     :=  '00'+IntToStr(qtdSpEmer);
  if (qtdSpEmer > 9) and (qtdSpEmer < 100) then
    frmRelatorioParcialClientes.qrSuporteEmer.Caption     :=  '0'+IntToStr(qtdSpEmer);
  if (qtdSpEmer > 99) then
    frmRelatorioParcialClientes.qrSuporteEmer.Caption     :=  IntToStr(qtdSpEmer);

  if (qtdTotal < 10) then
    frmRelatorioParcialClientes.qrQuantidadeTotal.Caption :=  '00'+IntToStr(qtdTotal);
  if (qtdTotal > 9) and (qtdTotal < 100) then
    frmRelatorioParcialClientes.qrQuantidadeTotal.Caption :=  '0'+IntToStr(qtdTotal);
  if (qtdTotal > 99) then
    frmRelatorioParcialClientes.qrQuantidadeTotal.Caption :=  IntToStr(qtdTotal);

  dmDados.dsGetDados.Close;

  //Adicionando Porcentagens
  with frmRelatorioParcialClientes do
    begin
      qAuxPorcentagem   :=  0;
      qAuxPorcentagem   :=  RoundTo(((qtdMelhoria/qtdTotal)*100),-2);
      qrPorcMelhoria.Caption :=  FloatToStr(qAuxPorcentagem)+'%';

      qAuxPorcentagem   :=  0;
      qAuxPorcentagem   :=  RoundTo(((qtdTreinamento/qtdTotal)*100),-2);
      qrPorcTreinamento.Caption :=  FloatToStr(qAuxPorcentagem)+'%';

      qAuxPorcentagem   :=  0;
      qAuxPorcentagem   :=  RoundTo(((qtdSpATD/qtdTotal)*100),-2);
      qrPorcSPAT.Caption :=  FloatToStr(qAuxPorcentagem)+'%';

      qAuxPorcentagem   :=  0;
      qAuxPorcentagem   :=  RoundTo(((qtdSpEmer/qtdTotal)*100),-2);
      qrPorcSPEMER.Caption :=  FloatToStr(qAuxPorcentagem)+'%';
    end;

  DataAux :=  StrToDate(edDataInicial.Text);
  DataIni_1 :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux :=  null;
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFim_1 :=  FormatDateTime('MM/DD/YYYY', DataAux);

  //Adicionado Totalizador de Horario
  dmDados.dsGetDados.CommandText  :=  '';
  qSql  :=  '';
  qSql  :=  'select C.FK_CLIENTE as IDCLIENTE, C.FK_CLIENTE_TIPO as IDTIPOCLIENTE, C.FK_TIPO_TICKET as IDTIPOCHAMADO, C.TEMPO as TEMPO ';
  qSql  :=  qSql  + 'from CONTROLE C ';
  qSql  :=  qSql  + 'where C.DATA between '+QuotedStr(DataIni_1)+' and '+QuotedStr(DataFim_1);
  dmDados.dsGetDados.CommandText  :=  qSql;
  dmDados.dsGetDados.Open;
  dmDados.dsGetDados.First;

  HoraBug           :=  0;
  MinutoBug         :=  0;
  HoraDuvida        :=  0;
  MinutoDuvida      :=  0;
  HoraMelhoria      :=  0;
  MinutoMelhoria    :=  0;
  HoraTreinamento   :=  0;
  MinutoTreinamento :=  0;
  HoraSPAT          :=  0;
  MinutoSPAT        :=  0;
  HoraSPEMER        :=  0;
  MinutoSPEMER      :=  0;
  TempoTotalHoras   :=  0;
  TempoTotalMinutos :=  0;

  While Not dmDados.dsGetDados.Eof do
    begin
      if (dmDados.dsGetDados.FieldByName('IDTIPOCHAMADO').AsInteger = 2) then //Melhoria
        begin
          HoraMelhoria   :=  HoraMelhoria   + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,1,2));
          MinutoMelhoria :=  MinutoMelhoria + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,4,2));
          if (MinutoMelhoria > 59) then
            begin
              HoraMelhoria :=  HoraMelhoria + 1;
              MinutoMelhoria :=  MinutoMelhoria - 60;
            end;
        end;

      if (dmDados.dsGetDados.FieldByName('IDTIPOCHAMADO').AsInteger = 3) then //Treinamento
        begin
          HoraTreinamento   :=  HoraTreinamento   + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,1,2));
          MinutoTreinamento :=  MinutoTreinamento + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,4,2));
          if (MinutoTreinamento > 59) then
            begin
              HoraTreinamento   :=  HoraTreinamento + 1;
              MinutoTreinamento :=  MinutoTreinamento - 60;
            end;
        end;

      if (dmDados.dsGetDados.FieldByName('IDTIPOCHAMADO').AsInteger = 5) then //SPAT
        begin
          HoraSPAT   :=  HoraSPAT   + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,1,2));
          MinutoSPAT :=  MinutoSPAT + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,4,2));
          if (MinutoSPAT > 59) then
            begin
              HoraSPAT   :=  HoraSPAT + 1;
              MinutoSPAT :=  MinutoSPAT - 60;
            end;
        end;

      if (dmDados.dsGetDados.FieldByName('IDTIPOCHAMADO').AsInteger = 6) then //SPEMER
        begin
          HoraSPEMER   :=  HoraSPEMER   + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,1,2));
          MinutoSPEMER :=  MinutoSPEMER + StrToInt(Copy(dmDados.dsGetDados.FieldByName('TEMPO').AsString,4,2));
          if (MinutoSPEMER > 59) then
            begin
              HoraSPEMER   :=  HoraSPEMER + 1;
              MinutoSPEMER :=  MinutoSPEMER - 60;
            end;
        end;
      dmDados.dsGetDados.Next;
    end;
  dmDados.dsGetDados.Close;

  //TempoMelhoria
  if (HoraMelhoria < 10) then
	  TempoMelhoria  :=  '00'+IntToStr(HoraMelhoria);
  if (HoraMelhoria > 9) and (HoraMelhoria < 100) then
	  TempoMelhoria  :=  '0'+IntToStr(HoraMelhoria);
  if (HoraMelhoria > 99) then
	  TempoMelhoria  :=  IntToStr(HoraMelhoria);
  if (MinutoMelhoria < 10) then
	  TempoMelhoria  :=  TempoMelhoria+':0'+IntToStr(MinutoMelhoria);
  if (MinutoMelhoria > 9) then
  	TempoMelhoria  :=  TempoMelhoria+':'+IntToStr(MinutoMelhoria);
  frmRelatorioParcialClientes.qrTempoMelhoria.Caption  :=  TempoMelhoria;

  //TempoTreinamento
  if (HoraTreinamento < 10) then
	  TempoTreinamento  :=  '00'+IntToStr(HoraTreinamento);
  if (HoraTreinamento > 9) and (HoraTreinamento < 100) then
	  TempoTreinamento  :=  '0'+IntToStr(HoraTreinamento);
  if (HoraTreinamento > 99) then
	  TempoTreinamento  :=  IntToStr(HoraTreinamento);
  if (MinutoTreinamento < 10) then
	  TempoTreinamento  :=  TempoTreinamento+':0'+IntToStr(MinutoTreinamento);
  if (MinutoTreinamento > 9) then
  	TempoTreinamento  :=  TempoTreinamento+':'+IntToStr(MinutoTreinamento);
  frmRelatorioParcialClientes.qrTempoTreinamento.Caption  :=  TempoTreinamento;

  //TempoSPAT
  if (HoraSPAT < 10) then
	  TempoSPAT  :=  '00'+IntToStr(HoraSPAT);
  if (HoraSPAT > 9) and (HoraSPAT < 100) then
	  TempoSPAT  :=  '0'+IntToStr(HoraSPAT);
  if (HoraSPAT > 99) then
	  TempoSPAT  :=  IntToStr(HoraSPAT);
  if (MinutoSPAT < 10) then
	  TempoSPAT  :=  TempoSPAT+':0'+IntToStr(MinutoSPAT);
  if (MinutoSPAT > 9) then
  	TempoSPAT  :=  TempoSPAT+':'+IntToStr(MinutoSPAT);
  frmRelatorioParcialClientes.qrTempoSPAT.Caption  :=  TempoSPAT;

  //TempoSPEMER
  if (HoraSPEMER < 10) then
	  TempoSPEMER  :=  '00'+IntToStr(HoraSPEMER);
  if (HoraSPEMER > 9) and (HoraSPEMER < 100) then
	  TempoSPEMER  :=  '0'+IntToStr(HoraSPEMER);
  if (HoraSPEMER > 99) then
	  TempoSPEMER  :=  IntToStr(HoraSPEMER);
  if (MinutoSPEMER < 10) then
	  TempoSPEMER  :=  TempoSPEMER+':0'+IntToStr(MinutoSPEMER);
  if (MinutoSPEMER > 9) then
  	TempoSPEMER  :=  TempoSPEMER+':'+IntToStr(MinutoSPEMER);
  frmRelatorioParcialClientes.qrTempoSPEMER.Caption  :=  TempoSPEMER;

  //TempoTotalUtilizado
  TempoTotalHoras   :=  HoraBug + HoraDuvida + HoraMelhoria + HoraTreinamento + HoraSPAT + HoraSPEMER;
  TempoTotalMinutos :=  MinutoBug + MinutoDuvida + MinutoMelhoria + MinutoTreinamento + MinutoSPAT + MinutoSPEMER;

  While TempoTotalMinutos > 59 do
    begin
      TempoTotalMinutos :=  TempoTotalMinutos - 60;
      TempoTotalHoras   :=  TempoTotalHoras + 1;
    end;

  if (TempoTotalHoras < 10) then
    TempoTotalUtilizado :=  '00'+IntToStr(TempoTotalHoras);
  if (TempoTotalHoras > 9) and (TempoTotalHoras < 100) then
    TempoTotalUtilizado :=  '0'+IntToStr(TempoTotalHoras);
  if (TempoTotalHoras > 99) then
    TempoTotalUtilizado :=  IntToStr(TempoTotalHoras);
  if (TempoTotalMinutos < 10) then
    TempoTotalUtilizado :=  TempoTotalUtilizado+':0'+IntToStr(TempoTotalMinutos);
  if (TempoTotalMinutos > 10) then
    TempoTotalUtilizado :=  TempoTotalUtilizado+':'+IntToStr(TempoTotalMinutos);
  frmRelatorioParcialClientes.qrTotalHorasUtilizado.Caption  :=  TempoTotalUtilizado;

  dmDados.cdsRelParcialCli.Open;
  frmRelatorioParcialClientes.QuickRep1.Preview;
  dmDados.cdsRelParcialCli.Close;

  edDataInicial.Clear;
  edDataFinal.Clear;
end;

procedure TfrmRelatorioClientesParcial.btParcialHorasClick(
  Sender: TObject);
var
  qSql        : String;
  qSql_2      : String;
  qSql_3      : String;
  qSql_4      : String;
  DataInicial : String;
  DataFinal   : String;
  DataAux     : TDate;
  TipoCliente : String;
  HoraAuxiliar, MinutoAuxiliar  : Integer;
  TempoAuxiliar : String;
  MelhoriaHoras, MelhoriaMinutos  : Integer;
  SuporteHoras, SuporteMinutos    : Integer;
  TreinamentoHoras, TreinamentoMinutos  : Integer;
  Melhoria, Suporte, Treinamento  : String;
  TotalHoras, TotalMinutos        : Integer;
  Total                           : String;
  CobrarHoras                     : String;
  CobrarHoras_Aux, CobrarMinutos_Aux  : Integer;
  Validador : Integer;
begin
  MelhoriaHoras       :=  0;
  MelhoriaMinutos     :=  0;
  TreinamentoHoras    :=  0;
  TreinamentoMinutos  :=  0;
  SuporteHoras        :=  0;
  SuporteMinutos      :=  0;
  TotalHoras          :=  0;
  TotalMinutos        :=  0;

  qSql_4  :=  '';
  qSql_4  :=  'delete from REL_PARCIAL_HORAS';
  dmDados.dsGetDados.CommandText  :=  '';
  dmDados.dsGetDados.CommandText  :=  qSql_4;
  dmDados.dsGetDados.ExecSQL();
  dmDados.dsGetDados.Close;

  DataAux :=  StrToDate(edDataInicial.Text);
  DataInicial :=  FormatDateTime('MM/DD/YYYY' , DataAux);
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFinal := FormatDateTime('MM/DD/YYYY', DataAux);

  qSql  :=  '';
  qSql  :=  'select C.FK_CLIENTE, ';
  qSql  :=  qSql + '(select CS.NOMECLIENTE ';
  qSql  :=  qSql + 'from CLIENTES CS ';
  qSql  :=  qSql + 'where CS.ID = C.FK_CLIENTE) as NOMECLIENTE, ';
  qSql  :=  qSql + 'sum(cast(substring(C.TEMPO from 1 for 2) as numeric)) as HORAS, ';
  qSql  :=  qSql + 'sum(cast(substring(C.TEMPO from 4 for 5) as numeric)) as MINUTOS, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 1 for 2) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET = 2 and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as HORASMELHORIA, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 4 for 5) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET = 2 and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as MINUTOSMELHORIA, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 1 for 2) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET = 3 and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as HORASTREINAMENTO, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 4 for 5) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET = 3 and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as MINUTOSTREINAMENTO, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 1 for 2) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET in (5, 6) and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as HORASSUPORTE, ';
  qSql  :=  qSql + '(select coalesce(sum(cast(substring(C1.TEMPO from 4 for 5) as numeric)),0) ';
  qSql  :=  qSql + 'from CONTROLE C1 ';
  qSql  :=  qSql + 'where C1.FK_CLIENTE = C.FK_CLIENTE and ';
  qSql  :=  qSql + 'C1.FK_TIPO_TICKET in (5, 6) and ';
  qSql  :=  qSql + 'C1.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+') as MINUTOSSUPORTE ';
  qSql  :=  qSql + 'from CONTROLE C ';
  qSql  :=  qSql + 'where C.FK_TIPO_TICKET in (2, 3, 5, 6) and ';
//  qSql  :=  qSql + 'C.FK_CLIENTE not in (158) and '; //FISISTEMAS
  qSql  :=  qSql + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal)+' ';
  qSql  :=  qSql + 'group by 1, 2';

  dmDados.dsAuxiliar.CommandText  :=  '';
  dmDados.dsAuxiliar.CommandText  :=  qSql;
  dmDados.dsAuxiliar.Open;
  dmDados.dsAuxiliar.First;

  while not dmDados.dsAuxiliar.Eof do
    begin
      qSql_3  :=  '';
      DataAux :=  StrToDate(edDataInicial.Text);
      qSql_3  :=  'insert into REL_PARCIAL_HORAS (DATA_INICIO, DATA_FINAL, FK_CLIENTE, NOME_CLIENTE, TIPO_CLIENTE, TEMPO_TOTAL, ';
      qSql_3  :=  qSql_3 + 'TEMPO_MELHORIA, TEMPO_SUPORTE, TEMPO_TREINAMENTO, OBS) values (';
      qSql_3  :=  qSql_3 + QuotedStr(DataInicial)+', '+QuotedStr(DataFinal)+', ';
      qSql_3  :=  qSql_3 + dmDados.dsAuxiliar.FieldByName('FK_CLIENTE').AsString+', ';
      qSql_3  :=  qSql_3 + QuotedStr(dmDados.dsAuxiliar.FieldByName('NOMECLIENTE').AsString)+', ';

      //TipoCliente
      qSql_2  :=  '';
      qSql_2  :=  'select * from clientes_tipo where id = (select fk_clientes_tipo from clientes where id = '+IntToStr(dmDados.dsAuxiliar.FieldByName('FK_CLIENTE').AsInteger)+')';
      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql_2;
      dmDados.dsGetDados.Open;
      qSql_3  :=  qSql_3 + QuotedStr(dmDados.dsGetDados.FieldByName('DESCRICAO').AsString)+', ';
      TipoCliente := dmDados.dsGetDados.FieldByName('DESCRICAO').AsString;
      dmDados.dsGetDados.Close;

      //Tempo Total
      TempoAuxiliar   :=  '';
      HoraAuxiliar    :=  0;
      MinutoAuxiliar  :=  0;
      HoraAuxiliar    :=  dmDados.dsAuxiliar.FieldByName('HORAS').AsInteger;
      MinutoAuxiliar  :=  dmDados.dsAuxiliar.FieldByName('MINUTOS').AsInteger;
      while (MinutoAuxiliar > 59) do
        begin
          MinutoAuxiliar  :=  MinutoAuxiliar  - 60;
          HoraAuxiliar    :=  HoraAuxiliar  + 1;
        end;

      TotalHoras    :=  TotalHoras  + HoraAuxiliar;
      TotalMinutos  :=  TotalMinutos + MinutoAuxiliar;
      while (TotalMinutos > 59) do
        begin
          TotalHoras  :=  TotalHoras  + 1;
          TotalMinutos  :=  TotalMinutos - 60;
        end;


      if (HoraAuxiliar < 10) then
        TempoAuxiliar :=  '0'+IntToStr(HoraAuxiliar)+':'
      else
        TempoAuxiliar :=  IntToStr(HoraAuxiliar)+':';

      if (MinutoAuxiliar  < 10) then
        TempoAuxiliar :=  TempoAuxiliar + '0'+IntToStr(MinutoAuxiliar)
      else
        TempoAuxiliar := TempoAuxiliar + IntToStr(MinutoAuxiliar);

      qSql_3  :=  qSql_3 + QuotedStr(TempoAuxiliar)+', ';

      CobrarHoras :=  '';
      CobrarHoras :=  TempoAuxiliar;

      //Tempo Melhoria
      TempoAuxiliar   :=  '';
      HoraAuxiliar    :=  0;
      MinutoAuxiliar  :=  0;
      HoraAuxiliar    :=  dmDados.dsAuxiliar.FieldByName('HORASMELHORIA').AsInteger;
      MinutoAuxiliar  :=  dmDados.dsAuxiliar.FieldByName('MINUTOSMELHORIA').AsInteger;
      while (MinutoAuxiliar > 59) do
        begin
          MinutoAuxiliar  :=  MinutoAuxiliar  - 60;
          HoraAuxiliar    :=  HoraAuxiliar  + 1;
        end;

      MelhoriaHoras    :=  MelhoriaHoras  + HoraAuxiliar;
      MelhoriaMinutos  :=  MelhoriaMinutos + MinutoAuxiliar;
      while (MelhoriaMinutos > 59) do
        begin
          MelhoriaHoras  :=  MelhoriaHoras  + 1;
          MelhoriaMinutos  :=  MelhoriaMinutos - 60;
        end;

      if (HoraAuxiliar < 10) then
        TempoAuxiliar :=  '0'+IntToStr(HoraAuxiliar)+':'
      else
        TempoAuxiliar :=  IntToStr(HoraAuxiliar)+':';

      if (MinutoAuxiliar  < 10) then
        TempoAuxiliar :=  TempoAuxiliar + '0'+IntToStr(MinutoAuxiliar)
      else
        TempoAuxiliar := TempoAuxiliar + IntToStr(MinutoAuxiliar);

      qSql_3  :=  qSql_3 + QuotedStr(TempoAuxiliar)+', ';

      //Tempo Suporte
      TempoAuxiliar   :=  '';
      HoraAuxiliar    :=  0;
      MinutoAuxiliar  :=  0;
      HoraAuxiliar    :=  dmDados.dsAuxiliar.FieldByName('HORASSUPORTE').AsInteger;
      MinutoAuxiliar  :=  dmDados.dsAuxiliar.FieldByName('MINUTOSSUPORTE').AsInteger;
      while (MinutoAuxiliar > 59) do
        begin
          MinutoAuxiliar  :=  MinutoAuxiliar  - 60;
          HoraAuxiliar    :=  HoraAuxiliar  + 1;
        end;

      SuporteHoras    :=  SuporteHoras  + HoraAuxiliar;
      SuporteMinutos  :=  SuporteMinutos + MinutoAuxiliar;
      while (SuporteMinutos > 59) do
        begin
          SuporteHoras  :=  SuporteHoras  + 1;
          SuporteMinutos  :=  SuporteMinutos - 60;
        end;

      if (HoraAuxiliar < 10) then
        TempoAuxiliar :=  '0'+IntToStr(HoraAuxiliar)+':'
      else
        TempoAuxiliar :=  IntToStr(HoraAuxiliar)+':';

      if (MinutoAuxiliar  < 10) then
        TempoAuxiliar :=  TempoAuxiliar + '0'+IntToStr(MinutoAuxiliar)
      else
        TempoAuxiliar := TempoAuxiliar + IntToStr(MinutoAuxiliar);

      qSql_3  :=  qSql_3 + QuotedStr(TempoAuxiliar)+', ';

      //Tempo Treinamento
      TempoAuxiliar   :=  '';
      HoraAuxiliar    :=  0;
      MinutoAuxiliar  :=  0;
      HoraAuxiliar    :=  dmDados.dsAuxiliar.FieldByName('HORASTREINAMENTO').AsInteger;
      MinutoAuxiliar  :=  dmDados.dsAuxiliar.FieldByName('MINUTOSTREINAMENTO').AsInteger;
      while (MinutoAuxiliar > 59) do
        begin
          MinutoAuxiliar  :=  MinutoAuxiliar  - 60;
          HoraAuxiliar    :=  HoraAuxiliar  + 1;
        end;

      TreinamentoHoras    :=  TreinamentoHoras  + HoraAuxiliar;
      TreinamentoMinutos  :=  TreinamentoMinutos + MinutoAuxiliar;
      while (TreinamentoMinutos > 59) do
        begin
          TreinamentoHoras  :=  TreinamentoHoras  + 1;
          TreinamentoMinutos  :=  TreinamentoMinutos - 60;
        end;

      if (HoraAuxiliar < 10) then
        TempoAuxiliar :=  '0'+IntToStr(HoraAuxiliar)+':'
      else
        TempoAuxiliar :=  IntToStr(HoraAuxiliar)+':';

      if (MinutoAuxiliar  < 10) then
        TempoAuxiliar :=  TempoAuxiliar + '0'+IntToStr(MinutoAuxiliar)
      else
        TempoAuxiliar := TempoAuxiliar + IntToStr(MinutoAuxiliar);

      qSql_3  :=  qSql_3 + QuotedStr(TempoAuxiliar)+', '+QuotedStr('Sem Observacao')+')';

      if (TipoCliente = 'INVESTIDORA') then
        begin
          Validador :=  0;
          Validador :=  dmDados.dsAuxiliar.FieldByName('HORASTREINAMENTO').AsInteger;
          if ( Validador > 10) then
            begin
              CobrarHoras_Aux   :=  CobrarHoras_Aux + (dmDados.dsAuxiliar.FieldByName('HORASTREINAMENTO').AsInteger - 10);
              CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSTREINAMENTO').AsInteger;
            end;

          Validador :=  0;
          Validador  :=   dmDados.dsAuxiliar.FieldByName('HORASSUPORTE').AsInteger;
          if (Validador > 10) then
            begin
              CobrarHoras_Aux   :=  CobrarHoras_Aux + (dmDados.dsAuxiliar.FieldByName('HORASSUPORTE').AsInteger - 10);
              CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSSUPORTE').AsInteger;
            end;

          Validador :=  0;
          Validador :=  dmDados.dsAuxiliar.FieldByName('HORASMELHORIA').AsInteger;
          if (Validador > 10) then
            begin
              CobrarHoras_Aux   :=  CobrarHoras_Aux + (dmDados.dsAuxiliar.FieldByName('HORASMELHORIA').AsInteger - 10);
              CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSMELHORIA').AsInteger;
            end;
        end;

      if (TipoCliente <> 'FI SISTEMAS') and (TipoCliente <> 'INVESTIDORA') and (TipoCliente <> 'OUTRAS UNIODONTOS') then
        begin
          CobrarHoras_Aux   :=  CobrarHoras_Aux   + dmDados.dsAuxiliar.FieldByName('HORASMELHORIA').AsInteger;
          CobrarHoras_Aux   :=  CobrarHoras_Aux   + dmDados.dsAuxiliar.FieldByName('HORASSUPORTE').AsInteger;
          CobrarHoras_Aux   :=  CobrarHoras_Aux   + dmDados.dsAuxiliar.FieldByName('HORASTREINAMENTO').AsInteger;
          CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSTREINAMENTO').AsInteger;
          CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSSUPORTE').AsInteger;
          CobrarMinutos_Aux :=  CobrarMinutos_Aux + dmDados.dsAuxiliar.FieldByName('MINUTOSMELHORIA').AsInteger;
        end;

      dmDados.dsInsertDados.CommandText :=  '';
      dmDados.dsInsertDados.CommandText :=  qSql_3;
      dmDados.dsInsertDados.ExecSQL();
      Label3.Caption  :=  dmDados.dsAuxiliar.FieldByName('NOMECLIENTE').AsString;
      Application.ProcessMessages;
      dmDados.dsAuxiliar.Next;
    end;
  dmDados.dsAuxiliar.Close;
  //MessageDlg('InfoGravada',mtConfirmation,[mbOK],0);

  qSql  :=  '';
  qSql  :=  'select * ';
  qSql  :=  qSql  + 'from REL_PARCIAL_HORAS ';
  qSql  :=  qSql  + 'where DATA_INICIO = '+QuotedStr(DataInicial)+' and DATA_FINAL = '+QuotedStr(DataFinal)+' ';
  qSql  :=  qSql  + 'order by TIPO_CLIENTE, NOME_CLIENTE asc';
  dmDados.dsParcial_Horas.CommandText :=  '';
  dmDados.dsParcial_Horas.CommandText :=  qSql;

  //Totalizador Melhoria
  if (MelhoriaHoras < 10) then
    Melhoria  :=  '0'+IntToStr(MelhoriaHoras)+':'
  else
    Melhoria  :=  IntToStr(MelhoriaHoras)+':';

  if (MelhoriaMinutos < 10) then
    Melhoria  :=  Melhoria + IntToStr(MelhoriaMinutos)
  else
    Melhoria  :=  Melhoria  + IntToStr(MelhoriaMinutos);

  frmRelatorioParcial_Horas.QRLabel18.Caption :=  Melhoria;

  //Totalizador Suporte
  if (SuporteHoras < 10) then
    Suporte  :=  '0'+IntToStr(SuporteHoras)+':'
  else
    Suporte  :=  IntToStr(SuporteHoras)+':';

  if (SuporteMinutos < 10) then
    Suporte  :=  Suporte + IntToStr(SuporteMinutos)
  else
    Suporte  :=  Suporte  + IntToStr(SuporteMinutos);

  frmRelatorioParcial_Horas.QRLabel19.Caption :=  Suporte;

  //Totalizador Treinamento
  if (TreinamentoHoras < 10) then
    Treinamento  :=  '0'+IntToStr(TreinamentoHoras)+':'
  else
    Treinamento  :=  IntToStr(TreinamentoHoras)+':';

  if (TreinamentoMinutos < 10) then
    Treinamento  :=  Treinamento + IntToStr(TreinamentoMinutos)
  else
    Treinamento  :=  Treinamento  + IntToStr(TreinamentoMinutos);

  frmRelatorioParcial_Horas.QRLabel20.Caption :=  Treinamento;

  //Totalizador Total
  if (TotalHoras < 10) then
    Total  :=  '0'+IntToStr(TotalHoras)+':'
  else
    Total  :=  IntToStr(TotalHoras)+':';

  if (TotalMinutos < 10) then
    Total  :=  Total + IntToStr(TotalMinutos)
  else
    Total  :=  Total  + IntToStr(TotalMinutos);

  frmRelatorioParcial_Horas.QRLabel21.Caption :=  Total;

  //Totalizando Cobran�a
  while (CobrarMinutos_Aux > 59) do
    begin
      CobrarMinutos_Aux :=  CobrarMinutos_Aux - 60;
      CobrarHoras_Aux   :=  CobrarHoras_Aux + 1;
    end;

  CobrarHoras :=  '';

  if (CobrarHoras_Aux < 10) then
    CobrarHoras :=  '0'+IntToStr(CobrarHoras_Aux)+':'
  else
    CobrarHoras :=  IntToStr(CobrarHoras_Aux)+':';

  if (CobrarMinutos_Aux < 10) then
    CobrarHoras :=  CobrarHoras + '0'+IntToStr(CobrarMinutos_Aux)
  else
    CobrarHoras :=  CobrarHoras + IntToStr(CobrarMinutos_Aux);


  frmRelatorioParcial_Horas.qrlabel23.Caption  :=  CobrarHoras;
  frmRelatorioParcial_Horas.qrlabel24.Caption  :=  '(*)A cobran�a de Horas n�o contabiliza os chamados feitos para Outras Uniodontos e para os Chamados da Fi Sistemas.';  

  //dmDados.dsParcial_Horas.Open;
  dmDados.cdsParcial_Horas.Open;
  frmRelatorioParcial_Horas.QRLabel10.Caption :=  edDataInicial.Text+' at� '+edDataFinal.Text;
  frmRelatorioParcial_Horas.QuickRep1.Preview;
  dmDados.cdsParcial_Horas.Close;
end;

end.
