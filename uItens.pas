unit uItens;

interface

uses FireDAC.Comp.Client,System.SysUtils,System.StrUtils,System.DateUtils;

type TItens = class
  private
    FCodigo: Integer;
    FDataExclusao: TDate;
    FID: Integer;
    FDataCadastro: TDate;
    FUsuario: Integer;
    FDescricao: String;
    FEstoqueMinimo: Real;
    FPorcentagemComissao: Real;
    FControleEstoque: Boolean;
    FAplicarPromocao: Boolean;
    FPorcentagemPromocao: Real;
    FValorVenda: Real;
    FEstoque: Real;
    FInterno: Boolean;
    FUnidadeMedida: Real;
    FValorCompra: Real;
    FComissao: Boolean;
    FCodigoBarra: String;
    FUnidade: String;
    FValorPromocao: Real;
    FPorcentagemLucro: Real;
    FTipo: String;
    FObservacoes: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDataExclusao(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetUsuario(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetAplicarPromocao(const Value: Boolean);
    procedure SetCodigoBarra(const Value: String);
    procedure SetComissao(const Value: Boolean);
    procedure SetControleEstoque(const Value: Boolean);
    procedure SetEstoque(const Value: Real);
    procedure SetEstoqueMinimo(const Value: Real);
    procedure SetInterno(const Value: Boolean);
    procedure SetObservacoes(const Value: String);
    procedure SetPorcentagemComissao(const Value: Real);
    procedure SetPorcentagemLucro(const Value: Real);
    procedure SetPorcentagemPromocao(const Value: Real);
    procedure SetTipo(const Value: String);
    procedure SetUnidade(const Value: String);
    procedure SetUnidadeMedida(const Value: Real);
    procedure SetValorCompra(const Value: Real);
    procedure SetValorPromocao(const Value: Real);
    procedure SetValorVenda(const Value: Real);

    public
      property ID :Integer read FID write SetID;
      property Codigo :Integer read FCodigo write SetCodigo;
      property DataCadastro :TDate read FDataCadastro write SetDataCadastro;
      property DataExclusao :TDate read FDataExclusao write SetDataExclusao;
      property Usuario :Integer read FUsuario write SetUsuario;
      property Descricao :String read FDescricao write SetDescricao;
      property CodigoBarra:String read FCodigoBarra write SetCodigoBarra;
      property Tipo:String read FTipo write SetTipo;
      property Estoque :Real read FEstoque write SetEstoque;
      property EstoqueMinimo :Real read FEstoqueMinimo write SetEstoqueMinimo;
      property ValorCompra  :Real read FValorCompra write SetValorCompra;
      property ValorVenda  :Real read FValorVenda write SetValorVenda;
      property PorcentagemLucro :Real read FPorcentagemLucro write SetPorcentagemLucro;
      property ValorPromocao :Real read FValorPromocao write SetValorPromocao;
      property PorcentagemPromocao :Real read FPorcentagemPromocao write SetPorcentagemPromocao;
      property AplicarPromocao  :Boolean read FAplicarPromocao write SetAplicarPromocao;
      property Interno :Boolean read FInterno write SetInterno;
      property Comissao :Boolean read FComissao write SetComissao;
      property PorcentagemComissao :Real read FPorcentagemComissao write SetPorcentagemComissao;
      property UnidadeMedida:Real read FUnidadeMedida write SetUnidadeMedida;
      property Unidade :String read FUnidade write SetUnidade;
      property Observacoes :String read FObservacoes write SetObservacoes;
      property ControleEstoque:Boolean read FControleEstoque write SetControleEstoque;

      procedure Inserir;
      procedure Item(ID :Integer);
end;

const
  ItensCampos : string = 'DataExclusao,Codigo,Usuario,Descricao,CodigoBarra,Tipo,Estoque,EstoqueMinimo,ValorCompra,ValorVenda,'+
              'PorcentagemLucro,ValorPromocao,PorcentagemPromocao,AplicarPromocao,Interno,Comissao,PorcentagemComissao,UnidadeMedida,'+
              'Unidade,Observacoes,ControleEstoque';

implementation

{ TItens }

uses dPrincipal, uCadastroItens;

procedure TItens.Inserir;
var tabItens :TFDQuery;
    sFields :String;
begin

   tabItens := TFDQuery.Create(nil);
   tabItens.Connection := dmPrincipal.SqLiteConnection;

   sFields := ItensCampos;

   tabItens.SQL.Clear;

   if  ID = 0 then

   tabItens.SQL.Add('INSERT INTO Itens ('+sFields+') VALUES (:'+StringReplace(sFields,',',',:',[rfReplaceAll])+')')

   else begin
      tabItens.SQL.Add('UPDATE Itens SET ' +
                       'DataExclusao =:DataExclusao,'+
                       'Codigo =:Codigo,'+
                       'Usuario =:Usuario ,'+
                       'Descricao =:Descricao,'+
                       'CodigoBarra =:CodigoBarra,'+
                       'Tipo =:Tipo,'+
                       'Estoque =:Estoque,'+
                       'EstoqueMinimo =:EstoqueMinimo,'+
                       'ValorCompra =:ValorCompra,'+
                       'ValorVenda =:ValorVenda,'+
                       'PorcentagemLucro =:PorcentagemLucro ,'+
                       'ValorPromocao =:ValorPromocao,'+
                       'PorcentagemPromocao =:PorcentagemPromocao,'+
                       'AplicarPromocao =:AplicarPromocao,'+
                       'Interno =:Interno,'+
                       'Comissao =:Comissao,'+
                       'PorcentagemComissao =:PorcentagemComissao,'+
                       'UnidadeMedida =:UnidadeMedida ,'+
                       'Unidade =:Unidade,'+
                       'Observacoes =:Observacoes ,'+
                       'ControleEstoque =:ControleEstoque WHERE ID =:ID ');
      tabItens.ParamByName('ID').Value      := ID;
   end;

   if DateToStr(DataExclusao) <> '30/12/1899' then
      tabItens.ParamByName('DataExclusao').AsDateTime := DataExclusao
   else
      tabItens.ParamByName('DataExclusao').AsString := '';

  // tabItens.ParamByName('DataCadastro').Value        := DataCadastro;
   tabItens.ParamByName('Codigo').Value              := Codigo;
   tabItens.ParamByName('Usuario').Value             := Usuario ;
   tabItens.ParamByName('Descricao').Value           := Descricao;
   tabItens.ParamByName('CodigoBarra').Value         := CodigoBarra;
   tabItens.ParamByName('Tipo').Value                := Tipo;
   tabItens.ParamByName('Estoque').Value             := Estoque;
   tabItens.ParamByName('EstoqueMinimo').Value       := EstoqueMinimo;
   tabItens.ParamByName('ValorCompra').Value         := ValorCompra;
   tabItens.ParamByName('ValorVenda').Value          := ValorVenda;
   tabItens.ParamByName('PorcentagemLucro').Value    := PorcentagemLucro ;
   tabItens.ParamByName('ValorPromocao').Value       := ValorPromocao;
   tabItens.ParamByName('PorcentagemPromocao').Value := PorcentagemPromocao;
   tabItens.ParamByName('AplicarPromocao').Value     := AplicarPromocao;
   tabItens.ParamByName('Interno').Value             := Interno;
   tabItens.ParamByName('Comissao').Value            := Comissao;
   tabItens.ParamByName('PorcentagemComissao').Value := PorcentagemComissao;
   tabItens.ParamByName('UnidadeMedida').Value       := UnidadeMedida ;
   tabItens.ParamByName('Unidade').Value             := Unidade;
   tabItens.ParamByName('Observacoes').Value         := Observacoes ;
   tabItens.ParamByName('ControleEstoque').Value     := ControleEstoque;
   tabItens.ExecSQL;
end;

procedure TItens.Item(ID: Integer);
var tabItens :TFDQuery;
begin
   tabItens := TFDQuery.Create(nil);
   tabItens.Connection := dmPrincipal.SqLiteConnection;
   tabItens.SQL.Clear;
   tabItens.Open('SELECT  '+ ItensCampos +
                 ' FROM itens WHERE ID ='+QuotedStr(IntToStr(ID)));
   if tabItens.RecordCount = 1 then begin
      if not tabItens.FieldByName('DataExclusao').isNull then
         DataExclusao        := tabItens.FieldByName('DataExclusao').Value;
      //Usuario             := tabItens.FieldByName('Usuario').Value;
      Descricao           := tabItens.FieldByName('Descricao').AsString;
      CodigoBarra         := tabItens.FieldByName('CodigoBarra').AsString;
//      Tipo                := tabItens.FieldByName('Tipo').Value;
{      Estoque             := tabItens.FieldByName('Estoque').Value;
      EstoqueMinimo       := tabItens.FieldByName('EstoqueMinimo').Value;
      ValorCompra         := tabItens.FieldByName('ValorCompra').Value;}
      ValorVenda          := tabItens.FieldByName('ValorVenda').Value;
{      PorcentagemLucro    := tabItens.FieldByName('PorcentagemLucro').Value;
      ValorPromocao       := tabItens.FieldByName('ValorPromocao').Value;
      PorcentagemPromocao := tabItens.FieldByName('PorcentagemPromocao').Value;
      AplicarPromocao     := tabItens.FieldByName('AplicarPromocao').Value;
      Interno             := tabItens.FieldByName('Interno').Value;
      Comissao            := tabItens.FieldByName('Comissao').Value;
      PorcentagemComissao := tabItens.FieldByName('PorcentagemComissao').Value;
      UnidadeMedida       := tabItens.FieldByName('UnidadeMedida').Value;
      Unidade             := tabItens.FieldByName('Unidade').Value;
      Observacoes         := tabItens.FieldByName('Observacoes').Value;
      ControleEstoque     := tabItens.FieldByName('ControleEstoque').Value;}
   end;

end;

procedure TItens.SetAplicarPromocao(const Value: Boolean);
begin
  FAplicarPromocao := Value;
end;

procedure TItens.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItens.SetCodigoBarra(const Value: String);
begin
  FCodigoBarra := Value;
end;

procedure TItens.SetComissao(const Value: Boolean);
begin
  FComissao := Value;
end;

procedure TItens.SetControleEstoque(const Value: Boolean);
begin
  FControleEstoque := Value;
end;

procedure TItens.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TItens.SetDataExclusao(const Value: TDate);
begin
  FDataExclusao := Value;
end;

procedure TItens.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TItens.SetEstoque(const Value: Real);
begin
  FEstoque := Value;
end;

procedure TItens.SetEstoqueMinimo(const Value: Real);
begin
  FEstoqueMinimo := Value;
end;

procedure TItens.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TItens.SetInterno(const Value: Boolean);
begin
  FInterno := Value;
end;

procedure TItens.SetObservacoes(const Value: String);
begin
  FObservacoes := Value;
end;

procedure TItens.SetPorcentagemComissao(const Value: Real);
begin
  FPorcentagemComissao := Value;
end;

procedure TItens.SetPorcentagemLucro(const Value: Real);
begin
  FPorcentagemLucro := Value;
end;

procedure TItens.SetPorcentagemPromocao(const Value: Real);
begin
  FPorcentagemPromocao := Value;
end;

procedure TItens.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TItens.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TItens.SetUnidadeMedida(const Value: Real);
begin
  FUnidadeMedida := Value;
end;

procedure TItens.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

procedure TItens.SetValorCompra(const Value: Real);
begin
  FValorCompra := Value;
end;

procedure TItens.SetValorPromocao(const Value: Real);
begin
  FValorPromocao := Value;
end;

procedure TItens.SetValorVenda(const Value: Real);
begin
  FValorVenda := Value;
end;

end.
