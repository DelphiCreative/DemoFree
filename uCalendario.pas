unit uCalendario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects;

type
  TfCalendario = class(TForm)
    LayPrincipal: TLayout;
    GridMes: TGridPanelLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    procedure CarregaCalendario(DataCalendario:TDate);
    procedure FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCalendario: TfCalendario;

implementation

{$R *.fmx}

uses uPrincipal;

{ TfCalendario }

procedure TfCalendario.CarregaCalendario(DataCalendario:TDate);
var
   sAno,sMes :String;
   i,iDia : Integer;
   btnDia :TButton;
   Panel,RunPanel :TPanel;
   lblVazio :TLabel;
   txtDia :TText;
   Horarios :String;
   retDia : TRectangle;
begin

   RunPanel :=  TPanel.Create(nil);

   sMes := FormatDateTime('MM',DataCalendario);
   sAno := FormatDateTime('YYYY',DataCalendario);

   Self.BeginUpdate;
   for I := 0 to GridMes.ComponentCount - 1 do begin
      if (GridMes.Components[I] is TFmxObject) then
         TFmxObject(GridMes.Components[I]).Parent := RunPanel;
   end;
   Self.EndUpdate;

   FreeAndNil(RunPanel);

   GridMes.BeginUpdate;
   for I := 1 to (MonthDays[IsLeapYear(StrToInt(sAno)),strToInt(sMes)]) do begin
      if (I = 1)  then begin
         for IDia := 2 to  dayofweek(strtodate( Inttostr(i) + '/'+ sMes +'/'+ sAno )) do begin
            txtDia       := TText.Create(GridMes);
            txtDia.Align := TAlignLayout.Client;
            txtDia.Text  := '';
            txtDia.Parent :=  GridMes;
         end;
      end;

      retDia := TRectangle.Create(GridMes);
      retDia.Align          := TAlignLayout.Client;
      retDia.Fill.Color     := TAlphaColors.Null;
      retDia.Stroke.Color   := TAlphaColors.Null;
      retDia.Margins.Top    := 1;
      retDia.Margins.Left   := 1;
      retDia.Margins.Right  := 1;
      retDia.Margins.Bottom := 1;
      retDia.parent         := GridMes;

      txtDia := TText.Create(GridMes);
      txtDia.Align := TAlignLayout.Client;
      txtDia.Text := Inttostr(i);

      txtDia.Hint := sAno +'-'+sMes+'-'+ (FormatFloat('00',i));
//      txtDia.OnClick    := DiaClick;
      txtDia.OnDblClick := FecharClick;
      txtDia.Margins.Top := 1;
      txtDia.Margins.Left := 1;
      txtDia.Margins.Right:= 1;
      txtDia.Margins.Bottom := 1;
      txtDia.Parent :=  retDia;
      retDia.Fill.Color :=TAlphaColors.White;
         txtDia.TextSettings.FontColor := TAlphaColors.Steelblue;

   end;
   GridMes.EndUpdate;


end;

procedure TfCalendario.FecharClick(Sender: TObject);
begin
   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;
end;


end.
