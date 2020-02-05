unit uCadastroChamado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmCadastroKanban = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbTipoRegistro: TComboBox;
    edData: TMaskEdit;
    cbTipoChamado: TComboBox;
    cbCliente: TComboBox;
    edTicket: TEdit;
    cbProgramador: TComboBox;
    mDescricao: TMemo;
    btNovoRegistro: TBitBtn;
    btGravar: TBitBtn;
    btVoltar: TBitBtn;
    edTempo: TMaskEdit;
    edNomeCliente: TEdit;
    procedure btVoltarClick(Sender: TObject);
    procedure btNovoRegistroClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure cbClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function f_LiberarCampos(cRegistro, cData, cTipo, cCliente, cTicket, cTempo, cProgramador, cAtendente, cDescricao : Boolean):Boolean;
    function f_LiberarBotao(cNovoRegistro, cGravarDados, cVoltar : Boolean):Boolean;
    function f_LimparCampos():Boolean;
    function f_CarregaDadosCombo(cTipoDados:Integer):Boolean;
    function f_getID(cTipo : Integer; cDados : String):Integer;
  end;

var
  frmCadastroKanban: TfrmCadastroKanban;

implementation
  uses uDmDados;
  
{$R *.dfm}

procedure TfrmCadastroKanban.btVoltarClick(Sender: TObject);
begin
  Close;
end;

function TfrmCadastroKanban.f_LiberarCampos(cRegistro, cData, cTipo,
  cCliente, cTicket, cTempo, cProgramador, cAtendente,
  cDescricao: Boolean): Boolean;
begin
  cbTipoRegistro.Enabled  :=  cRegistro;
  edData.Enabled          :=  cData;
  cbTipoChamado.Enabled   :=  cTipo;
  cbCliente.Enabled       :=  cCliente;
  edTicket.Enabled        :=  cTicket;
  edTempo.Enabled         :=  cTempo;
  cbProgramador.Enabled   :=  cProgramador;
//  cbAtendente.Enabled     :=  cAtendente;
  mDescricao.Enabled      :=  cDescricao;
end;

function TfrmCadastroKanban.f_LiberarBotao(cNovoRegistro, cGravarDados,
  cVoltar: Boolean): Boolean;
begin
  btNovoRegistro.Enabled  :=  cNovoRegistro;
  btGravar.Enabled        :=  cGravarDados;
  btVoltar.Enabled        :=  cVoltar;
end;

procedure TfrmCadastroKanban.btNovoRegistroClick(Sender: TObject);
var
  pDataStr                              : String;
  DataAux                               : TDate;
  pTipoRegistro, pTipoChamado, pCliente : Integer;
  pTicket, pTempo                       : String;
  pProgramador, pAtendente              : Integer;
begin
  f_LiberarBotao(False, True, True);
  f_LimparCampos();
  f_LiberarCampos(True, True, True, True, True, True, True, True, True);
  f_CarregaDadosCombo(1); // 1 : REGISTRO
  f_CarregaDadosCombo(2); // 2 : TIPOCHAMADO
  f_CarregaDadosCombo(3); // 3 : CLIENTE
  f_CarregaDadosCombo(4); // 4 : PROGRAMADOR
  cbTipoRegistro.SetFocus;
end;

function TfrmCadastroKanban.f_LimparCampos: Boolean;
begin
  cbTipoRegistro.Clear;
  frmCadastroKanban.
  edData.Clear;
  cbTipoChamado.Clear;
  cbCliente.Clear;
  edTicket.Clear;
  edTempo.Clear;
  cbProgramador.Clear;
//  cbAtendente.Clear;
  mDescricao.Clear;
end;

function TfrmCadastroKanban.f_CarregaDadosCombo(
  cTipoDados: Integer): Boolean;
var
  qSql            : String;
  Status          : String;
  TipoRegistro    : String;
  AuxStr, AuxStr2 : String;
  AuxFkTipoRegistro : Integer;
begin
  Status  :=  'A';

  //  1 : REGISTRO
  //  2 : TIPOCHAMADO
  //  3 : CLIENTE
  //  4 : PROGRAMADOR
  //  5 : ATENDENTE

  if (cTipoDados = 1) then //REGISTRO
    begin
      TipoRegistro  :=  'REGISTRO';
      qSql  :=  'select * from TIPO_REGISTRO where Status = '+QuotedStr(Status);
      dmDados.dsCarregarDados.CommandText :=  '';
      dmDados.dsCarregarDados.CommandText :=  qSql;
      dmDados.dsCarregarDados.Open;
      dmDados.dsCarregarDados.First;

      while Not dmDados.dsCarregarDados.Eof do
        begin
//          AuxStr  :=  '[';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('ID').AsString;
//          AuxStr  :=  AuxStr  + '] ';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('DESCRICAO').AsString;
          AuxStr  :=  dmDados.dsCarregarDados.FieldByName('DESCRICAO').AsString;
          cbTipoRegistro.Items.Add(AuxStr);
          dmDados.dsCarregarDados.Next;
        end;
      dmDados.dsCarregarDados.Close;
    end;

  if (cTipoDados = 2) then //TIPOCHAMADO
    begin
      TipoRegistro  :=  'TIPOCHAMADO';
      qSql  :=  'select * from TICKET_TIPO where Status = '+QuotedStr(Status);

      dmDados.dsCarregarDados.CommandText :=  '';
      dmDados.dsCarregarDados.CommandText :=  qSql;
      dmDados.dsCarregarDados.Open;
      dmDados.dsCarregarDados.First;

      while Not dmDados.dsCarregarDados.Eof do
        begin
//          AuxStr  :=  '[';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('ID').AsString;
//          AuxStr  :=  AuxStr  + '] ';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('DESCRICAO').AsString;
          AuxStr  :=  dmDados.dsCarregarDados.FieldByName('DESCRICAO').AsString;
          cbTipoChamado.Items.Add(AuxStr);
          dmDados.dsCarregarDados.Next;
        end;
      dmDados.dsCarregarDados.Close;
    end;

  if (cTipoDados = 3) then //CLIENTE
    begin
      TipoRegistro  :=  'CLIENTE';
      qSql  :=  'select * from CLIENTES where Status = '+QuotedStr(Status);
      dmDados.dsCarregarDados.CommandText :=  '';
      dmDados.dsCarregarDados.CommandText :=  qSql;
      dmDados.dsCarregarDados.Open;
      dmDados.dsCarregarDados.First;

      while Not dmDados.dsCarregarDados.Eof do
        begin
//          AuxStr  :=  '[';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('ID').AsString;
//          AuxStr  :=  AuxStr  + '] ';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('NOMECLIENTE').AsString;
//          AuxStr  :=  dmDados.dsCarregarDados.FieldByName('NOMECLIENTE').AsString;
            AuxStr  :=  dmDados.dsCarregarDados.FieldByName('LOGIN').AsString;
          cbCliente.Items.Add(AuxStr);
          dmDados.dsCarregarDados.Next;
        end;
      dmDados.dsCarregarDados.Close;
    end;

  if (cTipoDados = 4) then //PROGRAMADOR
    begin
      TipoRegistro  :=  'PROGRAMADOR';
      qSql  :=  'select * from PROGRAMADORES where PROGRAMADORES_STATUS = '+QuotedStr(Status);
      dmDados.dsCarregarDados.CommandText :=  '';
      dmDados.dsCarregarDados.CommandText :=  qSql;
      dmDados.dsCarregarDados.Open;
      dmDados.dsCarregarDados.First;

      while Not dmDados.dsCarregarDados.Eof do
        begin
//          AuxStr  :=  '[';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('PROGRAMADORES_ID').AsString;
//          AuxStr  :=  AuxStr  + '] ';
//          AuxStr  :=  AuxStr  + dmDados.dsCarregarDados.FieldByName('PROGRAMADORES_LOGIN').AsString;
          AuxStr  :=  dmDados.dsCarregarDados.FieldByName('PROGRAMADORES_LOGIN').AsString;
          cbProgramador.Items.Add(AuxStr);
          dmDados.dsCarregarDados.Next;
        end;
      dmDados.dsCarregarDados.Close;
    end;
end;

procedure TfrmCadastroKanban.btGravarClick(Sender: TObject);
var
  qSql                        : String;
  DataAux                     : TDate;
  pDataStr, pTicket           : String;
  pDescricao, pTempo          : String;
  pTipoRegistro, pTipoChamado : Integer;
  pCliente, pProgramador      : Integer;
  pAtendente, pTipoCliente    : Integer;
begin
  if (edTempo.Text = '  :  ') then
    begin
      MessageDlg('FAVOR PREENCHER O CAMPO <TEMPO>. CASO CONTRÁRIO '+#13+'O REGISTRO NÃO SERÁ SALVO.',mtError,[mbOK],0);
      Exit;
    end;

  if (cbTipoChamado.Text = '') then
    begin
      MessageDlg('FAVOR PREENCHER O CAMPO <TIPO>. CASO CONTRÁRIO '+#13+'O REGISTRO NÃO SERÁ SALVO.',mtError,[mbOK],0);
      Exit;
    end;

  if (cbCliente.Text = '') then
    begin
      MessageDlg('FAVOR PREENCHER O CAMPO <CLIENTE>. CASO CONTRÁRIO '+#13+'O REGISTRO NÃO SERÁ SALVO.',mtError,[mbOK],0);
      Exit;
    end;

  if (cbTipoRegistro.Text = '') then
    begin
      MessageDlg('FAVOR PREENCHER O CAMPO <REGISTRO>. CASO CONTRÁRIO '+#13+'O REGISTRO NÃO SERÁ SALVO.',mtError,[mbOK],0);
      Exit;
    end;

  if (edData.Text = '  /  /    ') then
    begin
      MessageDlg('FAVOR PREENCHER O CAMPO <DATA>. CASO CONTRÁRIO '+#13+'O REGISTRO NÃO SERÁ SALVO.',mtError,[mbOK],0);
      Exit;
    end;

  DataAux       :=  StrToDate(edData.Text);
  pDataStr      :=  FormatDateTime('MM/DD/YYYY', DataAux);
  pTicket       :=  edTicket.Text;
  pTempo        :=  edTempo.Text;
  pTipoRegistro :=  f_getID(1, UpperCase(cbTipoRegistro.Text));
  pTipoChamado  :=  f_getID(2, UpperCase(cbTipoChamado.Text));
  pCliente      :=  f_getID(3, UpperCase(cbCliente.Text));
  pTipoCliente  :=  f_getID(6, UpperCase(cbCliente.Text));

  qSql          :=  'insert into CONTROLE (FK_TIPO_REGISTRO, DATA, FK_CLIENTE, FK_CLIENTE_TIPO, TICKET, ';
  qSql          :=  qSql  + 'FK_TIPO_TICKET, FK_ATENDENTE, FK_PROGRAMADOR, TEMPO, DESCRICAO) values (';
  qSql          :=  qSql  + IntToStr(pTipoRegistro)+', '+QuotedStr(pDataStr)+', '+IntToStr(pCliente)+', '+IntToStr(pTipoCliente)+', ';
  qSql          :=  qSql  + QuotedStr(edTicket.Text)+', '+IntToStr(pTipoChamado)+ ', ';

  pProgramador  :=  f_getID(4, cbProgramador.Text);
  qSql  :=  qSql  + 'NULL, '+IntToStr(pProgramador)+', ';

  qSql          :=  qSql  + QuotedStr(pTempo)+', '+QuotedStr(mDescricao.Text)+')';

  dmDados.dsKanbanInsert.CommandText  :=  '';
  dmDados.dsKanbanInsert.CommandText  :=  qSql;

  //Verificando Cliente
  if (pCliente = 0) then
    begin
      MessageDlg('FAVOR SELECIONAR UM CLIENTE VÁLIDO!'+#13+#13+
                  'Login: ['+cbCliente.Text+'] '+#13+
                  'Cliente Não Encontrado na Base de Dados!',mtWarning,[mbOk],0);
      cbCliente.SetFocus;
    end
  else
    begin
      try
        dmDados.dsKanbanInsert.ExecSQL;
        MessageDlg('Dados Gravados Com Sucesso!!',mtInformation,[mbOk],0);
        f_LimparCampos();
        f_LiberarCampos(False, False, False, False, False, False, False, False, False);
        f_LiberarBotao(True, False, True);
      except
        on E : Exception do
          begin
            MessageDlg(E.ClassName+' error raised, with message : '+E.Message,mtError,[mbOk],0);
            MessageDlg('Erro ao Gravar os Dados!',mtError,[mbOk],0);
            f_LiberarCampos(False, False, False, False, False, False, False, False, False);
            f_LiberarBotao(True, False, True);
          end;
      end;

    end;


end;

function TfrmCadastroKanban.f_getID(cTipo: Integer;
  cDados: String): Integer;
var
  qSql  : String;
  Resultado : Integer;
begin
  case cTipo of
  //TipoRegistro
  1 : begin
        qSql  :=  '';
        qSql  :=  'select ID from TIPO_REGISTRO where DESCRICAO = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('ID').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;
      end;

  //TIPOCHAMADO
  2 : begin
        qSql  :=  '';
        qSql  :=  'select ID from TICKET_TIPO where DESCRICAO = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('ID').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;
      end;

  //CLIENTE
  3 : begin
        qSql  :=  '';
        qSql  :=  'select ID from CLIENTES where LOGIN = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('ID').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;
      end;

  //PROGRAMADOR
  4 : begin
        qSql  :=  '';
        qSql  :=  'select PROGRAMADORES_ID from PROGRAMADORES where PROGRAMADORES_NOME = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('PROGRAMADORES_ID').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;
      end;

  //ATENDENTE
  5 : begin
        qSql  :=  '';
        qSql  :=  'select ATENDENTES_ID from ATENDENTES where ATENDENTES_NOME = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('ATENDENTES_ID').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;
      end;

  //TIPOCLIENTE
  6 : begin
        qSql  :=  '';
        qSql  :=  'select FK_CLIENTES_TIPO from CLIENTES where LOGIN = '+QuotedStr(cDados);
        dmDados.dsGetDados.CommandText  :=  '';
        dmDados.dsGetDados.CommandText  :=  qSql;
        dmDados.dsGetDados.Open;
        Resultado  :=  dmDados.dsGetDados.FieldByName('FK_CLIENTES_TIPO').AsInteger;
        dmDados.dsGetDados.Close;
        result    :=  Resultado;        
      end;
  end;

end;

procedure TfrmCadastroKanban.cbClienteExit(Sender: TObject);
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select * from CLIENTES where LOGIN = '+QuotedStr(cbCliente.Text);
  dmDados.dsGetDados.CommandText  :=  '';
  dmDados.dsGetDados.CommandText  :=  qSql;
  dmDados.dsGetDados.Open;
  dmDados.dsGetDados.First;
  edNomeCliente.Text  :=  dmDados.dsGetDados.FieldByName('NOMECLIENTE').AsString;
  dmDados.dsGetDados.Close;
end;

end.
