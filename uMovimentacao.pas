unit uMovimentacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uCadastros, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  Data.DB, FMX.Effects, FMX.TabControl, FMX.ListBox, System.Actions,
  FMX.ActnList, FMX.DateTimeCtrls, FMX.ComboEdit,
  uContas, FMX.MultiView;

type
  TfMovimentacao = class(TfCadastros)
    btCancelar: TSpeedButton;
    edtID: TEdit;
    TabControl1: TTabControl;
    tbCards: TTabItem;
    tbLista: TTabItem;
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
    edtPagamento: TDateEdit;
    cbxPagamento: TComboEdit;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    vsb_contas_liquidadas: TVertScrollBox;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    ShadowEffect1: TShadowEffect;
    Rectangle3: TRectangle;
    Rectangle7: TRectangle;
    Layout8: TLayout;
    Rectangle8: TRectangle;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    retFundo1: TRectangle;
    Rectangle4: TRectangle;
    vsb_contas_liquidar: TVertScrollBox;
    ShadowEffect2: TShadowEffect;
    Rectangle9: TRectangle;
    Layout9: TLayout;
    Rectangle11: TRectangle;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Rectangle5: TRectangle;
    vsb_contas_aguardando: TVertScrollBox;
    ShadowEffect3: TShadowEffect;
    Rectangle12: TRectangle;
    Layout10: TLayout;
    Rectangle13: TRectangle;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    Layout11: TLayout;
    Rectangle14: TRectangle;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    Layout12: TLayout;
    Rectangle15: TRectangle;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    Label8: TLabel;
    lblTotalLiquidadas: TLabel;
    lblTotalAberto: TLabel;
    procedure btnLancarClick(Sender: TObject);
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
    procedure CarregaPagamentos;
    function ArredondaParcela(total: real; parc, num_parcelas: integer): real;
    procedure ListaContas(Filtro :String);
    procedure ListaContasPagar(Filtro :String);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure CalculaTotal;
  private
    { Private declarations }
     Soma : TContas;
     Total,SomaTotal :Real;

  public
    { Public declarations }
    iIDAtendimento :Integer;
    lbl :TLabel;
    filtro_vencimento :String;
  end;

var
  fMovimentacao: TfMovimentacao;
  RetRun: TRectangle;
  LabelRun: TLabel;
  PositionY: Real;
  ButtonRun :TSpeedButton;


implementation

{$R *.fmx}

uses dPrincipal, uPrincipal, uFuncoes,  uBuscaAvancada,
  uContasLiquidadas, uLancarContas;

{ TfCadastrosContatos }

procedure TfMovimentacao.edtIDChangeTracking(Sender: TObject);
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
//         TComboBox(Components[I] as TComboBox).StyledSettings := [];
//         TComboBox(Components[I] as TComboBox).TextSettings.Font.Size:= 14;
         TComboEdit(Components[I] as TComboEdit).Caption(TComboEdit(Components[I] as TComboEdit).Hint);
      end else if (Components[I] is TComboBox)then begin
         TComboBox(Components[I] as TComboBox).OnEnter := EditEnter;
         TComboBox(Components[I] as TComboBox).OnExit  := EditExit;
//          TComboBox(Components[I] as TComboBox).StyledSettings := [];
//          TComboBox(Components[I] as TComboBox).TextSettings.Font.Size:= 14;
         TComboBox(Components[I] as TComboBox).Caption(TComboBox(Components[I] as TComboBox).Hint);
       end  else if (Components[I] is TDateEdit)then begin
         TDateEdit(Components[I] as TDateEdit).OnEnter := EditEnter;
           TDateEdit(Components[I] as TDateEdit).OnExit  := EditExit;
           TDateEdit(Components[I] as TDateEdit).StyledSettings := [];
           TDateEdit(Components[I] as TDateEdit).TextSettings.Font.Size:= 14;
           TDateEdit(Components[I] as TDateEdit).Caption(TEdit(Components[I] as TDateEdit).Hint);
       end;
   end;
   edtPagamento.Date := Date;
   Soma := TContas.Create;
   ListaContas(edtID.text);

   if lblLancar.Tag = 0 then begin
      Layout4.Visible := False;
      Layout12.Visible := False;
   end;

   CarregaPagamentos;



end;

procedure TfMovimentacao.edtValorContaKeyDown(Sender: TObject; var Key: Word;
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

procedure TfMovimentacao.ListaContas(Filtro :String);
var i :integer;
    RunDestroy :TRectangle;
begin
   for I := vsb_contas_liquidar.ComponentCount - 1 Downto 0 do begin
      if (vsb_contas_liquidar.Components[I] is TRectangle) then begin
         RunDestroy := TRectangle(vsb_contas_liquidar.Components[I]);
         FreeAndNil(RunDestroy);
      end;
   end;

   dmPrincipal.tabContas.Open('select contas_liquidadas.ID,contas_liquidadas.IDConta,ValorPago,DataPagamento,' +
                              '(SELECT Nome FROM Contatos WHERE Contatos.ID = Contas.IDContato) Nome ,'+
                              ' (select descricao from contas_categorias where contas_categorias.ID ='+
                              ' (select IDCategoria from contas where contas.ID = contas_liquidadas.IDConta)) Categoria,'+
                              ' (select descricao from tipos_pagamentos where tipos_pagamentos.ID = contas_liquidadas.IDTipoPagamento ) Pagamento'+
                              ' from contas_liquidadas'+
                              ' inner join contas on contas.ID = contas_liquidadas.IDConta '+edtID.text + Filtro_vencimento);
   Total := 0;
   PositionY := 0;
   vsb_contas_liquidadas.BeginUpdate;
   dmPrincipal.tabContas.First;
   while not dmPrincipal.tabContas.Eof do begin
      Application.ProcessMessages;
      RetRun := TRectangle.Create(vsb_contas_liquidar);
      RetRun.Name         := 'ret_liquidada_'+ dmPrincipal.tabContas.Fields[0].AsString;
      RetRun.Position.X   := 8.00;
      RetRun.Position.Y   := PositionY;
      RetRun.Fill.Color   := TAlphaColors.Green;
      RetRun.Stroke.Color := TAlphaColors.White;
      RetRun.Padding.Left := 5;
      RetRun.Size.Width   := 300.00;
      RetRun.Size.Height  := 32.00;
      RetRun.Visible      := True;
     // PanelRun.Hint        := FDMemTable1.Fields[0].A///sString + 'º ' +FDMemTable1.Fields[1].AsString +' '+FDMemTable1.Fields[2].AsString;
      RetRun.Parent       := vsb_contas_liquidadas;

      fBuscaAvancada := TfBuscaAvancada.Create(vsb_contas_liquidadas);
      if lblLancar.tag > 0 then begin
         fBuscaAvancada.lblDescricaoConta.Text := dmPrincipal.tabContas.FieldByName('Categoria').AsString+#13+
                                               dmPrincipal.tabContas.FieldByName('Pagamento').AsString;
      end else begin
         fBuscaAvancada.lblDescricaoConta.Text :=dmPrincipal.tabContas.FieldByName('Nome').AsString+#13+
         dmPrincipal.tabContas.FieldByName('Categoria').AsString+#13+
                                               dmPrincipal.tabContas.FieldByName('Pagamento').AsString;

      end;


      fBuscaAvancada.lblDescricaoConta.Hint :=fBuscaAvancada.lblDescricaoConta.Text;
      fBuscaAvancada.lblDescricaoConta.ShowHint := True;
      fBuscaAvancada.Line1.Visible := False;
      fBuscaAvancada.lblDescricaoConta.HitTest := True;
      fBuscaAvancada.Layout5.Visible := False;
      fBuscaAvancada.lblDataVencimento.Text := FormatDateTime('dd/mm/yyyy', dmPrincipal.tabContas.FieldByName('DataPagamento').AsDateTime);
      fBuscaAvancada.lblContaValor.Text := FormatFloat('#,0.00',(dmPrincipal.tabContas.FieldByName('ValorPago').AsFloat));

      fBuscaAvancada.layContasLiquidadas.Align := TAlignLayout.Client;

      RetRun.AddObject(TLayout(fBuscaAvancada.FindComponent('layContasLiquidadas')));
      Total := Total + dmPrincipal.tabContas.FieldByName('ValorPago').AsFloat;
      PositionY := PositionY + 35;
      dmPrincipal.tabContas.Next;
  end;
  vsb_contas_liquidadas.EndUpdate;
  lblTotalLiquidadas.Text:= FormatFloat('#,0.00',Total);

  ListaContasPagar(edtID.text);




end;

procedure TfMovimentacao.ListaContasPagar(Filtro :String);
var I :Integer;
    RunDestroy :TRectangle;

begin

   {for I := vsb_contas_liquidar.ComponentCount - 1 Downto 0 do begin
      if (vsb_contas_liquidar.Components[I] is TRectangle) then begin
         RunDestroy := TRectangle(vsb_contas_liquidar.Components[I]);
         FreeAndNil(RunDestroy);
      end;
   end;  }


   Total := 0;
   dmPrincipal.tabContas.Open('select ID,DataVencimento, '+

   '(SELECT Nome FROM Contatos WHERE Contatos.ID = Contas.IDContato) Nome ,'+
   '(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta,'+
   '(select descricao from contas_categorias where contas_categorias.id = contas.IDCategoria) conta,DataLiquidacao, observacoes from contas WHERE DataLiquidacao = "1899-12-30" AND (status <> "A" OR status IS NULL)'+edtID.text+filtro_vencimento);
   PositionY := 0;
   vsb_contas_liquidar.BeginUpdate;
   dmPrincipal.tabContas.First;
   while not dmPrincipal.tabContas.Eof do begin
      Application.ProcessMessages;
      RetRun := TRectangle.Create(vsb_contas_liquidar);
      RetRun.Name         := 'ret_'+ dmPrincipal.tabContas.Fields[0].AsString;
      RetRun.Position.X   := 8.00;
      RetRun.Position.Y   := PositionY;
      RetRun.Align := TAlignLayout.Top;
      RetRun.Fill.Color   := TAlphaColors.Green;
      RetRun.Stroke.Color := TAlphaColors.White;
      RetRun.Padding.Left := 5;
      RetRun.Size.Width   := 300.00;
      RetRun.Size.Height  := 32.00;
      RetRun.Visible      := True;
     // PanelRun.Hint        := FDMemTable1.Fields[0].A///sString + 'º ' +FDMemTable1.Fields[1].AsString +' '+FDMemTable1.Fields[2].AsString;
      RetRun.Parent       := vsb_contas_liquidar;

      fBuscaAvancada := TfBuscaAvancada.Create(vsb_contas_liquidar);

      fBuscaAvancada.lblDescricaoConta.Text := dmPrincipal.tabContas.FieldByName('conta').AsString+#13+
                                               dmPrincipal.tabContas.FieldByName('observacoes').AsString;

      if lblLancar.tag = 0 then
         fBuscaAvancada.lblDescricaoConta.Text := dmPrincipal.tabContas.FieldByName('Nome').AsString+#13+
                                                 fBuscaAvancada.lblDescricaoConta.Text;


      fBuscaAvancada.lblDescricaoConta.Hint :=fBuscaAvancada.lblDescricaoConta.Text;
      fBuscaAvancada.lblDescricaoConta.ShowHint := True;
      fBuscaAvancada.Line1.Visible := False;
      fBuscaAvancada.lblDescricaoConta.HitTest := True;
      fBuscaAvancada.btnLiquidar.Text := 'Liquidar';
      fBuscaAvancada.retLiquidar.Fill.Color := TAlphaColors.Green;

      fBuscaAvancada.Layout5.Visible := True;
      fBuscaAvancada.btnLiquidar.Tag := dmPrincipal.tabContas.Fields[0].AsInteger;
      fBuscaAvancada.lblDataVencimento.Text := FormatDateTime('dd/mm/yyyy', dmPrincipal.tabContas.FieldByName('DataVencimento').AsDateTime);
      fBuscaAvancada.lblContaValor.Text := FormatFloat('#,0.00',(dmPrincipal.tabContas.FieldByName('ValorConta').AsFloat));

      fBuscaAvancada.layContasLiquidadas.Align := TAlignLayout.Client;

      RetRun.AddObject(TLayout(fBuscaAvancada.FindComponent('layContasLiquidadas')));
      total := Total + dmPrincipal.tabContas.FieldByName('ValorConta').AsFloat;
      PositionY := PositionY + 35;
      dmPrincipal.tabContas.Next;
   end;
   lblTotalAberto.Text := FormatFloat('#,0.00',(Total));
   vsb_contas_liquidar.EndUpdate;

   dmPrincipal.tabContas.Open('select ID,DataVencimento, '+
    '(SELECT Nome FROM Contatos WHERE Contatos.ID = Contas.IDContato) Nome ,'+
    '(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta,'+
    '(select descricao from contas_categorias where contas_categorias.id = contas.IDCategoria) conta,DataLiquidacao, observacoes from contas WHERE DataLiquidacao = "1899-12-30" AND status = "A" '+edtID.text);

   PositionY := 0;
   vsb_contas_aguardando.BeginUpdate;
   dmPrincipal.tabContas.First;
   while not dmPrincipal.tabContas.Eof do begin
      Application.ProcessMessages;
      RetRun := TRectangle.Create(vsb_contas_liquidar);
      RetRun.Name         := 'ret_'+ dmPrincipal.tabContas.Fields[0].AsString;
      RetRun.Position.X   := 8.00;
      RetRun.Position.Y   := PositionY;
      RetRun.Fill.Color   := TAlphaColors.Green;
      RetRun.Stroke.Color := TAlphaColors.White;
      RetRun.Align := TAlignLayout.Top;
      RetRun.Padding.Left := 5;
      RetRun.Size.Width   := 300.00;
      RetRun.Size.Height  := 32.00;
      RetRun.Visible      := True;
      // PanelRun.Hint        := FDMemTable1.Fields[0].A///sString + 'º ' +FDMemTable1.Fields[1].AsString +' '+FDMemTable1.Fields[2].AsString;
      RetRun.Parent       := vsb_contas_aguardando;

      fBuscaAvancada := TfBuscaAvancada.Create(vsb_contas_liquidar);

      fBuscaAvancada.lblDescricaoConta.Text := dmPrincipal.tabContas.FieldByName('conta').AsString+#13+
                                               dmPrincipal.tabContas.FieldByName('observacoes').AsString;
      if lblLancar.tag = 0 then
         fBuscaAvancada.lblDescricaoConta.Text := dmPrincipal.tabContas.FieldByName('Nome').AsString+#13+
                                                 fBuscaAvancada.lblDescricaoConta.Text;



      fBuscaAvancada.lblDescricaoConta.Hint     := fBuscaAvancada.lblDescricaoConta.Text;
      fBuscaAvancada.lblDescricaoConta.ShowHint := True;
      fBuscaAvancada.Line1.Visible              := False;
      fBuscaAvancada.btnLiquidar.Text           := 'Cancelar';
      fBuscaAvancada.retLiquidar.Fill.Color     := TAlphaColors.Red;
      fBuscaAvancada.btnLiquidar.Tag            := dmPrincipal.tabContas.Fields[0].AsInteger ;
      fBuscaAvancada.lblDescricaoConta.HitTest  := True;
      //fBuscaAvancada.Layout5.Visible := False;
      fBuscaAvancada.lblDataVencimento.Text := FormatDateTime('dd/mm/yyyy', dmPrincipal.tabContas.FieldByName('DataVencimento').AsDateTime);
      fBuscaAvancada.lblContaValor.Text := FormatFloat('#,0.00',(dmPrincipal.tabContas.FieldByName('ValorConta').AsFloat));

      fBuscaAvancada.layContasLiquidadas.Align := TAlignLayout.Client;

      RetRun.AddObject(TLayout(fBuscaAvancada.FindComponent('layContasLiquidadas')));

      PositionY := PositionY + 35;
      dmPrincipal.tabContas.Next;
   end;
   vsb_contas_aguardando.EndUpdate;
   CalculaTotal;

end;

procedure TfMovimentacao.ListBoxItem1Click(Sender: TObject);
begin
  inherited;
  TListBoxItem(Sender).Free;

end;

procedure TfMovimentacao.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
  tbDadosAdicionaisChange.Execute;
end;

procedure TfMovimentacao.Rectangle10Click(Sender: TObject);
begin
  inherited;
  fPrincipal.tbChangeMovimentos.Execute;
end;

procedure TfMovimentacao.retMovimentosClick(Sender: TObject);
begin
  inherited;
  fPrincipal.tbChangeMovimentos.Execute;
end;

procedure TfMovimentacao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Rectangle6.Visible := True;
  Rectangle6.Visible := True;
  fLancarContas := TfLancarContas.Create(Self);
  fLancarContas.lblLancar.Text := 'Lançar conta à receber';

  fLancarContas.edtNome.Tag  := lblLancar.Tag;
  fLancarContas.edtNome.Text := lblLancar.Text;
  fLancarContas.edtValorConta.text := '0,00';

  fLancarContas.iIDAtendimento:= 0;
  fLancarContas.edtID.text := '0';

  fLancarContas.ShowModal;
  Rectangle6.Visible := False;
  ListaContas(edtID.text);

end;

procedure TfMovimentacao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Rectangle6.Visible := True;
  Rectangle6.Visible := True;
  fLancarContas := TfLancarContas.Create(Self);
  fLancarContas.lblLancar.Text := 'Lançar conta à pagar';

  fLancarContas.edtNome.Tag  := lblLancar.Tag;
  fLancarContas.edtNome.Text := lblLancar.Text;
  fLancarContas.edtValorConta.text := '0,00';

  fLancarContas.iIDAtendimento:= 0;
  fLancarContas.edtID.text := '0';

  fLancarContas.ShowModal;
  Rectangle6.Visible := False;
  ListaContas(edtID.text);
end;

procedure TfMovimentacao.btnLancarClick(Sender: TObject);
var Conta : TContasLiquidadas;
    i,iChave,iParc :Integer;
    sRecorrencia,sTipo :string;
    dData :TDate;
    lbl :TLabel;
    sMsg :TStringBuilder;
    rValor :Real;
begin
   inherited;

   if (Trim(cbxPagamento.Text) <> '')and (cbxPagamento.ItemIndex = -1) then begin
      dmPrincipal.QuerySelect.Open('SELECT ID,Descricao FROM tipos_pagamentos WHERE Descricao ='+QuotedStr(Trim(cbxPagamento.Text)));
      if dmPrincipal.QuerySelect.RecordCount = 0 then begin
         dmPrincipal.sqliteConnection.ExecSQL('INSERT INTO tipos_pagamentos '+
                                             ' (Descricao) VALUES ('+QuotedStr(Trim(cbxPagamento.Text))+')');
         CarregaPagamentos;
      end;
   end;


   {if  trim(edtValorConta.Text) = '' then begin
      lbl := TLabel((edtValorConta).FindComponent('Label'+(edtValorConta).Name));
      lbl.TextSettings.FontColor := TAlphaColors.Red;
      edtValorConta.SetFocus;
      Abort;
   end else if strtofloat(edtValorConta.Text) < 1 then begin
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

   }

   {laco no scroll}

   rValor := strtofloat(StringReplace(edtValorConta.Text,'.','',[rfReplaceAll]));

   Soma.ContasAguardando(edtID.text + filtro_vencimento);

   {if rValor > SomaTotal then begin
      ShowMessage('Recebido Maior');

   end else if rValor < SomaTotal then begin
      ShowMessage('Recebido Menor');

   end else ShowMessage('Recebido Igual');}

   dmPrincipal.tabContas.Open('select ID,(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) '+
                              'FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta'+
                              ' from contas WHERE DataLiquidacao = "1899-12-30" AND status = "A" '
                              +edtID.text + filtro_vencimento+
                              ' order by ValorConta desc'
                              );

   Conta := TContasLiquidadas.Create;
   dmPrincipal.tabContas.First;
   while not dmPrincipal.tabContas.Eof do begin

      if rValor >  0 then begin
         Conta.TipoPagamento := cbxPagamento.Text;
         Conta.IDConta       := dmPrincipal.tabContas.Fields[0].AsInteger;
         Conta.DataPagamento := edtPagamento.Date;
         Conta.Observacoes   := edtAnotacoes.Text;

         if dmPrincipal.tabContas.Fields[1].AsFloat <= rValor then begin
            rValor := rValor - dmPrincipal.tabContas.Fields[1].AsFloat;
            Conta.ValorPago := dmPrincipal.tabContas.Fields[1].AsFloat;
            Executar('UPDATE contas SET DataLiquidacao ="'+FormatDateTime('yyyy-mm-dd',edtPagamento.Date)+'" WHERE ID = '+dmPrincipal.tabContas.Fields[0].AsString);
         end else begin
            Conta.ValorPago     :=rValor;
            rValor := 0;
         end;

      Conta.Inserir;
      end;
      dmPrincipal.tabContas.Next;
   end;

   ListaContas(edtID.text);
end;

procedure TfMovimentacao.TabControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  ListBox1.Visible := False;
end;

function TfMovimentacao.ArredondaParcela(total: real; parc,
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

procedure TfMovimentacao.btCancelarClick(Sender: TObject);
begin
  inherited;
   if lblLancar.Tag > 0 then begin
      fPrincipal.tbChangeCadastros.Execute;
      fPrincipal.tbChangeCadastroContatos.Execute;
   end else begin
      fPrincipal.tbChangeMovimento.Execute;
   end;

end;

procedure TfMovimentacao.CalculaTotal;
begin
   Soma.ContasAguardando(edtID.text +filtro_vencimento);
   Label8.Text := FormatFloat('#,0.00',Soma.Soma);

   edtValorConta.SetFocus;
   edtValorConta.Text := FormatFloat('#,0.00',Soma.Soma);
   edtValorConta.SetFocus;
   SomaTotal := Soma.Soma;
end;

procedure TfMovimentacao.CarregaPagamentos;
begin
   dmPrincipal.tabTarefas.Open('SELECT ID,Descricao FROM tipos_pagamentos');
   cbxPagamento.items.Clear;
   while not dmPrincipal.tabTarefas.Eof do begin
     cbxPagamento.Items.AddObject(dmPrincipal.tabTarefas.Fields[1].AsString , Tobject(Integer(dmPrincipal.tabTarefas.Fields[0].AsInteger)));
     dmPrincipal.tabTarefas.Next;
   end;
end;

procedure TfMovimentacao.EditEnter(Sender: TObject);
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

procedure TfMovimentacao.EditExit(Sender: TObject);
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

   ActiveControl := nil;
end;
end.
