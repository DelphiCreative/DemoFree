unit uLancarContas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uCadastros, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  Data.DB, FMX.Effects, FMX.TabControl, FMX.ListBox, System.Actions,
  FMX.ActnList, FMX.DateTimeCtrls, FMX.ComboEdit;

type
  TfLancarContas = class(TfCadastros)
    btCancelar: TSpeedButton;
    edtID: TEdit;
    TabControl1: TTabControl;
    tbDadosGerais: TTabItem;
    tbDadosAdicionais: TTabItem;
    edtCodigoBarra: TEdit;
    edtParcela: TEdit;
    edtDocumento: TEdit;
    edtNome: TEdit;
    ShadowEffect2: TShadowEffect;
    edtAnotacoes: TEdit;
    actContatos: TActionList;
    tbDadosGeraisChange: TChangeTabAction;
    tbDadosAdicionaisChange: TChangeTabAction;
    btnLancar: TSpeedButton;
    ShadowEffect6: TShadowEffect;
    Rectangle10: TRectangle;
    Layout1: TLayout;
    lblLancar: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    Rectangle6: TRectangle;
    ListBox1: TListBox;
    StyleBook1: TStyleBook;
    edtValorConta: TEdit;
    edtEmissao: TDateEdit;
    edtVencimento: TDateEdit;
    cbxCategoria: TComboEdit;
    cbxRecorrencia: TComboBox;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    procedure btnLancarClick(Sender: TObject);
    procedure edtDocumentoChangeTracking(Sender: TObject);
    procedure edtIDChangeTracking(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure Rectangle10Click(Sender: TObject);
    procedure retMovimentosClick(Sender: TObject);
    procedure TabControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure edtValorContaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure TestarContas;
    procedure CarregaCategorias;
    function ArredondaParcela(total: real; parc, num_parcelas: integer): real;

  private
    { Private declarations }
  public
    { Public declarations }
    iIDAtendimento :Integer;
    lbl :TLabel;
  end;

var
  fLancarContas: TfLancarContas;

implementation

{$R *.fmx}

uses dPrincipal, uPrincipal, uFuncoes,  uBuscaAvancada, uContas;

{ TfCadastrosContatos }

procedure TfLancarContas.edtDocumentoChangeTracking(Sender: TObject);
begin
   inherited;
  { lbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
   edtDocumento.StyledSettings := [];
   if  (edtDocumento.Text <> '') and (Length(edtDocumento.Text) <> 11) and (Length(edtDocumento.Text) <> 14) then begin
      lbl.Text := 'Informe um CPF/CNPJ válido';

      edtDocumento.TextSettings.Font.Style := [TFontStyle.fsBold];
      edtDocumento.TextSettings.FontColor := TAlphaColors.Red;
   end;

   if (Length(edtDocumento.Text) = 11) then begin
      if not ValidaCPF(edtDocumento.Text) then begin
         edtDocumento.StyledSettings := [];
         edtDocumento.TextSettings.Font.Style := [TFontStyle.fsBold];
         edtDocumento.TextSettings.FontColor := TAlphaColors.Red;
         lbl.Text := 'Informe um CPF válido';
        //    Abort;
      end
      else begin
         edtDocumento.TextSettings.Font.Style := [];
         edtDocumento.TextSettings.FontColor := AppColor;
         lbl.Text := 'CPF';
      end;
   end;

   if (Length(edtDocumento.Text) = 14) then begin
      if not ValidaCNPJ(edtDocumento.Text) then begin
         edtDocumento.TextSettings.Font.Style := [TFontStyle.fsBold];
         edtDocumento.TextSettings.FontColor := TAlphaColors.Red;
         lbl.Text := 'Informe um CNPJ válido';
      end else begin
         edtDocumento.TextSettings.Font.Style := [];
         edtDocumento.TextSettings.FontColor := AppColor;
         lbl.Text := 'CNPJ';
      end;
   end;

    if  (edtDocumento.Text = '') then lbl.Text := 'Documento';}
end;

procedure TfLancarContas.edtIDChangeTracking(Sender: TObject);
var I :Integer;
begin
   inherited;
   TabControl1.TabPosition := TTabPosition.None;

   for  I := 0 to ComponentCount -1 do begin
      if (Components[I] is TEdit)then begin
        TEdit(Components[I] as TEdit).OnEnter := EditEnter;
        TEdit(Components[I] as TEdit).OnExit  := EditExit;
        TEdit(Components[I] as TEdit).StyledSettings := [];
        TEdit(Components[I] as TEdit).TextSettings.Font.Size:= 14;
        TEdit(Components[I] as TEdit).Caption(TEdit(Components[I] as TEdit).Hint);
      end else if (Components[I] is TComboEdit)then begin
        TComboEdit(Components[I] as TComboEdit).OnEnter := EditEnter;
        TComboEdit(Components[I] as TComboEdit).OnExit  := EditExit;
//           TComboBox(Components[I] as TComboBox).StyledSettings := [];
//           TComboBox(Components[I] as TComboBox).TextSettings.Font.Size:= 14;
           TComboEdit(Components[I] as TComboEdit).Caption(TComboEdit(Components[I] as TComboEdit).Hint);
      end else if (Components[I] is TComboBox)then begin
        TComboBox(Components[I] as TComboBox).OnEnter := EditEnter;
        TComboBox(Components[I] as TComboBox).OnExit  := EditExit;
//           TComboBox(Components[I] as TComboBox).StyledSettings := [];
//           TComboBox(Components[I] as TComboBox).TextSettings.Font.Size:= 14;
           TComboBox(Components[I] as TComboBox).Caption(TComboBox(Components[I] as TComboBox).Hint);
      end  else if (Components[I] is TDateEdit)then begin
        TDateEdit(Components[I] as TDateEdit).OnEnter := EditEnter;
        TDateEdit(Components[I] as TDateEdit).OnExit  := EditExit;
        TDateEdit(Components[I] as TDateEdit).StyledSettings := [];
        TDateEdit(Components[I] as TDateEdit).TextSettings.Font.Size:= 14;
        TDateEdit(Components[I] as TDateEdit).Caption(TEdit(Components[I] as TDateEdit).Hint);
      end;
   end;

   CarregaCategorias;

end;

procedure TfLancarContas.edtValorContaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   Texto, Texto2: string;
   i: byte;
begin
   inherited;
   if (KeyChar in ['0'..'9',chr(vkback)]) then begin
      // limito a 23 caracteres senão haverá um erro na função StrToInt64()
      if (KeyChar in ['0'..'9']) and (Length(Trim(TEdit(Sender).Text))>23) then
          KeyChar := #0;

      // pego somente os caracteres de 0 a 9, ignorando a pontuação
      Texto2 := '0';
      Texto := Trim(TEdit(Sender).Text)+KeyChar;
      for i := 1 to Length(Texto) do
         if Texto[i] in ['0'..'9'] then
            Texto2 := Texto2 + Texto[i];

      // se foi pressionado BACKSPACE (única tecla válida, fora os números)
      // apago o último caractere da string
      if KeyChar = chr(vkback) then
         Delete(Texto2,Length(Texto2),1);

      // formato o texto que depois será colocado no Edit
      Texto2 := FormatFloat('#,0.00',StrToInt64(Texto2)/100);

      TEdit(Sender).Text := Texto2;

      TEdit(Sender).SelStart := Length(Texto2);
   end;

   KeyChar := #0;

end;

procedure TfLancarContas.ListBoxItem1Click(Sender: TObject);
begin
  inherited;
  TListBoxItem(Sender).Free;

end;

procedure TfLancarContas.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
  tbDadosAdicionaisChange.Execute;
end;

procedure TfLancarContas.Rectangle10Click(Sender: TObject);
begin
  inherited;
  fPrincipal.tbChangeMovimentos.Execute;
end;

procedure TfLancarContas.retMovimentosClick(Sender: TObject);
begin
  inherited;
  fPrincipal.tbChangeMovimentos.Execute;
end;

procedure TfLancarContas.btnLancarClick(Sender: TObject);
var Conta : TContas;
    i,iChave,iParc :Integer;
    sRecorrencia,sTipo :string;
    dData :TDate;
    lbl :TLabel;
    sMsg :TStringBuilder;
    rValor :Real;
begin
   inherited;

   if  trim(edtValorConta.Text) = '' then begin
      lbl := TLabel((edtValorConta).FindComponent('Label'+(edtValorConta).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Red;
      edtValorConta.SetFocus;
      Abort;
   end else if strtofloat(StringReplace(edtValorConta.Text,'.','',[rfReplaceAll])) < 1 then begin
      lbl := TLabel((edtValorConta).FindComponent('Label'+(edtValorConta).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Red;
      edtValorConta.SetFocus;
      Abort;
   end else begin
      lbl := TLabel((edtValorConta).FindComponent('Label'+(edtValorConta).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
   end;

   if trim(cbxCategoria.Text) = '' then begin
      lbl := TLabel((cbxCategoria).FindComponent('Label'+(cbxCategoria).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Red;
      cbxCategoria.SetFocus;
      Abort;
   end else begin
      lbl := TLabel((cbxCategoria).FindComponent('Label'+(cbxCategoria).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
   end;

   if edtParcela.Text = '' then begin
      edtParcela.SetFocus;
      edtParcela.Text := '1';
   end;

   if (Trim(cbxCategoria.Text) <> '')and (cbxCategoria.ItemIndex = -1) then begin
      dmPrincipal.QuerySelect.Open('SELECT ID,Descricao FROM contas_categorias WHERE Descricao ='+QuotedStr(Trim(cbxCategoria.Text)));
      if dmPrincipal.QuerySelect.RecordCount = 0 then begin
         dmPrincipal.sqliteConnection.ExecSQL('INSERT INTO contas_categorias '+
                                             ' (Descricao) VALUES ('+QuotedStr(Trim(cbxCategoria.Text))+')');

         CarregaCategorias;
      end;
   end;

   iChave := StrToInt(ChavePrimaria('contas'));
   if lblLancar.Text = 'Lançar conta à receber' then
      sTipo := 'R'
   else
      sTipo := 'P';
   iParc := StrtoInt(edtParcela.Text);
   rValor := strtofloat(StringReplace(edtValorConta.Text,'.','',[rfReplaceAll]));

   Conta := TContas.Create;
   sMsg := TStringBuilder.Create;
   for I := 0 to IParc-1 do begin
       if (cbxRecorrencia.ItemIndex =  0) or  (cbxRecorrencia.ItemIndex = -1) then begin
          sRecorrencia := 'M';
          dData := IncMonth(edtVencimento.Date,+I);
       end else if cbxRecorrencia.ItemIndex = 1 then begin
          sRecorrencia := 'S';
          dData := IncMonth(edtVencimento.Date,+(I*12));
       end else if cbxRecorrencia.ItemIndex = 2  then begin
          sRecorrencia := 'A';
          dData := edtVencimento.Date+(I*7);
       end;

       Conta.Categoria := cbxCategoria.Text;
       Conta.IDContato := edtNome.Tag;
       Conta.Parcela := InttoStr(I+1)+'/'+InttoStr(IParc);
       Conta.TipoCobranca := sRecorrencia;
       Conta.NumeroDocumento := edtDocumento.Text;
       Conta.CodigoBarra     := edtCodigoBarra.Text;
       Conta.ValorConta      := ArredondaParcela(rValor,I, IParc);

       Conta.DataLiquidacao  := 0;
       Conta.DataEmissao     := edtVencimento.Date;
       Conta.DataVencimento  := dData;
       Conta.CodigoChave     := iChave;
       Conta.TipoConta       := sTipo;
       Conta.Observacoes     := edtAnotacoes.Text;
       Conta.IDAtendimento   := iIDAtendimento;

       sMsg.Append(FormatDateTime('ddmmyyyy',dData)+#13);

       Conta.Inserir;

//     ShowMessage(inttostr(Conta.IDCategoria));

//       Showmessage(datetostr(dData)+ ' '+
//         Decimal(
//           FloatToStr(
//             ArredondaParcela(NumberBox1.value,
//               ArredondaParcela(StrtoFloat(Desformata(edtValorConta.Text))/100,
//               I, IParc))));


   end;

   Notificacoes('','Contas lançadas com sucesso!',edtNome.Text+#13+sMsg.ToString);


end;

procedure TfLancarContas.TabControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  ListBox1.Visible := False;
end;

procedure TfLancarContas.TestarContas;
begin

   {if (edtRecorrencia.ItemIndex = -1) then begin
      MostrarHintComboEdit(edtRecorrencia,'Qual a recorrência?');
      Abort;
   end;

   if StrToFloatDef(Trim( Desformata(edtValorTotal.Text)),0) <= 0  then begin
      MostrarHint(edtValorTotal,'Qual valor?');
      Abort;
   end;

   Refresh := False;
   CodigoConta := '';
   if (cbxContas.ItemIndex <> -1) then begin
      CodigoConta := (InttoStr(integer(cbxContas.Items.Objects[cbxContas.ItemIndex])));

   end else begin
      if Trim(cbxContas.Text) = '' then begin
         MostrarHintComboEdit(cbxContas,'Qual a conta?');
         Abort;
      end else begin
         retAvisos.Visible := False;

         mPrincipal.QuerySelect.Open('SELECT Codigo,Descricao FROM contas_desc WHERE Descricao ='+QuotedStr(Trim(cbxContas.Text)));
         if mPrincipal.QuerySelect.RecordCount = 0 then begin
            CodigoConta := ChavePrimaria('contas_desc');
            mPrincipal.sqliteConnection.ExecSQL('INSERT INTO contas_desc '+
                                               ' (Usuario,Descricao) VALUES ('+
            InttoStr(fPrincipal.btnUsuario.Tag)+','+QuotedStr(Trim(cbxContas.Text))+')');
            Refresh := True;
         end else  CodigoConta :=  mPrincipal.QuerySelect.Fields[0].AsString;
      end;
   end;

   retAvisos.Visible := False; }

end;

function TfLancarContas.ArredondaParcela(total: real; parc,
  num_parcelas: integer): real;
var
	valor, n_centavos, total_parcelado, total_final: real;
	parcelas: array[0..100] of real;
  i: integer;
begin
   total_final := 0;
   valor := Round((total / num_parcelas)*100)/100;
	 total_parcelado := valor * num_parcelas;

   n_centavos := 0;
   if total_parcelado <> total then
     n_centavos := round((total_parcelado - total) * 100);

 	 for i:=0 to num_parcelas-1 do begin
  		parcelas[i] := valor;
	  	if n_centavos > 0 then begin
		 	   parcelas[i] := parcelas[i] - 1/100;
		  	 n_centavos := n_centavos - 1;
		  end
	  	else if n_centavos < 0 then begin
		     parcelas[i] := parcelas[i] + 1/100;
			   n_centavos := n_centavos + 1;
		  end;
      if i = parc then
         result := parcelas[parc];
      total_final := total_final + parcelas[i];
   end;

end;

procedure TfLancarContas.btCancelarClick(Sender: TObject);
begin
  inherited;
   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;
   Close;
end;

procedure TfLancarContas.CarregaCategorias;
begin
   dmPrincipal.tabTarefas.Open('SELECT ID,Descricao FROM contas_categorias');
   cbxCategoria.items.Clear;
   while not dmPrincipal.tabTarefas.Eof do begin
     cbxCategoria.Items.AddObject(dmPrincipal.tabTarefas.Fields[1].AsString , Tobject(Integer(dmPrincipal.tabTarefas.Fields[0].AsInteger)));
     dmPrincipal.tabTarefas.Next;
   end;
end;

procedure TfLancarContas.EditEnter(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender is TEdit) then begin
      if (Sender as TEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
         runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-11,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end else if (Sender is TComboEdit) then begin
      if (Sender as TComboEdit).Text = '' then begin
         runlbl := TLabel((Sender as TComboEdit).FindComponent('Label'+(Sender as TComboEdit).Name));
         runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-11,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end else if (Sender is TComboBox) then begin
      if (Sender as TComboBox).ItemIndex = -1 then begin
         runlbl := TLabel((Sender as TComboBox).FindComponent('Label'+(Sender as TComboBox).Name));
         runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-11,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end else if (Sender is TDateEdit) then begin
      if (Sender as TDateEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TDateEdit).FindComponent('Label'+(Sender as TDateEdit).Name));
         runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-11,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end;
end;

procedure TfLancarContas.EditExit(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender is TEdit) then begin
      if (Sender as TEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end else if (Sender is TComboEdit) then begin
      if (Sender as TComboEdit).Text = '' then begin
         runlbl := TLabel((Sender as TComboEdit).FindComponent('Label'+(Sender as TComboEdit).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;

   end else if (Sender is TComboBox) then begin
      if (Sender as TComboBox).ItemIndex = -1 then begin
         runlbl := TLabel((Sender as TComboBox).FindComponent('Label'+(Sender as TComboBox).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;

   end else if (Sender is TDateEdit) then begin
      if (Sender as TDateEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TDateEdit).FindComponent('Label'+(Sender as TDateEdit).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end;
end;
end.
