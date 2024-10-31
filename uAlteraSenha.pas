unit uAlteraSenha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Layouts, FMX.StdCtrls, FMX.Ani, FMX.Objects, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Effects;

type
  TfAlteraSenha = class(TForm)
    Layout1: TLayout;
    ShadowEffect1: TShadowEffect;
    Layout5: TLayout;
    layRegisterUsername: TLayout;
    rctRegisterUsername: TRectangle;
    edtRegisterUsername: TEdit;
    txtRegisterUsername: TText;
    imgRegisterUsername: TImage;
    layRegisterNewPassword: TLayout;
    rctRegisterNewPassword: TRectangle;
    edtRegisterNewPassword: TEdit;
    txtRegisterNewPassword: TText;
    imgRegisterNewPassword: TImage;
    layRegisterPassword: TLayout;
    rctRegisterPassword: TRectangle;
    edtRegisterPassword: TEdit;
    txtRegisterPassword: TText;
    imgRegisterPassword: TImage;
    rctRegister: TRectangle;
    btnRegister: TSpeedButton;
    layRegisterConfirmPassword: TLayout;
    rctRegisterConfirmPassword: TRectangle;
    edtRegisterConfirmPassword: TEdit;
    txtRegisterConfirmPassword: TText;
    imgRegisterConfirmPassword: TImage;
    Rectangle2: TRectangle;
    Text2: TText;
    SpeedButton1: TSpeedButton;
    procedure Rectangle6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure edtRegisterPasswordEnter(Sender: TObject);
    procedure edtRegisterPasswordExit(Sender: TObject);
  private
    { Private declarations }
    procedure UpdatePassword(ANewUserName, ANewPassword, AOldPassword, AOldUserName:String);
  public
    { Public declarations }
  end;

var
  fAlteraSenha: TfAlteraSenha;

implementation

{$R *.fmx}

uses dPrincipal, uPrincipal, uFuncoes, FMX.Helper.Utils;

procedure TfAlteraSenha.btnRegisterClick(Sender: TObject);
begin

   dmPrincipal.tabUsuarios.Locate('Nome',fPrincipal.lblUsuario.Text,[]);

   ShowValidationError(edtRegisterPassword.Text = '','Digite sua senha',
                       rctRegister.Fill.Color , edtRegisterPassword);

   ShowValidationError(edtRegisterPassword.Text <> dmPrincipal.tabUsuarios.FieldByName('Senha').AsString,'Senha inválida',
                       rctRegister.Fill.Color , edtRegisterPassword);

   ShowValidationError(edtRegisterNewPassword.Text = '','Informe a nova senha',
                       rctRegister.Fill.Color , edtRegisterNewPassword);

   ShowValidationError(edtRegisterConfirmPassword.Text = '','Confirme a nova senha',
                       rctRegister.Fill.Color , edtRegisterConfirmPassword);

   ShowValidationError(edtRegisterNewPassword.Text <> edtRegisterConfirmPassword.Text,'As senhas são diferente',
                       rctRegister.Fill.Color , edtRegisterConfirmPassword);


   Executar('UPDATE usuarios SET Senha ='+QuotedStr(edtRegisterNewPassword.Text) +
                 ' WHERE Nome = ' + QuotedStr(edtRegisterUsername.text));

   ShowValidationError('Senha alterada com sucesso',  rctRegister.Fill.Color , edtRegisterConfirmPassword);

end;

procedure TfAlteraSenha.edtRegisterPasswordEnter(Sender: TObject);
begin
   ApplyShadowToShape(Sender);
end;

procedure TfAlteraSenha.edtRegisterPasswordExit(Sender: TObject);
begin
   RemoveShadowFromShape(Sender);
end;

procedure TfAlteraSenha.Rectangle6Click(Sender: TObject);
begin
   Close;
end;

procedure TfAlteraSenha.SpeedButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfAlteraSenha.UpdatePassword(ANewUserName, ANewPassword, AOldPassword,
  AOldUserName: String);
begin

end;

end.
