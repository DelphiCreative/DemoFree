unit uCadastroContatos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uCadastros, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  Data.DB, FMX.Effects, FMX.TabControl, FMX.ListBox, System.Actions,
  FMX.ActnList;

type
  TfCadastrosContatos = class(TfCadastros)
    OpenDialog1: TOpenDialog;
    Rectangle2: TRectangle;
    btCancelar: TSpeedButton;
    edtID: TEdit;
    retMenu: TRectangle;
    ShadowEffect5: TShadowEffect;
    Rectangle1: TRectangle;
    TabControl1: TTabControl;
    tbDadosGerais: TTabItem;
    tbDadosAdicionais: TTabItem;
    edtRua: TEdit;
    edtCep: TEdit;
    EdtEmail1: TEdit;
    edtDocumento: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    edtNome: TEdit;
    Line2: TLine;
    ShadowEffect2: TShadowEffect;
    edtComplemento: TEdit;
    edtNumero: TEdit;
    edtTelefone: TEdit;
    edtAnotacoes: TEdit;
    actContatos: TActionList;
    tbDadosGeraisChange: TChangeTabAction;
    tbDadosAdicionaisChange: TChangeTabAction;
    edtTelefone2: TEdit;
    SpeedButton1: TSpeedButton;
    ShadowEffect6: TShadowEffect;
    Rectangle10: TRectangle;
    Rectangle4: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    Rectangle6: TRectangle;
    layAcesso: TLayout;
    lblAcesso: TLabel;
    retLiberado: TRectangle;
    Layout4: TLayout;
    Label4: TLabel;
    Rectangle3: TRectangle;
    ListBox1: TListBox;
    retBloqueado: TRectangle;
    ComboBox1: TComboBox;
    StyleBook1: TStyleBook;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    SpeedButton2: TSpeedButton;
    procedure Rectangle1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtDocumentoChangeTracking(Sender: TObject);
    procedure edtIDChangeTracking(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure edtDocumentoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure retMovimentosClick(Sender: TObject);
    procedure retLiberadoClick(Sender: TObject);
    procedure TabControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    sTipoCadastro :String;
    bCliente,bFornecedor,bProfissional :Boolean;
    lbl :TLabel;
  end;

var
  fCadastrosContatos: TfCadastrosContatos;

implementation

{$R *.fmx}

uses uContatos, dPrincipal, uPrincipal, uFuncoes, uReceitaWS, uBuscaAvancada,
  uCepWS, uMovimentacao;

{ TfCadastrosContatos }

procedure TfCadastrosContatos.edtCepKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var Cep :TCep;
begin
   inherited;
   if (not(KeyChar in ['0'..'9'])) and (ord(keychar)<>8) and (KeyChar <> #0) then
      KeyChar := #0;

   if Key = vkReturn then begin
      Cep := TCep.Create;
      Cep.Consultar(edtCep.Text);
      edtCidade.Texto(Cep.Localidade + '/' +Cep.Uf);
      edtBairro.Texto(Cep.Bairro);
      edtComplemento.Texto(Cep.Complemento);
      edtRua.Texto(Cep.Logradouro);
      Cep.Free;
   end;
end;

procedure TfCadastrosContatos.edtDocumentoChangeTracking(Sender: TObject);
begin
   inherited;
   lbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
   edtDocumento.StyledSettings := [];
   if (edtDocumento.Text <> '') and (Length(edtDocumento.Text) <> 11) and (Length(edtDocumento.Text) <> 14) then begin
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

   if (edtDocumento.Text = '') then lbl.Text := 'Documento';
end;

procedure TfCadastrosContatos.edtDocumentoKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
var Empresa :TEmpresa;
begin
   inherited;
   if Key = vkReturn then begin
      lbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
      if lbl.Text = 'CNPJ' then begin
         Empresa := TEmpresa.Create;
         Empresa.Consultar(edtDocumento.Text);
         edtNome.Texto(Empresa.Nome);
         edtRua.Texto(Empresa.Rua);
         edtBairro.Texto(Empresa.Bairro);
         edtEmail1.Texto(Empresa.Email);
         edtCidade.Texto(Empresa.Cidade);
         edtCep.Texto(Empresa.Cep);
      end;
   end;
end;

procedure TfCadastrosContatos.edtIDChangeTracking(Sender: TObject);
var
   L : TContatos;
   I : Integer;
begin
   inherited;
   TabControl1.TabPosition := TTabPosition.None;

   L := TContatos.Create;
   L.Contato(StrtoInt(edtID.Text));
   edtNome.Text        := L.Nome;
   edtEmail1.Text      := L.Email1;
   edtCep.Text         := L.Cep;
   edtRua.Text         := L.Rua;
   edtNumero.Text      := L.Numero;
   edtComplemento.Text := L.Complemento;
   edtBairro.Text      := L.Bairro;
   edtCidade.Text      := L.Cidade;
   edtTelefone.Text    := L.Telefone1;
   edtTelefone2.Text   := L.Telefone2;
   edtAnotacoes.Text   := L.Observacoes;

   if L.Sexo = '' then
      ComboBox1.ItemIndex := -1
   else if L.Sexo = 'Masculino' then
      ComboBox1.ItemIndex := 1
   else if L.Sexo = 'Feminino' then
      ComboBox1.ItemIndex := 0;

   fCadastrosContatos.Rectangle1.Tag := StrToInt(edtID.Text);
   fCadastrosContatos.Rectangle1.LoadImagem(edtNome.Text);
   edtDocumento.OnChangeTracking := nil;
   edtDocumento.Text := L.CpfCnpj;

   if edtID.Hint = '' then begin
      for  I := 0 to ComponentCount -1 do begin
         if (Components[I] is TEdit)then begin
            TEdit(Components[I] as TEdit).OnEnter := EditEnter;
            TEdit(Components[I] as TEdit).OnExit  := EditExit;
            TEdit(Components[I] as TEdit).StyledSettings := [];
            TEdit(Components[I] as TEdit).TextSettings.Font.Size:= 14;
            TEdit(Components[I] as TEdit).Caption(TEdit(Components[I] as TEdit).Hint);
         end else if (Components[I] is TComboBox)then begin
            TComboBox(Components[I] as TComboBox).OnEnter := EditEnter;
            TComboBox(Components[I] as TComboBox).OnExit  := EditExit;
//            TComboBox(Components[I] as TComboBox).StyledSettings := [];
//            TComboBox(Components[I] as TComboBox).TextSettings.Font.Size:= 14;
            TComboBox(Components[I] as TComboBox).Caption(TComboBox(Components[I] as TComboBox).Hint);
         end
      end;
   end;

   edtDocumento.OnChangeTracking := edtDocumentoChangeTracking;
//  edtNome.Caption('Nome');
//  edtCep.Caption('Cep');
   bCliente          := L.Cliente;
   bFornecedor       := L.Fornecedor;
   bProfissional     := L.Profissional;

   if (bProfissional) and (edtID.Text <> '0') then begin
      if VerificarProfissionalUsuarios(edtID.Text) then begin
         retLiberado.Visible := True;
         retBloqueado.Visible := False;
      end else begin
         retBloqueado.Visible := True;
         retLiberado.Visible := False;
      end;
      layAcesso.Visible := True;
   end;

   if (not bProfissional) then layAcesso.Visible := False;

end;

procedure TfCadastrosContatos.ListBoxItem1Click(Sender: TObject);
begin
   inherited;
   TListBoxItem(Sender).Free;
end;

procedure TfCadastrosContatos.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
  tbDadosAdicionaisChange.Execute;
end;

procedure TfCadastrosContatos.Rectangle1Click(Sender: TObject);
var
   lbl :TLabel;
   I :Integer;
begin
   inherited;
   OpenDialog1.Execute;
   if OpenDialog1.FileName <> '' then begin
      Rectangle1.Fill.Bitmap.Bitmap.LoadFromFile(OpenDialog1.FileName);
      Rectangle1.Hint := OpenDialog1.FileName;
      Rectangle1.Fill.Kind := TBrushKind.Bitmap;

      for I := 0 to Rectangle1.ComponentCount -1 do begin
          if (Rectangle1.Components[I] is TLabel)then
             (Rectangle1.Components[I] as TLabel).Text := '';
      end;
   end;
end;

procedure TfCadastrosContatos.retLiberadoClick(Sender: TObject);
var  lbxUsuarios :TListBoxItem;
begin
   inherited;
   if edtID.Text <> '0' then begin
      if (fPrincipal.lblUsuario.Tag = 1) and (bProfissional) and (not VerificarProfissionalUsuarios(edtID.Text)) then begin
         ListBox1.Items.Clear;
         dmPrincipal.tabSelect.Open('select * from usuarios WHERE IDContato IS NULL');
         while not dmPrincipal.tabSelect.eof do begin
            lbxUsuarios := TListBoxItem.Create(ListBox1);
            lbxUsuarios.Parent := ListBox1;
            lbxUsuarios.Tag    := dmPrincipal.tabSelect.FieldByName('ID').AsInteger;
            lbxUsuarios.Height := 40;
            lbxUsuarios.Text   := dmPrincipal.tabSelect.FieldByName('Nome').AsString;

            fBuscaAvancada                           := TfBuscaAvancada.Create(ListBox1);
            fBuscaAvancada.lblUsuarioLiberar.Text    := dmPrincipal.tabSelect.FieldByName('Nome').AsString;
            fBuscaAvancada.lblUsuarioLiberar.Tag     := dmPrincipal.tabSelect.FieldByName('ID').AsInteger;
            fBuscaAvancada.btnLiberarAcesso.Tag      := SpeedButton1.Tag;
            fBuscaAvancada.layUsuarios.Align         := TAlignLayout.Client;
            lbxUsuarios.AddObject(TLayout(fBuscaAvancada.FindComponent('layUsuarios')));
            ListBox1.AddObject(lbxUsuarios);
            dmPrincipal.tabSelect.Next;
         end;
         ListBox1.Visible := True;
      end;
   end;

end;

procedure TfCadastrosContatos.retMovimentosClick(Sender: TObject);
begin
   inherited;
   fPrincipal.tbChangeMovimentos.Execute;
end;

procedure TfCadastrosContatos.SpeedButton1Click(Sender: TObject);
var
   C : TContatos;
   ImgSalvar : TMemoryStream;
   sCodigo :String;
   tDestroy :TListBoxItem;
begin
   inherited;
   if Trim(edtNome.Text) = '' then Abort;

   C := TContatos.Create;
   C.Nome    := edtNome.Text;
   C.Email1  := edtEmail1.Text;
   C.CpfCnpj := edtDocumento.Text;
   C.Rua     := edtRua.Text;
   C.Bairro  := edtBairro.Text;
   C.Cidade  := edtCidade.Text;

   C.Cep := edtCep.Text;
   C.Numero:= edtNumero.Text;
   C.Complemento := edtComplemento.Text;
   C.Telefone1:= edtTelefone.Text;
   C.Telefone2   := edtTelefone2.Text;
   C.Observacoes := edtAnotacoes.Text;

   if ComboBox1.ItemIndex = - 1 then
      C.Sexo := ''
   else if ComboBox1.ItemIndex = 1 then
      C.Sexo := 'Masculino'
   else if ComboBox1.ItemIndex = 0 then
      C.Sexo := 'Feminino';

   if TSpeedButton(Sender).Tag = 0 then begin

      if sTipoCadastro = 'C' then
         C.Cliente := True
      else if sTipoCadastro = 'P' then
         C.Profissional := True
      else if sTipoCadastro = 'F' then
         C.Fornecedor := True;

       c.Inserir;
       TSpeedButton(Sender).Tag := dmPrincipal.SqLiteConnection.ExecSQLScalar('select seq from sqlite_sequence WHERE name = "contatos"');

       tDestroy := TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_contato_0'));
       tDestroy.Name := 'lbx_contato_'+Inttostr(TSpeedButton(Sender).Tag);

   end else begin
       //atualizar
       C.ID := TSpeedButton(Sender).Tag;
       C.Cliente      := bCliente;
       C.Fornecedor   := bFornecedor;
       C.Profissional := bProfissional;
       c.Inserir;
   end;

   btCancelar.Tag := TSpeedButton(Sender).Tag;

   if Rectangle1.Hint <> '' then begin
      dmPrincipal.QuerySelect.Open('SELECT Codigo,IDContato FROM contatos_imagem WHERE IDContato =  '+ inttostr(TSpeedButton(Sender).Tag));
      dmPrincipal.QueryExecute.SQL.Clear;

      if dmPrincipal.QuerySelect.RecordCount > 0  then begin
         dmPrincipal.QueryExecute.SQL.Add('UPDATE contatos_imagem SET Imagem=:Imagem WHERE Codigo=:Codigo');

         ImgSalvar := TMemoryStream.Create;
         Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(ImgSalvar);
         ImgSalvar.Seek(0,0);
         dmPrincipal.QueryExecute.ParamByName('Imagem').LoadFromStream( ImgSalvar, ftBlob);
         dmPrincipal.QueryExecute.ParamByName('Codigo').AsInteger := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
         dmPrincipal.QueryExecute.ExecSQL;

      end else begin
         dmPrincipal.QueryExecute.SQL.Add('INSERT INTO contatos_imagem (Imagem,IDContato) values(:Imagem ,:IDContato)');
         ImgSalvar := TMemoryStream.Create;
         Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(ImgSalvar);
         ImgSalvar.Seek(0,0);
         dmPrincipal.QueryExecute.ParamByName('Imagem').LoadFromStream( ImgSalvar, ftBlob);
         dmPrincipal.QueryExecute.ParamByName('IDContato').AsInteger := TSpeedButton(Sender).Tag;
         dmPrincipal.QueryExecute.ExecSQL;
      end;
   end;

   Rectangle1.Tag := 0;

   if sTipoCadastro = 'C' then
      fPrincipal.CarregaCardsCliente('')
   else if sTipoCadastro = 'P' then
      fPrincipal.CarregaCardsProfissional
   else if sTipoCadastro = 'F' then
      fPrincipal.CarregaCardsFornecedor;

   if (edtID.Text = '0') and (sTipoCadastro = 'P') then begin
      edtID.Hint := '0';
      edtID.Text := IntToStr(TSpeedButton(Sender).Tag);
   end;

end;

procedure TfCadastrosContatos.SpeedButton2Click(Sender: TObject);
var RunLayout :TLayout;  I:integer;
begin
   inherited;
   for I := fPrincipal.layMovimentos.ControlsCount - 1 downto 0 do
       fPrincipal.layMovimentos.RemoveObject(fPrincipal.layMovimentos.Controls[I]);

   fMovimentacao := TfMovimentacao.Create(fPrincipal.layMovimentos);
   fMovimentacao.lblLancar.text := edtNome.text;
   fMovimentacao.lblLancar.tag := SpeedButton1.Tag;
   fMovimentacao.edtID.text := ' AND IDContato = '+IntToStr(SpeedButton1.Tag);

   fPrincipal.layMovimentos.AddObject(TLayout(fMovimentacao.FindComponent('LayPrincipal')));
   fPrincipal.tbChangeMovimentos.Execute;

end;

procedure TfCadastrosContatos.TabControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
   inherited;
   ListBox1.Visible := False;
end;

procedure TfCadastrosContatos.btCancelarClick(Sender: TObject);
var tDestroy :TListBoxItem;
begin
   inherited;
   try
     tDestroy := TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_contato_'+Inttostr(SpeedButton1.Tag)));
     FreeAndNil(tDestroy)

   except

   end;
end;

procedure TfCadastrosContatos.EditEnter(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender is TEdit) then begin
      if (Sender as TEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
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
   end;
end;

procedure TfCadastrosContatos.EditExit(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender is TEdit) then begin
      if (Sender as TEdit).Text  = '' then begin
         runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end else if (Sender is TComboBox) then begin
      if (Sender as TComboBox).ItemIndex  = -1 then begin
         runlbl := TLabel((Sender as TComboBox).FindComponent('Label'+(Sender as TComboBox).Name));
         runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
         runlbl.FontColor := AppColor;
      end;
   end;
end;
end.
