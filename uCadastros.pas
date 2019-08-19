unit uCadastros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfCadastros = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    layPrincipal: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastros: TfCadastros;

implementation

{$R *.fmx}

end.
