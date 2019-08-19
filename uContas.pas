unit uContas;

interface

uses FireDAC.Comp.Client,System.SysUtils,System.StrUtils,System.DateUtils;

type
   TContas = class
  private
    FID: Integer;
    FTipoCobranca: String;
    FIDContato: Integer;
    FCodigoChave: Integer;
    FDataVencimento: TDate;
    FDataLiquidacao: TDate;
    FIDAtendimento: Integer;
    FDataExclusao: TDate;
    FTipoConta: String;
    FDataEmissao: TDate;
    FCodigoBarra: String;
    FDataCadastro: TDate;
    FValorConta: Real;
    FUsuario: Integer;
    FObservacoes: String;
    FIDCategoria: Integer;
    FNumeroDocumento: String;
    FParcela: String;
    FCategoria: String;
    FIDs: String;
    FSoma: Real;
    procedure SetCodigoBarra(const Value: String);
    procedure SetCodigoChave(const Value: Integer);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDataEmissao(const Value: TDate);
    procedure SetDataExclusao(const Value: TDate);
    procedure SetDataLiquidacao(const Value: TDate);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetIDAtendimento(const Value: Integer);
    procedure SetIDCategoria(const Value: Integer);
    procedure SetIDContato(const Value: Integer);
    procedure SetNumeroDocumento(const Value: String);
    procedure SetObservacoes(const Value: String);
    procedure SetParcela(const Value: String);
    procedure SetTipoCobranca(const Value: String);
    procedure SetTipoConta(const Value: String);
    procedure SetUsuario(const Value: Integer);
    procedure SetValorConta(const Value: Real);
    procedure SetID(const Value: Integer);
    procedure SetCategoria(const Value: String);
    procedure SetIDs(const Value: String);
    procedure SetSoma(const Value: Real);
    public
    property ID :Integer read FID write SetID;
    property DataCadastro :TDate read FDataCadastro write SetDataCadastro;
    property DataExclusao :TDate read FDataExclusao write SetDataExclusao;
    property Usuario :Integer read FUsuario write SetUsuario;
    property IDContato :Integer read FIDContato write SetIDContato;
    property Parcela   :String read FParcela write SetParcela;
    property TipoCobranca :String read FTipoCobranca write SetTipoCobranca;
    property NumeroDocumento :String read FNumeroDocumento write SetNumeroDocumento;
    property CodigoBarra :String read FCodigoBarra write SetCodigoBarra;
    property ValorConta :Real read FValorConta write SetValorConta;
    property DataLiquidacao :TDate read FDataLiquidacao write SetDataLiquidacao;
    property DataEmissao :TDate read FDataEmissao write SetDataEmissao;
    property DataVencimento :TDate read FDataVencimento write SetDataVencimento;
    property IDAtendimento :Integer read FIDAtendimento write SetIDAtendimento;
    property CodigoChave :Integer read FCodigoChave write SetCodigoChave;
    property IDCategoria :Integer read FIDCategoria write SetIDCategoria;
    property Categoria :String read FCategoria write SetCategoria;
    property TipoConta :String read FTipoConta write SetTipoConta;
    property Observacoes :String read FObservacoes write SetObservacoes;

    property Soma :Real read FSoma write SetSoma;
    property IDs  :String read FIDs write SetIDs;

    procedure ContasAguardando(Filtro :String);
    procedure Inserir;

   end;

const
  ContasCampos : string = 'DataExclusao,Usuario,IDContato,Parcela,TipoCobranca,NumeroDocumento,CodigoBarra,'+
                          'ValorConta,DataLiquidacao,DataEmissao,DataVencimento,IDAtendimento,CodigoChave,'+
                          'IDCategoria,TipoConta,Observacoes';

implementation

{ TContas }

uses dPrincipal, uFuncoes;

procedure TContas.ContasAguardando(Filtro: String);
var tabContas :TFDQuery;
begin
   tabContas := TFDQuery.Create(nil);
   tabContas.Connection := dmPrincipal.SqLiteConnection;
   tabContas.Open('select group_concat(ID) ID, SUM(ValorConta-(SELECT Coalesce(SUM(contas_liquidadas.ValorPago),0)'+
                  ' FROM contas_liquidadas  WHERE contas_liquidadas.IDConta = contas.ID)) ValorConta from contas '+
                  ' WHERE DataLiquidacao = "1899-12-30" AND status = "A" '+Filtro);

   IDs := tabContas.Fields[0].AsString;

   if not tabContas.Fields[1].IsNull then
      Soma := tabContas.Fields[1].AsFloat
   else Soma := 0;

   FreeAndNil(tabContas);

end;

procedure TContas.Inserir;
var tabContas :TFDQuery;
    sFields :String;
begin

   tabContas := TFDQuery.Create(nil);
   tabContas.Connection := dmPrincipal.SqLiteConnection;

   if IDCategoria = 0 then begin
      dmPrincipal.QuerySelect.Open('SELECT ID,Descricao FROM contas_categorias WHERE Descricao ='+QuotedStr(Trim(Categoria)));
      if dmPrincipal.QuerySelect.RecordCount = 0 then begin
         IDCategoria := StrToInt(ChavePrimaria('contas_categorias'));
         dmPrincipal.sqliteConnection.ExecSQL('INSERT INTO contas_categorias '+
                                             ' (Descricao) VALUES ('+QuotedStr(Trim(Categoria))+')');
      end else IDCategoria := dmPrincipal.QuerySelect.Fields[0].AsInteger;
   end;

   sFields := ContasCampos;

   tabContas.SQL.Clear;

   tabContas.SQL.Add('INSERT INTO Contas ('+sFields+') VALUES (:'+StringReplace(sFields,',',',:',[rfReplaceAll])+')');

   tabContas.ParamByName('DataExclusao').value := 0;
   tabContas.ParamByName('Usuario').value := Usuario;
   tabContas.ParamByName('IDContato').value := IDContato;
   tabContas.ParamByName('Parcela').value := Parcela;
   tabContas.ParamByName('TipoCobranca').value := TipoCobranca;
   tabContas.ParamByName('NumeroDocumento').value := NumeroDocumento;
   tabContas.ParamByName('CodigoBarra').value := CodigoBarra;
   tabContas.ParamByName('ValorConta').value := ValorConta;
   tabContas.ParamByName('DataLiquidacao').AsDate := DataLiquidacao;
   tabContas.ParamByName('DataEmissao').AsDate := DataEmissao;
   tabContas.ParamByName('DataVencimento').AsDate := DataVencimento;
   tabContas.ParamByName('IDAtendimento').value := IDAtendimento;
   tabContas.ParamByName('CodigoChave').value := CodigoChave;
   tabContas.ParamByName('IDCategoria').value := IDCategoria;
   tabContas.ParamByName('TipoConta').value := TipoConta;
   tabContas.ParamByName('Observacoes').value := Observacoes;

   tabContas.ExecSQL;

   FreeAndNil(tabContas);
end;

procedure TContas.SetCategoria(const Value: String);
begin
  FCategoria := Value;
end;

procedure TContas.SetCodigoBarra(const Value: String);
begin
  FCodigoBarra := Value;
end;

procedure TContas.SetCodigoChave(const Value: Integer);
begin
  FCodigoChave := Value;
end;

procedure TContas.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TContas.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TContas.SetDataExclusao(const Value: TDate);
begin
  FDataExclusao := Value;
end;

procedure TContas.SetDataLiquidacao(const Value: TDate);
begin
  FDataLiquidacao := Value;
end;

procedure TContas.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TContas.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TContas.SetIDAtendimento(const Value: Integer);
begin
  FIDAtendimento := Value;
end;

procedure TContas.SetIDCategoria(const Value: Integer);
begin
  FIDCategoria := Value;
end;

procedure TContas.SetIDContato(const Value: Integer);
begin
  FIDContato := Value;
end;

procedure TContas.SetIDs(const Value: String);
begin
  FIDs := Value;
end;

procedure TContas.SetNumeroDocumento(const Value: String);
begin
  FNumeroDocumento := Value;
end;

procedure TContas.SetObservacoes(const Value: String);
begin
  FObservacoes := Value;
end;

procedure TContas.SetParcela(const Value: String);
begin
  FParcela := Value;
end;

procedure TContas.SetSoma(const Value: Real);
begin
  FSoma := Value;
end;

procedure TContas.SetTipoCobranca(const Value: String);
begin
  FTipoCobranca := Value;
end;

procedure TContas.SetTipoConta(const Value: String);
begin
  FTipoConta := Value;
end;

procedure TContas.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

procedure TContas.SetValorConta(const Value: Real);
begin
  FValorConta := Value;
end;

end.
