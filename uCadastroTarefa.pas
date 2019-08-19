unit uCadastroTarefa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Effects, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Edit;

type
  TfCadastroTarefa = class(TForm)
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Line1: TLine;
    Label1: TLabel;
    Rectangle3: TRectangle;
    Label3: TLabel;
    Rectangle4: TRectangle;
    SpeedButton1: TSpeedButton;
    Rectangle5: TRectangle;
    SpeedButton2: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    LayPrincipal: TLayout;
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastroTarefa: TfCadastroTarefa;

implementation

{$R *.fmx}

uses dPrincipal, uPrincipal;

procedure TfCadastroTarefa.Edit1ChangeTracking(Sender: TObject);
begin
   dmPrincipal.QuerySelect.Open('SELECT * FROM tarefas WHERE Descricao = '+QuotedStr(Edit1.Text));
   if dmPrincipal.QuerySelect.RecordCount > 0 then begin
      Label1.Text := 'Tarefa cadastrada';
      Line1.Stroke.Color := TAlphaColors.Red;
      Label1.TextSettings.FontColor := TAlphaColors.Red;
      Edit1.TextSettings.FontColor := TAlphaColors.Red;
   end else  begin
      Label1.Text := 'Descrição da Tarefa';
      Line1.Stroke.Color := TAlphaColors.Steelblue;
      Label1.TextSettings.FontColor := TAlphaColors.Steelblue;
      Edit1.TextSettings.FontColor := TAlphaColors.Steelblue;
   end;

end;

procedure TfCadastroTarefa.SpeedButton1Click(Sender: TObject);
begin
   dmPrincipal.SqLiteConnection.ExecSQL('INSERT INTO tarefas (Descricao) values('+QuotedStr(Edit1.Text)+')');
   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;

end;

procedure TfCadastroTarefa.SpeedButton2Click(Sender: TObject);
begin
   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;
end;

end.
