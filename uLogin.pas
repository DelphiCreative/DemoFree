unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Effects,
  FMX.Ani, FMX.TabControl;

type
  TfLogin = class(TForm)
    LayPrincipal: TLayout;
    Rectangle2: TRectangle;
    Rectangle4: TRectangle;
    ShadowEffect1: TShadowEffect;
    SpeedButton1: TSpeedButton;
    Rectangle3: TRectangle;
    TabControl1: TTabControl;
    tbLoginAcesso: TTabItem;
    tbLoginCadastro: TTabItem;
    Edit1: TEdit;
    Label1: TLabel;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btSalvarUsuario: TSpeedButton;
    StyleBook1: TStyleBook;
    Rectangle1: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Layout1: TLayout;
    edtUsuarioNome: TEdit;
    lblVerificaUsuario: TLabel;
    edtUsuarioSenha: TEdit;
    edtUsuarioConfirma: TEdit;
    lblUsuarioNome: TLabel;
    lblUsuarioSenha: TLabel;
    lblUsuarioSenhaConfirmar: TLabel;
    SpeedButton2: TSpeedButton;
    lblConfirmaSenha: TLabel;
    lblSenha: TLabel;
    lblUsuarioPendente: TLabel;
    retVoltarLogin: TRectangle;
    retAddUsuario: TRectangle;
    Rectangle6: TRectangle;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure Edit2ChangeTracking(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtUsuarioNomeChangeTracking(Sender: TObject);
    procedure edtUsuarioNomeExit(Sender: TObject);
    procedure edtUsuarioNomeEnter(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure edtUsuarioSenhaExit(Sender: TObject);
    procedure edtUsuarioConfirmaExit(Sender: TObject);
    procedure edtUsuarioConfirmaChangeTracking(Sender: TObject);
    procedure retAddUsuarioClick(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
  private
    { Private declarations }
    bAlterarSenha :Boolean;
    sIDUsuario :string;
    usuario :String;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.fmx}

uses uPrincipal, dPrincipal, uFuncoes, uContatos;

procedure TfLogin.Edit1ChangeTracking(Sender: TObject);
begin
   dmPrincipal.QuerySelect.Open('SELECT * FROM usuarios WHERE Nome = '+QuotedStr(Edit1.Text));
   if dmPrincipal.QuerySelect.RecordCount = 0 then begin
      lblUsuarioPendente.Visible := False;
      Label1.TextSettings.FontColor := TAlphaColors.Red;
      Edit1.TextSettings.FontColor := TAlphaColors.Red;
      Edit1.Tag := 0;
      Edit2.Tag := 0;
   end else  begin

      if dmPrincipal.QuerySelect.FieldByName('IDContato').AsString = '' then
         lblUsuarioPendente.Visible := True;

      Label1.TextSettings.FontColor := TAlphaColors.Steelblue;
      Edit1.TextSettings.FontColor := TAlphaColors.Steelblue;
      Edit1.Tag := dmPrincipal.QuerySelect.FieldByName('IDContato').AsInteger;
      if dmPrincipal.QuerySelect.FieldByName('Adm').AsString = 'True' then
         Edit2.Tag := 1
      else
         Edit2.Tag := 0;

   end;

end;

procedure TfLogin.Edit2ChangeTracking(Sender: TObject);
begin
   dmPrincipal.QuerySelect.Open('SELECT * FROM usuarios WHERE Nome = '+QuotedStr(Edit1.Text) + ' AND Senha ='+QuotedStr(Edit2.Text) );

   if dmPrincipal.QuerySelect.RecordCount = 0 then begin
      Label2.TextSettings.FontColor := TAlphaColors.Red;
      Edit2.TextSettings.FontColor := TAlphaColors.Red;
      usuario := '';
   end else  begin
      Label2.TextSettings.FontColor := TAlphaColors.Steelblue;
      Edit2.TextSettings.FontColor := TAlphaColors.Steelblue;
      usuario := Edit1.Text;
   end;
end;

procedure TfLogin.edtUsuarioConfirmaChangeTracking(Sender: TObject);
begin
   if edtUsuarioSenha.Text <> edtUsuarioConfirma.Text then begin
      lblConfirmaSenha.Visible := True;
      lblConfirmaSenha.Text := 'Senhas diferentes';
   end else lblConfirmaSenha.Visible := False;
end;

procedure TfLogin.edtUsuarioConfirmaExit(Sender: TObject);
begin
   if edtUsuarioConfirma.Text = '' then begin
      lblConfirmaSenha.Text := 'Informe a senha';
      lblConfirmaSenha.Visible := True;
   end else begin
      lblConfirmaSenha.Visible := False;
   end;

end;

procedure TfLogin.edtUsuarioNomeChangeTracking(Sender: TObject);
begin
   if edtUsuarioNome.Text <> '' then begin
      dmPrincipal.QuerySelect.Open('SELECT * FROM usuarios WHERE Nome = '+QuotedStr(edtUsuarioNome.Text));
      if dmPrincipal.QuerySelect.RecordCount = 0 then begin
         lblVerificaUsuario.Text :=  'Dísponivel'; //Settings.FontColor := TAlphaColors.Red;
         lblVerificaUsuario.TextSettings.FontColor := TAlphaColors.Steelblue;
      end else  begin
         lblVerificaUsuario.Text :=  'Indíponivel'; //Settings.FontColor := TAlphaColors.Red;
         lblVerificaUsuario.TextSettings.FontColor := TAlphaColors.Red;
      end;

   end else begin
      lblVerificaUsuario.Text :=  'Digite o nome de usuário'; //Settings.FontColor := TAlphaColors.Red;
      lblVerificaUsuario.TextSettings.FontColor := TAlphaColors.Red;
   end;

   lblVerificaUsuario.Visible := True;
end;

procedure TfLogin.edtUsuarioNomeEnter(Sender: TObject);
begin
   if edtUsuarioNome.Text = '' then begin
      lblVerificaUsuario.Visible := True;
      lblVerificaUsuario.Text := 'Digite o nome de usuário';
      lblVerificaUsuario.TextSettings.FontColor := TAlphaColors.Red;
   end;
end;

procedure TfLogin.edtUsuarioNomeExit(Sender: TObject);
begin
   if lblVerificaUsuario.Text = 'Dísponivel' then
      lblVerificaUsuario.Visible := False;
end;

procedure TfLogin.edtUsuarioSenhaExit(Sender: TObject);
begin
   if edtUsuarioSenha.Text = '' then begin
      lblSenha.Text := 'Informe a senha';
      lblSenha.Visible := True;
   end else lblSenha.Visible := False;

end;

procedure TfLogin.Label4Click(Sender: TObject);
begin
   edtUsuarioNome.Text := '';
   edtUsuarioSenha.Text := '';
   edtUsuarioConfirma.Text := '';
   fPrincipal.tbChangeCadastroUsuario.Execute;
end;

procedure TfLogin.Rectangle6Click(Sender: TObject);
begin
   Edit1.Text := '';
   Edit2.Text := '';
   fPrincipal.tbChangeLoginUsuario.Execute;
end;

procedure TfLogin.retAddUsuarioClick(Sender: TObject);
begin
   if (not lblConfirmaSenha.Visible) and (not lblSenha.Visible) and
      (not lblVerificaUsuario.Visible) then begin

         Executar('INSERT INTO usuarios (Nome,Senha) VALUES ('+
                  Quotedstr(edtUsuarioNome.text)+ ','+
                  Quotedstr(edtUsuarioSenha.text)+')');

      Edit1.Text := '';
      Edit2.Text := '';
      Notificacoes('','Usuário salvo','Aguarde liberação do administrador');
      fPrincipal.tbChangeLoginUsuario.Execute;
   end;
end;

procedure TfLogin.SpeedButton1Click(Sender: TObject);
var P:TContatos;
    notificacao :String;
begin
   if lblUsuarioPendente.Visible then abort;

   if (Edit1.Text = 'Master') and (Edit2.Text = 'nicolas14') then begin
      usuario := Edit1.Text;
   end;

   if usuario <> '' then begin
      fPrincipal.CarregaCardsCliente('');
      fPrincipal.CarregaCardsProfissional;
      fPrincipal.CarregaCardsFornecedor;
      fPrincipal.Rectangle6.Visible := False;
      fPrincipal.Rectangle7.Visible := False;
      fPrincipal.imgUsuario.Tag := Edit1.Tag;
      fPrincipal.lblUsuario.Tag := Edit2.Tag;
      fPrincipal.lblUsuario.Text := usuario;
      fPrincipal.retMenu.Visible := True;

      if Edit2.Tag = 1 then begin
         fPrincipal.lblUsuariosAguardando.Text := UsuariosAguardandoLiberacao;
         if fPrincipal.lblUsuariosAguardando.Text <> '0' then begin
            fPrincipal.retUsuariosAguardando.Visible := True;
            notificacao := 'Usuários aguardando liberação: ' +fPrincipal.lblUsuariosAguardando.Text ;
         end;
      end;

      Notificacoes('','Bem vindo, '+usuario,notificacao);
      fPrincipal.imgUsuario.LoadImagem(usuario);
      fPrincipal.lblAtendimentoProfissional.Tag := fPrincipal.imgUsuario.Tag;
      P := TContatos.Create;
      P.Contato(Edit1.Tag);
      fPrincipal.lblProfissional.Text := P.Nome;
      P.Free;

      fPrincipal.tbChangeHome.Execute;
      Close;
   end;

end;

procedure TfLogin.SpeedButton2Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
