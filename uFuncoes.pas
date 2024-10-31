unit uFuncoes;

interface

uses
  FMX.Dialogs,
     Data.DB,
     System.JSON, System.RegularExpressions,
     System.Notification,
     System.StrUtils, System.SysUtils,System.Classes,
     IdBaseComponent, IdComponent,
     IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
     IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
     IdSMTPBase, IdSMTP,
     IdHTTP,IdMessage, IdText, IdAttachmentFile,
     FireDAC.Comp.Client,
     FMX.DateTimeCtrls, FMX.Graphics,
     FMX.ComboEdit, FMX.ListBox,
     FMX.StdCtrls,FMX.Types,System.UITypes, FMX.Edit,
     FMX.Objects;

type
  THelperObject = class Helper for TFmxObject
    procedure Caption(Desc :String);
    procedure Texto(Texto :String);
end;


type TShapeHelper = class Helper for TShape
   private

   public
      procedure LoadImagem(IDContato :string);
      procedure LoadItem(IDItem :Integer);
   end;


procedure Msg;

function ValidaCPF(CPF: string): Boolean;

function ValidaCNPJ(Cnpj: string): Boolean;
function Desformata(texto: String): String;

procedure Executar(Query :String);

function UsuariosAguardandoLiberacao : string;
function VerificarProfissionalUsuarios(IDProfissional :String) : Boolean;

procedure BuscaAtendimento(ID:String);

function ChavePrimaria(Tabela: String): String;

function Decimal(valor: String): String;

procedure Notificacoes(Nome, Titulo, MsgAlerta: String);
function Iniciais(Nome :String):String;
function ValorAtendimento(IDAtendimento :integer):String;
function TestarLancamento(IDAtendimento :integer):Integer;
function ContasAguardando(IDContato :Integer) :Real;
procedure ContasAnual(Ano,Tipo,Filtro : String);

implementation

uses dPrincipal;

procedure Msg;
begin
  Showmessage('teste');

end;

function ChavePrimaria(Tabela: String): String;
var
  sCodigo :Integer;
begin

  sCodigo := dmPrincipal.SqLiteConnection.ExecSQLScalar('select seq from sqlite_sequence WHERE name = "'+Tabela+'"');
  Result := inttostr(sCodigo + 1);
end;


function Decimal(valor: String): String;
begin
  Result := valor;
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  Result := StringReplace(Result, 'R', '', [rfReplaceAll]);
  Result := StringReplace(Result, '$', '', [rfReplaceAll]);
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  //Result := StringReplace(Result, '.', ',', [rfReplaceAll]);
end;

procedure Executar(Query :String);
begin
  try
    dmPrincipal.SqLiteConnection.ExecSQL(Query);

  except

  end;
end;

function UsuariosAguardandoLiberacao : string;
begin
   result := dmPrincipal.SqLiteConnection.ExecSQLScalar('select Count(*) from usuarios WHERE IDContato is null');
end;

function VerificarProfissionalUsuarios(IDProfissional :String) : Boolean;
var varCount :Integer;
begin
   varCount := dmPrincipal.SqLiteConnection.ExecSQLScalar('select Count(*) from usuarios WHERE IDContato ='+IDProfissional);
   if varCount = 0 then
      Result := False
   else
      Result := True;
end;

procedure BuscaAtendimento(ID:String);
begin
//  showmessage(ID);
  dmPrincipal.tabAtendimentos.Open('SELECT  atendimentos.*,tipos_atendimentos.Descricao DescricaoAtendimento,tarefas.Descricao Tarefa from atendimentos '+
                                   'inner join tipos_atendimentos on tipos_atendimentos.Codigo = atendimentos.TipoAtendimento '+
                                   'inner join tarefas on tarefas.Codigo = tipos_atendimentos.CodigoTarefa '+
                                   'WHERE atendimentos.codigo ='+QuotedStr(ID));

end;
{ TShapeHelper }

procedure TShapeHelper.LoadImagem(IDContato :string);
var Img :TStream;
    lbl :TLabel;
    I :Integer;
begin
   Self.Fill.Bitmap.Bitmap := nil;
   dmPrincipal.tabImagem.Open('SELECT imagem FROM contatos_imagem WHERE contatos_imagem.IDContato = '+InttoStr(Self.Tag));
   if dmPrincipal.tabImagem.recordcount > 0 then begin

      Img := TMemoryStream.Create;
      if not dmPrincipal.tabImagem.Fields[0].IsNull then begin
         Img := dmPrincipal.tabImagem.CreateBlobStream(
                dmPrincipal.tabImagem.FieldByName('Imagem'),TBlobStreamMode.bmRead
                 );
         Self.Fill.Kind := TBrushKind.Bitmap;
         Self.Fill.Bitmap.Bitmap.LoadFromStream(Img);

         for I := 0 to Self.ComponentCount -1 do begin
            if (Self.Components[I] is TLabel)then
               (Self.Components[I] as TLabel).Text := '';
         end;
      end;

   end else begin
     Self.Fill.Kind := TBrushKind.Solid;
     lbl :=TLabel.Create(Self);
     lbl.Parent := Self;

     lbl.Text := Iniciais(IDContato);

     lbl.TextSettings.VertAlign := TTextAlign.Center;
     lbl.TextSettings.HorzAlign := TTextAlign.Center;
     lbl.StyledSettings := [];
     lbl.Align := TAlignLayout.Client;
     if Self.Height  > 50 then
         lbl.TextSettings.Font.Size := 30;

     lbl.TextSettings.FontColor := TAlphaColors.White;
     lbl.BringToFront;
     Self.Fill.Color := TAlphaColors.Steelblue;
   end;

end;


function ValidaCPF(CPF: string): Boolean;
var
  dig10, dig11: string;
  s, I, r, peso: Integer;
begin
  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
    (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
    (CPF = '99999999999') or (Length(CPF) <> 11)) then
  begin
    ValidaCPF := False;
    Exit;
  end;

  try
    s := 0;
    peso := 10;
    for I := 1 to 9 do
    begin
      s := s + (StrToInt(CPF[I]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10);

    s := 0;
    peso := 11;
    for I := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[I]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);
    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      ValidaCPF := True
    else
      ValidaCPF := False;
  except
    ValidaCPF := False
  end;
end;

function ValidaCNPJ(Cnpj: string): Boolean;
var
  dig13, dig14: string;
  sm, I, r, peso: Integer;
begin
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((Cnpj = '00000000000000') or (Cnpj = '11111111111111') or
    (Cnpj = '22222222222222') or (Cnpj = '33333333333333') or
    (Cnpj = '44444444444444') or (Cnpj = '55555555555555') or
    (Cnpj = '66666666666666') or (Cnpj = '77777777777777') or
    (Cnpj = '88888888888888') or (Cnpj = '99999999999999') or
    (Length(Cnpj) <> 14)) then
  begin
    ValidaCNPJ := False;
    Exit;
  end;

  try
    sm := 0;
    peso := 2;
    for I := 12 downto 1 do
    begin
      sm := sm + (StrToInt(Cnpj[I]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13);
    sm := 0;
    peso := 2;
    for I := 13 downto 1 do
    begin
      sm := sm + (StrToInt(Cnpj[I]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);
    if ((dig13 = Cnpj[13]) and (dig14 = Cnpj[14])) then
      ValidaCNPJ := True
    else
      ValidaCNPJ := False;
  except
    ValidaCNPJ := False
  end;
end;

function Desformata(texto: String): String;
begin
  Result := texto;
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll]);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll]);
  Result := StringReplace(Result, 'XX', '', [rfReplaceAll]);
end;

procedure TShapeHelper.LoadItem(IDItem: Integer);
var Img :TStream;
begin
   Self.Fill.Bitmap.Bitmap := nil;
   dmPrincipal.QuerySelect.Open('SELECT imagem FROM itens_imagem WHERE itens_imagem.IDItem = '+InttoStr(Self.Tag));
   if dmPrincipal.QuerySelect.recordcount > 0 then begin
      Img := TMemoryStream.Create;
      if not dmPrincipal.QuerySelect.Fields[0].IsNull then begin
         Img := dmPrincipal.QuerySelect.CreateBlobStream(
                dmPrincipal.QuerySelect.FieldByName('Imagem'),TBlobStreamMode.bmRead
                 );
         Self.Fill.Bitmap.Bitmap.LoadFromStream(Img);
      end;
   end;

end;

{ THelperObject }

procedure THelperObject.Caption(Desc: String);
var
   lbl :TLabel;
   Line :TLine;
begin

   if (Self is TEdit) then begin
      TEdit(Self).StyleLookup := 'transparentedit';
      lbl := TLabel.Create(Self);

      lbl.Text := TEdit(Self).Hint;

      lbl.Name := 'Label'+Self.Name;
      lbl.StyledSettings := [TStyledSetting.Family];
      if  (Self is TEdit) then begin
         if (Self as TEdit).Text <> '' then begin
            lbl.Position.X := 0;
            lbl.Position.Y := -11;
            lbl.TextSettings.Font.Size := 9;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
         end else begin
            lbl.Position.X := 0;
            lbl.Position.Y := -2;
            lbl.TextSettings.Font.Size := 12;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
         end;
      end;
      lbl.Parent := Self;

      Line := TLine.Create(Self);
      Line.Stroke.Color := TAlphaColors.Steelblue;
      Line.LineType     := TLineType.Bottom;
      Line.Height       := 1;
      Line.Position.Y   := TEdit(Self).Height; //-8;
      Line.Width :=  TEdit(Self).Width;
      Line.Parent       := Self;

   end else  if (Self is TComboEdit) then begin
      TComboEdit(Self).StyleLookup := 'cbxCategoriaStyle1';
      lbl := TLabel.Create(Self);

      lbl.Text := TComboEdit(Self).Hint;

      lbl.Name := 'Label'+Self.Name;
      lbl.StyledSettings := [TStyledSetting.Family];
      if  (Self is TComboEdit) then begin
//         if (Self as TComboEdit).Text <> '' then begin
            lbl.Position.X := 0;
            lbl.Position.Y := -11;
            lbl.TextSettings.Font.Size := 9;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
//         end else begin
//            lbl.Position.X := 0;
//            lbl.Position.Y := -2;
//            lbl.TextSettings.Font.Size := 12;
//            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
//         end;
      end;
      lbl.Parent := Self;

   end else  if (Self is TDateEdit) then begin
      TDateEdit(Self).StyleLookup := 'DateEdit1Style1';
      lbl := TLabel.Create(Self);

      lbl.Text := TDateEdit(Self).Hint;

      lbl.Name := 'Label'+Self.Name;
      lbl.StyledSettings := [TStyledSetting.Family];
      if  (Self is TDateEdit) then begin
//         if (Self as TComboEdit).Text <> '' then begin
            lbl.Position.X := 0;
            lbl.Position.Y := -11;
            lbl.TextSettings.Font.Size := 9;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
//         end else begin
//            lbl.Position.X := 0;
//            lbl.Position.Y := -2;
//            lbl.TextSettings.Font.Size := 12;
//            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
//         end;
      end;
      lbl.Parent := Self;

      Line := TLine.Create(Self);
      Line.Stroke.Color := TAlphaColors.Steelblue;
      Line.LineType     := TLineType.Bottom;
      Line.Height       := 1;
      Line.Position.Y   := 21; //-8;
      Line.Width :=  TDateEdit(Self).Width;
      Line.Parent       := Self;
   end else if (Self is TComboBox) then begin
      //TComboBox(Self).StyleLookup := 'transparentedit';
      lbl := TLabel.Create(Self);

      lbl.Text := TEdit(Self).Hint;

      lbl.Name := 'Label'+Self.Name;
      lbl.StyledSettings := [TStyledSetting.Family];
      if  (Self is TComboBox) then begin
         if (Self as TComboBox).ItemIndex <> -1 then begin
            lbl.Position.X := 0;
            lbl.Position.Y := -11;
            lbl.TextSettings.Font.Size := 9;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
         end else begin
            lbl.Position.X := 0;
            lbl.Position.Y := -2;
            lbl.TextSettings.Font.Size := 12;
            lbl.TextSettings.FontColor := TAlphaColors.Steelblue;
         end;
      end;
      lbl.Parent := Self;

//      Line := TLine.Create(Self);
//      Line.Stroke.Color := TAlphaColors.Steelblue;
//      Line.LineType     := TLineType.Bottom;
//      Line.Height       := 1;
//      Line.Position.Y   := 21; //-8;
//      Line.Width :=  TEdit(Self).Width;
//      Line.Parent       := Self;
   end

end;

procedure THelperObject.Texto(Texto: String);
begin
   if (Self is TEdit) then begin
      (Self as TEdit).SetFocus;
      (Self as TEdit).text  := Texto;
   end;
end;

procedure Notificacoes(Nome, Titulo, MsgAlerta: String);
var
  MyNotification: TNotification;
  Alertas: TNotificationCenter;
begin
  Alertas := TNotificationCenter.Create(nil);
  MyNotification := Alertas.CreateNotification;
  try
    MyNotification.Name := Nome;
    MyNotification.Title := Titulo;
    MyNotification.AlertBody := MsgAlerta;;

    Alertas.PresentNotification(MyNotification);
  finally
    // MyNotification.Free;
  end;

end;

function Iniciais(nome :string):String;
var Ini : TArray<String>;
begin
   nome := AnsiUpperCase(trim(nome));

   if TRegEx.Matches(nome,' ').Count > 0 then begin
      ini := TRegEx.Split(nome,' ');
      result :=(LeftStr(nome,1) + LeftStr(ini[TRegEx.Matches(nome,' ').Count],1))
   end else if nome <> '' then
       result := LeftStr(nome,1)// + LeftStr(nome,1)
   else Result :=  'DC';
 end;

function ValorAtendimento(IDAtendimento :integer):String;
begin

  result := dmPrincipal.SqLiteConnection.ExecSQLScalar('select sum (valorunitario*quantidade) valor from atendimentos_det WHEre CodigoAtendimento ='+inttostr(IDAtendimento));

end;

function TestarLancamento(IDAtendimento :integer):Integer;
begin
  result := dmPrincipal.SqLiteConnection.ExecSQLScalar('select count(*) from contas where IDAtendimento ='+inttostr(IDAtendimento));
end;

function ContasAguardando(IDContato :Integer) :Real;
begin
  result := dmPrincipal.SqLiteConnection.ExecSQLScalar('select group_concat(ID) ID, SUM(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta from contas WHERE DataLiquidacao = "1899-12-30" AND status = "A"');
//  result := dmPrincipal.SqLiteConnection.ExecSQLScalar('select group_concat(ID) ID, SUM(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta from contas WHERE DataLiquidacao = "1899-12-30" AND status = "A"');
end;

procedure ContasAnual(Ano,Tipo,Filtro : String);
begin
   dmPrincipal.tabMovimentos.Open('select ID,DataVencimento,strftime("%m", DataVencimento)*1 Mes, '+
                                  'sum(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0) '+
                                  'FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta, '+
                                  '(select descricao from contas_categorias where contas_categorias.id = contas.IDCategoria) conta, '+
                                  'DataLiquidacao, observacoes,status from contas WHERE DataLiquidacao = "1899-12-30" '+
                                  'and strftime("%Y", DataVencimento) = "'+ano+'" AND tipoConta = "'+Tipo+'"'+
                                  'group by strftime("%m-%Y", DataVencimento) '+
                                  'order by DataVencimento desc ');


end;

end.
