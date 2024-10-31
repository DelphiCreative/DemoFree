unit FormLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Effects,
  FMX.Ani, FMX.TabControl;

type
  TfrmLogin = class(TForm)
    LayPrincipal: TLayout;
    rctBackground: TRectangle;
    ShadowEffect1: TShadowEffect;
    tbcLogin: TTabControl;
    tbLogin: TTabItem;
    tbRegister: TTabItem;
    btSalvarUsuario: TSpeedButton;
    StyleBook1: TStyleBook;
    laySignUp: TLayout;
    layLoginUsername: TLayout;
    rctLoginUsername: TRectangle;
    edtLoginUsername: TEdit;
    txtLoginUsername: TText;
    lblUsuarioPendente: TLabel;
    layLoginPassword: TLayout;
    rctLoginPassword: TRectangle;
    edtLoginPassword: TEdit;
    txtLoginPassword: TText;
    lblInfo: TLabel;
    lblSignUp: TLabel;
    Layout3: TLayout;
    rctExit: TRectangle;
    btnExit: TSpeedButton;
    imgExit: TImage;
    rctLogin: TRectangle;
    btnLogin: TSpeedButton;
    Layout5: TLayout;
    layRegisterUsername: TLayout;
    rctRegisterUsername: TRectangle;
    edtRegisterUsername: TEdit;
    txtRegisterUsername: TText;
    imgRegisterUsername: TImage;
    layRegisterConfirmPassword: TLayout;
    rctRegisterConfirmPassword: TRectangle;
    edtRegisterConfirmPassword: TEdit;
    txtRegisterConfirmPassword: TText;
    imgRegisterConfirmPassword: TImage;
    layRegisterPassword: TLayout;
    rctRegisterPassword: TRectangle;
    edtRegisterPassword: TEdit;
    txtRegisterPassword: TText;
    imgRegisterPassword: TImage;
    rctRegister: TRectangle;
    btnRegister: TSpeedButton;
    btnHaveAccount: TLabel;
    procedure btnLoginClick(Sender: TObject);
   // procedure Edit2ChangeTracking(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure lblSignUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLoginPasswordChangeTracking(Sender: TObject);
    function ValidateLogin :Boolean;
    procedure btnRegisterClick(Sender: TObject);
    procedure btnHaveAccountClick(Sender: TObject);
    procedure edtLoginUsernameEnter(Sender: TObject);
    procedure edtLoginUsernameExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bAlterarSenha :Boolean;
    sIDUsuario :string;
    procedure Login;
    procedure ExecuteLogin;
    function CheckUserLogin(const Username: string): Boolean;
  public
    { Public declarations }
//    procedure ShowValidationError(AMsg: string; AFocusControl: TControl); overload;
    procedure ShowValidation(ACondition: Boolean; AMsg: string; AFocusControl: TControl); overload;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses uPrincipal, dPrincipal, uFuncoes, uContatos, FMX.Alerts, FMX.Helper.Utils;

procedure TfrmLogin.edtLoginUsernameEnter(Sender: TObject);
begin
   ApplyShadowToShape(Sender);
end;

procedure TfrmLogin.edtLoginUsernameExit(Sender: TObject);
begin
   RemoveShadowFromShape(Sender);
end;

procedure TfrmLogin.ExecuteLogin;
begin
  ShowValidation(edtLoginUsername.Text = '', 'Informe um usuário', edtLoginUsername);
  ShowValidation(edtLoginPassword.Text = '', 'Informe sua senha', edtLoginPassword);

  if CheckUserLogin(edtLoginUsername.Text) then
      Login;
end;

procedure TfrmLogin.edtLoginPasswordChangeTracking(Sender: TObject);
begin
   ValidateLogin;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   edtLoginUsername.SetFocus;



end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   dmPrincipal.tabUsuarios.Open('SELECT * FROM usuarios');
   {$IFDEF DEBUG}
   edtLoginUsername.Text := 'ADM';
   edtLoginPassword.Text := '123';
   ExecuteLogin;
   Login;
   TThread.ForceQueue(nil,
    procedure
    begin
      Close;
    end
  );
   {$ENDIF}
end;

procedure TfrmLogin.lblSignUpClick(Sender: TObject);
begin
   edtRegisterUsername.Text := '';
   edtRegisterPassword.Text := '';
   edtRegisterConfirmPassword.Text := '';

   tbcLogin.GotoVisibleTab(tbRegister.Index)
end;

function TfrmLogin.CheckUserLogin(const Username: string): Boolean;
begin
  Result := False;

  if not dmPrincipal.tabUsuarios.Locate('Nome', Username, []) then
  begin
     edtLoginUsername.TextSettings.FontColor := TAlphaColors.Red;
     edtLoginUsername.Tag := 0;
     ShowValidation(edtRegisterUsername.Text = '', 'Usuário não localizado', edtRegisterUsername);
  end
  else
  begin
    edtLoginUsername.TextSettings.FontColor := TAlphaColors.Steelblue;
    edtLoginUsername.Tag := dmPrincipal.tabUsuarios.FieldByName('IDContato').AsInteger;

    if dmPrincipal.tabUsuarios.FieldByName('Adm').AsString = 'True' then
      edtLoginPassword.Tag := 1
    else
      edtLoginPassword.Tag := 0;

    Result := True;

    if dmPrincipal.tabUsuarios.FieldByName('IDContato').AsString = '' then begin
       Result := False;
       ShowValidation(edtRegisterUsername.Text = '', 'Usuário aguardando liberação', edtRegisterUsername);
    end;
  end;

end;


procedure TfrmLogin.Login;
var P:TContatos;
    notificacao :String;
begin

   if (edtLoginUsername.Text = 'Master') and (edtLoginPassword.Text = '1234') then begin
      //usuario := edtUserName.Text;
   end;

   if ValidateLogin then begin

      fPrincipal.CarregaCardsCliente('');
      fPrincipal.CarregaCardsProfissional;
      fPrincipal.CarregaCardsFornecedor;
      fPrincipal.Rectangle6.Visible := False;
      fPrincipal.Rectangle7.Visible := False;
      fPrincipal.imgUsuario.Tag := edtLoginUsername.Tag;
      fPrincipal.lblUsuario.Tag := edtLoginPassword.Tag;
      fPrincipal.lblUsuario.Text := edtLoginUsername.Text;
      fPrincipal.retMenu.Visible := True;

      if edtLoginPassword.Tag = 1 then begin
         fPrincipal.lblUsuariosAguardando.Text := UsuariosAguardandoLiberacao;
         if fPrincipal.lblUsuariosAguardando.Text <> '0' then begin
            fPrincipal.retUsuariosAguardando.Visible := True;
            notificacao := 'Usuários aguardando liberação: ' +fPrincipal.lblUsuariosAguardando.Text ;
         end;
      end;

      Notificacoes('','Bem vindo, '+edtLoginUsername.Text, notificacao);
      //fPrincipal.imgUsuario.LoadImagem(edtLoginUsername.Text);
      fPrincipal.lblAtendimentoProfissional.Tag := fPrincipal.imgUsuario.Tag;
      P := TContatos.Create;
      P.Contato(edtLoginUsername.Tag);
      fPrincipal.lblProfissional.Text := P.Nome;
      P.Free;

      fPrincipal.TabControl1.Visible := True;

      fPrincipal.tbChangeHome.Execute;
      Close;
   end;

end;

procedure TfrmLogin.ShowValidation(ACondition: Boolean; AMsg: string;
  AFocusControl: TControl);
begin
   ShowValidationError(ACondition, AMsg, rctLogin.Fill.Color, AFocusControl);
end;

procedure TfrmLogin.btnRegisterClick(Sender: TObject);
begin
   ShowValidation(edtRegisterUsername.Text = '', 'Digite o nome de usuário', edtRegisterUsername);

   if edtRegisterUsername.Text <> '' then
      ShowValidation(dmPrincipal.tabUsuarios.Locate('Nome', edtRegisterUsername.Text, []), 'Nome de usuário indisponível', edtRegisterUsername);

   ShowValidation(edtRegisterPassword.Text <> edtRegisterConfirmPassword.Text,'As senhas são diferente', edtRegisterConfirmPassword);

   dmPrincipal.tabUsuarios.Append;
   dmPrincipal.tabUsuarios.FieldByName('Nome').AsString := edtRegisterUsername.text;
   dmPrincipal.tabUsuarios.FieldByName('Senha').AsString := edtRegisterPassword.text;
   dmPrincipal.tabUsuarios.Post;

   edtLoginUsername.Text := '';
   edtLoginPassword.Text := '';
   Notificacoes('','Usuário salvo','Aguarde liberação do administrador');
   fPrincipal.tbChangeLoginUsuario.Execute;
end;

function TfrmLogin.ValidateLogin: Boolean;
begin

  if dmPrincipal.tabUsuarios.Locate('Nome', edtLoginUsername.Text, []) then
     ShowValidation(edtLoginPassword.Text <> dmPrincipal.tabUsuarios.FieldByName('Senha').AsString, 'Senha incorreta', edtLoginPassword)
  else
     ShowValidation(True, 'Usuário não localizado', edtLoginUsername);

  result := True;
end;

procedure TfrmLogin.btnHaveAccountClick(Sender: TObject);
begin
   edtLoginUsername.Text := '';
   edtLoginPassword.Text := '';
   tbcLogin.GotoVisibleTab(tbLogin.Index)
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin

  ExecuteLogin;

end;

procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.
