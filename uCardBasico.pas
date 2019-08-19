unit uCardBasico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Effects, FMX.Objects;

type
  TfCardBasico = class(TForm)
    LayoutCard: TLayout;
    retPrincipal: TRectangle;
    SombraPrincipal: TShadowEffect;
    retTopo: TRectangle;
    SombraTopo: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCardBasico: TfCardBasico;

implementation

{$R *.fmx}

end.
