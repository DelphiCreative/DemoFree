unit uPrincipal;

interface

uses
  System.SysUtils, System.StrUtils, System.Types, System.UITypes,
  System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.MultiView, FMX.Objects,
  FMX.TabControl, FMX.Effects, FMX.Platform, System.Actions, FMX.ActnList,
  FMX.Edit,System.RegularExpressions,
  FMX.Filter.Effects, Data.DB, FMX.DateTimeCtrls, FMX.ComboEdit, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo;

type
  TfPrincipal = class(TForm)
    Layout1: TLayout;
    VertScrollBox1: TVertScrollBox;
    retMenu: TRectangle;
    TabControl1: TTabControl;
    tbHome: TTabItem;
    tbAgenda: TTabItem;
    ActionList1: TActionList;
    tbChangeHome: TChangeTabAction;
    tbChangeAgenda: TChangeTabAction;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    tbAtualizacoesContatos: TTabItem;
    RectangleCardClientes: TRectangle;
    HorzScrollBox1: THorzScrollBox;
    FlowLayoutCardClientes: TFlowLayout;
    LayoutCard: TLayout;
    RectangleAddCliente: TRectangle;
    ShadowEffect1: TShadowEffect;
    btnPrincipalAddCliente: TSpeedButton;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    ShadowEffect2: TShadowEffect;
    RectangleCardFornecedores: TRectangle;
    HorzScrollBox2: THorzScrollBox;
    FlowLayoutCardFornecedores: TFlowLayout;
    Layout2: TLayout;
    RectangleAddFornecedor: TRectangle;
    btnPrincipalAddFornecedor: TSpeedButton;
    ShadowEffect3: TShadowEffect;
    RectangleCardProfissionais: TRectangle;
    HorzScrollBox3: THorzScrollBox;
    FlowLayoutCardProfissionais: TFlowLayout;
    Layout3: TLayout;
    RectangleAddProfissional: TRectangle;
    btnPrincipalAddProfissional: TSpeedButton;
    ShadowEffect4: TShadowEffect;
    TabItemAtendimentos: TTabItem;
    tbChangeAtendimentos: TChangeTabAction;
    HorzScrollAtendimentos: THorzScrollBox;
    Rectangle5: TRectangle;
    Label2: TLabel;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Label3: TLabel;
    Label4: TLabel;
    ToolBar1: TToolBar;
    edtBuscaCliente: TEdit;
    tbMovimentacao: TTabItem;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    Button2: TButton;
    Layout4: TLayout;
    GridDataAtendimentos: TGridPanelLayout;
    retAtendimentos: TRectangle;
    VertAtendimentos: TVertScrollBox;
    imgProfissionalAtendimento: TRectangle;
    lblProfissional: TLabel;
    Label7: TLabel;
    retProfissional: TRectangle;
    Layout5: TLayout;
    Layout6: TLayout;
    ShadowEffect8: TShadowEffect;
    Rectangle14: TRectangle;
    lblTarefa: TLabel;
    lblDataAtendimento: TLabel;
    Rectangle15: TRectangle;
    lblMes: TLabel;
    edtBuscaAvancada: TEdit;
    SearchEditButton1: TSearchEditButton;
    retBuscaAvancada: TRectangle;
    FloatAnimationExibirBusca: TFloatAnimation;
    FloatAnimationEscondeBusca: TFloatAnimation;
    tbChangeAtualizacoes: TChangeTabAction;
    TabControl2: TTabControl;
    tbCardsAtendimentos: TTabItem;
    tdDetalhesAtendimento: TTabItem;
    layAtendimento: TLayout;
    Action1: TAction;
    tbChangeItensAtendimentos: TChangeTabAction;
    tbChangeDetalhesAtendimento: TChangeTabAction;
    lblIDAtendimento: TLabel;
    Rectangle13: TRectangle;
    btnGravarAtendimento: TSpeedButton;
    Rectangle19: TRectangle;
    btnCancelarAtendimento: TSpeedButton;
    Rectangle20: TRectangle;
    Label5: TLabel;
    Rectangle21: TRectangle;
    Label11: TLabel;
    Rectangle22: TRectangle;
    Label14: TLabel;
    lblAtendimentoTipo: TLabel;
    tbChangeCardAtendimento: TChangeTabAction;
    Rectangle23: TRectangle;
    Label10: TLabel;
    edtAtendimentosAnotacoes: TEdit;
    tbCadastrosContatos: TTabItem;
    tcDadosContatos: TTabControl;
    tbChangeCadastroContatos: TChangeTabAction;
    Label12: TLabel;
    lbx_atendimento_itens: TListBox;
    ShadowEffect9: TShadowEffect;
    lblAtendimentoProfissional: TEdit;
    edtAtendimentoInicio: TEdit;
    StyleBook1: TStyleBook;
    lblSair: TLabel;
    lblHome: TLabel;
    lblContatos: TLabel;
    lblAtendimentos: TLabel;
    lblUsuario: TLabel;
    imgUsuario: TCircle;
    lbUserName: TLabel;
    tbCadastros: TTabItem;
    lbxCadastros: TListBox;
    tbMovimentacoes: TTabItem;
    ChangeTabAction1: TChangeTabAction;
    tbChangeMovimentos: TChangeTabAction;
    tbChangeCadastros: TChangeTabAction;
    retAnterior: TRectangle;
    retProximo: TRectangle;
    tbChangeCadastroUsuario: TChangeTabAction;
    tbChangeLoginUsuario: TChangeTabAction;
    retUsuariosAguardando: TCircle;
    lblUsuariosAguardando: TLabel;
    hsbUsuarios: THorzScrollBox;
    lblAtendimentoCliente: TLabel;
    btnAtendimentoLancar: TRectangle;
    SpeedButton2: TSpeedButton;
    layMovimentos: TLayout;
    MenuMovimentos: TLayout;
    MenuMovimentosIcone: TRectangle;
    MenuMovimentosButton: TSpeedButton;
    GridPanelLayout1: TGridPanelLayout;
    layEsquerda: TLayout;
    layCentro: TLayout;
    layDireita: TLayout;
    tbMovimentos: TTabItem;
    retJan: TRectangle;
    ShadowEffect12: TShadowEffect;
    Label20: TLabel;
    Label25: TLabel;
    lbl_receber_1: TLabel;
    Label27: TLabel;
    lbl_pagar_1: TLabel;
    retFev: TRectangle;
    ShadowEffect11: TShadowEffect;
    Label19: TLabel;
    Label21: TLabel;
    lbl_receber_2: TLabel;
    Label23: TLabel;
    lbl_pagar_2: TLabel;
    tbChangeMovimento: TChangeTabAction;
    retMar: TRectangle;
    ShadowEffect13: TShadowEffect;
    Label29: TLabel;
    Label30: TLabel;
    lbl_receber_3: TLabel;
    Label32: TLabel;
    lbl_pagar_3: TLabel;
    retAbr: TRectangle;
    ShadowEffect14: TShadowEffect;
    Label34: TLabel;
    Label35: TLabel;
    lbl_receber_4: TLabel;
    Label37: TLabel;
    lbl_pagar_4: TLabel;
    retMai: TRectangle;
    ShadowEffect15: TShadowEffect;
    Label39: TLabel;
    Label40: TLabel;
    lbl_receber_5: TLabel;
    Label42: TLabel;
    lbl_pagar_5: TLabel;
    retJun: TRectangle;
    ShadowEffect16: TShadowEffect;
    Label44: TLabel;
    Label45: TLabel;
    lbl_receber_6: TLabel;
    Label47: TLabel;
    lbl_pagar_6: TLabel;
    retJul: TRectangle;
    ShadowEffect17: TShadowEffect;
    Label49: TLabel;
    Label50: TLabel;
    lbl_receber_7: TLabel;
    Label52: TLabel;
    lbl_pagar_7: TLabel;
    retAgo: TRectangle;
    ShadowEffect18: TShadowEffect;
    Label55: TLabel;
    Label56: TLabel;
    lbl_receber_8: TLabel;
    Label58: TLabel;
    lbl_pagar_8: TLabel;
    retSet: TRectangle;
    ShadowEffect19: TShadowEffect;
    Label60: TLabel;
    Label61: TLabel;
    lbl_receber_9: TLabel;
    Label63: TLabel;
    lbl_pagar_9: TLabel;
    retOut: TRectangle;
    ShadowEffect20: TShadowEffect;
    Label65: TLabel;
    Label66: TLabel;
    lbl_receber_10: TLabel;
    Label68: TLabel;
    lbl_pagar_10: TLabel;
    retNov: TRectangle;
    ShadowEffect21: TShadowEffect;
    Label70: TLabel;
    Label71: TLabel;
    lbl_receber_11: TLabel;
    Label73: TLabel;
    lbl_pagar_11: TLabel;
    retDez: TRectangle;
    ShadowEffect22: TShadowEffect;
    Label75: TLabel;
    Label76: TLabel;
    lbl_receber_12: TLabel;
    Label78: TLabel;
    lbl_pagar_12: TLabel;
    Rectangle39: TRectangle;
    ShadowEffect23: TShadowEffect;
    lblMovimentacao: TLabel;
    Label24: TLabel;
    lbl_receber_13: TLabel;
    Label28: TLabel;
    lbl_pagar_13: TLabel;
    hsbAnos: THorzScrollBox;
    layMovimentacao: TLayout;
    ChangeTabAction2: TChangeTabAction;
    btnJan: TSpeedButton;
    btnFev: TSpeedButton;
    btnMar: TSpeedButton;
    btnAbr: TSpeedButton;
    btnMai: TSpeedButton;
    btnJun: TSpeedButton;
    btnJul: TSpeedButton;
    btnAgo: TSpeedButton;
    btnSet: TSpeedButton;
    btnOut: TSpeedButton;
    btnNov: TSpeedButton;
    btnDez: TSpeedButton;
    MenuAtendimentos: TLayout;
    MenuAtendimentosIcone: TRectangle;
    MenuAtendimentosButton: TSpeedButton;
    MenuAtendimentosLabel: TLabel;
    MenuMovimentosLabel: TLabel;
    MenuClientes: TLayout;
    MenuClientesIcone: TRectangle;
    MenuClientesButton: TSpeedButton;
    MenuClientesLabel: TLabel;
    MenuTarefas: TLayout;
    MenuTarefasIcone: TRectangle;
    MenuTarefasButton: TSpeedButton;
    MenuTarefasLabel: TLabel;
    MenuServicos: TLayout;
    MenuServicosIcone: TRectangle;
    MenuServicosButton: TSpeedButton;
    MenuServicosLabel: TLabel;
    MenuUsuario: TLayout;
    MenuUsuarioIcone: TRectangle;
    MenuUsuarioButton: TSpeedButton;
    MenuUsuarioLabel: TLabel;
    MenuFornecedor: TLayout;
    MenuFornecedorIcone: TRectangle;
    MenuFornecedorButton: TSpeedButton;
    MenuFornecedorLabel: TLabel;
    MenuProfissionais: TLayout;
    MenuProfissionaisIcone: TRectangle;
    MenuProfissionaisButton: TSpeedButton;
    MenuProfissionaisLabel: TLabel;
    MenuContatos: TLayout;
    MenuContatosIcone: TRectangle;
    MenuContatosButton: TSpeedButton;
    MenuContatosLabel: TLabel;
    Layout7: TLayout;
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    btnAtendimentosLancarPagar: TRectangle;
    SpeedButton3: TSpeedButton;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    retMovimentos: TRectangle;
    layMovimento: TLayout;
    MenuLogoff: TLayout;
    MenuLogoffIcone: TRectangle;
    MenuLogoffButton: TSpeedButton;
    MenuLogoffLabel: TLabel;
    Layout8: TLayout;
    Rectangle12: TRectangle;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    procedure btnPrincipalAddClienteClick(Sender: TObject);
    procedure btnPrincipalAddServicoClick(Sender: TObject);
    procedure Text2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CarregaCardsCliente(Filtro: String);
    procedure CarregaCardsFornecedor;
    procedure CarregaCardsProfissional;
    procedure CadastroContatos(IDContato, Tipo, Titulo, MeuHint: String);
    procedure Login;
    procedure FormShow(Sender: TObject);
    procedure btnPrincipalAddFornecedorClick(Sender: TObject);
    procedure btnPrincipalAddProfissionalClick(Sender: TObject);

    procedure ObjetoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ObjetoDragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure ObjetoDragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure CalendarioAtendimentos(DataAtendimento: TDate);
    procedure Atendimentos(CodigoTarefa, CodigoProfissional: Integer;
      DataAgenda: TDate);
    procedure ClickTarefa(Sender: TObject);
    procedure ClickTipoTarefa(Sender: TObject);
    procedure DuploClickTipoTarefa(Sender: TObject);
    procedure DiaClick(Sender: TObject);
    procedure GerarAtendimento(CodigoProfissional, CodigoCliente,
      IDAtendimento: Integer);
    procedure edtBuscaClienteChangeTracking(Sender: TObject);

    procedure Rectangle2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle2DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure Rectangle2DragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);

    procedure CarregaTarefas;
    procedure ListaTarefas;
    procedure Label1Click(Sender: TObject);

    procedure FloatAnimationEscondeBuscaFinish(Sender: TObject);

    procedure lblClienteClick(Sender: TObject);

    procedure Label8Click(Sender: TObject);

    procedure btnCancelarAtendimentoClick(Sender: TObject);

    procedure btnGravarAtendimentoClick(Sender: TObject);

    procedure AdicionarItem(IDItem, IDAtendimento: String);

    procedure lblSairClick(Sender: TObject);

    procedure lblContatosClick(Sender: TObject);

    procedure lblAtendimentosClick(Sender: TObject);

    procedure Label7Click(Sender: TObject);

    procedure SpeedButton1Click(Sender: TObject);

    procedure retProximoClick(Sender: TObject);

    procedure retAnteriorClick(Sender: TObject);
    procedure lblUsuarioClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GravarAtendimento;
    procedure ClearMes;
    procedure Anos;
    procedure edtBuscaAvancadaKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure AnoClick(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure btnJanClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure MenuAtendimentosButtonClick(Sender: TObject);
    procedure MenuMovimentosButtonClick(Sender: TObject);
    procedure MenuContatosButtonClick(Sender: TObject);
    procedure MenuProfissionaisButtonClick(Sender: TObject);
    procedure MenuFornecedorButtonClick(Sender: TObject);
    procedure MenuClientesButtonClick(Sender: TObject);
    procedure MenuTarefasButtonClick(Sender: TObject);
    procedure MenuServicosButtonClick(Sender: TObject);
    procedure lblMovimentacaoClick(Sender: TObject);
  private
    { Private declarations }
    LastOver: TControl;
    DesY: Single;
  public
    { Public declarations }
    IMGContato: TStream;
    sUpdateContatos: String;
    DataAtendimento: TDate;
    ListItem: TListBoxItem;
    ListItemName: Integer;
    rPreco :Real;

  end;

var
  fPrincipal: TfPrincipal;

const
  AppVersion: Integer = 1010;
  AppColor: Integer = 4278592094;

implementation

{$R *.fmx}

uses
  uContatos, dPrincipal, uCardClientes, uCadastroContatos, uFuncoes,
  uLogin, uCalendario, uCadastroTarefa, uCardAtendimento,
  uCardTiposAtendimentos, uItens, uCadastroItens, uBuscaAvancada,
  uAlteraSenha, uLancarContas, uMovimentacao;

procedure TfPrincipal.GerarAtendimento(CodigoProfissional, CodigoCliente,
  IDAtendimento: Integer);
var
   Cp,Cc: TContatos;
begin

   lbx_atendimento_itens.Items.Clear;
   lbx_atendimento_itens.Enabled   := True;

   Cp := TContatos.Create;
   Cc := TContatos.Create;
   if IDAtendimento = 0 then begin
      Cp.Contato(CodigoProfissional);
      lblAtendimentoProfissional.Text := Cp.Nome;
      lblAtendimentoProfissional.Tag  := CodigoProfissional;

      Cc.Contato(CodigoCliente);
      lblAtendimentoCliente.Text      := Cc.Nome;
      lblAtendimentoCliente.Tag       := CodigoCliente;
      edtAtendimentoInicio.Text       := FormatDateTime('hh:mm', Time);

   end else begin
      BuscaAtendimento(Inttostr(IDAtendimento));

      Cp.Contato(dmPrincipal.tabAtendimentos.FieldByName('CodigoProfissional').AsInteger);
      lblAtendimentoProfissional.Text := Cp.Nome;
      lblAtendimentoProfissional.Tag  := dmPrincipal.tabAtendimentos.FieldByName('CodigoProfissional').AsInteger;

      Cc.Contato(dmPrincipal.tabAtendimentos.FieldByName('CodigoContato').AsInteger);
      lblAtendimentoCliente.Text     := Cc.Nome;
      lblAtendimentoCliente.Tag      := dmPrincipal.tabAtendimentos.FieldByName('CodigoContato').AsInteger;

      lblAtendimentoTipo.Tag         := dmPrincipal.tabAtendimentos.FieldByName('TipoAtendimento').AsInteger;
      lblAtendimentoTipo.Text        := dmPrincipal.tabAtendimentos.FieldByName('DescricaoAtendimento').AsString;
      edtAtendimentoInicio.Text      := dmPrincipal.tabAtendimentos.FieldByName('HorarioInicio').AsString;
      edtAtendimentosAnotacoes.Text  := dmPrincipal.tabAtendimentos.FieldByName('Anotacoes').AsString;

      lbx_atendimento_itens.Items.Clear;
      AdicionarItem('', Inttostr(IDAtendimento));

      if TestarLancamento(IDAtendimento) > 0 then lbx_atendimento_itens.Enabled   := False;
   end;

   Cp.Free;
   Cc.Free;
   btnAtendimentoLancar.Visible       := lbx_atendimento_itens.Enabled;
   btnAtendimentosLancarPagar.Visible := btnAtendimentoLancar.Visible;
   btnGravarAtendimento.Tag           := IDAtendimento;
   tbChangeDetalhesAtendimento.Execute;

end;

procedure TfPrincipal.GravarAtendimento;
var
   I: Integer;
begin
   if lblAtendimentoTipo.Tag = 0 then
      Abort;

   if btnGravarAtendimento.Tag = 0 then begin
      btnGravarAtendimento.Tag := StrtoInt(ChavePrimaria('atendimentos'));

      Executar('INSERT INTO atendimentos ' +
               '(CodigoContato,CodigoProfissional,DataAtendimento,HorarioInicio,TipoAtendimento,Anotacoes)'+
               ' VALUES ' + '(' + Inttostr(lblAtendimentoCliente.Tag) + ',' +
               Inttostr(lblAtendimentoProfissional.Tag) + ',"' +
               FormatDateTime('yyyy-mm-dd', DataAtendimento) + '"' + ',"' +
               edtAtendimentoInicio.Text + '",' + Inttostr(lblAtendimentoTipo.Tag) + ','+
               QuotedStr(edtAtendimentosAnotacoes.Text) + ')');

   end else begin

      Executar('UPDATE atendimentos SET ' + 'CodigoContato=' +
               Inttostr(lblAtendimentoCliente.Tag) + ',CodigoProfissional=' +
               Inttostr(lblAtendimentoProfissional.Tag) + ',DataAtendimento="' +
               FormatDateTime('yyyy-mm-dd', DataAtendimento) + '",HorarioInicio="' +
               edtAtendimentoInicio.Text + '",TipoAtendimento=' +
               Inttostr(lblAtendimentoTipo.Tag) + ',Anotacoes=' +
               QuotedStr(edtAtendimentosAnotacoes.Text) + ' WHERE Codigo = ' +
               Inttostr(btnGravarAtendimento.Tag));
   end;

   if TestarLancamento(btnGravarAtendimento.Tag) = 0 then begin
      for I := lbx_atendimento_itens.ComponentCount - 1 Downto 0 do begin
         if (lbx_atendimento_itens.Components[I] is TListBoxItem) then begin
            if (lbx_atendimento_itens.Components[I] As TListBoxItem).Hint <> '' then begin
              Executar(StringReplace((lbx_atendimento_itens.Components[I] As TListBoxItem).Hint, 'TrocaID', Inttostr(btnGravarAtendimento.Tag),
                                      [rfReplaceAll]));
            end;

         end;
      end;
   end;

   CalendarioAtendimentos(DataAtendimento);
   fPrincipal.Atendimentos(lblTarefa.Tag, lblAtendimentoProfissional.Tag, DataAtendimento);

end;

procedure TfPrincipal.AdicionarItem(IDItem, IDAtendimento: String);
var
   It: TItens;
begin

   if IDAtendimento = '' then begin
      It := TItens.Create;
      It.Item(StrtoInt(IDItem));
      ListItem := TListBoxItem.Create(lbx_atendimento_itens);
      ListItem.Parent := lbx_atendimento_itens;
      ListItem.Name := 'lbx_new_item_' + Inttostr(ListItemName);
      ListItem.StyledSettings := [];
      ListItem.TextSettings.FontColor := TAlphaColors.Null;

      fBuscaAvancada := TfBuscaAvancada.Create(lbx_atendimento_itens);
      ListItem.Height := fBuscaAvancada.layAtendimentoItens.Height;
      fBuscaAvancada.btnRemoveITem.Tag := ListItemName;
      fBuscaAvancada.btnRemoveITem.HelpContext := 0;
      fBuscaAvancada.lblItemDescricao.Text := It.Descricao;

      if rPreco = -1 then
         fBuscaAvancada.lblItemValor.Text := FormatFloat('R$ #,##0.00',It.ValorVenda)
      else
         fBuscaAvancada.lblItemValor.Text := FormatFloat('R$ #,##0.00',rPreco);

      fBuscaAvancada.lblItemCodigo.Text := IDItem;
      fBuscaAvancada.layAtendimentoItens.Align := TAlignLayout.Client;
      if rPreco = -1 then
         ListItem.Hint := 'insert into atendimentos_det (CodigoAtendimento,IDItem,ValorUnitario,Quantidade) VALUES ('+
                       'TrocaID,' + IDItem + ',' + Floattostr(It.ValorVenda) + ',1)'
      else
         ListItem.Hint := 'insert into atendimentos_det (CodigoAtendimento,IDItem,ValorUnitario,Quantidade) VALUES ('+
                       'TrocaID,' + IDItem + ',' + Floattostr(rPreco) + ',1)';

      ListItem.AddObject(TLayout(fBuscaAvancada.FindComponent('layAtendimentoItens')));
      inc(ListItemName);
      lbx_atendimento_itens.AddObject(ListItem);
   end else begin
      dmPrincipal.tabSelect.Open('SELECT atendimentos_det.Codigo, ' +
                                 'atendimentos_det.IDItem, ' + 'atendimentos_det.ValorUnitario,' +
                                 'atendimentos_det.CodigoAtendimento, ' + 'itens.Descricao ' +
                                 ' FROM atendimentos_det ' +
                                 ' INNER JOIN itens ON itens.ID = atendimentos_det.IDItem WHERE CodigoAtendimento = '+
                                  IDAtendimento);

      while not dmPrincipal.tabSelect.eof do begin
         ListItem := TListBoxItem.Create(lbx_atendimento_itens);
         ListItem.Parent                          := lbx_atendimento_itens;
         ListItem.Name                            := 'lbx_add_item_' +Inttostr(dmPrincipal.tabSelect.FieldByName('Codigo').AsInteger);
         ListItem.StyledSettings := [];
         ListItem.TextSettings.FontColor := TAlphaColors.Null;
         ListItem.Hint                            := '';
         fBuscaAvancada                           := TfBuscaAvancada.Create(lbx_atendimento_itens);
         ListItem.Height                          := fBuscaAvancada.layAtendimentoItens.Height;
         fBuscaAvancada.btnRemoveITem.Tag         := dmPrincipal.tabSelect.FieldByName('Codigo').AsInteger;
         fBuscaAvancada.btnRemoveITem.HelpContext := 1;
         fBuscaAvancada.lblItemDescricao.Text     := dmPrincipal.tabSelect.FieldByName('Descricao').AsString;
         fBuscaAvancada.lblItemValor.Text         := FormatFloat('R$ #,##0.00',dmPrincipal.tabSelect.FieldByName('ValorUnitario').AsFloat);
         fBuscaAvancada.lblItemCodigo.Text        := dmPrincipal.tabSelect.FieldByName('IDITem').AsString;
         fBuscaAvancada.layAtendimentoItens.Align := TAlignLayout.Client;

         ListItem.AddObject(TLayout(fBuscaAvancada.FindComponent('layAtendimentoItens')));
         lbx_atendimento_itens.AddObject(ListItem);
         dmPrincipal.tabSelect.Next;
      end;
   end;

end;

procedure TfPrincipal.Anos;
var I :Integer;
    Ret :TRectangle;
    lbl :TLabel;
begin
   for I := hsbAnos.ComponentCount - 1 Downto 0 do begin
      if (hsbAnos.Components[I] is TRectangle) then begin
         Ret := TRectangle(hsbAnos.Components[I]);
         FreeAndNil(Ret);
      end;
   end;

   dmPrincipal.QuerySelect.Open('select strftime("%Y", DataVencimento) Ano from contas group by strftime("%Y", DataVencimento)');

   while not dmPrincipal.QuerySelect.eof do begin

      Ret := TRectangle.Create(hsbAnos);
      Ret.Align                := TAlignLayout.Left;
      Ret.Name                 := 'pnl_' + dmPrincipal.QuerySelect.Fields[0].AsString;
      Ret.Margins.Left         := 10;
      Ret.Fill.Color           := TAlphaColors.Steelblue;
      Ret.Stroke.Color         := TAlphaColors.Steelblue;
      Ret.Size.Width           := 50;
      Ret.Size.PlatformDefault := False;
      Ret.Parent               := hsbAnos;

      Lbl                        := TLabel.Create(hsbAnos);
      Lbl.Align                  := TAlignLayout.Client;
      Lbl.StyledSettings         := [];
      lbl.Size.PlatformDefault   := False;
      lbl.TextSettings.FontColor :=  TAlphaColors.White;
      lbl.TextSettings.Font.Size :=10;
      Lbl.Text                   := dmPrincipal.QuerySelect.Fields[0].AsString;
      Lbl.Parent                 := Ret;
      Lbl.OnClick                := AnoClick;
      Lbl.HitTest                := True;
      dmPrincipal.QuerySelect.Next;
   end;

end;

procedure TfPrincipal.Atendimentos(CodigoTarefa, CodigoProfissional: Integer;
  DataAgenda: TDate);
var
   profissional: Integer;
   PanelCol: TRectangle;
   VertiCol: TVertScrollBox;
   LblTitulo: TLabel;
   RetCard, PanelTituloBorda, PanelTitulo: TRectangle;
   TxtCard: TText;
   Vert: TVertScrollBox;
   Shadow: TShadowEffect;
   I: Integer;
   RunDestroy: TRectangle;
begin
   for I := HorzScrollAtendimentos.ComponentCount - 1 Downto 0 do begin
      if (HorzScrollAtendimentos.Components[I] is TRectangle) then begin
         RunDestroy := TRectangle(HorzScrollAtendimentos.Components[I]);
         FreeAndNil(RunDestroy);
      end;
   end;

   if CodigoTarefa = 0 then
      dmPrincipal.QuerySelect.Open('SELECT * FROM tipos_atendimentos ORDER BY Ordem, Travado')
   else
      dmPrincipal.QuerySelect.Open('SELECT * FROM tipos_atendimentos WHERE CodigoTarefa = ' +
                                    Inttostr(CodigoTarefa) + ' ORDER BY Ordem,Travado');

   dmPrincipal.QuerySelect.First;
   while not dmPrincipal.QuerySelect.eof do begin
      //fundo tarefas
      PanelCol                      := TRectangle.Create(HorzScrollAtendimentos);
      PanelCol.Align                := TAlignLayout.Left;
      PanelCol.Name                 := 'pnl_' + dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
      PanelCol.Margins.Left         := 10;
      PanelCol.Fill.Color           := TAlphaColors.Antiquewhite;
      PanelCol.Stroke.Color         := TAlphaColors.White;
      PanelCol.Margins.Top          := 5;
      PanelCol.Margins.Bottom       := 5;
      PanelCol.Position.X           := 1000;
      PanelCol.Size.Width           := 270;
      PanelCol.Size.Height          := 430;
      PanelCol.Size.PlatformDefault := False;
      PanelCol.Parent               := HorzScrollAtendimentos;

      //Container de Tarefas
      VertiCol                      := TVertScrollBox.Create(PanelCol);
      VertiCol.Align                := TAlignLayout.Client;
      VertiCol.Name                 := 'scr_' + Inttostr(dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger);
      VertiCol.Size.Width           := 270;
      VertiCol.Size.Height          := 430.000000000000000000;
      VertiCol.Size.PlatformDefault := False;
      VertiCol.TabOrder             := 0;
      VertiCol.Tag                  := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
      VertiCol.Hint                 := dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
      VertiCol.OnDragOver           := Rectangle2DragOver;
      VertiCol.OnDragDrop           := Rectangle2DragDrop;
      VertiCol.Parent               := PanelCol;

      //titulos das tarefas
      PanelTituloBorda                      := TRectangle.Create(PanelCol);
      PanelTituloBorda.Align                := TAlignLayout.Top;
      PanelTituloBorda.Size.Height          := 35;
      PanelTituloBorda.Size.PlatformDefault := False;
      PanelTituloBorda.Fill.Color           := dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
      PanelTituloBorda.Stroke.Color         := dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
      PanelTituloBorda.Parent               := PanelCol;
      PanelTituloBorda.Margins.Left         := 2;
      PanelTituloBorda.Margins.Top          := 1;
      PanelTituloBorda.Margins.Right        := 2;
      PanelTituloBorda.Margins.Bottom       := 0;
      PanelTituloBorda.Position.X           := 2;
      PanelTituloBorda.Position.Y           := 2;
      PanelTituloBorda.Size.Width           := 221;
      PanelTituloBorda.Parent               := PanelCol;

      PanelTitulo := TRectangle.Create(PanelTituloBorda);
      PanelTitulo.Align                := TAlignLayout.Client;
      PanelTitulo.Fill.Color           :=  dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
      PanelTitulo.Align                := TAlignLayout.Client;
      PanelTitulo.Size.Height          := 31.000000000000000000;
      PanelTitulo.Size.PlatformDefault := False;
      PanelTitulo.Stroke.Color         := dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
      PanelTitulo.Parent               := PanelTituloBorda;

      Shadow             := TShadowEffect.Create(PanelTituloBorda);
      Shadow.Distance    := 3;
      Shadow.Direction   := 45;
      Shadow.Softness    := 0.1;
      Shadow.Opacity     := 0.1;
      Shadow.ShadowColor := TAlphaColors.Black;
      Shadow.Parent      := PanelTituloBorda;

      // Titulo da Tarefa
      LblTitulo                         := TLabel.Create(PanelTitulo);
      LblTitulo.Name                    := 'lbl_' +Inttostr(dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger);
      LblTitulo.Align                   := TAlignLayout.Client;
      LblTitulo.StyledSettings          := [];
      LblTitulo.Size.PlatformDefault    := False;
      LblTitulo.Margins.Left            := 5;
      LblTitulo.TextSettings.Font.Style := [TFontStyle.fsBold];
      LblTitulo.TextSettings.Font.Size := 14;
      LblTitulo.Tag                    := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
      LblTitulo.Text                   := dmPrincipal.QuerySelect.FieldByName('Descricao').AsString;
      LblTitulo.Parent                 := PanelTitulo;
      LblTitulo.OnClick                := DuploClickTipoTarefa;
      LblTitulo.HitTest                := True;

      dmPrincipal.tabSelect.Open('SELECT atendimentos.*, ' +
                                 ' (SELECT Nome FROM contatos WHERE contatos.ID = atendimentos.CodigoContato )Cliente, '+
                                 ' (SELECT Travado FROM tipos_atendimentos WHERE tipos_atendimentos.Codigo = atendimentos.TipoAtendimento) Bloqueado '+
                                 ' FROM atendimentos WHERE TipoAtendimento =' +
                                 dmPrincipal.QuerySelect.FieldByName('Codigo').AsString +
                                 ' AND CodigoProfissional = ' + Inttostr(CodigoProfissional) +
                                 ' AND DataAtendimento = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',
                                 DataAgenda))+ ' ORDER BY HorarioInicio');

      while not dmPrincipal.tabSelect.eof do begin
         RetCard                := TRectangle.Create(VertiCol);
         RetCard.Align          := TAlignLayout.Top;
         RetCard.Padding.Left   := 5;
         RetCard.Padding.Right  := 5;
         RetCard.Margins.Left   := 2;
         RetCard.Margins.Top    := 1;
         RetCard.Margins.Bottom := 2;
         RetCard.Margins.Right  := 2;
         RetCard.Position.X     := 5;
         RetCard.Position.Y     := 5;
         RetCard.Hint           := dmPrincipal.QuerySelect.FieldByName('Codigo').AsString;
         RetCard.Size.Height          := 60;
         RetCard.Cursor               := crHandPoint;
         RetCard.Fill.Color           := TAlphaColors.White; //dmPrincipal.QuerySelect.FieldByName('Cor').AsInteger;
         RetCard.Stroke.Color         := RetCard.Fill.Color;
         RetCard.Size.PlatformDefault := False;
         RetCard.Tag                  := dmPrincipal.tabSelect.FieldByName('Codigo').AsInteger;
         RetCard.OnDragOver           := Rectangle2DragOver;
         RetCard.OnDragDrop := Rectangle2DragDrop;
         RetCard.OnMouseDown := Rectangle2MouseDown;

         Shadow             := TShadowEffect.Create(RetCard);
         Shadow.Distance    := 3;
         Shadow.Direction   := 45;
         Shadow.Softness    := 0.1;
         Shadow.Opacity     := 0.2;
         Shadow.ShadowColor := TAlphaColors.Black;
         Shadow.Parent      := RetCard;

         RetCard.Parent   := VertiCol;
         fCardAtendimento := TfCardAtendimento.Create(Nil);
         fCardAtendimento.lblContato.Text                 := dmPrincipal.tabSelect.FieldByName('Cliente').AsString;
         fCardAtendimento.imgCliente.Tag                  := dmPrincipal.tabSelect.FieldByName('CodigoContato').AsInteger;
         fCardAtendimento.imgCliente.LoadImagem(fCardAtendimento.lblContato.Text );
         fCardAtendimento.lblHorario.Text                 := LeftStr(dmPrincipal.tabSelect.FieldByName('HorarioInicio').AsString, 5);
         fCardAtendimento.lblAnotacoes.Text               := dmPrincipal.tabSelect.FieldByName('Anotacoes').AsString;
         fCardAtendimento.RetCardAtendimento.Tag          := dmPrincipal.tabSelect.FieldByName('Codigo').AsInteger;

         RetCard.AddObject(TLayout(fCardAtendimento.FindComponent('LayPrincipal')));
         dmPrincipal.tabSelect.Next;
      end;

     dmPrincipal.QuerySelect.Next;
   end;

end;

procedure TfPrincipal.btnCancelarAtendimentoClick(Sender: TObject);
begin
  tbChangeCardAtendimento.Execute;
end;

procedure TfPrincipal.btnGravarAtendimentoClick(Sender: TObject);
begin
   GravarAtendimento;
   tbChangeCardAtendimento.Execute;

end;

procedure TfPrincipal.btnJanClick(Sender: TObject);
var RunLayout :TLayout;  I:integer;
begin
   inherited;
   for I := fPrincipal.layMovimentacao.ControlsCount - 1 downto 0 do
       fPrincipal.layMovimentacao.RemoveObject(fPrincipal.layMovimentacao.Controls[I]);

   fMovimentacao := TfMovimentacao.Create(fPrincipal.layMovimentacao);
   fMovimentacao.lblLancar.text := lblMovimentacao.text;
   fMovimentacao.lblLancar.tag := 0;
   fMovimentacao.edtID.text := ' AND  strftime("%Y", DataVencimento) ='+QuotedStr(inttostr(lblMovimentacao.Tag)) +
                               ' AND  strftime("%m", DataVencimento)*1 = ' +inttostr(TSpeedButton(Sender).tag);//' AND IDContato = '+IntToStr(SpeedButton1.Tag);

   fPrincipal.layMovimentacao.AddObject(TLayout(fMovimentacao.FindComponent('LayPrincipal')));
   fPrincipal.ChangeTabAction2.Execute;
end;

procedure TfPrincipal.CadastroContatos(IDContato, Tipo, Titulo,
  MeuHint: String);
begin

   if MeuHint <> 'Editar Item' then begin
      if TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_contato_' +(IDContato))) <> nil then begin
         ListItem := TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_contato_' + (IDContato)));
         FreeAndNil(ListItem);
      end;

      ListItem := TListBoxItem.Create(lbxCadastros);
      ListItem.Parent := lbxCadastros;
      ListItem.StyledSettings := [];
      ListItem.TextSettings.FontColor := TAlphaColors.Null;

      ListItem.Name := 'lbx_contato_' + (IDContato);

      fCadastrosContatos := TfCadastrosContatos.Create(ListItem);
      ListItem.Height := fCadastrosContatos.LayPrincipal.Height;
      fCadastrosContatos.Rectangle10.Fill.Color := retMenu.Fill.Color;
      fCadastrosContatos.sTipoCadastro := Tipo;

      fCadastrosContatos.SpeedButton1.Tag := StrtoInt(IDContato);
      fCadastrosContatos.edtID.Text := IDContato;

      fCadastrosContatos.btCancelar.Tag := StrtoInt(IDContato);
      ListItem.AddObject(TLayout(fCadastrosContatos.FindComponent('LayPrincipal')));
      lbxCadastros.AddObject(ListItem);
   end else begin
      if TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_serv_' +(IDContato))) <> nil then begin
         ListItem := TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_serv_'+ (IDContato)));
         FreeAndNil(ListItem);
      end;

      ListItem := TListBoxItem.Create(lbxCadastros);
      ListItem.Parent := lbxCadastros;
      ListItem.StyledSettings := [];
      ListItem.TextSettings.FontColor := TAlphaColors.Null;
      ListItem.Name := 'lbx_serv_' + (IDContato);

      fCadastrosItens := TfCadastrosItens.Create(ListItem);
      ListItem.Height := fCadastrosItens.LayPrincipal.Height;
      fCadastrosItens.btSalvar.Tag := StrtoInt(IDContato);
      fCadastrosItens.edtID.Text := IDContato;
      fCadastrosItens.btCancelar.Tag := StrtoInt(IDContato);
      fCadastrosItens.Rectangle3.Fill.Color := retMenu.Fill.Color;
      ListItem.AddObject(TLayout(fCadastrosItens.FindComponent('LayPrincipal')));
      lbxCadastros.AddObject(ListItem);
   end;
   fPrincipal.FloatAnimationEscondeBusca.Start;
   tbChangeCadastros.Execute;
   tbChangeCadastroContatos.Execute;

end;

procedure TfPrincipal.CalendarioAtendimentos(DataAtendimento: TDate);
var
   sAno, sMes: String;
   I, iDia: Integer;
   btnDia: TButton;
   Panel, RunPanel: TPanel;
   lblVazio: TLabel;
   txtDia: TText;
   Horarios: String;
   retDia: TRectangle;
begin
   lblDataAtendimento.Text := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', DataAtendimento);
   RunPanel := TPanel.Create(nil);

   sMes := FormatDateTime('MM', DataAtendimento);
   lblMes.Text := FormatDateTime('MMMM', DataAtendimento);
   sAno := FormatDateTime('YYYY', DataAtendimento);

   Self.BeginUpdate;
   for I := 0 to GridDataAtendimentos.ComponentCount - 1 do begin
      if (GridDataAtendimentos.Components[I] is TFmxObject) then
         TFmxObject(GridDataAtendimentos.Components[I]).Parent := RunPanel;
   end;
   Self.EndUpdate;

   FreeAndNil(RunPanel);

   GridDataAtendimentos.BeginUpdate;
   for I := 1 to (MonthDays[IsLeapYear(StrtoInt(sAno)), StrtoInt(sMes)]) do begin
      if (I = 1) then begin
         for iDia := 2 to dayofweek(strtodate(Inttostr(I) + '/' + sMes + '/' + sAno)) do begin
           txtDia        := TText.Create(GridDataAtendimentos);
           txtDia.Align  := TAlignLayout.Client;
           txtDia.Text   := '';
           txtDia.Parent := GridDataAtendimentos;
         end;
      end;

      retDia := TRectangle.Create(GridDataAtendimentos);
      retDia.Align := TAlignLayout.Client;
      retDia.Fill.Color := TAlphaColors.Null;
      retDia.Stroke.Color := AppColor;
      retDia.Margins.Top := 1;
      retDia.Margins.Left := 1;
      retDia.Margins.Right := 1;
      retDia.Margins.Bottom := 1;
      retDia.Parent := GridDataAtendimentos;

      txtDia := TText.Create(GridDataAtendimentos);
      txtDia.Align := TAlignLayout.Client;
      txtDia.Text := Inttostr(I);
      txtDia.TextSettings.Font.Size := 8;
      txtDia.TextSettings.HorzAlign := TTextAlign.Leading;
      txtDia.TextSettings.VertAlign := TTextAlign.Leading;

      // txtDia.Hint := sAno +'-'+sMes+'-'+ (FormatFloat('00',i));
      txtDia.Hint := (FormatFloat('00', I) + '/' + sMes + '/' + sAno);
      txtDia.HitTest        := True;
      txtDia.OnClick        := DiaClick;
      // txtDia.OnDblClick := FecharClick;
      txtDia.Margins.Top    := 1;
      txtDia.Margins.Left   := 1;
      txtDia.Margins.Right  := 1;
      txtDia.Margins.Bottom := 1;
      txtDia.Parent := retDia;

      if (dmPrincipal.SQLiteConnection.ExecSQLScalar
         ('select Count(*) tot from atendimentos WHERE DataExclusao IS NULL AND DataAtendimento = '
          + QuotedStr(sAno + '-' + sMes + '-' + FormatFloat('00', I))) > 0) then begin

         retDia.Fill.Color := AppColor;
         txtDia.TextSettings.FontColor := TAlphaColors.White;
      end else begin
         retDia.Fill.Color := TAlphaColors.Null;
      end;
   end;
   GridDataAtendimentos.EndUpdate;

end;

procedure TfPrincipal.CarregaCardsCliente(Filtro: String);
var
   StreamIMG: TStream;
   I: Integer;
begin

   for I := FlowLayoutCardClientes.ControlsCount - 1 downto 1 do begin
      FlowLayoutCardClientes.RemoveObject(FlowLayoutCardClientes.Controls[I]);
   end;

   FlowLayoutCardClientes.BeginUpdate;
   Self.BeginUpdate;

   dmPrincipal.tabClientes.Open('SELECT ID,Nome,Email1,(SELECT imagem FROM contatos_imagem WHERE contatos_imagem.IDContato = contatos.ID)Imagem FROM contatos '+
                                ' WHERE (DataExclusao = "" OR DataExclusao IS NULL) ' + Filtro +
                                ' AND Cliente = 1 ORDER BY DataAtividade DESC ');
   while not dmPrincipal.tabClientes.eof do begin
      frmCardClientes := TfrmCardClientes.Create(Self);
      frmCardClientes.Label1.Text := dmPrincipal.tabClientes.FieldByName('Nome').AsString;
      frmCardClientes.Label2.Text := dmPrincipal.tabClientes.FieldByName('Email1').AsString;
      frmCardClientes.Height := 160;

      StreamIMG := TMemoryStream.Create;
      if not dmPrincipal.tabClientes.Fields[2].IsNull then begin
         StreamIMG := dmPrincipal.tabClientes.CreateBlobStream(dmPrincipal.tabClientes.FieldByName('Imagem'), TBlobStreamMode.bmRead);
         frmCardClientes.Circle1.Fill.Bitmap.Bitmap.LoadFromStream(StreamIMG);
         frmCardClientes.Circle1.Hint := 'C';
      end; // else frmCardClientes.Circle1.Hint := 'Sem Imagem' ;// else fLogin.Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(StreamIMG) ;

      frmCardClientes.Circle1.Tag               := dmPrincipal.tabClientes.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.Hint        := 'C';
      frmCardClientes.RectangleCard.Tag         := dmPrincipal.tabClientes.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.OnDragOver  := ObjetoDragOver;
      frmCardClientes.RectangleCard.OnDragDrop  := ObjetoDragDrop;
      frmCardClientes.RectangleCard.OnMouseDown := ObjetoMouseDown;

      FlowLayoutCardClientes.AddObject(TLayout(frmCardClientes.FindComponent('LayoutCard')));

      dmPrincipal.tabClientes.Next;
   end;
   Self.EndUpdate;
   FlowLayoutCardClientes.EndUpdate;

end;

procedure TfPrincipal.CarregaCardsFornecedor;
var
   StreamIMG: TStream;
   I: Integer;
begin

   for I := FlowLayoutCardFornecedores.ControlsCount - 1 downto 1 do begin
       FlowLayoutCardFornecedores.RemoveObject(FlowLayoutCardFornecedores.Controls[I]);
   end;

   FlowLayoutCardFornecedores.BeginUpdate;
   Self.BeginUpdate;

   dmPrincipal.QuerySelect.Open('SELECT ID,Nome,Email1,(SELECT imagem FROM contatos_imagem WHERE contatos_imagem.IDContato = contatos.ID)Imagem FROM contatos '+
                                ' WHERE (DataExclusao = "" OR DataExclusao IS NULL) ' +
                                ' AND Fornecedor = 1 ORDER BY DataAtividade DESC ');
   while not dmPrincipal.QuerySelect.eof do begin
      frmCardClientes := TfrmCardClientes.Create(Self);
      frmCardClientes.Label1.Text := dmPrincipal.QuerySelect.FieldByName('Nome').AsString;
      frmCardClientes.Label2.Text := dmPrincipal.QuerySelect.FieldByName('Email1').AsString;
      frmCardClientes.Height := 160;

      StreamIMG := TMemoryStream.Create;
      if not dmPrincipal.QuerySelect.Fields[2].IsNull then begin
         StreamIMG := dmPrincipal.QuerySelect.CreateBlobStream(dmPrincipal.QuerySelect.FieldByName('Imagem'), TBlobStreamMode.bmRead);
         frmCardClientes.Circle1.Fill.Bitmap.Bitmap.LoadFromStream(StreamIMG);
         frmCardClientes.Circle1.Hint := 'F';
      end;

      frmCardClientes.Circle1.Tag := dmPrincipal.QuerySelect.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.Tag := dmPrincipal.QuerySelect.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.Hint := 'F';
      frmCardClientes.RectangleCard.OnDragOver := ObjetoDragOver;
      frmCardClientes.RectangleCard.OnDragDrop := ObjetoDragDrop;
      frmCardClientes.RectangleCard.OnMouseDown := ObjetoMouseDown;
      FlowLayoutCardFornecedores.AddObject(TLayout(frmCardClientes.FindComponent('LayoutCard')));

      dmPrincipal.QuerySelect.Next;
   end;
   Self.EndUpdate;
   FlowLayoutCardFornecedores.EndUpdate;

end;

procedure TfPrincipal.CarregaCardsProfissional;
var
   StreamIMG: TStream;
   I: Integer;
begin

   for I := FlowLayoutCardProfissionais.ControlsCount - 1 downto 1 do begin
      FlowLayoutCardProfissionais.RemoveObject(FlowLayoutCardProfissionais.Controls[I]);
   end;

   FlowLayoutCardProfissionais.BeginUpdate;
   Self.BeginUpdate;

   dmPrincipal.QuerySelect.Open('SELECT ID,Nome,Email1,(SELECT imagem FROM contatos_imagem WHERE contatos_imagem.IDContato = contatos.ID)Imagem FROM contatos '+
                                ' WHERE (DataExclusao = "" OR DataExclusao IS NULL) ' +
                                ' AND Profissional = 1 ORDER BY DataAtividade DESC ');
   while not dmPrincipal.QuerySelect.eof do begin
      frmCardClientes := TfrmCardClientes.Create(Self);
      frmCardClientes.Label1.Text := dmPrincipal.QuerySelect.FieldByName('Nome').AsString;
      frmCardClientes.Label2.Text := dmPrincipal.QuerySelect.FieldByName('Email1').AsString;
      frmCardClientes.Height := 160;

      StreamIMG := TMemoryStream.Create;
      if not dmPrincipal.QuerySelect.Fields[2].IsNull then begin
         StreamIMG := dmPrincipal.QuerySelect.CreateBlobStream(dmPrincipal.QuerySelect.FieldByName('Imagem'), TBlobStreamMode.bmRead);
         frmCardClientes.Circle1.Fill.Bitmap.Bitmap.LoadFromStream(StreamIMG);
         frmCardClientes.Circle1.Hint := 'P';
      end; // else frmCardClientes.Circle1.Hint := 'Sem Imagem' ;// else fLogin.Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(StreamIMG) ;

      frmCardClientes.Circle1.Tag := dmPrincipal.QuerySelect.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.Tag := dmPrincipal.QuerySelect.FieldByName('ID').AsInteger;
      frmCardClientes.RectangleCard.Hint := 'P';
      frmCardClientes.RectangleCard.OnDragOver := ObjetoDragOver;
      frmCardClientes.RectangleCard.OnDragDrop := ObjetoDragDrop;
      frmCardClientes.RectangleCard.OnMouseDown := ObjetoMouseDown;
      FlowLayoutCardProfissionais.AddObject(TLayout(frmCardClientes.FindComponent('LayoutCard')));
      dmPrincipal.QuerySelect.Next;
   end;
   Self.EndUpdate;
   FlowLayoutCardProfissionais.EndUpdate;

end;

procedure TfPrincipal.CarregaTarefas;
begin
   DataAtendimento := Date;
   Atendimentos(1, imgProfissionalAtendimento.Tag, DataAtendimento);

end;

procedure TfPrincipal.ClearMes;
begin
   lbl_receber_1.Text := '0,00';
   lbl_receber_2.Text := lbl_receber_1.Text;
   lbl_receber_3.Text := lbl_receber_1.Text;
   lbl_receber_4.Text := lbl_receber_1.Text;
   lbl_receber_5.Text := lbl_receber_1.Text;
   lbl_receber_6.Text := lbl_receber_1.Text;
   lbl_receber_7.Text := lbl_receber_1.Text;
   lbl_receber_8.Text := lbl_receber_1.Text;
   lbl_receber_9.Text := lbl_receber_1.Text;
   lbl_receber_10.Text := lbl_receber_1.Text;
   lbl_receber_11.Text := lbl_receber_1.Text;
   lbl_receber_12.Text := lbl_receber_1.Text;
   lbl_receber_13.Text := lbl_receber_1.Text;
   lbl_pagar_1.Text := lbl_receber_1.Text;
   lbl_pagar_2.Text := lbl_receber_1.Text;
   lbl_pagar_3.Text := lbl_receber_1.Text;
   lbl_pagar_4.Text := lbl_receber_1.Text;
   lbl_pagar_5.Text := lbl_receber_1.Text;
   lbl_pagar_6.Text := lbl_receber_1.Text;
   lbl_pagar_7.Text := lbl_receber_1.Text;
   lbl_pagar_8.Text := lbl_receber_1.Text;
   lbl_pagar_9.Text := lbl_receber_1.Text;
   lbl_pagar_10.Text := lbl_receber_1.Text;
   lbl_pagar_11.Text := lbl_receber_1.Text;
   lbl_pagar_12.Text := lbl_receber_1.Text;
   lbl_pagar_13.Text := lbl_receber_1.Text;
end;

procedure TfPrincipal.ClickTarefa(Sender: TObject);
begin
   lblTarefa.Text := TLabel(Sender).Text;
   lblTarefa.Tag  := TLabel(Sender).Tag;

   Atendimentos(TLabel(Sender).Tag, imgProfissionalAtendimento.Tag, DataAtendimento);
end;

procedure TfPrincipal.ClickTipoTarefa(Sender: TObject);
begin
   lblTarefa.Text := TLabel(Sender).Hint;
   lblTarefa.Tag := TLabel(Sender).HelpContext;
   lblAtendimentoTipo.Tag := TLabel(Sender).Tag;
   lblAtendimentoTipo.Text := TLabel(Sender).Text;
   Atendimentos(TLabel(Sender).HelpContext, imgProfissionalAtendimento.Tag,DataAtendimento);
end;

procedure TfPrincipal.DiaClick(Sender: TObject);
begin
   dataAtendimento := strtodate((Sender as TText).Hint);
   lblDataAtendimento.Text := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', DataAtendimento);
   Atendimentos(lblTarefa.Tag, imgProfissionalAtendimento.Tag, DataAtendimento);
end;

procedure TfPrincipal.DuploClickTipoTarefa(Sender: TObject);
begin
   lblTarefa.Text := TLabel(Sender).Hint;
   lblTarefa.Tag  := TLabel(Sender).HelpContext;
   lblAtendimentoTipo.Tag := TLabel(Sender).Tag;
   lblAtendimentoTipo.Text := TLabel(Sender).Text;
   lblAtendimentoCliente.Text := '';
   edtAtendimentosAnotacoes.Text := '';
   edtAtendimentoInicio.Text := FormatDateTime('hh:mm', Time);
   btnGravarAtendimento.Tag := 0;
   btnAtendimentoLancar.Visible := False;
   btnAtendimentosLancarPagar.Visible := btnAtendimentoLancar.Visible;
   tbChangeDetalhesAtendimento.Execute;
end;

procedure TfPrincipal.edtBuscaAvancadaKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   I: Integer;
   RunDestroy: TLayout;
   vsColuna: TVertScrollBox;
   arrBusca :TArray<String>;
   sBusca :String;
begin

   if TRegEx.Matches(edtBuscaAvancada.Text,'=').Count = 0 then begin
      FloatAnimationEscondeBusca.Start;
      if retBuscaAvancada.FindComponent('vsb_busca') <> nil then begin
         vsColuna := TVertScrollBox(retBuscaAvancada.FindComponent('vsb_busca'));
         FreeAndNil(vsColuna);
      end;
   end;

   if (Key = vkReturn) and (edtBuscaAvancada.Text = '') then begin
      retBuscaAvancada.Height := 25;
      vsColuna := TVertScrollBox.Create(retBuscaAvancada);
      vsColuna.Align := TAlignLayout.Client;
      vsColuna.Name := 'vsb_busca';
      vsColuna.Size.PlatformDefault := False;
      vsColuna.TabOrder := 0;
      vsColuna.Parent := retBuscaAvancada;
      Self.BeginUpdate;
      vsColuna.BeginUpdate;

      retBuscaAvancada.Position.X := layCentro.Position.X+2;
      retBuscaAvancada.Width := edtBuscaAvancada.Width;

      if (retBuscaAvancada.Opacity <> 1) then begin
         retBuscaAvancada.Visible := True;
         FloatAnimationExibirBusca.Start;
      end;

      fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
      fBuscaAvancada.LayCadastro.Align := TAlignLayout.Client;
      vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayCadastro')));
      Self.EndUpdate;
      vsColuna.EndUpdate;
   end;

   rPreco := -1;
   arrBusca :=  TRegEx.Split(edtBuscaAvancada.Text,'=');
   if TRegEx.Matches(edtBuscaAvancada.Text,'=').Count > 0 then begin
      if (arrBusca[1]) <> '' then begin
         try
             rPreco := StrToFloat(arrBusca[1]);
         except
           rPreco := -1;
         end;
      end;
   end;

   if (Key = vkReturn) and (edtBuscaAvancada.Text <> '') and (TRegEx.Matches(edtBuscaAvancada.Text,'=').Count = 0)  then begin
      retBuscaAvancada.Height := 300;
      vsColuna := TVertScrollBox.Create(retBuscaAvancada);
      vsColuna.Align := TAlignLayout.Client;
      vsColuna.Name := 'vsb_busca';
      vsColuna.Size.PlatformDefault := False;
      vsColuna.TabOrder := 0;
      vsColuna.Parent := retBuscaAvancada;
      Self.BeginUpdate;
      vsColuna.BeginUpdate;
      retBuscaAvancada.Position.X := layCentro.Position.X+2;
      retBuscaAvancada.Width := edtBuscaAvancada.Width;

      if (retBuscaAvancada.Opacity <> 1) and (edtBuscaAvancada.Text <> '') then begin
         retBuscaAvancada.Visible := True;
         FloatAnimationExibirBusca.Start;
      end;

      sBusca := arrBusca[0];

      if TabControl2.Tabs[TabControl2.TabIndex].Name = 'tdDetalhesAtendimento' then begin
         if lblAtendimentoCliente.Tag = 0 then begin
           dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Nome,Rua,CpfCnpj FROM contatos ' + ' WHERE Cliente = 1 ' +
                                        ' AND Nome LIKE ' + QuotedStr('%' + sBusca + '%') +
                                        ' OR CpfCnpj LIKE ' + QuotedStr('%' + sBusca + '%') +
                                        '  LIMIT 3');
            if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
               fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
               fBuscaAvancada.LblTitulo.Text  := 'Clientes';
               fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
               vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));

               while not dmPrincipal.tabBuscaAvancada.eof do begin
                  fBuscaAvancada                     := TfBuscaAvancada.Create(vsColuna);
                  fBuscaAvancada.btnAtendimentos.Tag := 1;
                  fBuscaAvancada.btnEditar.Hint          := 'Editar Contato';
                  fBuscaAvancada.btnAddItem.Visible      := False;
                  fBuscaAvancada.lblContatoNome.Text     := dmPrincipal.tabBuscaAvancada.FieldByName('Nome').AsString;
                  fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Rua').AsString;
                  fBuscaAvancada.lblDocumento.Text       := dmPrincipal.tabBuscaAvancada.FieldByName('CpfCnpj').AsString;
                  fBuscaAvancada.LayContatos.Align       := TAlignLayout.Top;
                  fBuscaAvancada.imgContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
                  fBuscaAvancada.retContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
                  fBuscaAvancada.imgContatos.LoadImagem(fBuscaAvancada.lblContatoNome.Text);
                  vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
                  dmPrincipal.tabBuscaAvancada.Next;
               end;
            end;
         end;

         dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Descricao,CodigoBarra,ValorVenda FROM itens ' +
                                         'WHERE  Descricao LIKE ' + QuotedStr('%' + sBusca +
                                         '%') + ' ');
         if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.LblTitulo.Text := 'Serviços';
            fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));
         end;

         while not dmPrincipal.tabBuscaAvancada.eof do begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.btnAtendimentos.Visible := False;
            fBuscaAvancada.btnEditar.Hint          := 'Editar Item';
            fBuscaAvancada.btnAddItem.Tag          := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
            fBuscaAvancada.lblContatoNome.Text     := dmPrincipal.tabBuscaAvancada.FieldByName('Descricao').AsString;
            fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('CodigoBarra').AsString;
            fBuscaAvancada.lblDocumento.Text       := FormatFloat('R$ #,##0.00', dmPrincipal.tabBuscaAvancada.FieldByName('ValorVenda').AsFloat);
            fBuscaAvancada.LayContatos.Align       := TAlignLayout.Top;
            fBuscaAvancada.retContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
            fBuscaAvancada.imgContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
            fBuscaAvancada.imgContatos.LoadItem(0);
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
            dmPrincipal.tabBuscaAvancada.Next;
         end;
      end

      else begin
         dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Nome,Rua,CpfCnpj FROM contatos ' + ' WHERE Cliente = 1 ' +
                                           ' AND Nome LIKE ' + QuotedStr('%' + sBusca + '%') +
                                           ' OR CpfCnpj LIKE ' + QuotedStr('%' +sBusca + '%') +
                                           '  LIMIT 3');
         if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.LblTitulo.Text  := 'Clientes';
            fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));

            while not dmPrincipal.tabBuscaAvancada.eof do begin
               fBuscaAvancada                     := TfBuscaAvancada.Create(vsColuna);
               fBuscaAvancada.btnAtendimentos.Tag := 1;
               if TabControl1.Tabs[TabControl1.TabIndex].Name <> 'TabItemAtendimentos' then
                  fBuscaAvancada.btnAtendimentos.Visible := False;
               fBuscaAvancada.btnEditar.Hint          := 'Editar Contato';
               fBuscaAvancada.btnAddItem.Visible      := False;
               fBuscaAvancada.lblContatoNome.Text     := dmPrincipal.tabBuscaAvancada.FieldByName('Nome').AsString;
               fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Rua').AsString;
               fBuscaAvancada.lblDocumento.Text       := dmPrincipal.tabBuscaAvancada.FieldByName('CpfCnpj').AsString;
               fBuscaAvancada.LayContatos.Align       := TAlignLayout.Top;
               fBuscaAvancada.imgContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.retContatos.Tag         := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.imgContatos.LoadImagem(fBuscaAvancada.lblContatoNome.Text);
               vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
               dmPrincipal.tabBuscaAvancada.Next;
            end;
         end;

         dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Nome,Rua,CpfCnpj  FROM contatos ' + ' WHERE Fornecedor = 1 '+
                                           ' AND Nome LIKE ' + QuotedStr('%' + sBusca + '%') +
                                           ' OR CpfCnpj LIKE ' + QuotedStr('%' + sBusca + '%') +
                                           'LIMIT 3');

         if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.LblTitulo.Text := 'Fornecedores';
            fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));

            while not dmPrincipal.tabBuscaAvancada.eof do begin
               fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
               if TabControl1.Tabs[TabControl1.TabIndex].Name <> 'TabItemAtendimentos' then
               fBuscaAvancada.btnAtendimentos.Visible := False;
               fBuscaAvancada.btnAddItem.Visible := False;
               fBuscaAvancada.btnEditar.Hint := 'Editar Contato';
               fBuscaAvancada.lblContatoNome.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Nome').AsString;
               fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Rua').AsString;
               fBuscaAvancada.lblDocumento.Text := dmPrincipal.tabBuscaAvancada.FieldByName('CpfCnpj').AsString;
               fBuscaAvancada.LayContatos.Align := TAlignLayout.Top;
               fBuscaAvancada.retContatos.Hint := 'F';
               fBuscaAvancada.imgContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.retContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.imgContatos.LoadImagem(fBuscaAvancada.lblContatoNome.Text);
               vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
               dmPrincipal.tabBuscaAvancada.Next;
            end;
         end;

         dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Nome,Rua,CpfCnpj  FROM contatos ' +
                                           ' WHERE Profissional = 1 ' + ' AND Nome LIKE ' +
                                           QuotedStr('%' + sBusca+ '%') + ' OR CpfCnpj LIKE ' +
                                           QuotedStr('%' + sBusca + '%') + '  LIMIT 3');

         if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.LblTitulo.Text := 'Profissionais';
            fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));

            while not dmPrincipal.tabBuscaAvancada.eof do begin
               fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
               fBuscaAvancada.btnAddItem.Visible := False;
               fBuscaAvancada.btnEditar.Hint := 'Editar Contato';
               fBuscaAvancada.lblContatoNome.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Nome').AsString;
               fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Rua').AsString;
               fBuscaAvancada.lblDocumento.Text := dmPrincipal.tabBuscaAvancada.FieldByName('CpfCnpj').AsString;
               fBuscaAvancada.LayContatos.Align := TAlignLayout.Top;
               fBuscaAvancada.imgContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.retContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.retContatos.Hint := 'P';
               fBuscaAvancada.imgContatos.LoadImagem(fBuscaAvancada.lblContatoNome.Text);
               vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
               dmPrincipal.tabBuscaAvancada.Next;
            end;
         end;

         dmPrincipal.tabBuscaAvancada.Open('SELECT ID,Descricao,CodigoBarra,ValorVenda FROM itens ' +
                                           ' WHERE Descricao LIKE ' + QuotedStr('%' + sBusca + '%') +
                                           ' LIMIT 3');
         if dmPrincipal.tabBuscaAvancada.recordCount > 0 then begin
            fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
            fBuscaAvancada.LblTitulo.Text := 'Serviços';
            fBuscaAvancada.LayTitulo.Align := TAlignLayout.Top;
            vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayTitulo')));

            while not dmPrincipal.tabBuscaAvancada.eof do begin
               fBuscaAvancada := TfBuscaAvancada.Create(vsColuna);
               fBuscaAvancada.btnEditar.Hint := 'Editar Item';
               fBuscaAvancada.btnAtendimentos.Visible := False;
               fBuscaAvancada.lblContatoNome.Text := dmPrincipal.tabBuscaAvancada.FieldByName('Descricao').AsString;
               fBuscaAvancada.lblDocumento.Text := FormatFloat('R$ #,##0.00', dmPrincipal.tabBuscaAvancada.FieldByName('ValorVenda').AsFloat);
               fBuscaAvancada.lblContatoEndereco.Text := dmPrincipal.tabBuscaAvancada.FieldByName('CodigoBarra').AsString;
               fBuscaAvancada.LayContatos.Align := TAlignLayout.Top;
               fBuscaAvancada.retContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.imgContatos.Tag := dmPrincipal.tabBuscaAvancada.FieldByName('ID').AsInteger;
               fBuscaAvancada.imgContatos.LoadItem(0);

               if TabControl1.Tabs[TabControl1.TabIndex].Name <> 'TabItemAtendimentos' then
                  fBuscaAvancada.btnAddItem.Visible := False;

               vsColuna.AddObject(TLayout(fBuscaAvancada.FindComponent('LayContatos')));
               dmPrincipal.tabBuscaAvancada.Next;
            end;

         end;
      end;

      Self.EndUpdate;
      vsColuna.EndUpdate;
   end;

end;

procedure TfPrincipal.edtBuscaClienteChangeTracking(Sender: TObject);
begin
   CarregaCardsCliente(' AND Nome LIKE ' +  QuotedStr('%' + edtBuscaCliente.Text + '%'));
end;

procedure TfPrincipal.FloatAnimationEscondeBuscaFinish(Sender: TObject);
begin
   retBuscaAvancada.Visible := False;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
   Rectangle6.Visible := False;
   TabControl1.TabPosition := TTabPosition.None;
   TabControl2.TabPosition := TTabPosition.None;
   tcDadosContatos.TabPosition := TTabPosition.None;
   retMenu.Visible := False;
   fPrincipal.retUsuariosAguardando.Visible := False;

   tbChangeCardAtendimento.Execute;
   FloatAnimationEscondeBusca.Start;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
   ListItemName := 1;
   tbChangeHome.Execute;
   lblMovimentacao.tag := 2018;
   Login;

   ListaTarefas;
   DataAtendimento := Date;
   CalendarioAtendimentos(DataAtendimento);
   ClearMes;

end;

procedure TfPrincipal.Label1Click(Sender: TObject);
begin
   tbChangeAtendimentos.Execute;
   MultiView1.HideMaster;

end;

procedure TfPrincipal.Label20Click(Sender: TObject);
var RunLayout :TLayout;  I:integer;
begin
   inherited;
   for I := fPrincipal.layMovimentacao.ControlsCount - 1 downto 0 do
      fPrincipal.layMovimentacao.RemoveObject(fPrincipal.layMovimentacao.Controls[I]);

   fMovimentacao := TfMovimentacao.Create(fPrincipal.layMovimentacao);
   fMovimentacao.lblLancar.text := lblMovimentacao.text;
   fMovimentacao.lblLancar.tag := 0;
   fMovimentacao.edtID.text := ' AND  strftime("%m", DataVencimento)*1 = 1 ';//' AND IDContato = '+IntToStr(SpeedButton1.Tag);

   fPrincipal.layMovimentacao.AddObject(TLayout(fMovimentacao.FindComponent('LayPrincipal')));
   fPrincipal.ChangeTabAction2.Execute;
end;

procedure TfPrincipal.Label7Click(Sender: TObject);
begin
   Rectangle6.Visible := True;
   fCardTiposAtendimentos := TfCardTiposAtendimentos.Create(Self);
   fCardTiposAtendimentos.Tarefas;
   Rectangle7.Height := fCardTiposAtendimentos.Height;
   Rectangle7.Width := fCardTiposAtendimentos.Width;
   fPrincipal.Rectangle7.Visible := True;
   Rectangle7.RemoveObject(0);

   fCardTiposAtendimentos.Showmodal;
   Rectangle7.RemoveObject(0);

end;

procedure TfPrincipal.Label8Click(Sender: TObject);
begin
   Rectangle6.Visible := True;
   fCardTiposAtendimentos := TfCardTiposAtendimentos.Create(Self);
   fCardTiposAtendimentos.Tarefas;
   Rectangle7.Height := fCardTiposAtendimentos.Height;
   Rectangle7.Width := fCardTiposAtendimentos.Width;
   fPrincipal.Rectangle7.Visible := True;
   Rectangle7.RemoveObject(0);
   Rectangle7.AddObject(TLayout(fCardTiposAtendimentos.FindComponent('LayoutCard')));
   MultiView1.HideMaster;
end;

procedure TfPrincipal.lblAtendimentosClick(Sender: TObject);
begin
   Atendimentos(lblTarefa.Tag, lblAtendimentoProfissional.Tag, DataAtendimento);
   imgProfissionalAtendimento.Tag := lblAtendimentoProfissional.Tag;
   imgProfissionalAtendimento.LoadImagem(lblProfissional.Text);

   tbChangeAtendimentos.Execute;
end;

procedure TfPrincipal.lblClienteClick(Sender: TObject);
begin
   tbChangeAtualizacoes.Execute;
   MultiView1.HideMaster;
end;

procedure TfPrincipal.lblContatosClick(Sender: TObject);
begin
   CarregaCardsCliente('');
   CarregaCardsFornecedor;
   CarregaCardsProfissional;
   tbChangeAtualizacoes.Execute;

end;

procedure TfPrincipal.lblMovimentacaoClick(Sender: TObject);
begin
   Anos;
end;

procedure TfPrincipal.lblSairClick(Sender: TObject);
begin
   Application.Terminated := True;
end;

procedure TfPrincipal.lblUsuarioClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   Rectangle6.Visible := True;
   fAlteraSenha := TfAlteraSenha.Create(Self);
   fAlteraSenha.Showmodal;
   Rectangle6.Visible := False;

end;

procedure TfPrincipal.ListaTarefas;
var
   lblDescricao, lblTotal: TLabel;
   line: TLine;
   round: TRoundRect;
   vsbTarefas: TVertScrollBox;
begin

   if VertAtendimentos.FindComponent('vsbTarefas') <> nil then begin
      vsbTarefas := TVertScrollBox(VertAtendimentos.FindComponent('vsbTarefas'));
      FreeAndNil(vsbTarefas);
   end;

   vsbTarefas := TVertScrollBox.Create(VertAtendimentos);
   vsbTarefas.Align := TAlignLayout.Client;
   vsbTarefas.Name := 'vsbTarefas';
   vsbTarefas.Size.PlatformDefault := False;
   vsbTarefas.TabOrder := 0;
   vsbTarefas.Parent := VertAtendimentos;
   Self.BeginUpdate;

   dmPrincipal.QuerySelect.Open('SELECT Codigo,Descricao FROM tarefas');

   while not dmPrincipal.QuerySelect.eof do begin
    // cbxTarefas.Items.AddObject(dmPrincipal.QuerySelect.Fields[1].AsString , Tobject(Integer(dmPrincipal.QuerySelect.Fields[0].AsInteger)));
    if lblTarefa.Tag = 0 then begin
      lblTarefa.Text := dmPrincipal.QuerySelect.FieldByName('Descricao').AsString;
      lblTarefa.Tag := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
    end;

    lblDescricao := TLabel.Create(vsbTarefas);
    lblDescricao.Align := TAlignLayout.Top;
    lblDescricao.StyledSettings := [];

    lblDescricao.Margins.Top    := 2;
    lblDescricao.Margins.Bottom := 2;
    lblDescricao.Position.X     := 5;
    lblDescricao.Position.Y     := 290;
    lblDescricao.Size.Width     := 190;
    lblDescricao.Size.Height             := 22;
    lblDescricao.Size.PlatformDefault    := False;
    lblDescricao.TextSettings.Font.Size  := 10;
    lblDescricao.TextSettings.Font.Style := [TFontStyle.fsBold];
    lblDescricao.TextSettings.FontColor  := AppColor;
    lblDescricao.Text                    := dmPrincipal.QuerySelect.FieldByName('Descricao').AsString;
    lblDescricao.ParentShowHint := False;
    lblDescricao.ShowHint       := True;
    lblDescricao.HitTest        := True;
    lblDescricao.Tag            := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
    lblDescricao.Cursor  := crHandPoint;
    lblDescricao.OnClick := ClickTarefa;
    lblDescricao.Parent  := vsbTarefas;

    line := TLine.Create(vsbTarefas);
    line.Align := TAlignLayout.Bottom;
    line.LineType := TLineType.Bottom;
    line.Size.Width := 190;
    line.Size.Height := 1;
    line.Size.PlatformDefault := False;
    line.Stroke.Color := TAlphaColors.Steelblue;
    line.Parent := lblDescricao;

    dmPrincipal.tabSelect.Open('SELECT * FROM tipos_atendimentos WHERE CodigoTarefa = ' +
                               Inttostr(lblDescricao.Tag) + ' ORDER BY Ordem,Travado');
    dmPrincipal.tabSelect.First;
    while not dmPrincipal.tabSelect.eof do begin
      lblDescricao := TLabel.Create(vsbTarefas);
      lblDescricao.Align := TAlignLayout.Top;
      lblDescricao.StyledSettings := [];
      lblDescricao.Margins.Top    := 2;
      lblDescricao.Margins.Left   := 10;
      lblDescricao.Margins.Bottom := 2;
      lblDescricao.Position.X := 5;
      lblDescricao.Position.Y := 290;
      lblDescricao.Size.Width := 190;
      lblDescricao.Size.Height := 22;
      lblDescricao.Size.PlatformDefault := False;
      lblDescricao.TextSettings.Font.Size := 12;
      lblDescricao.TextSettings.Font.Style := [];
      lblDescricao.TextSettings.FontColor := AppColor;
      lblDescricao.Text := dmPrincipal.tabSelect.FieldByName('Descricao').AsString;
      lblDescricao.ParentShowHint := False;
      lblDescricao.ShowHint := True;
      lblDescricao.HitTest := True;
      lblDescricao.Hint := dmPrincipal.QuerySelect.FieldByName('Descricao').AsString;
      lblDescricao.HelpContext := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
      lblDescricao.Tag         := dmPrincipal.tabSelect.FieldByName('Codigo').AsInteger;
      lblDescricao.Cursor      := crHandPoint;
      lblDescricao.OnClick     := ClickTipoTarefa;
      lblDescricao.Parent      := vsbTarefas;

      line := TLine.Create(vsbTarefas);
      line.Align := TAlignLayout.Bottom;
      line.LineType := TLineType.Bottom;
      line.Size.Width := 190;
      line.Size.Height := 1;
      line.Size.PlatformDefault := False;
      line.Stroke.Color := TAlphaColors.Steelblue;
      line.Parent := lblDescricao;

      dmPrincipal.tabSelect.Next;
    end;
    dmPrincipal.QuerySelect.Next;

  end;
  Self.EndUpdate;

end;

procedure TfPrincipal.Login;
begin
  Rectangle6.Visible := True;
  fLogin := TfLogin.Create(Self);

  fLogin.Showmodal;
  Rectangle6.Visible := False;

  Anos;
end;

procedure TfPrincipal.MenuAtendimentosButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   Atendimentos(lblTarefa.Tag, lblAtendimentoProfissional.Tag, DataAtendimento);
   imgProfissionalAtendimento.Tag := lblAtendimentoProfissional.Tag;
   imgProfissionalAtendimento.LoadImagem(lblProfissional.Text);
   tbChangeAtendimentos.Execute;

end;

procedure TfPrincipal.MenuClientesButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddClienteClick(Nil);

end;

procedure TfPrincipal.MenuContatosButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   CarregaCardsCliente('');
   CarregaCardsFornecedor;
   CarregaCardsProfissional;
   tbChangeAtualizacoes.Execute;
end;

procedure TfPrincipal.MenuFornecedorButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddFornecedorClick(Nil);

end;

procedure TfPrincipal.MenuMovimentosButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   tbChangeMovimento.execute;
end;

procedure TfPrincipal.MenuProfissionaisButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddProfissionalClick(Nil);
end;

procedure TfPrincipal.MenuServicosButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddServicoClick(Nil);

end;

procedure TfPrincipal.MenuTarefasButtonClick(Sender: TObject);
begin
   MultiView1.HideMaster;
   Atendimentos(lblTarefa.Tag, lblAtendimentoProfissional.Tag, DataAtendimento);
   imgProfissionalAtendimento.Tag := lblAtendimentoProfissional.Tag;
   imgProfissionalAtendimento.LoadImagem(lblProfissional.Text);
   tbChangeAtendimentos.Execute;

   Rectangle6.Visible := True;
   fCardTiposAtendimentos := TfCardTiposAtendimentos.Create(Self);
   fCardTiposAtendimentos.Tarefas;
   Rectangle7.Height := fCardTiposAtendimentos.Height;
   Rectangle7.Width := fCardTiposAtendimentos.Width;
   fPrincipal.Rectangle7.Visible := True;
   Rectangle7.RemoveObject(0);

   fCardTiposAtendimentos.Showmodal;
   Rectangle7.RemoveObject(0);

end;

procedure TfPrincipal.ObjetoDragDrop(Sender: TObject; const Data: TDragObject;
  const Point: TPointF);
begin
   if sUpdateContatos <> '' then begin
      dmPrincipal.SQLiteConnection.ExecSQL(sUpdateContatos);
      CarregaCardsCliente('');
      CarregaCardsFornecedor;
      CarregaCardsProfissional;
   end;
end;

procedure TfPrincipal.ObjetoDragOver(Sender: TObject; const Data: TDragObject;
  const Point: TPointF; var Operation: TDragOperation);
begin

   if (TRectangle(Sender).Name = 'RectangleAddCliente') and (TRectangle(Data.Source).Hint <> 'C') then
       sUpdateContatos := 'Update contatos SET Cliente = 1,DataAtividade = current_timestamp WHERE ID =' + Inttostr(TRectangle(Data.Source).Tag)
    // + ' ' + TRectangle(Data.Source).Name ;
   else if (TRectangle(Sender).Name = 'RectangleAddFornecedor') and (TRectangle(Data.Source).Hint <> 'F') then
      sUpdateContatos :=  'Update contatos SET Fornecedor = 1,DataAtividade = current_timestamp WHERE ID =' + Inttostr(TRectangle(Data.Source).Tag)
    // + ' ' + TRectangle(Data.Source).Name ;
   else if (TRectangle(Sender).Name = 'RectangleAddProfissional') and (TRectangle(Data.Source).Hint <> 'P') then
      sUpdateContatos := 'Update contatos SET Profissional = 1,DataAtividade = current_timestamp WHERE ID =' + Inttostr(TRectangle(Data.Source).Tag)
   else
     sUpdateContatos := '';

   Operation := TDragOperation.Copy;

end;

procedure TfPrincipal.ObjetoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
   Svc: IFMXDragDropService;
   DragData: TDragObject;
   DragImage: TBitmap;
begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXDragDropService, Svc) then begin
      DragImage := TControl(Sender).MakeScreenshot;
      DragData.Source := Sender;
      DragData.Data := DragImage;
      try
         Svc.BeginDragDrop(Application.MainForm, DragData, DragImage);
      finally
         DragImage.Free;
      end;
   end;
end;

procedure TfPrincipal.Rectangle2DragDrop(Sender: TObject;
  const Data: TDragObject; const Point: TPointF);
begin
   if LastOver <> nil then begin
      LastOver.Margins.Top := 5;
      LastOver.Margins.Bottom := 0;
   end;

   if Sender is TVertScrollBox then
      TControl(Sender).AddObject(TControl(Data.Source))
   else
      TControl(Sender).Parent.AddObject(TControl(Data.Source));
   TControl(Data.Source).Position.Y := DesY;

   if TControl(Data.Source).Hint <> Inttostr(TControl(Sender).Tag) then begin
      if TControl(Data.Source).Parent <> TControl(Sender).Parent then begin
         Executar('UPDATE atendimentos SET TipoAtendimento = ' +
         Inttostr(TControl(Sender).Tag) + ' WHERE Codigo =' +
         Inttostr(TControl(Data.Source).Tag));
         // Label8.Text := 'Mover atendimento ' + InttoStr(TControl(Data.Source).Tag) +
         // 'do tipo ' + TControl(Data.Source).Hint +
         // 'do tipo ' + IntTostr(TControl(Sender).Tag) ;
         //
         TControl(Data.Source).Hint := Inttostr(TControl(Sender).Tag);

         Atendimentos(lblTarefa.Tag, imgProfissionalAtendimento.Tag, DataAtendimento);
      end;
   end;

  { Label8.Text := TControl(Data.Source).Name +' - '+ IntTostr(TControl(Data.Source).Tag)+ ' - '+ TControl(Data.Source).Hint +
    TControl(Sender).Name +' - '+ IntTostr(TControl(Sender).Tag) +' - '+ TControl(Sender).Hint ;
  }
  // ShowMessage(Inttostr(LastOver.Tag));
  //
  // ShowMessage(LastOver.Hint);
  //
  // ShowMessage('Enviou');

end;

procedure TfPrincipal.Rectangle2DragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin

  Operation := TDragOperation.Copy;

  // if Data.Source <> nil then
  // Label5.Text := Format(' DragAndDrop by Aone , Src: %s, Des: %s, %f, %f', [TControl(Data.Source).Name, TControl(Sender).Name, Point.X, Point.Y]);

  // Label6.Text := inttostr(TControl(Data.Source).Tag) + ' - ' +TControl(Data.Source).Name;
  // Label7.Text := inttostr(TControl(Sender).Tag)+ ' - ' +TControl(Sender).Name;

   if Sender is TVertScrollBox then begin
     DesY := Point.Y - 20;
     Exit;
   end;

   if LastOver <> nil then begin
      if LastOver is TVertScrollBox then begin
         LastOver.Margins.Top := 5;
         LastOver.Margins.Bottom := 0;
      end;
   end;

   if Point.Y < 20 then
      TControl(Sender).Margins.Top := 20
   else
      TControl(Sender).Margins.Top := 5;

   if Point.Y > TControl(Sender).Height - 20 then
      TControl(Sender).Margins.Bottom := 20
   else
      TControl(Sender).Margins.Bottom := 0;

   if Point.Y < TControl(Sender).Height / 2 then
      DesY := TControl(Sender).Position.Y - TControl(Sender).Margins.Top - 1
   else
      DesY := TControl(Sender).Position.Y + TControl(Sender).Margins.Bottom + TControl(Sender).Height + 1;

   LastOver := TControl(Sender);
   self.Caption := LastOver.ClassName;

end;

procedure TfPrincipal.Rectangle2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  Svc: IFMXDragDropService;
  DragData: TDragObject;
  DragImage: TBitmap;
begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXDragDropService, Svc) then begin
      DragImage := TControl(Sender).MakeScreenshot;
      DragData.Source := Sender;
      DragData.Data := DragImage;
      try
        Svc.BeginDragDrop(Application.MainForm, DragData, DragImage);
      finally
        DragImage.Free;
      end;
   end;
end;

procedure TfPrincipal.retAnteriorClick(Sender: TObject);
begin
   DataAtendimento := IncMonth(DataAtendimento, -1);
   CalendarioAtendimentos(DataAtendimento);
   Atendimentos(lblTarefa.Tag, imgProfissionalAtendimento.Tag, DataAtendimento);

end;

procedure TfPrincipal.retProximoClick(Sender: TObject);
begin
   DataAtendimento := IncMonth(DataAtendimento, +1);
   CalendarioAtendimentos(DataAtendimento);
   Atendimentos(lblTarefa.Tag, imgProfissionalAtendimento.Tag, DataAtendimento);

end;

procedure TfPrincipal.btnPrincipalAddClienteClick(Sender: TObject);
begin
   CadastroContatos('0', 'C', 'Cadastro de Clientes', '');
end;

procedure TfPrincipal.btnPrincipalAddFornecedorClick(Sender: TObject);
begin
   CadastroContatos('0', 'F', 'Cadastro de Fornecedores', '');
end;

procedure TfPrincipal.btnPrincipalAddProfissionalClick(Sender: TObject);
begin
   CadastroContatos('0', 'P', 'Cadastro de Profissional', '');
end;

procedure TfPrincipal.btnPrincipalAddServicoClick(Sender: TObject);
begin
   CadastroContatos('0', 'P', 'Cadastro de Serviço', 'Editar Item');
end;

procedure TfPrincipal.AnoClick(Sender: TObject);
var rAnual :Real;
begin
   ClearMes;
   ContasAnual(TLabel(Sender).Text , 'P','');
   rAnual := 0;
   dmPrincipal.tabMovimentos.first;
   while not dmPrincipal.tabMovimentos.eof do begin
      TLabel(FindComponent('lbl_pagar_' + (dmPrincipal.tabMovimentos.Fields[2].AsString))).Text :=  FormatFloat('#,##0.00',dmPrincipal.tabMovimentos.Fields[3].AsFloat);
      rAnual := rAnual + dmPrincipal.tabMovimentos.Fields[3].AsFloat;
      dmPrincipal.tabMovimentos.Next;
   end;

   lbl_pagar_13.text := FormatFloat('#,##0.00',rAnual);
   ContasAnual(TLabel(Sender).Text, 'R','');
   rAnual := 0;
   dmPrincipal.tabMovimentos.first;
   while not dmPrincipal.tabMovimentos.eof do begin
      TLabel(FindComponent('lbl_receber_' + (dmPrincipal.tabMovimentos.Fields[2].AsString))).Text :=  FormatFloat('#,##0.00',dmPrincipal.tabMovimentos.Fields[3].AsFloat);
      rAnual := rAnual + dmPrincipal.tabMovimentos.Fields[3].AsFloat;
      dmPrincipal.tabMovimentos.Next;
   end;

   lbl_receber_13.text := FormatFloat('R$ #,##0.00',rAnual);

   lblMovimentacao.Text := 'Movimentação :'+TLabel(Sender).Text;
   lblMovimentacao.Tag :=  strtoInt(TLabel(Sender).Text)
end;

procedure TfPrincipal.SpeedButton10Click(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddFornecedorClick(nil);
   tbChangeCadastros.Execute;

end;

procedure TfPrincipal.SpeedButton11Click(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddProfissionalClick(nil);
   tbChangeCadastros.Execute;

end;

procedure TfPrincipal.SpeedButton1Click(Sender: TObject);
begin
   MultiView1.HideMaster;
   btnPrincipalAddClienteClick(nil);
   tbChangeCadastros.Execute;
end;

procedure TfPrincipal.SpeedButton2Click(Sender: TObject);
var I :Integer;
begin

   GravarAtendimento;

   for I := lbx_atendimento_itens.ComponentCount - 1 Downto 0 do begin
      if (lbx_atendimento_itens.Components[I] is TListBoxItem) then begin
         if (lbx_atendimento_itens.Components[I] As TListBoxItem).Hint <> '' then begin
             (lbx_atendimento_itens.Components[I] As TListBoxItem).Hint := '';
         end;
      end;
   end;

   if (lblAtendimentoCliente.Tag > 0) and (lbx_atendimento_itens.Count > 0) and
      (lbx_atendimento_itens.Enabled) then begin
      Rectangle6.Visible               := True;
      fLancarContas                    := TfLancarContas.Create(Self);
      fLancarContas.lblLancar.Text     := TSpeedButton(Sender).Text;
      fLancarContas.edtNome.Tag        := lblAtendimentoCliente.Tag;
      fLancarContas.edtNome.Text       := lblAtendimentoCliente.Text;
      fLancarContas.edtValorConta.text := ValorAtendimento(btnGravarAtendimento.Tag);
      fLancarContas.iIDAtendimento     := btnGravarAtendimento.Tag;
      fLancarContas.edtID.text         := '0';

      fLancarContas.ShowModal;
      Rectangle6.Visible               := False;

      if TestarLancamento(btnGravarAtendimento.Tag) > 0 then begin
         lbx_atendimento_itens.Enabled := False;

      end;
   end;
end;

procedure TfPrincipal.Text2Click(Sender: TObject);
begin
  tbChangeAgenda.Execute;
end;

end.
