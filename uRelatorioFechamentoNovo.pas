unit uRelatorioFechamentoNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmRelatorioNovoFechamento = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rbTodosClientes: TRadioButton;
    rbUnicoCliente: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicio: TMaskEdit;
    edDataFinal: TMaskEdit;
    Label3: TLabel;
    dbCliente: TDBComboBox;
    btGerarFechamento: TBitBtn;
    btVoltar: TBitBtn;
    rbInvestidora: TRadioButton;
    rbLicenciada: TRadioButton;
    rbOutrosClientes: TRadioButton;
    procedure btVoltarClick(Sender: TObject);
    procedure btGerarFechamentoClick(Sender: TObject);
    procedure rbTodosClientesClick(Sender: TObject);
    procedure rbLicenciadaClick(Sender: TObject);
    procedure rbInvestidoraClick(Sender: TObject);
    procedure rbOutrosClientesClick(Sender: TObject);
    procedure rbUnicoClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function f_carregarDados():Boolean;
  end;

var
  frmRelatorioNovoFechamento: TfrmRelatorioNovoFechamento;

implementation
  uses uDmDados, uNovoRelatorioFechamentoForm, DB;
  
{$R *.dfm}

procedure TfrmRelatorioNovoFechamento.btVoltarClick(Sender: TObject);
begin
  dbCliente.Enabled :=  False;
  edDataInicio.Clear;
  edDataFinal.Clear;
  Close;
end;

procedure TfrmRelatorioNovoFechamento.btGerarFechamentoClick(
  Sender: TObject);
var
  TodosClientes   : String;
  Investidora     : String;
  Licenciada      : String;
  OutrosClientes  : String;
  UnicoCliente    : String;
  qSql            : String;
  DataInicial     : String;
  DataFinal       : String;
  DataAux         : TDate;
  ClienteLogin    : String;
  AuxS            :  String;
  Cobranca        : String;
begin
  Investidora     :=  '';
  Licenciada      :=  '';
  TodosClientes   :=  '';
  OutrosClientes  :=  '';
  UnicoCliente    :=  '';

  //Coleta de Informa��es
  if (rbTodosClientes.Checked = True) then
    TodosClientes :=  'S';

  if (rbUnicoCliente.Checked = True) then
    begin
      if (dbCliente.Text = '') then
        begin
          MessageDlg('FAVOR PREENCHER O CLIENTE.',mtWarning,[mbOK],0);
          dbCliente.SetFocus;
          Exit;
        end
      else
        ClienteLogin  :=  dbCliente.Text;
    end;

  if (rbInvestidora.Checked = True) then
    Investidora :=  'S';

  if (rbLicenciada.Checked = True) then
    Licenciada  :=  'S';

  if (rbOutrosClientes.Checked = True) then
    OutrosClientes  :=  'S';

  if (rbUnicoCliente.Checked = True) then
    UnicoCliente  :=  'S';  

  DataAux     :=  StrToDate(edDataInicio.Text);
  DataInicial :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux     :=  StrToDate(edDataFinal.Text);
  DataFinal   :=  FormatDateTime('MM/DD/YYYY', DataAux);

  if (TodosClientes = 'S') then
    begin
      dmDados.dsGetDados.Close;
      qSql  :=  '';
      qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal);

      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql;
      dmDados.dsGetDados.Open;
    end;

   if (Investidora  = 'S') then
    begin
      qSql  :=  '';
      qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE_TIPO = 1 and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal);

      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql;
      dmDados.dsGetDados.Open;
    end;

   if (Licenciada  = 'S') then
    begin
      qSql  :=  '';
      qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE_TIPO = 2 and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal);

      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql;
      dmDados.dsGetDados.Open;
    end;

   if (OutrosClientes  = 'S') then
    begin
      qSql  :=  '';
      qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE_TIPO = 3 and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal);

      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql;
      dmDados.dsGetDados.Open;
    end;


  if (UnicoCliente = 'S') then
    begin
      ClienteLogin  :=  '%'+UpperCase(dbCliente.Text)+'%';
      qSql  :=  '';
      qSql  :=  'select distinct(C.FK_CLIENTE) as IDCLIENTE ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE = (select CS.ID from CLIENTES CS where CS.LOGIN LIKE '+QuotedStr(ClienteLogin)+') and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+' and '+QuotedStr(DataFinal);

      dmDados.dsGetDados.CommandText  :=  '';
      dmDados.dsGetDados.CommandText  :=  qSql;
      dmDados.dsGetDados.Open;
    end;

  //Iniciando Relat�rio
   while not dmDados.dsGetDados.EoF do
    begin
      AuxS  :=  ' - ';
      qSql  :=  '';
      qSql  :=  'select C.FK_CLIENTE, ';
      qSql  :=  qSql  + '(select CS.LOGIN ||'+QuotedStr(AuxS)+'|| CS.NOMECLIENTE ';
      qSql  :=  qSql  + 'from CLIENTES CS ';
      qSql  :=  qSql  + 'where CS.ID = C.FK_CLIENTE) as NOMECLIENTE, ';
      qSql  :=  qSql  + 'C.FK_CLIENTE_TIPO, ';
      qSql  :=  qSql  + '(select CTO.DESCRICAO ';
      qSql  :=  qSql  + 'from CLIENTES_TIPO CTO ';
      qSql  :=  qSql  + 'where CTO.ID = C.FK_CLIENTE_TIPO) as TIPOCLIENTE, ';
      qSql  :=  qSql  + 'C.TICKET, ';
      qSql  :=  qSql  + 'C.ASSUNTO_CHAMADO, ';
      qSql  :=  qSql  + 'C.FK_TIPO_TICKET, ';
      qSql  :=  qSql  + '(select TT.DESCRICAO ';
      qSql  :=  qSql  + 'from TICKET_TIPO TT ';
      qSql  :=  qSql  + 'where TT.ID = C.FK_TIPO_TICKET) as TIPOCHAMADO, ';
      qSql  :=  qSql  + 'C.TEMPO ';
      qSql  :=  qSql  + 'from CONTROLE C ';
      qSql  :=  qSql  + 'where C.FK_TIPO_TICKET not in (1, 4) and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE = '+dmDados.dsGetDados.FieldByName('IDCLIENTE').AsString+' and ';
      qSql  :=  qSql  + 'C.FK_CLIENTE not in (158) and ';
      qSql  :=  qSql  + 'C.DATA between '+QuotedStr(DataInicial)+'and '+QuotedStr(DataFinal)+' ';
      qSql  :=  qSql  + 'order by TIPOCLIENTE, NOMECLIENTE ';
      dmDados.dsFechamentoNovo.CommandText  :=  '';
      dmDados.dsFechamentoNovo.CommandText  :=  qSql;
      dmDados.dsFechamentoNovo.Open;
      //dmDados.cdsFechamentoNovo.Active      :=  True;

      //Cabe�alho
      qSql  :=  '';
      qSql  :=  'select * ';
      qSql  :=  qSql  + 'from REL_PARCIAL_HORAS where FK_CLIENTE = '+dmDados.dsGetDados.FieldByName('IDCLIENTE').AsString;
      qSql  :=  qSql  + ' and DATA_INICIO = '+QuotedStr(DataInicial);
      qSql  :=  qSql  + ' and DATA_FINAL = '+QuotedStr(DataFinal);
      DataAux :=  StrToDate(edDataInicio.Text);
      frmNovoRelatorioFechamentoForm.QRLabel18.Caption  :=  FormatDateTime('MM/YYYY', DataAux);
      frmNovoRelatorioFechamentoForm.QRLabel19.Caption  :=  dmDados.dsFechamentoNovo.FieldByName('NOMECLIENTE').AsString;
      frmNovoRelatorioFechamentoForm.QRLabel21.Caption  :=  edDataInicio.Text+' � '+edDataFinal.Text;

      dmDados.dsAuxiliarDados.CommandText :=  '';
      dmDados.dsAuxiliarDados.CommandText :=  qSql;
      dmDados.dsAuxiliarDados.Open;
      frmNovoRelatorioFechamentoForm.QRLabel20.Caption  :=  dmDados.dsAuxiliarDados.FieldByName('TEMPO_TOTAL').AsString;
      frmNovoRelatorioFechamentoForm.QRLabel22.Caption  :=  dmDados.dsAuxiliarDados.FieldByName('TEMPO_MELHORIA').AsString;
      frmNovoRelatorioFechamentoForm.QRLabel23.Caption  :=  dmDados.dsAuxiliarDados.FieldByName('TEMPO_SUPORTE').AsString;
      frmNovoRelatorioFechamentoForm.QRLabel24.Caption  :=  dmDados.dsAuxiliarDados.FieldByName('TEMPO_TREINAMENTO').AsString;
      dmDados.dsAuxiliarDados.Close;
      dmDados.cdsFechamentoNovo.Active  :=  True;
      frmNovoRelatorioFechamentoForm.QuickRep1.Preview;
      dmDados.cdsFechamentoNovo.Active  :=  False;;
      dmDados.dsGetDados.Next;
    end;
    dmDados.dsGetDados.Close;
    MessageDlg('Todos os Relat�rios Foram Gerados, conforme filtros selecionados.',mtInformation,[mbOK],0);
    dbCliente.Clear;
    dbCliente.Enabled :=  False;
    edDataInicio.Clear;
    edDataFinal.Clear;
end;



function TfrmRelatorioNovoFechamento.f_carregarDados: Boolean;
var
  qSql  : String;
  DtIni, DtFim  : String;
  DtAux : TDate;
begin
  DtAux :=  StrToDate(edDataInicio.Text);
  DtIni :=  FormatDateTime('MM/DD/YYYY', DtAux);
  DtAux :=  StrToDate(edDataFinal.Text);
  DtFim :=  FormatDateTime('MM/DD/YYYY', DtAux);

  qSql  :=  '';
  qSql  :=  'select distinct(C.LOGIN) as LOGIN ';
  qSql  :=  qSql  + 'from CLIENTES C ';
  qSql  :=  qSql  + 'where C.ID in ';
  qSql  :=  qSql  + '(select CE.FK_CLIENTE from CONTROLE CE where ';
  qSql  :=  qSql  + 'CE.FK_TIPO_TICKET NOT IN (1,4) and ';
  qSql  :=  qSql  + 'DATA between '+QuotedStr(DtIni)+' and '+QuotedStr(DtFim)+')';

  dmDados.dsCarregarDados.CommandText :=  '';
  dmDados.dsCarregarDados.CommandText :=  qSql;
  dmDados.dsCarregarDados.Open;
  dmDados.dsCarregarDados.First;

  while not dmDados.dsCarregarDados.EoF do
    begin
      dbCliente.Items.Add(dmDados.dsCarregarDados.FieldByName('LOGIN').AsString);
      dmDados.dsCarregarDados.Next;
    end;
  dmDados.dsCarregarDados.Close;
end;

procedure TfrmRelatorioNovoFechamento.rbTodosClientesClick(
  Sender: TObject);
begin
  dbCliente.Enabled :=  False;
  dbCliente.Clear;
end;

procedure TfrmRelatorioNovoFechamento.rbLicenciadaClick(Sender: TObject);
begin
  dbCliente.Enabled :=  False;
  dbCliente.Clear;
end;

procedure TfrmRelatorioNovoFechamento.rbInvestidoraClick(Sender: TObject);
begin
  dbCliente.Enabled :=  False;
  dbCliente.Clear;
end;

procedure TfrmRelatorioNovoFechamento.rbOutrosClientesClick(
  Sender: TObject);
begin
  dbCliente.Enabled :=  False;
  dbCliente.Clear;
end;

procedure TfrmRelatorioNovoFechamento.rbUnicoClienteClick(Sender: TObject);
begin
  dbCliente.Clear;
  f_carregarDados();
  dbCliente.Enabled :=  True;
  dbCliente.SetFocus;
end;

end.
