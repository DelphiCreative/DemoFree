unit uCardClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3;

type
  TfrmCardClientes = class(TForm)
    LayoutCard: TLayout;
    RectangleCard: TRectangle;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    Label2: TLabel;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure Circle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardClientes: TfrmCardClientes;

implementation

{$R *.fmx}

uses uPrincipal, dPrincipal, uFuncoes;

procedure TfrmCardClientes.Circle1Click(Sender: TObject);
begin
   fPrincipal.CadastroContatos(Inttostr(Circle1.Tag),Circle1.Hint,'Dados Cliente','');
end;

end.
