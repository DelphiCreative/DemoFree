unit uAlteraSenha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Layouts, FMX.StdCtrls, FMX.Ani, FMX.Objects, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Effects;

type
  TfAlteraSenha = class(TForm)
    TabControl1: TTabControl;
    tbLoginAcesso: TTabItem;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle1: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Rectangle4: TRectangle;
    SpeedButton1: TSpeedButton;
    Rectangle3: TRectangle;
    SpeedButton2: TSpeedButton;
    tbLoginCadastro: TTabItem;
    btSalvarUsuario: TSpeedButton;
    Layout1: TLayout;
    edtUsuarioNome: TEdit;
    lblVerificaUsuario: TLabel;
    edtUsuarioSenha: TEdit;
    lblSenha: TLabel;
    edtUsuarioConfirma: TEdit;
    lblConfirmaSenha: TLabel;
    lblUsuarioNome: TLabel;
    lblUsuarioSenha: TLabel;
    lblUsuarioSenhaConfirmar: TLabel;
    retVoltarLogin: TRectangle;
    retAddUsuario: TRectangle;
    Rectangle6: TRectangle;
    Edit2: TEdit;
    Label2: TLabel;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure retAddUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlteraSenha: TfAlteraSenha;

implementation

{$R *.fmx}

uses dPrincipal, uPrincipal, uFuncoes;

procedure TfAlteraSenha.Edit1ChangeTracking(Sender: TObject);
begin
   dmPrincipal.QuerySelect.Open('SELECT * FROM usuarios WHERE Nome = '+QuotedStr(fPrincipal.lblUsuario.Text) +
                                ' AND Senha ='+QuotedStr(Edit2.Text) );

   if dmPrincipal.QuerySelect.RecordCount = 0 then
      edtUsuarioNome.Enabled := False
   else
      edtUsuarioNome.Enabled := True;

   edtUsuarioNome.Tag := dmPrincipal.QuerySelect.FieldByName('ID').AsInteger;
   edtUsuarioSenha.Enabled := edtUsuarioNome.Enabled;
   edtUsuarioConfirma.Enabled := edtUsuarioNome.Enabled

end;

procedure TfAlteraSenha.Rectangle6Click(Sender: TObject);
begin
   Close;
end;

procedure TfAlteraSenha.retAddUsuarioClick(Sender: TObject);
begin

   if edtUsuarioSenha.Text = '' then begin
      lblSenha.Text := 'Informe a senha';
      lblSenha.Visible := True;
      abort;
   end else lblSenha.Visible := False;

   if edtUsuarioConfirma.Text = '' then begin
      lblUsuarioSenha.Text := 'Informe a senha';
      lblUsuarioSenha.Visible := True;
      abort;
   end else lblUsuarioSenha.Visible := True;

   if edtUsuarioSenha.Text <> edtUsuarioConfirma.Text then begin
      lblSenha.Text := 'Senhas não conferem';
      lblSenha.Visible := True;
      abort;
   end;

   if (edtUsuarioNome.Text <> '') and (edtUsuarioNome.Text <> fPrincipal.lblUsuario.Text) then begin
      dmPrincipal.QuerySelect.Open('SELECT * FROM usuarios WHERE Nome = '+QuotedStr(edtUsuarioNome.Text));
      if dmPrincipal.QuerySelect.RecordCount > 0 then begin
         lblVerificaUsuario.Visible := True;
         lblVerificaUsuario.Text := 'Nome indísponivel';
         lblVerificaUsuario.TextSettings.FontColor := TAlphaColors.Red;
         abort;
      end else begin
         Executar('UPDATE usuarios SET Nome = '+QuotedStr(edtUsuarioNome.Text) +
                  ',Senha ='+QuotedStr(edtUsuarioSenha.Text) + ' WHERE ID = '+inttostr(edtUsuarioNome.tag) );
         fPrincipal.lblUsuario.Text := edtUsuarioNome.Text;
         Close;
      end;
   end else if (edtUsuarioNome.Text = '') then begin
        Executar('UPDATE usuarios SET Senha ='+QuotedStr(edtUsuarioSenha.Text) +
                 ' WHERE ID = '+inttostr(edtUsuarioNome.tag));
        Close;
   end;

end;

end.
