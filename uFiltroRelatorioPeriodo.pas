unit uFiltroRelatorioPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmRelatorioPeriodoFiltro = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    rbTodos: TRadioButton;
    rbAbertos: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicial: TMaskEdit;
    edDataFinal: TMaskEdit;
    btGerarRelatorio: TBitBtn;
    btVoltar: TBitBtn;
    procedure btVoltarClick(Sender: TObject);
    procedure btGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPeriodoFiltro: TfrmRelatorioPeriodoFiltro;

implementation
  uses uDmDados, uRelatorioControleChamadosFI_Periodo;

{$R *.dfm}

procedure TfrmRelatorioPeriodoFiltro.btVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioPeriodoFiltro.btGerarRelatorioClick(
  Sender: TObject);
var
  qSql  : String;
  DataInicial : String;
  DataFinal   : String;
  DataAux     : TDate;
  AnoSelecionado  : String;
begin
  if (edDataInicial.Text = '') then
    begin
      MessageDlg('FAVOR PREENCHER A DATA INICIAL.', mtWarning, [mbOK],0);
      edDataInicial.SetFocus;
      Exit;
    end;

  if (edDataFinal.Text = '') then
    begin
      MessageDlg('FAVOR PREENCHER A DATA FINAL.', mtWarning, [mbOK],0);
      edDataFinal.SetFocus;
      Exit;
    end;

  DataAux :=  StrToDate(edDataInicial.Text);
  DataInicial :=  FormatDateTime('MM/DD/YYYY', DataAux);
  DataAux :=  StrToDate(edDataFinal.Text);
  DataFinal :=  FormatDateTime('MM/DD/YYYY', DataAux);

  if (rbTodos.Checked = True) then
    begin
      qSql  :=  '';
      qSql  :=  qSql  + 'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE, PROBLEMA, ';
      qSql  :=  qSql  + 'MELHORIA, TREINAMENTO, DADOS, TREINAMENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, ';
      qSql  :=  qSql  + 'INCIDENTE_AB, PROBLEMA_AB, MELHORIA_AB, TREINAMENTO_AB, DADOS_AB, TREINAMENTOONLINE_AB, ';
      qSql  :=  qSql  + 'DADOS_AB, TREINAMENTOONLINE_AB, INSTALACAO_AB, DATA_INICIAL, DATA_FINAL ';
      qSql  :=  qSql  + 'from REL_CHAMADOS_FI where Data_Inicial = '+QuotedStr(DataInicial)+' and ';
      qSql  :=  qSql  + 'Data_Final = '+QuotedStr(DataFinal)+' and CRIADOS <> 0 ';
      qSql  :=  qSql  + 'order by CRIADOS desc';
      dmDados.dsRel_Periodo.CommandText :=  '';
      dmDados.dsRel_Periodo.CommandText :=  qSql;
      frmRelatorioChamadosFI_Periodo.QRDBText2.DataField    :=  'CRIADOS';
      frmRelatorioChamadosFI_Periodo.QRDBText10.DataField   :=  'UNCLASSIFIED';
      frmRelatorioChamadosFI_Periodo.QRDBText3.DataField    :=  'INCIDENTE';
      frmRelatorioChamadosFI_Periodo.QRDBText4.DataField    :=  'PROBLEMA';
      frmRelatorioChamadosFI_Periodo.QRDBText5.DataField    :=  'MELHORIA';
      frmRelatorioChamadosFI_Periodo.QRDBText6.DataField    :=  'TREINAMENTO';
      frmRelatorioChamadosFI_Periodo.QRDBText7.DataField    :=  'DADOS';
      frmRelatorioChamadosFI_Periodo.QRDBText8.DataField    :=  'TREINAMENTOONLINE';
      frmRelatorioChamadosFI_Periodo.QRDBText9.DataField    :=  'INSTALACAO';
      dmDados.dsRel_Periodo.Open;
      frmRelatorioChamadosFI_Periodo.QRLabel13.Caption   :=  'RELATÓRIO DE CHAMADOS CRIADOS [ POR PERÍODO ]';
      frmRelatorioChamadosFI_Periodo.QRLabel15.Caption   :=  edDataInicial.Text;
      frmRelatorioChamadosFI_Periodo.QRLabel17.Caption   :=  edDataFinal.Text;
      dmDados.cdsRel_Periodo.Open;
      frmRelatorioChamadosFI_Periodo.QuickRep1.Preview;
      dmDados.cdsRel_Periodo.Close;
    end;

  if (rbAbertos.Checked = True) then
    begin
      qSql  :=  '';
      qSql  :=  qSql  + 'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE, PROBLEMA, ';
      qSql  :=  qSql  + 'MELHORIA, TREINAMENTO, DADOS, TREINAMENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, ';
      qSql  :=  qSql  + 'INCIDENTE_AB, PROBLEMA_AB, MELHORIA_AB, TREINAMENTO_AB, DADOS_AB, TREINAMENTOONLINE_AB, ';
      qSql  :=  qSql  + 'DADOS_AB, TREINAMENTOONLINE_AB, INSTALACAO_AB, DATA_INICIAL, DATA_FINAL ';
      qSql  :=  qSql  + 'from REL_CHAMADOS_FI where Data_Inicial = '+QuotedStr(DataInicial)+' and ';
      qSql  :=  qSql  + 'Data_Final = '+QuotedStr(DataFinal)+' and CRIADO_AB <> 0 ';
      qSql  :=  qSql  + 'order by CRIADO_AB desc';
      dmDados.dsRel_PeriodoAberto.CommandText :=  '';
      dmDados.dsRel_PeriodoAberto.CommandText :=  qSql;
      frmRelatorioChamadosFI_Periodo.QRDBText2.DataField    :=  'CRIADO_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText10.DataField   :=  'UNCLASSIFIED_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText3.DataField    :=  'INCIDENTE_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText4.DataField    :=  'PROBLEMA_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText5.DataField    :=  'MELHORIA_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText6.DataField    :=  'TREINAMENTO_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText7.DataField    :=  'DADOS_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText8.DataField    :=  'TREINAMENTOONLINE_AB';
      frmRelatorioChamadosFI_Periodo.QRDBText9.DataField    :=  'INSTALACAO_AB';
      dmDados.dsRel_PeriodoAberto.Open;
      frmRelatorioChamadosFI_Periodo.QRLabel13.Caption   :=  'RELATÓRIO DE CHAMADOS EM ABERTO [ POR PERÍODO ]';
      frmRelatorioChamadosFI_Periodo.QRLabel15.Caption   :=  edDataInicial.Text;
      frmRelatorioChamadosFI_Periodo.QRLabel17.Caption   :=  edDataFinal.Text;
      dmDados.dsRel_PeriodoAberto.Open;
      frmRelatorioChamadosFI_Periodo.QuickRep1.Preview;
      dmDados.dsRel_PeriodoAberto.Close;
    end;

end;

end.
