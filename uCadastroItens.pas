unit uCadastroItens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uCadastros, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  Data.DB, FMX.Effects, FMX.TabControl, FMX.ListBox, System.Actions,
  FMX.ActnList;

type
  TfCadastrosItens = class(TfCadastros)
    OpenDialog1: TOpenDialog;
    Rectangle2: TRectangle;
    btCancelar: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    Rectangle3: TRectangle;
    edtID: TEdit;
    retMenu: TRectangle;
    ShadowEffect5: TShadowEffect;
    Rectangle1: TRectangle;
    TabControl1: TTabControl;
    tbDadosGerais: TTabItem;
    tbDadosAdicionais: TTabItem;
    edtValorVenda: TEdit;
    edtCodigoBarra: TEdit;
    edtDescricao: TEdit;
    Line2: TLine;
    ShadowEffect2: TShadowEffect;
    actContatos: TActionList;
    tbDadosGeraisChange: TChangeTabAction;
    tbDadosAdicionaisChange: TChangeTabAction;
    btSalvar: TSpeedButton;
    Layout1: TLayout;
    Rectangle4: TRectangle;
    Label1: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    Rectangle6: TRectangle;
    procedure Rectangle1Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtIDChangeTracking(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure edtValorVendaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    sTipoCadastro :String;
    bCliente,bFornecedor,bProfissional :Boolean;
    lbl :TLabel;
  end;

var
  fCadastrosItens: TfCadastrosItens;

implementation

{$R *.fmx}

uses uItens, dPrincipal, uPrincipal, uFuncoes, uReceitaWS;

{ TfCadastrosContatos }

procedure TfCadastrosItens.edtIDChangeTracking(Sender: TObject);
var L : TItens;
    I : Integer;
begin
   inherited;
   TabControl1.TabPosition := TTabPosition.None;

   L := TItens.Create;
   L.Item(StrtoInt(edtID.Text));
   edtDescricao.Text  := L.Descricao;
   edtValorVenda.Text := FloatToStr(L.ValorVenda);

   fCadastrosItens.Rectangle1.Tag := StrToInt(edtID.Text);
   fCadastrosItens.Rectangle1.LoadItem(0);

   for  I := 0 to ComponentCount -1 do begin
      if (Components[I] is TEdit)then begin
         TEdit(Components[I] as TEdit).OnEnter := EditEnter;
         TEdit(Components[I] as TEdit).OnExit  := EditExit;
         TEdit(Components[I] as TEdit).StyledSettings := [];
         TEdit(Components[I] as TEdit).TextSettings.Font.Size:= 14;
         TEdit(Components[I] as TEdit).Caption(TEdit(Components[I] as TEdit).Hint);
      end
   end;

end;

procedure TfCadastrosItens.edtValorVendaKeyDown(Sender: TObject; var Key: Word;
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

      // atribuo a string à propriedade Text do Edit
      TEdit(Sender).Text := Texto2;

      // posiciono o cursor no fim do texto
      TEdit(Sender).SelStart := Length(Texto2);
   end;

   KeyChar := #0;
end;

procedure TfCadastrosItens.ListBoxItem1Click(Sender: TObject);
begin
   inherited;
   tbDadosGeraisChange.Execute;

end;

procedure TfCadastrosItens.ListBoxItem2Click(Sender: TObject);
begin
   inherited;
   tbDadosAdicionaisChange.Execute;
end;

procedure TfCadastrosItens.Rectangle1Click(Sender: TObject);
begin
   inherited;
   OpenDialog1.Execute;
   Rectangle1.Fill.Bitmap.Bitmap.LoadFromFile(OpenDialog1.FileName);
   Rectangle1.Hint := OpenDialog1.FileName;
end;

procedure TfCadastrosItens.btSalvarClick(Sender: TObject);
var
   I : TItens;
   ImgSalvar : TMemoryStream;
   sCodigo :String;
begin
   inherited;
   I := TItens.Create;
   I.Descricao   := edtDescricao.Text;
   I.CodigoBarra := edtCodigoBarra.Text;
   I.ValorVenda  := StrtoFloat(stringReplace(edtValorVenda.Text,'.','',[rfReplaceAll]));

   if TSpeedButton(Sender).Tag = 0 then begin
       I.Inserir;
       TSpeedButton(Sender).Tag := dmPrincipal.SqLiteConnection.ExecSQLScalar('select seq from sqlite_sequence WHERE name = "itens"');
   end else begin
       //atualizar
       I.ID := TSpeedButton(Sender).Tag;
       I.Inserir;
   end;

   if Rectangle1.Hint <> '' then begin
      dmPrincipal.QuerySelect.Open('SELECT Codigo,IDItem FROM itens_imagem WHERE IDItem =  '+ inttostr(TSpeedButton(Sender).Tag));
      dmPrincipal.QueryExecute.SQL.Clear;

      if dmPrincipal.QuerySelect.RecordCount > 0  then begin
         dmPrincipal.QueryExecute.SQL.Add('UPDATE itens_imagem SET Imagem=:Imagem WHERE Codigo=:Codigo');

         ImgSalvar := TMemoryStream.Create;
         Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(ImgSalvar);
         ImgSalvar.Seek(0,0);
         dmPrincipal.QueryExecute.ParamByName('Imagem').LoadFromStream( ImgSalvar, ftBlob);
         dmPrincipal.QueryExecute.ParamByName('Codigo').AsInteger := dmPrincipal.QuerySelect.FieldByName('Codigo').AsInteger;
         dmPrincipal.QueryExecute.ExecSQL;

      end else begin

         dmPrincipal.QueryExecute.SQL.Add('INSERT INTO itens_imagem (Imagem,IDITem) values(:Imagem ,:IDItem)');
         ImgSalvar := TMemoryStream.Create;
         Rectangle1.Fill.Bitmap.Bitmap.SaveToStream(ImgSalvar);
         ImgSalvar.Seek(0,0);
         dmPrincipal.QueryExecute.ParamByName('Imagem').LoadFromStream( ImgSalvar, ftBlob);
         dmPrincipal.QueryExecute.ParamByName('IDItem').AsInteger := TSpeedButton(Sender).Tag;
         dmPrincipal.QueryExecute.ExecSQL;
      end;
   end;

   Rectangle1.Tag := 0;

   fPrincipal.Rectangle6.Visible := False;
   fPrincipal.Rectangle7.Visible := False;

end;

procedure TfCadastrosItens.btCancelarClick(Sender: TObject);
var tDestroy :TListBoxItem;
begin
   inherited;
   tDestroy := TListBoxItem(fPrincipal.lbxCadastros.FindComponent('lbx_serv_'+Inttostr(TSpeedButton(Sender).Tag)));

   FreeAndNil(tDestroy)
end;

procedure TfCadastrosItens.EditEnter(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender as TEdit).Text  = '' then begin
       runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
       runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Linear);
       runlbl.AnimateFloat('Position.Y',-11,0.1, TAnimationType.InOut,TInterpolationType.Linear);
       runlbl.FontColor := TAlphaColors.Royalblue;
   end;
end;

procedure TfCadastrosItens.EditExit(Sender: TObject);
var runlbl :TLabel;
begin
   if (Sender as TEdit).Text  = '' then begin
      runlbl := TLabel((Sender as TEdit).FindComponent('Label'+(Sender as TEdit).Name));
      runlbl.AnimateFloat('Font.Size',12,0.1, TAnimationType.InOut,TInterpolationType.Linear);
      runlbl.AnimateFloat('Position.Y',-2,0.1, TAnimationType.InOut,TInterpolationType.Linear);
      runlbl.FontColor := TAlphaColors.Royalblue;
   end;
end;

end.
