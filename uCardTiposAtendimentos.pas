unit uCardTiposAtendimentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uCardBasico, FMX.Effects, FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.Colors,
  FMX.Controls.Presentation, FMX.Edit, FMX.ComboEdit,System.RegularExpressions;

type
  TfCardTiposAtendimentos = class(TfCardBasico)
    ListBox1: TListBox;
    Rectangle1: TRectangle;
    btnSair: TSpeedButton;
    Rectangle2: TRectangle;
    cbxTarefas: TComboEdit;
    lblTitulo: TLabel;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    btnSalvar: TSpeedButton;
    Rectangle6: TRectangle;
    Rectangle5: TRectangle;
    procedure CarregaLista(IDTarefa :Integer);
    procedure Tarefas;
    procedure btnSairClick(Sender: TObject);
    procedure cbxTarefasChangeTracking(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCardTiposAtendimentos: TfCardTiposAtendimentos;

implementation

{$R *.fmx}

uses dPrincipal, uPrincipal;

{ TfCardBasico1 }

procedure TfCardTiposAtendimentos.btnSalvarClick(Sender: TObject);
var I,L :Integer;
    s :TStringBuilder;
    arrDescricao :TArray<String>;
begin
   inherited;
   if (Trim(cbxTarefas.Text) <> '')and (cbxTarefas.ItemIndex = -1) then begin
      dmPrincipal.QuerySelect.Open('SELECT Codigo,Descricao FROM tarefas WHERE Descricao ='+QuotedStr(Trim(cbxTarefas.Text)));
      if dmPrincipal.QuerySelect.RecordCount = 0 then begin
         dmPrincipal.sqliteConnection.ExecSQL('INSERT INTO tarefas '+
                                              ' (Descricao) VALUES ('+QuotedStr(Trim(cbxTarefas.Text))+')');
         ListBox1.Clear;
         Tarefas;
         if dmPrincipal.tabTarefas.Locate('Descricao',cbxTarefas.Text,[]) then
            CarregaLista(dmPrincipal.tabTarefas.FieldByName('Codigo').AsInteger)
      end;
   end else if (cbxTarefas.ItemIndex <> -1)  then begin
      s:=TStringBuilder.Create;
      for  I := 0 to ListBox1.ComponentCount -1 do begin
         if ListBox1.Components[I].tag > 0 then begin
            if (ListBox1.Components[I] is TComboColorBox) then begin
               s.Append('UPDATE tipos_atendimentos SET ');
               s.Append('Cor='+inttostr((ListBox1.Components[I] as TComboColorBox).Color));
            end;
            if (ListBox1.Components[I] is TEdit) then begin
                arrDescricao :=  TRegEx.Split((ListBox1.Components[I] as TEdit).Text,',');
                s.Append(',Descricao='+QuotedStr(arrDescricao[0]));
                if (TRegEx.Matches((ListBox1.Components[I] as TEdit).Text,',').Count) > 0 then
                   if arrDescricao[1] <> '' then
                      s.Append(',Ordem ='+QuotedStr(arrDescricao[1]));
              //s.Append(',Descricao='+QuotedStr((ListBox1.Components[I] as TEdit).Text));
              s.Append(' WHERE Codigo ='+InttoStr((ListBox1.Components[I] as TEdit).Tag)+';');
              dmPrincipal.SqLiteConnection.ExecSQL(s.ToString);
              s.Clear;
            end;
         end else begin
            if (ListBox1.Components[I] is TComboColorBox) then begin
    //          s.Append('UPDATE tipos_atendimentos SET ');
                s.Append('('+inttostr((ListBox1.Components[I] as TComboColorBox).Color));
            end;

            if (ListBox1.Components[I] is TEdit) then begin
                s.Append(','+QuotedStr((ListBox1.Components[I] as TEdit).Text));
               if (ListBox1.Components[I] as TEdit).Text <> '' then begin
                  // 'insert into tipos_atendimentos '
                   dmPrincipal.SqLiteConnection.ExecSQL('insert into tipos_atendimentos (Cor,Descricao,CodigoTarefa) VALUES '+s.ToString+','
                                                        +Inttostr(integer(cbxTarefas.Items.Objects[cbxTarefas.ItemIndex]))+')');
               end;
               s.Clear;
            end;
         end;
      end;
      CarregaLista(integer(cbxTarefas.Items.Objects[cbxTarefas.ItemIndex]));
      fPrincipal.Atendimentos(integer(cbxTarefas.Items.Objects[cbxTarefas.ItemIndex]),
                              fPrincipal.imgProfissionalAtendimento.Tag,
                              fPrincipal.DataAtendimento);
   end;

   fPrincipal.ListaTarefas;

end;

procedure TfCardTiposAtendimentos.CarregaLista(IDTarefa: Integer);
var ItemNovo :TListBoxItem;
    TCor     :TComboColorBox;
    TDes     :TEdit;
begin
    dmPrincipal.QuerySelect.Open('SELECT Codigo,Descricao,Cor FROM tipos_atendimentos WHERE CodigoTarefa = '+Inttostr(IDTarefa)+
                                ' ORDER BY Ordem');
    ListBox1.Clear;
    while not dmPrincipal.QuerySelect.Eof do begin
      ItemNovo := TlistBoxItem.Create(ListBox1);
      ItemNovo.StyleLookup := 'listboxitembottomdetail';
      ItemNovo.StyledSettings := [];
      ItemNovo.TextSettings.FontColor := TAlphaColors.Null;
      ItemNovo.Padding.Right := 2;
      ItemNovo.Name          := 'list_'+dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
      ItemNovo.Padding.Top   := ItemNovo.Padding.Right;
      ItemNovo.Padding.Left  := ItemNovo.Padding.Right;
      ItemNovo.Padding.Bottom := ItemNovo.Padding.Right;
      ItemNovo.Size.Width    := 430.000000000000000000;
      ItemNovo.Size.Height   := 30;
      ItemNovo.Size.PlatformDefault := False;
      ItemNovo.Tag := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;

      TCor := TComboColorBox.Create(ListBox1);
//     TCor.DropDownKind := TdmPrincipal; Custom
      TCor.Color := dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
      TCor.Align := TAlignLayout.Right;
      TCor.Name := 'color_'+dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
//     TCor.DisableFocusEffect = False
      TCor.Position.X := 218;
      TCor.Position.Y := 5;
      TCor.Size.Width := 207;
      TCor.Size.Height := 31;
      TCor.Size.PlatformDefault := False;
      TCor.Tag := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
      TCor.Parent := ItemNovo;

      TDes := TEdit.Create(ListBox1);
      //Touch.InteractiveGestures = [LongTap, DoubleTap]
      TDes.Align := TAlignLayout.Client;
      TDes. TabOrder := 2;
      TDes. Size.Width := 218;
      TDes. Size.Height := 31;
      TDes.Margins.Right := 5;
      TDes.Name := 'txt_'+dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
      TDes.Text := dmPrincipal.QuerySelect.FieldByName('Descricao').AsString;
      TDes.Tag := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
      TDes.Parent :=ItemNovo;
      ListBox1.AddObject( ItemNovo );
      dmPrincipal.QuerySelect.Next;
   end;

   ItemNovo := TlistBoxItem.Create(ListBox1);
   ItemNovo.StyleLookup := 'listboxitembottomdetail';
   ItemNovo.StyledSettings := [];
   ItemNovo.TextSettings.FontColor := TAlphaColors.Null;
   ItemNovo.Padding.Right := 2;
   ItemNovo.Padding.Top   := ItemNovo.Padding.Right;
   ItemNovo.Padding.Left  := ItemNovo.Padding.Right;
   ItemNovo.Padding.Bottom := ItemNovo.Padding.Right;
   ItemNovo.Size.Width    := 430.000000000000000000;
   ItemNovo.Size.Height   := 30;
   ItemNovo.Size.PlatformDefault := False;
   ItemNovo.Parent := ListBox1;

   TCor := TComboColorBox.Create(ListBox1);
//     TCor.DropDownKind := TdmPrincipal; Custom
   TCor.Color := TAlphaColors.White;
   TCor.Align := TAlignLayout.Right;
//    TCor.Name := 'color_'+dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
//     TCor.DisableFocusEffect = False
   TCor.Position.X := 218;
   TCor.Position.Y := 5;
   TCor.Size.Width := 207;
   TCor.Size.Height := 31;
   TCor.Size.PlatformDefault := False;
   TCor.Parent := ItemNovo;

   TDes := TEdit.Create(ListBox1);
   //Touch.InteractiveGestures = [LongTap, DoubleTap]
   TDes.Align := TAlignLayout.Client;
   TDes. TabOrder := 2;
   TDes. Size.Width := 218;
   TDes. Size.Height := 31;
   TDes.Margins.Right := 5;
   TDes.TextPrompt := 'Adicionar um novo';

   TDes.Tag := 0;
   TDes.Parent :=ItemNovo;
   ListBox1.AddObject( ItemNovo );

end;

procedure TfCardTiposAtendimentos.cbxTarefasChangeTracking(Sender: TObject);
begin
   inherited;
   if dmPrincipal.tabTarefas.Locate('Descricao',cbxTarefas.Text,[]) then
      CarregaLista(dmPrincipal.tabTarefas.FieldByName('Codigo').AsInteger)
   else
      ListBox1.Clear;

end;

procedure TfCardTiposAtendimentos.btnSairClick(Sender: TObject);
begin
   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;
   Close;
end;

procedure TfCardTiposAtendimentos.Tarefas;
begin
   dmPrincipal.tabTarefas.Open('SELECT Codigo,Descricao FROM tarefas');
   cbxTarefas.items.Clear;
   while not dmPrincipal.tabTarefas.Eof do begin
     cbxTarefas.Items.AddObject(dmPrincipal.tabTarefas.Fields[1].AsString , Tobject(Integer(dmPrincipal.tabTarefas.Fields[0].AsInteger)));
     dmPrincipal.tabTarefas.Next;
   end;

end;

end.
