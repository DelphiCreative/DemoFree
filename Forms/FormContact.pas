unit FormContact;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Edit, FMX.Layouts, FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    rctBackground: TRectangle;
    SpeedButton1: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    Text1: TText;
    Rectangle4: TRectangle;
    Text5: TText;
    edtDescription: TMemo;
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    edtItemId: TEdit;
    Text2: TText;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    edtCategory: TEdit;
    Text3: TText;
    Layout3: TLayout;
    Rectangle5: TRectangle;
    edtPrice: TEdit;
    Text6: TText;
    Rectangle3: TRectangle;
    Text4: TText;
    edtName: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
