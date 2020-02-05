unit uFiltroRelatorioFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmFiltroRelatorioFechamento = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edDataInicio: TMaskEdit;
    edDataFinal: TMaskEdit;
    Label2: TLabel;
    cbClienteFechamento: TComboBox;
    btGerarRelatorio: TBitBtn;
    btVoltar: TBitBtn;
    procedure btVoltarClick(Sender: TObject);
    procedure btGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function f_getDadosClientes():Boolean;
    function f_LimparCampos():Boolean;
    function f_getIDCliente(Login:String):Integer;
    function f_getNomeLoginCliente(Login:String):Boolean;
  end;

var
  frmFiltroRelatorioFechamento: TfrmFiltroRelatorioFechamento;
  NomeClienteRel, LoginClienteRel : String;

implementation
  uses uDmDados, SqlExpr, DB, uRelCliFec;
  
{$R *.dfm}

procedure TfrmFiltroRelatorioFechamento.btVoltarClick(Sender: TObject);
begin
  Close;
end;

function TfrmFiltroRelatorioFechamento.f_getDadosClientes(): Boolean;
var
  qSql  : String;
  Status  : String;
  NotInBug, NotInDuvida : Integer;
begin
  Status      :=  'A';
  NotInBug    :=  1;
  NotInDuvida :=  4;
  qSql  :=  '';
  qSql  :=  'SELECT DISTINCT(C.fk_cliente) AS IDCLIENTE, CS.login as LOGIN, CS.nomecliente AS CLIENTE, CST.descricao as TIPOCLIENTE ';
  qSql  :=  qSql  + 'FROM CONTROLE C ';
  qSql  :=  qSql  + 'JOIN CLIENTES CS ON CS.id = C.fk_cliente ';
  qSql  :=  qSql  + 'JOIN CLIENTES_TIPO CST ON CST.id = CS.fk_clientes_tipo ';
  qSql  :=  qSql  + 'where CS.STATUS = '+QuotedStr(Status)+' and ';
  qSql  :=  qSql  + 'C.FK_TIPO_TICKET not in ('+IntToStr(NotInBug)+','+IntToStr(NotInDuvida)+') ';
  //  qSql  :=  qSql  + 'GROUP BY 1,2,3 ';
  qSql  :=  qSql  + 'ORDER BY TIPOCLIENTE ASC ';

  dmDados.dsGetDados.CommandText  :=  '';
  dmDados.dsGetDados.CommandText  :=  qSql;
  dmDados.dsGetDados.Open;
  dmDados.dsGetDados.First;

  while not dmDados.dsGetDados.Eof do
    begin
      cbClienteFechamento.Items.Add(dmDados.dsGetDados.FieldByName('LOGIN').AsString);
      dmDados.dsGetDados.Next;
    end;
  dmDados.dsGetDados.Close;
  result  :=  True;
end;

function TfrmFiltroRelatorioFechamento.f_LimparCampos: Boolean;
begin
  edDataInicio.Clear;
  edDataFinal.Clear;
  cbClienteFechamento.Clear;
end;

procedure TfrmFiltroRelatorioFechamento.btGerarRelatorioClick(
  Sender: TObject);
var
  DataAux                   : TDate;
  TipoClienteFechamentoRel  : String;
  DataIni, DataFim          : String;
  qSql                      : String;
  Cliente                   : Integer;
  NotIn01, NotIn02          : Integer;
  DataIniRel, DataFimRel    : String;
  HorasMelhoria, HorasTreinamento, HorasSupAt, HorasSupEmer, HorasCobrar, HorasDescInv  : Integer;
  MinMelhoria, MinTreinamento, MinSupAt, MinSupEmer, MinCobrar, MinDesInv               : Integer;
begin
  DataAux :=  StrToDate(edDataInicio.Text);
  DataIni :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux :=  null;
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFim :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux :=  null;
  Cliente :=  f_getIDCliente(cbClienteFechamento.Text);
  NotIn01 :=  1;
  NotIn02 :=  4;

  qSql    :=  '';
  qSql    :=  'select CS.ID as IDCLIENTE, C.TICKET as TICKET, CS.LOGIN as LOGIN, CS.NOMECLIENTE as CLIENTE, CST.DESCRICAO as TIPOCLIENTE, ';
  qSql    :=  qSql  + 'TR.DESCRICAO as TIPOREGISTRO, TT.DESCRICAO as TIPOTICKET, C.DATA as DATA, C.TEMPO as TEMPO, C.DESCRICAO as DESCRICAO ';
  qSql    :=  qSql  + 'from CONTROLE C ';
  qSql    :=  qSql  + 'join CLIENTES CS on CS.ID = C.FK_CLIENTE ';
  qSql    :=  qSql  + 'join CLIENTES_TIPO CST on CST.ID = CS.FK_CLIENTES_TIPO ';
  qSql    :=  qSql  + 'join TIPO_REGISTRO TR on TR.ID = C.FK_TIPO_REGISTRO ';
  qSql    :=  qSql  + 'join TICKET_TIPO TT on TT.ID = C.FK_TIPO_TICKET ';
  qSql    :=  qSql  + 'where C.FK_CLIENTE = '+IntToStr(Cliente)+' and ';
  qSql    :=  qSql  + 'TT.ID not in ('+IntToStr(NotIn01)+', '+IntToStr(NotIn02)+') and ';
  qSql    :=  qSql  + 'C.DATA between '+QuotedStr(DataIni)+' and '+QuotedStr(DataFim)+' ';
  qSql    :=  qSql  + 'order by TIPOREGISTRO, TIPOTICKET asc';

  dmDados.dsRelCliFec.Close;
  dmDados.dsRelCliFec.CommandText :=  '';
  dmDados.dsRelCliFec.CommandText :=  qSql;
//  dmDados.cdsRelCliFec.Open;
  f_getNomeLoginCliente(cbClienteFechamento.Text);
  //Preenchendo Parte do Cabeçalho
  frmRelCliFec.qrCliente.Caption      :=  LoginClienteRel+' - '+NomeClienteRel;
  DataAux     :=  StrToDate(edDataInicio.Text);
  DataIniRel  :=  FormatDateTime('DD/MM/YYYY', DataAux);
  DataAux     :=  null;
  DataAux     :=  StrToDate(edDataFinal.Text);
  DataFimRel  :=  FormatDateTime('DD/MM/YYYY', DataAux);
  frmRelCliFec.qrCompetencia.Caption  :=  DataIniRel+' à '+DataFimRel;

  //Iniciando Cálculos de Horas
  HorasMelhoria     :=  0;
  HorasTreinamento  :=  0;
  HorasSupAt        :=  0;
  HorasSupEmer      :=  0;
  HorasCobrar       :=  0;
  HorasDescInv      :=  10;
  MinMelhoria       :=  0;
  MinTreinamento    :=  0;
  MinSupAt          :=  0;
  MinSupEmer        :=  0;
  MinCobrar         :=  0;
  MinDesInv         :=  0;

  dmDados.dsRelCliFec.Open;
  dmDados.dsRelCliFec.First;
  TipoClienteFechamentoRel  :=  dmDados.dsRelCliFec.FieldByName('TIPOCLIENTE').AsString;

  while not dmDados.dsRelCliFec.Eof do
    begin
      //MELHORIA
      if (dmDados.dsRelCliFec.FieldByName('TIPOTICKET').AsString = 'MELHORIA') then
        begin
          HorasMelhoria :=  HorasMelhoria + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,1,2));
          MinMelhoria   :=  MinMelhoria + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,4,2));
          if (MinMelhoria > 59) then
            begin
              MinMelhoria   :=  MinMelhoria - 60;
              HorasMelhoria :=  HorasMelhoria + 1;
            end;
        end;

      //TREINAMENTO
      if (dmDados.dsRelCliFec.FieldByName('TIPOTICKET').AsString = 'TREINAMENTO') then
        begin
          HorasTreinamento :=  HorasTreinamento + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,1,2));
          MinTreinamento   :=  MinTreinamento + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,4,2));
          if (MinTreinamento > 59) then
            begin
              MinTreinamento   :=  MinTreinamento - 60;
              HorasTreinamento :=  HorasTreinamento + 1;
            end;
        end;

      //SUPORTE - ATENDIMENTO
      if (dmDados.dsRelCliFec.FieldByName('TIPOTICKET').AsString = 'SUPORTE - ATENDIMENTO') then
        begin
          HorasSupAt :=  HorasSupAt + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,1,2));
          MinSupAt   :=  MinSupAt + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,4,2));
          if (MinSupAt > 59) then
            begin
              MinSupAt   :=  MinSupAt - 60;
              HorasSupAt :=  HorasSupAt + 1;
            end;
        end;

      //SUPORTE - EMERGENCIA
      if (dmDados.dsRelCliFec.FieldByName('TIPOTICKET').AsString = 'SUPORTE - EMERGENCIA') then
        begin
          HorasSupEmer :=  HorasSupEmer + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,1,2));
          MinSupEmer   :=  MinSupEmer + StrToInt(Copy(dmDados.dsRelCliFec.FieldByName('TEMPO').AsString,4,2));
          if (MinSupEmer > 59) then
            begin
              MinSupEmer   :=  MinSupEmer - 60;
              HorasSupEmer :=  HorasSupEmer + 1;
            end;
        end;
      dmDados.dsRelCliFec.Next;
    end;

  dmDados.dsRelCliFec.Close;

  HorasCobrar :=  HorasMelhoria + HorasTreinamento + HorasSupAt + HorasSupEmer;
  MinCobrar   :=  MinMelhoria;
  if (MinCobrar > 59) then
    begin
      MinCobrar   :=  MinCobrar - 60;
      HorasCobrar :=  HorasCobrar + 1;
    end;
  MinCobrar   :=  MinCobrar + MinTreinamento;
  if (MinCobrar > 59) then
    begin
      MinCobrar   :=  MinCobrar - 60;
      HorasCobrar :=  HorasCobrar + 1;
    end;
  MinCobrar :=  MinCobrar + MinSupAt;
  if (MinCobrar > 59) then
    begin
      MinCobrar   :=  MinCobrar - 60;
      HorasCobrar :=  HorasCobrar + 1;
    end;
  MinCobrar :=  MinCobrar + MinSupEmer;
  if (MinCobrar > 59) then
    begin
      MinCobrar   :=  MinCobrar - 60;
      HorasCobrar :=  HorasCobrar + 1;
    end;



  if (TipoClienteFechamentoRel = 'INVESTIDORA') then
    HorasCobrar :=  HorasCobrar - HorasDescInv;
  if (HorasCobrar < 0) then
    HorasCobrar :=  0;
  if (MinCobrar < 0) then
    MinCobrar   :=  0;

  //Ajustes Horas Cobrar
  if (HorasCobrar < 10) and (MinCobrar < 10) then
    frmRelCliFec.qrHorasCobrar.Caption  :=  '0'+IntToStr(HorasCobrar)+':0'+IntToStr(MinCobrar);
  if (HorasCobrar >= 10) and (MinCobrar >= 10) then
    frmRelCliFec.qrHorasCobrar.Caption  :=  IntToStr(HorasCobrar)+':'+IntToStr(MinCobrar);
  if (HorasCobrar < 10) and (MinCobrar >= 10) then
    frmRelCliFec.qrHorasCobrar.Caption  :=  '0'+IntToStr(HorasCobrar)+':'+IntToStr(MinCobrar);
  if (HorasCobrar >= 10) and (MinCobrar < 10) then
    frmRelCliFec.qrHorasCobrar.Caption  :=  IntToStr(HorasCobrar)+':0'+IntToStr(MinCobrar);

  //Ajustes Melhorias
  if (HorasMelhoria < 10) and (MinMelhoria < 10) then
    frmRelCliFec.qrMelhoria.Caption  :=  '0'+IntToStr(HorasMelhoria)+':0'+IntToStr(MinMelhoria);
  if (HorasMelhoria >= 10) and (MinMelhoria >= 10) then
    frmRelCliFec.qrMelhoria.Caption  :=  IntToStr(HorasMelhoria)+':'+IntToStr(MinMelhoria);
  if (HorasMelhoria < 10) and (MinMelhoria >= 10) then
    frmRelCliFec.qrMelhoria.Caption  :=  '0'+IntToStr(HorasMelhoria)+':'+IntToStr(MinMelhoria);
  if (HorasMelhoria >= 10) and (MinMelhoria < 10) then
    frmRelCliFec.qrMelhoria.Caption  :=  IntToStr(HorasMelhoria)+':0'+IntToStr(MinMelhoria);

  //Ajustes Treinamento
  if (HorasTreinamento < 10) and (MinTreinamento < 10) then
    frmRelCliFec.qrTreinamento.Caption  :=  '0'+IntToStr(HorasTreinamento)+':0'+IntToStr(MinTreinamento);
  if (HorasTreinamento >= 10) and (MinTreinamento >= 10) then
    frmRelCliFec.qrTreinamento.Caption  :=  IntToStr(HorasTreinamento)+':'+IntToStr(MinTreinamento);
  if (HorasTreinamento < 10) and (MinTreinamento >= 10) then
    frmRelCliFec.qrTreinamento.Caption  :=  '0'+IntToStr(HorasTreinamento)+':'+IntToStr(MinTreinamento);
  if (HorasTreinamento >= 10) and (MinTreinamento < 10) then
    frmRelCliFec.qrTreinamento.Caption  :=  IntToStr(HorasTreinamento)+':0'+IntToStr(MinTreinamento);

  //Ajustes Suporte - Atendimento
  if (HorasSupAt < 10) and (MinSupAt < 10) then
    frmRelCliFec.qrSuporteAT.Caption  :=  '0'+IntToStr(HorasSupAt)+':0'+IntToStr(MinSupAt);
  if (HorasSupAt >= 10) and (MinSupAt >= 10) then
    frmRelCliFec.qrSuporteAT.Caption  :=  IntToStr(HorasSupAt)+':'+IntToStr(MinSupAt);
  if (HorasSupAt < 10) and (MinSupAt >= 10) then
    frmRelCliFec.qrSuporteAT.Caption  :=  '0'+IntToStr(HorasSupAt)+':'+IntToStr(MinSupAt);
  if (HorasSupAt >= 10) and (MinSupAt < 10) then
    frmRelCliFec.qrSuporteAT.Caption  :=  IntToStr(HorasSupAt)+':0'+IntToStr(MinSupAt);

  //Ajustes Suporte - Emergencia
  if (HorasSupEmer < 10) and (MinSupEmer < 10) then
    frmRelCliFec.qrSuporteEmer.Caption  :=  '0'+IntToStr(HorasSupEmer)+':0'+IntToStr(MinSupEmer);
  if (HorasSupEmer >= 10) and (MinSupEmer >= 10) then
    frmRelCliFec.qrSuporteEmer.Caption  :=  IntToStr(HorasSupEmer)+':'+IntToStr(MinSupEmer);
  if (HorasSupEmer < 10) and (MinSupEmer >= 10) then
    frmRelCliFec.qrSuporteEmer.Caption  :=  '0'+IntToStr(HorasSupEmer)+':'+IntToStr(MinSupEmer);
  if (HorasSupEmer >= 10) and (MinSupEmer < 10) then
    frmRelCliFec.qrSuporteEmer.Caption  :=  IntToStr(HorasSupEmer)+':0'+IntToStr(MinSupEmer);

  dmDados.dsRelCliFec.CommandText :=  '';
  dmDados.dsRelCliFec.CommandText :=  qSql;
  dmDados.cdsRelCliFec.Open;
  frmRelCliFec.QRBand3.Visible    :=  true;
  frmRelCliFec.QuickRep1.Preview;
  dmDados.cdsRelCliFec.Close;

  edDataInicio.Clear;
  edDataFinal.Clear;
  cbClienteFechamento.Text  :=  '';
  edDataInicio.SetFocus;

end;

function TfrmFiltroRelatorioFechamento.f_getIDCliente(Login:String): Integer;
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select ID from CLIENTES where LOGIN = '+QuotedStr(Login);

  with dmDados.dsGetDados do
    begin
      CommandText :=  '';
      CommandText :=  qSql;
      Open;
      First;
      result  :=  FieldByName('ID').AsInteger;
      Close;
    end;
end;

function TfrmFiltroRelatorioFechamento.f_getNomeLoginCliente(
  Login:String): Boolean;
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select ID, LOGIN, NOMECLIENTE from CLIENTES where LOGIN = '+QuotedStr(Login);

  with dmDados.dsGetDados do
    begin
      CommandText :=  '';
      CommandText :=  qSql;
      Open;
      First;
      NomeClienteRel  :=  FieldByName('NOMECLIENTE').AsString;
      LoginClienteRel :=  FieldByName('LOGIN').AsString;
      Close;
    end;
end;

end.
