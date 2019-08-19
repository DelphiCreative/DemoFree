unit uContasLiquidadas;

interface

uses FireDAC.Comp.Client,System.SysUtils,System.StrUtils,System.DateUtils;

type TContasLiquidadas = class
  private
    FIDConta: Integer;
    FTipoPagamento: String;
    FDataPagamento: TDate;
    FValorPago: Real;
    FIDTipoPagamento: Integer;
    FUsuario: String;
    FObservacoes: String;
    procedure SetDataPagamento(const Value: TDate);
    procedure SetIDConta(const Value: Integer);
    procedure SetIDTipoPagamento(const Value: Integer);
    procedure SetTipoPagamento(const Value: String);
    procedure SetValorPago(const Value: Real);
    procedure SetUsuario(const Value: String);
    procedure SetObservacoes(const Value: String);
  published
    property IDConta :Integer read FIDConta write SetIDConta;
    property IDTipoPagamento :Integer read FIDTipoPagamento write SetIDTipoPagamento;
    property TipoPagamento :String read FTipoPagamento write SetTipoPagamento;
    property ValorPago :Real read FValorPago write SetValorPago;
    property DataPagamento :TDate read FDataPagamento write SetDataPagamento;
    property Usuario :String read FUsuario write SetUsuario;
    property Observacoes:String read FObservacoes write SetObservacoes;
    procedure Inserir;
end;

const
  ContasLiquidadasCampos : string = 'IDConta,Usuario,IDTipoPagamento,'+
                                    'ValorPago,DataPagamento,Observacoes';


implementation

{ TContasLiquidadas }

uses dPrincipal, uFuncoes;

procedure TContasLiquidadas.Inserir;
var tabContas :TFDQuery;
    sFields :String;
begin

   tabContas := TFDQuery.Create(nil);
   tabContas.Connection := dmPrincipal.SqLiteConnection;

   if IDTipoPagamento = 0 then begin
      tabContas.Open('SELECT ID,Descricao FROM tipos_pagamentos WHERE Descricao ='+QuotedStr(Trim(TipoPagamento)));
      if tabContas.RecordCount = 0 then begin
         IDTipoPagamento := StrToInt(ChavePrimaria('tipos_pagamentos'));
         dmPrincipal.sqliteConnection.ExecSQL('INSERT INTO tipos_pagamentos '+
                                             ' (Descricao) VALUES ('+QuotedStr(Trim(TipoPagamento))+')');
      end else IDTipoPagamento := tabContas.Fields[0].AsInteger;
   end;

   sFields := ContasLiquidadasCampos;

   tabContas.SQL.Clear;

   tabContas.SQL.Add('INSERT INTO contas_liquidadas ('+sFields+') VALUES (:'+StringReplace(sFields,',',',:',[rfReplaceAll])+')');

   tabContas.ParamByName('Usuario').value := Usuario;
   tabContas.ParamByName('IDConta').value := IDConta;
   tabContas.ParamByName('IDTipoPagamento').value := IDTipoPagamento;
   tabContas.ParamByName('ValorPago').value := ValorPago;
   tabContas.ParamByName('DataPagamento').AsDate := DataPagamento;
   tabContas.ParamByName('Observacoes').value := Observacoes;

   tabContas.ExecSQL;

   FreeAndNil(tabContas);

end;

procedure TContasLiquidadas.SetDataPagamento(const Value: TDate);
begin
  FDataPagamento := Value;
end;

procedure TContasLiquidadas.SetIDConta(const Value: Integer);
begin
  FIDConta := Value;
end;

procedure TContasLiquidadas.SetIDTipoPagamento(const Value: Integer);
begin
  FIDTipoPagamento := Value;
end;

procedure TContasLiquidadas.SetObservacoes(const Value: String);
begin
  FObservacoes := Value;
end;

procedure TContasLiquidadas.SetTipoPagamento(const Value: String);
begin
  FTipoPagamento := Value;
end;

procedure TContasLiquidadas.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

procedure TContasLiquidadas.SetValorPago(const Value: Real);
begin
  FValorPago := Value;
end;

end.
