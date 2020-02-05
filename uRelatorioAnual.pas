unit uRelatorioAnual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmRelatorioAnual = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edAno: TMaskEdit;
    btGerarRelatorio: TBitBtn;
    btVoltar: TBitBtn;
    rbTodos: TRadioButton;
    rbAberto: TRadioButton;
    Label2: TLabel;
    procedure btVoltarClick(Sender: TObject);
    procedure btGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioAnual: TfrmRelatorioAnual;

implementation

{$R *.dfm}

procedure TfrmRelatorioAnual.btVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioAnual.btGerarRelatorioClick(Sender: TObject);
var
  qSql  : String;
  Ano  : String;
begin
  Ano   :=  '';
  Ano   :=  edAno.Text;

  if (Ano = '') then
    begin
      MessageDlg('Favor Preencher o Ano!', mtError,[mbOK],0);
      Exit;
    end;

  if (rbTodos.Checked = True) then
    begin
      qSql  :=  '';
      qSql  :=  qSql  + 'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE, PROBLEMA, ';
      qSql  :=  qSql  + 'MELHORIA, TREINAMENTO, DADOS, TREINAMENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, ';
      qSql  :=  qSql  + 'INCIDENTE_AB, PROBLEMA_AB, MELHORIA_AB, TREINAMENTO_AB, DADOS_AB, TREINAMENTOONLINE_AB, ';
      qSql  :=  qSql  + 'DADOS_AB, TREINAMENTOONLINE_AB, INSTALACAO_AB, ANO_SELECIONADO ';
      qSql  :=  qSql  + 'from REL_CHAMADOS_FI_ANO where ANO_SELECIONADO = '+QuotedStr(Ano)+' and ';
      qSql  :=  qSql  + ' and CRIADOS <> 0 ';
      qSql  :=  qSql  + 'order by CRIADOS desc';
    end;

  if (rbAberto.Checked = True) then
    begin
      qSql  :=  '';
      qSql  :=  qSql  + 'select distinct(SERVICO_NOME), CRIADOS, UNCLASSIFIED, INCIDENTE, PROBLEMA, ';
      qSql  :=  qSql  + 'MELHORIA, TREINAMENTO, DADOS, TREINAMENTOONLINE, INSTALACAO, CRIADO_AB, UNCLASSIFIED_AB, ';
      qSql  :=  qSql  + 'INCIDENTE_AB, PROBLEMA_AB, MELHORIA_AB, TREINAMENTO_AB, DADOS_AB, TREINAMENTOONLINE_AB, ';
      qSql  :=  qSql  + 'DADOS_AB, TREINAMENTOONLINE_AB, INSTALACAO_AB,  ANO_SELECIONADO ';
      qSql  :=  qSql  + 'from REL_CHAMADOS_FI_ANO where ANO_SELECIONADO = '+QuotedStr(Ano)+' and ';
      qSql  :=  qSql  + ' and CRIADOS <> 0 ';
      qSql  :=  qSql  + 'order by CRIADOS desc';
    end;

end;

end.
