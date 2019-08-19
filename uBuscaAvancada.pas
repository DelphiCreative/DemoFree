unit uBuscaAvancada;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Effects, FMX.ListBox;

type
  TfBuscaAvancada = class(TForm)
    layContatos: TLayout;
    retContatos: TRectangle;
    lblContatoEndereco: TLabel;
    LayTitulo: TLayout;
    Rectangle1: TRectangle;
    lblTitulo: TLabel;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    btnEditar: TRectangle;
    btnAtendimentos: TRectangle;
    layCadastro: TLayout;
    Rectangle4: TRectangle;
    layAtendimentoItens: TLayout;
    retFundoAtendimentoItem: TRectangle;
    Layout4: TLayout;
    lblItemDescricao: TLabel;
    btnAddItem: TRectangle;
    retRomoverItem: TRectangle;
    btnRemoveItem: TSpeedButton;
    imgContatos: TRoundRect;
    lblContatoNome: TText;
    lblDocumento: TLabel;
    lblItemValor: TLabel;
    lblItemCodigo: TLabel;
    Layout3: TLayout;
    retAtalhos: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    btnBuscaAddServico: TRectangle;
    btnIncluirCliente: TSpeedButton;
    btnIncluirServico: TSpeedButton;
    btnIncluirProfissional: TSpeedButton;
    btnIncluirFornecedor: TSpeedButton;
    Rectangle3: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    layUsuarios: TLayout;
    Rectangle11: TRectangle;
    lblUsuarioLiberar: TLabel;
    btnLiberarAcesso: TRectangle;
    layContasLiquidadas: TLayout;
    Rectangle12: TRectangle;
    Layout5: TLayout;
    lblContaValor: TLabel;
    lblDescricaoConta: TLabel;
    lblDataVencimento: TLabel;
    Line1: TLine;
    retLiquidar: TRectangle;
    btnLiquidar: TSpeedButton;
    procedure btnIncluirServicoClick(Sender: TObject);
    procedure Layout1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnEditarClick(Sender: TObject);
    procedure btnAtendimentosClick(Sender: TObject);
    procedure retContatosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Rectangle1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnAddItemClick(Sender: TObject);
    procedure Layout4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnRemoveItemClick(Sender: TObject);
    procedure lblItemValorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnIncluirClienteClick(Sender: TObject);
    procedure btnIncluirFornecedorClick(Sender: TObject);
    procedure btnIncluirProfissionalClick(Sender: TObject);
    procedure btnLiberarAcessoClick(Sender: TObject);
    procedure btnLiquidarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscaAvancada: TfBuscaAvancada;

implementation

{$R *.fmx}

uses uPrincipal, uFuncoes, uContatos, uMovimentacao;

procedure TfBuscaAvancada.Layout1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
begin
   Rectangle2.Align  := TAlignLayout.Client;
   Rectangle2.Parent := TLayout(Sender);
end;

procedure TfBuscaAvancada.Layout4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
begin
   retRomoverItem.Align  := TAlignLayout.Client;
   retRomoverItem.Parent := TLayout(Sender);
end;

procedure TfBuscaAvancada.lblItemValorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
    retRomoverItem.Parent := Nil;
end;

procedure TfBuscaAvancada.Rectangle1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
   Rectangle2.Parent := Nil;
end;

procedure TfBuscaAvancada.btnEditarClick(Sender: TObject);
begin
  fPrincipal.CadastroContatos(inttostr(retContatos.Tag),
                              'C',
                              'Cadastro de Cliente',
                              TRectangle(Sender).Hint);

end;

procedure TfBuscaAvancada.btnIncluirClienteClick(Sender: TObject);
begin
  fPrincipal.btnPrincipalAddClienteClick(Nil);
end;

procedure TfBuscaAvancada.btnIncluirFornecedorClick(Sender: TObject);
begin
 fPrincipal.btnPrincipalAddFornecedorClick(Nil);
end;

procedure TfBuscaAvancada.btnIncluirProfissionalClick(Sender: TObject);
begin
   fPrincipal.btnPrincipalAddProfissionalClick(Nil);
end;

procedure TfBuscaAvancada.retContatosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
   Rectangle2.Parent := Nil;
end;

procedure TfBuscaAvancada.btnAddItemClick(Sender: TObject);
begin
   if fPrincipal.lbx_atendimento_itens.Enabled = True then
      fPrincipal.AdicionarItem(Inttostr(btnAddItem.Tag),'');
end;

procedure TfBuscaAvancada.btnAtendimentosClick(Sender: TObject);
var Cc :TContatos;
begin
   if TRectangle(Sender).Tag = 0 then begin
      //carrega atendimentos do profissional selecionado
      fPrincipal.CalendarioAtendimentos(Date);

      fPrincipal.Atendimentos(1,
                              retContatos.Tag,
                              Date);
      fPrincipal.imgProfissionalAtendimento.Tag := retContatos.Tag;
      fPrincipal.imgProfissionalAtendimento.LoadImagem(lblContatoNome.Text);
      fPrincipal.lblProfissional.Text := lblContatoNome.Text;
      fPrincipal.FloatAnimationEscondeBusca.Start;
      fPrincipal.Rectangle6.Visible := False;
      fPrincipal.Rectangle7.Visible := False;
      fPrincipal.tbChangeAtendimentos.Execute;
   end else begin
      //gera atendimento cliente selecionado
      if fPrincipal.lblAtendimentoCliente.Tag = 0 then begin
         Cc := TContatos.Create;
         Cc.Contato(retContatos.Tag);
         fPrincipal.lblAtendimentoCliente.Text := Cc.Nome;
         fPrincipal.lblAtendimentoCliente.Tag  := retContatos.Tag;
      end else
         fPrincipal.GerarAtendimento(fPrincipal.imgProfissionalAtendimento.Tag,retContatos.Tag,0);

      fPrincipal.FloatAnimationEscondeBusca.Start;
   end;

end;

procedure TfBuscaAvancada.btnRemoveItemClick(Sender: TObject);
var  ListItemRemove :TListBoxItem;
     I :integer;
     vis :boolean;
begin

   if TSpeedButton(Sender).HelpContext = 0 then begin
      if TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_new_item_'+Inttostr(TSpeedButton(Sender).Tag))) <> nil then begin
         TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_new_item_'+Inttostr(TSpeedButton(Sender).Tag))).Visible := False;
         TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_new_item_'+Inttostr(TSpeedButton(Sender).Tag))).Hint := '';
      end;
   end else if TSpeedButton(Sender).HelpContext = 1 then begin
      if TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_add_item_'+Inttostr(TSpeedButton(Sender).Tag))) <> nil then begin
         TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_add_item_'+Inttostr(TSpeedButton(Sender).Tag))).Visible := False;
         TListBoxItem(fPrincipal.lbx_atendimento_itens.FindComponent('lbx_add_item_'+Inttostr(TSpeedButton(Sender).Tag))).Hint :=
          'DELETE FROM atendimentos_det WHERE codigo = '+Inttostr(TSpeedButton(Sender).Tag);
      end;
   end;

   vis := False;
   fPrincipal.lbx_atendimento_itens.BeginUpdate;
   for I := fPrincipal.lbx_atendimento_itens.ComponentCount - 1 Downto 0 do begin
      if (fPrincipal.lbx_atendimento_itens.Components[I] is TListBoxItem) then begin
          if (fPrincipal.lbx_atendimento_itens.Components[I] As TListBoxItem).Visible then begin
              vis := (fPrincipal.lbx_atendimento_itens.Components[I] As TListBoxItem).Visible;
          end;
      end;
   end;
   fPrincipal.lbx_atendimento_itens.EndUpdate;
   fPrincipal.btnAtendimentoLancar.Visible := vis;
end;

procedure TfBuscaAvancada.btnIncluirServicoClick(Sender: TObject);
begin
   fPrincipal.btnPrincipalAddServicoClick(Nil);
end;

procedure TfBuscaAvancada.btnLiberarAcessoClick(Sender: TObject);
begin
   Executar('UPDATE usuarios SET IDCOntato ='+inttostr(btnLiberarAcesso.Tag)+' WHERE ID = '+ inttostr(lblUsuarioLiberar.Tag));
   fPrincipal.lblUsuariosAguardando.Text := UsuariosAguardandoLiberacao;
end;

procedure TfBuscaAvancada.btnLiquidarClick(Sender: TObject);
begin
   if TSpeedButton(Sender).Text = 'Liquidar' then begin
      TSpeedButton(Sender).Text := 'Cancelar';
      Executar('UPDATE contas SET status = "A" WHERE ID ='+inttostr(TSpeedButton(Sender).Tag));

      if TRectangle(fMovimentacao.vsb_contas_liquidar.FindComponent('ret_'+Inttostr(TSpeedButton(Sender).Tag))) <> nil then
         TRectangle(fMovimentacao.vsb_contas_liquidar.FindComponent('ret_'+Inttostr(TSpeedButton(Sender).tag))).Parent := fMovimentacao.vsb_contas_aguardando;
         retLiquidar.Fill.Color := TAlphaColors.Red;

   end else if TSpeedButton(Sender).Text = 'Cancelar' then begin
     TSpeedButton(Sender).Text := 'Liquidar';
     Executar('UPDATE contas SET status = NULL WHERE ID ='+inttostr(TSpeedButton(Sender).Tag));

     if TRectangle(fMovimentacao.vsb_contas_liquidar.FindComponent('ret_'+Inttostr(TSpeedButton(Sender).Tag))) <> nil then
        TRectangle(fMovimentacao.vsb_contas_liquidar.FindComponent('ret_'+Inttostr(TSpeedButton(Sender).tag))).Parent := fMovimentacao.vsb_contas_liquidar;
      retLiquidar.Fill.Color := TAlphaColors.Green;
   end;

   fMovimentacao.CalculaTotal;

end;

end.
