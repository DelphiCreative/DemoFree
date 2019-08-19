unit uCardAtendimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfCardAtendimento = class(TForm)
    LayPrincipal: TLayout;
    retCardAtendimento: TRectangle;
    lblHorario: TLabel;
    lblContato: TLabel;
    lblAnotacoes: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    imgCliente: TRoundRect;
    procedure retCardAtendimentoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCardAtendimento: TfCardAtendimento;

implementation

{$R *.fmx}

uses uPrincipal;

procedure TfCardAtendimento.retCardAtendimentoDblClick(Sender: TObject);
begin
   fPrincipal.GerarAtendimento(0,0,retCardAtendimento.Tag);

end;

end.
