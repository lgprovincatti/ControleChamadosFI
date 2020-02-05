unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus, ShellApi;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    Cadastros1: TMenuItem;
    Kanban1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    NovaTask1: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbNomeAtendente: TLabel;
    lbDataHora: TLabel;
    lbTipoAcesso: TLabel;
    Label4: TLabel;
    lbDataHoraAtual: TLabel;
    Label5: TLabel;
    NovoCliente1: TMenuItem;
    FechamentoClientes1: TMenuItem;
    ParcialClientes1: TMenuItem;
    AtualizarAssuntosChamdos1: TMenuItem;
    ParcialClientesHoras1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    RelatrioChamadosFISistemas1: TMenuItem;
    RelatrioChamadosFISistemasPerodo1: TMenuItem;
    Supervisor1: TMenuItem;
    N3: TMenuItem;
    OTRSRelatrioAbertoGeral1: TMenuItem;
    OTRSRelatrioAbertoGeral2: TMenuItem;
    OTRSRelatrioAbertoPorFilaGeral1: TMenuItem;
    OTRSRelatrioQuantidadedeChamadosPorAnalista1: TMenuItem;
    OTRSRelatrioQuantidadedeChamadosPorAnalistaDetalhado1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure NovaTask1Click(Sender: TObject);
    procedure NovoCadastro1Click(Sender: TObject);
    procedure NovoCliente1Click(Sender: TObject);
    procedure FechamentoClientes1Click(Sender: TObject);
    procedure ParcialClientes1Click(Sender: TObject);
    procedure RelatrioChamadosFISistemasPerodo1Click(Sender: TObject);
    procedure ParcialClientesHoras1Click(Sender: TObject);
    procedure AtualizarAssuntosChamdos1Click(Sender: TObject);
    procedure RelatrioChamadosFISistemas1Click(Sender: TObject);
    procedure OTRSRelatrioAbertoGeral1Click(Sender: TObject);
    procedure OTRSRelatrioAbertoGeral2Click(Sender: TObject);
    procedure OTRSRelatrioAbertoPorFilaGeral1Click(Sender: TObject);
    procedure OTRSRelatrioQuantidadedeChamadosPorAnalista1Click(
      Sender: TObject);
    procedure OTRSRelatrioQuantidadedeChamadosPorAnalistaDetalhado1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function WinExecAndWait(const Path:  PChar; const Visibility:  Word; const Wait:  Boolean):  Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
  uses uAcesso, uCadastroChamado, uDmDados, uCadastroClientes, uFiltroRelatorioFechamento, uRelatorioClientesParcial, uRelatorioFechamentoNovo,
  DateUtils, uRelatorioControleChamadosFI_Periodo, uFiltroRelatorioPeriodo, uRelatorioAnual,
  uRelatorioOTRSAbertosGeral_Form, uFormRel_AbertosPorFila, uFormRel_QtdeAnalista, uFormRel_QtdeAnalistaDet;

{$R *.dfm}

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  lbDataHoraAtual.Caption :=  FormatDateTime('DD/MM/YYYY - HH:NN:SS', Now);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  frmAcesso.Close;
end;

procedure TfrmPrincipal.NovaTask1Click(Sender: TObject);
begin
  frmCadastroKanban.ShowModal;
end;

procedure TfrmPrincipal.NovoCadastro1Click(Sender: TObject);
begin
  frmCadastroKanban.ShowModal;
end;

procedure TfrmPrincipal.NovoCliente1Click(Sender: TObject);
begin
  frmCadastroClientes.ShowModal;
end;

procedure TfrmPrincipal.FechamentoClientes1Click(Sender: TObject);
var
  Data  : TDate;
  Dia   : String;
  Mes   : String;
  Ano   : String;
begin
//  frmFiltroRelatorioFechamento.f_getDadosClientes();
//  frmFiltroRelatorioFechamento.ShowModal;
    Data  :=  StartOfTheMonth(Now);
    frmRelatorioNovoFechamento.edDataInicio.Clear;
    frmRelatorioNovoFechamento.edDataInicio.Text  :=  FormatDateTime('DD/MM/YYYY', Data);
    Data  :=  EndOfTheMonth(Now);
    frmRelatorioNovoFechamento.edDataFinal.Clear;
    frmRelatorioNovoFechamento.edDataFinal.Text  :=  FormatDateTime('DD/MM/YYYY', Data);
    frmRelatorioNovoFechamento.rbTodosClientes.Checked  :=  True;
    frmRelatorioNovoFechamento.ShowModal;
end;

procedure TfrmPrincipal.ParcialClientes1Click(Sender: TObject);
var
  Data  : TDate;
begin
  Data  :=  StartOfTheMonth(Now);
  frmRelatorioClientesParcial.edDataInicial.Clear;
  frmRelatorioClientesParcial.edDataInicial.Text  :=  FormatDateTime('DD/MM/YYYY', Data);
  Data  :=  EndOfTheMonth(Now);
  frmRelatorioClientesParcial.edDataFinal.Clear;
  frmRelatorioClientesParcial.edDataFinal.Text  :=  FormatDateTime('DD/MM/YYYY', Data);
  frmRelatorioClientesParcial.f_CarregarDadosClientes();
  frmRelatorioClientesParcial.ShowModal;
end;

procedure TfrmPrincipal.RelatrioChamadosFISistemasPerodo1Click(
  Sender: TObject);
begin
  frmRelatorioPeriodoFiltro.edDataInicial.Text  :=  DateToStr(StartOfTheMonth(Now));
  frmRelatorioPeriodoFiltro.edDataFinal.Text    :=  DateToStr(EndOfTheMonth(Now));
  frmRelatorioPeriodoFiltro.rbTodos.Checked     :=  True;
  frmRelatorioPeriodoFiltro.ShowModal;
end;

function TfrmPrincipal.WinExecAndWait(const Path: PChar;
  const Visibility: Word; const Wait: Boolean): Boolean;
var
  ProcessInformation:  TProcessInformation;
  StartupInfo:  TStartupInfo;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb          := SizeOf(TStartupInfo);
    lpReserved  := NIL;
    lpDesktop   := NIL;
    lpTitle     := NIL;
    dwFlags     := STARTF_USESHOWWINDOW;
    wShowWindow := Visibility;
    cbReserved2 := 0;
    lpReserved2 := NIL
  end;

  result := CreateProcess(NIL,       {address of module name}
                          Path,      {address of command line}
                          NIL,       {address of process security attributes}
                          NIL,       {address of thread security attributes}
                          FALSE,     {new process inherits handle}
                          NORMAL_PRIORITY_CLASS,   {creation flags}
                          NIL,       {address of new environment block}
                          NIL,       {address of current directory name}
                          StartupInfo,
                          ProcessInformation);
  if Result then
  begin
    with ProcessInformation do
    begin
      if Wait then
      WaitForSingleObject(hProcess, INFINITE);
      CloseHandle(hThread);
      CloseHandle(hProcess)
    end;
   end;
end;

procedure TfrmPrincipal.ParcialClientesHoras1Click(Sender: TObject);
var
  comando : String;
begin
  comando :=  '\\192.168.1.235\publico\Lucas\ControleFISistemas - Suporte\PesquisaOTRS.exe';
  WinExecandWait(PCHAR(comando), SW_SHOWNORMAL, True);
end;

procedure TfrmPrincipal.AtualizarAssuntosChamdos1Click(Sender: TObject);
var
  comando : String;
begin
  comando :=  '\\192.168.1.235\publico\Lucas\ControleFISistemas - Suporte\AtualizarAssuntos.exe';
  WinExecandWait(PCHAR(comando), SW_SHOWNORMAL, True);
end;

procedure TfrmPrincipal.RelatrioChamadosFISistemas1Click(Sender: TObject);
begin
  frmRelatorioAnual.edAno.Clear;
  frmRelatorioAnual.edAno.Text  :=  DateToStr(YearOf(Now));
  frmRelatorioAnual.ShowModal;
end;

procedure TfrmPrincipal.OTRSRelatrioAbertoGeral1Click(Sender: TObject);
var
  comando : String;
begin
  comando :=  '\\192.168.1.235\publico\Lucas\ControleFISistemas - Suporte\RelatoriosOTRS.exe';
  WinExecandWait(PCHAR(comando), SW_SHOWNORMAL, True);
end;

procedure TfrmPrincipal.OTRSRelatrioAbertoGeral2Click(Sender: TObject);
begin
  dmDados.cdsRelatorioOTRS_AbertosGeral.Open;
  frmRelatorioOTRSAbertosGeral_Form.QuickRep1.Preview;
  dmDados.cdsRelatorioOTRS_AbertosGeral.Close;
end;

procedure TfrmPrincipal.OTRSRelatrioAbertoPorFilaGeral1Click(
  Sender: TObject);
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select * from REL_ABERTOS_GERAL_POR_FILA order by TIPO, CLIENTE_NOME asc';
  dmDados.dsRel_Abertos_Fila.CommandText  :=  '';
  dmDados.dsRel_Abertos_Fila.CommandText  :=  qSql;
  dmDados.cdsRel_Abertos_Fila.Open;
  frmFormRel_AbertosPorFila.QRLabel11.Caption :=  dmDados.cdsRel_Abertos_Fila.FieldByName('FILA').AsString;
  frmFormRel_AbertosPorFila.QuickRep1.Preview;
  dmDados.cdsRel_Abertos_Fila.Close;
end;

procedure TfrmPrincipal.OTRSRelatrioQuantidadedeChamadosPorAnalista1Click(
  Sender: TObject);
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select * from REL_ANALISTA_QTDE';
  dmDados.dsRel_QtdeAnalistas.CommandText :=  '';
  dmDados.dsRel_QtdeAnalistas.CommandText :=  qSql;
  dmDados.cdsRel_QtdeAnalistas.Open;
  frmRel_ChamadosAnalistaQtde.QuickRep1.Preview;
  dmDados.cdsRel_QtdeAnalistas.Close;
end;

procedure TfrmPrincipal.OTRSRelatrioQuantidadedeChamadosPorAnalistaDetalhado1Click(
  Sender: TObject);
var
  qSql  : String;
begin
  qSql  :=  '';
  qSql  :=  'select * from REL_ANALISTA_QTDE_DET';
  dmDados.dsRel_QtdeAnalistasDet.CommandText  :=  '';
  dmDados.dsRel_QtdeAnalistasDet.CommandText  :=  qSql;
  dmDados.cdsRel_QtdeAnalistasDet.Open;
  frmFormRelQtdeChamadosAnalistasDet.QuickRep1.Preview;
  dmDados.cdsRel_QtdeAnalistasDet.Open;  
end;

end.



