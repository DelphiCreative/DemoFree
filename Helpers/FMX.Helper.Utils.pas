unit FMX.Helper.Utils;

interface

uses
  System.SysUtils, System.Classes, System.UITypes,
  FMX.Alerts, FMX.Edit, FMX.Memo, FMX.Forms,
  FMX.Types, FMX.Controls, FMX.Objects, FMX.Effects;

type
  TFormHelper = class helper for TForm
  public
    procedure ShowValidationError(AMsg: string; AColor :TAlphaColor; AFocusControl: TControl); overload;
    procedure ShowValidationError(ACondition: Boolean; AMsg: string; AColor :TAlphaColor; AFocusControl: TControl); overload;
  end;

type
  TControlHelper = class helper for TControl
  public
    procedure HandleKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure AutoSetupTabOrderNavigation;
  end;

type
  TShapeHelper = class helper for TShape
  public
    procedure ApplyShadow;
    procedure RemoveShadow;
  end;

  procedure ApplyShadowToShape(Sender: TObject);
  procedure RemoveShadowFromShape(Sender: TObject);

implementation

{ TShapeHelper }

procedure TShapeHelper.ApplyShadow;
var
  Shadow: TShadowEffect;
begin
  Shadow := TShadowEffect.Create(Self);
  Self.Stroke.Thickness := 1;
  Self.Stroke.Color := TAlphaColorRec.Gray;
  Self.AddObject(Shadow);
  Shadow.Distance := 2;
  Shadow.Direction := 45;
  Shadow.Softness := 0.1;
  Shadow.Opacity := 0.1;
  Shadow.ShadowColor := TAlphaColorRec.Black;
end;

procedure TShapeHelper.RemoveShadow;
var
  i: Integer;
  Shadow: TShadowEffect;
begin
  for i := Self.ChildrenCount - 1 downto 0 do
  begin
    if Self.Children[i] is TShadowEffect then
    begin
      Shadow := TShadowEffect(Self.Children[i]);
      Self.RemoveObject(Shadow);
      Shadow.Free;
    end;
  end;
  Self.Stroke.Thickness := 0;
end;

{ Generic Procedures for Event Handlers }

procedure ApplyShadowToShape(Sender: TObject);
var
  Shape: TShape;
begin
  if Sender is TEdit then
  begin
    Shape := TShape(TEdit(Sender).Parent); // Assumindo que o TEdit está dentro do TShape
    TEdit(Sender).AutoSetupTabOrderNavigation;
    Shape.ApplyShadow;
  end else if Sender is TMemo then begin
    Shape := TShape(TMemo(Sender).Parent); // Assumindo que o TEdit está dentro do TShape
    TMemo(Sender).AutoSetupTabOrderNavigation;
    Shape.ApplyShadow;
  end;
end;

procedure RemoveShadowFromShape(Sender: TObject);
var
  Shape: TShape;
begin
  if Sender is TEdit then
  begin
    Shape := TShape(TEdit(Sender).Parent); // Assumindo que o TEdit está dentro do TShape
    Shape.RemoveShadow;
  end else if Sender is TMemo then begin
    Shape := TShape(TMemo(Sender).Parent); // Assumindo que o TEdit está dentro do TShape
    Shape.RemoveShadow;
  end;
end;

{ TControlHelper }

procedure TControlHelper.HandleKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
  NextControl: TControl;
  NextTag: Integer;
  I: Integer;
  RootParent: TFMXObject;
begin
  if (Key = vkReturn) or (Key = vkTab) then
  begin
    Key := 0;
    if ssShift in Shift then
      NextTag := Self.Tag - 1
    else
      NextTag := Self.Tag + 1;

    RootParent := Self;
    while Assigned(RootParent.Parent) do
      RootParent := RootParent.Parent;
    for I := 0 to RootParent.ComponentCount - 1 do
    begin
      if (RootParent.Components[I] is TControl) then
      begin
        NextControl := TControl(RootParent.Components[I]);
        if NextControl.Tag = NextTag then
        begin
          NextControl.SetFocus;
          Break;
        end;
      end;
    end;
  end;
end;
procedure TControlHelper.AutoSetupTabOrderNavigation;
begin
  Self.OnKeyUp := HandleKeyDown;
end;

{ TFormHelper }

procedure TFormHelper.ShowValidationError(ACondition: Boolean; AMsg: string;
  AColor :TAlphaColor; AFocusControl: TControl);
begin

  if not ACondition then
     Exit;

   var alert := TAlert.Create(Self, AMsg, atNone, TAlphaColors.White, AColor);
   alert.Opacity := True;
   alert.AlertRectHeight := 30;
   alert.ShowBottomToast;

   if Assigned(AFocusControl) then
      AFocusControl.SetFocus;

   Abort;

end;

procedure TFormHelper.ShowValidationError(AMsg: string; AColor :TAlphaColor;
  AFocusControl: TControl);
begin
   ShowValidationError(True, AMsg, AColor, AFocusControl)
end;

end.

