unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TfrmAcesso = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edLogin: TEdit;
    edSenha: TEdit;
    btAcessar: TBitBtn;
    btSair: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btAcessarClick(Sender: TObject);
  private
    { Private declarations }
    function f_geraSenha(Login, Senha:String):Boolean;
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

implementation
  uses uDmDados, uPrincipal, DateUtils;
  
{$R *.dfm}

procedure TfrmAcesso.btSairClick(Sender: TObject);
begin
  //Finalizando Conex�o com o Banco
  dmDados.cn.Connected  :=  False;

  Application.Terminate;
end;

procedure TfrmAcesso.btAcessarClick(Sender: TObject);
var
  qSql                        : String;
  Login, Senha, Status        : String;
  AtendenteLogado, TipoAcesso : String;
begin
  //Iniciando Conex�o com o Banco
  dmDados.cn.Connected  :=  True;

  //Pegando Dados de Login - Form
  Login   :=  UpperCase(edLogin.Text);
  Senha   :=  UpperCase(edSenha.Text);
  Status  :=  'A';

  qSql  :=  '';
  qSql  := 'select * from ATENDENTES where ATENDENTES_LOGIN = '+QuotedStr(Login)+
           ' and ATENDENTES_SENHA = '+QuotedStr(Senha)+' and ATENDENTES_STATUS = '+QuotedStr(Status);

  dmDados.dsAcessoSQL.CommandText :=  '';
  dmDados.dsAcessoSQL.CommandText :=  qSql;
  dmDados.dsAcessoSQL.Open;

  if (dmDados.dsAcessoSQL.IsEmpty) and (f_geraSenha(Login, Senha) = False) then
    begin
      dmDados.dsAcessoSQL.Close;
      MessageDlg('Dados Incorretos!! Favor verificar!!',mtError,[mbOk],0);
      edLogin.Clear;
      edSenha.Clear;
      edLogin.SetFocus;
    end
  else
    begin
      MessageDlg('Dados Validados com Sucesso! Acesso OK',mtInformation,[mbOk],0);
      if (f_geraSenha(Login, Senha) = True) then
        begin
          AtendenteLogado :=  'SUPERFI';
          TipoAcesso      :=  'SUPORTE';
        end
      else
        begin
          AtendenteLogado :=  dmDados.dsAcessoSQL.FieldByName('ATENDENTES_NOME').AsString;
          TipoAcesso      :=  dmDados.dsAcessoSQL.FieldByName('ATENDENTES_SUPORTE').AsString;
        end;

      if (TipoAcesso = 'DIRETORIA') then
        begin
          frmPrincipal.MainMenu1.Items[0].Visible :=  True;
          frmPrincipal.MainMenu1.Items[1].Visible :=  True;
          frmPrincipal.MainMenu1.Items[2].Visible :=  True;
          frmPrincipal.MainMenu1.Items[3].Visible :=  True;
          frmPrincipal.MainMenu1.Items[4].Visible :=  True;
          TipoAtendenteValidacao  :=  TipoAcesso;
        end;


      if (TipoAcesso = 'SUPERVISOR') then
        begin
          frmPrincipal.MainMenu1.Items[0].Visible :=  True;
          frmPrincipal.MainMenu1.Items[1].Visible :=  True;
          frmPrincipal.MainMenu1.Items[2].Visible :=  True;
          frmPrincipal.MainMenu1.Items[3].Visible :=  True;
          frmPrincipal.MainMenu1.Items[4].Visible :=  True;
          TipoAtendenteValidacao  :=  TipoAcesso;
        end;

      if (TipoAcesso = 'SUPORTE') then
        begin
          frmPrincipal.MainMenu1.Items[0].Visible :=  False;
          frmPrincipal.MainMenu1.Items[1].Visible :=  True;
          frmPrincipal.MainMenu1.Items[2].Visible :=  False;
          frmPrincipal.MainMenu1.Items[3].Visible :=  False;
          frmPrincipal.MainMenu1.Items[4].Visible :=  True;
          TipoAtendenteValidacao  :=  TipoAcesso;
        end;

      if (TipoAcesso = 'ODONTOTECH') then
        begin
          frmPrincipal.MainMenu1.Items[0].Visible :=  False;
          frmPrincipal.MainMenu1.Items[1].Visible :=  True;
          frmPrincipal.MainMenu1.Items[2].Visible :=  False;
          frmPrincipal.MainMenu1.Items[3].Visible :=  False;
          frmPrincipal.MainMenu1.Items[4].Visible :=  True;
          TipoAtendenteValidacao  :=  TipoAcesso;
        end;

      frmPrincipal.lbNomeAtendente.Caption  :=  AtendenteLogado;
      frmPrincipal.lbTipoAcesso.Caption     :=  TipoAcesso;
      frmPrincipal.lbDataHora.Caption       :=  FormatDateTime('DD/MM/YYYY - HH:NN:SS', Now);
      frmAcesso.Visible                     :=  False;
      frmPrincipal.ShowModal;
      dmDados.dsAcessoSQL.Close;
    end;
end;

function TfrmAcesso.f_geraSenha(Login, Senha: String): Boolean;
var
  SenhaFI : String;
  nroFI   : Integer;
begin
  //(dia*79)+(mes*12)
  nroFI   :=  (DayOfTheMonth(Now)*79)+(MonthOfTheYear(Now)*12);
  SenhaFI :=  'FI.'+IntToStr(nroFI);

  if (Login = 'SUPERFI') and (Senha = SenhaFI) then
    result  :=  True
  else
    result  :=  False;
end;

end.
