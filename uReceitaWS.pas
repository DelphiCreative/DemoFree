unit uReceitaWS;

interface

uses IdHTTP,System.JSON,System.Classes,System.StrUtils,System.SysUtils,
     FMX.Dialogs;

type
   TEmpresa = class
  private
    FDataSituacao: TDate;
    FCnpj: string;
    FEmail: string;
    FBairro: string;
    FCapitalSocial: real;
    FCep: string;
    FEfr: string;
    FDataAbertura: TDate;
    FNumero: string;
    FStatus: string;
    FSituacao: String;
    FComplemento: string;
    FUltimaAtualizacao: TDate;
    FDataSituacaoEspecial: TDate;
    FSituacaoEspecial: string;
    FNome: string;
    FCidade: string;
    FTipo: string;
    FMotivoSituacao: string;
    FNaturezaJuridica: string;
    FTelefone: string;
    FNomeFantasia: string;
    FEstado: string;
    FRua: string;
    procedure SetDataSituacao(const Value: TDate);
    procedure SetBairro(const Value: string);
    procedure SetCapitalSocial(const Value: real);
    procedure SetCep(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCnpj(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetDataAbertura(const Value: TDate);
    procedure SetDataSituacaoEspecial(const Value: TDate);
    procedure SetEfr(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetMotivoSituacao(const Value: string);
    procedure SetNaturezaJuridica(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeFantasia(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetRua(const Value: string);
    procedure SetSituacao(const Value: String);
    procedure SetSituacaoEspecial(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetUltimaAtualizacao(const Value: TDate);
   public
    property DataSituacao:TDate read FDataSituacao write SetDataSituacao;
    property Tipo :string read FTipo write SetTipo;
    property Nome :string read FNome write SetNome;
    property Situacao :String read FSituacao write SetSituacao;
    property Bairro :string read FBairro write SetBairro;
    property Rua :string read FRua write SetRua;
    property Numero :string read FNumero write SetNumero;
    property Cep :string read FCep write SetCep;
    property Cidade :string read FCidade write SetCidade;
    property Estado :string read FEstado write SetEstado;
    property DataAbertura :TDate read FDataAbertura write SetDataAbertura;
    property NaturezaJuridica :string read FNaturezaJuridica write SetNaturezaJuridica;
    property NomeFantasia :string read FNomeFantasia write SetNomeFantasia;
    property Cnpj :string read FCnpj write SetCnpj;
    property UltimaAtualizacao :TDate read FUltimaAtualizacao write SetUltimaAtualizacao;
    property Status :string read FStatus write SetStatus;
    property Complemento :string read FComplemento write SetComplemento;
    property Email  :string read FEmail write SetEmail;
    property Telefone  :string read FTelefone write SetTelefone;
    property Efr  :string read FEfr write SetEfr;
    property MotivoSituacao  :string read FMotivoSituacao write SetMotivoSituacao;
    property SituacaoEspecial  :string read FSituacaoEspecial write SetSituacaoEspecial;
    property DataSituacaoEspecial :TDate read FDataSituacaoEspecial write SetDataSituacaoEspecial;
    property CapitalSocial  :real read FCapitalSocial write SetCapitalSocial;

    procedure Consultar(CNPJ :string);
   end;

implementation

{ TEmpresa }

uses uFuncoes;

procedure TEmpresa.Consultar(CNPJ: string);
begin

end;

procedure TEmpresa.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEmpresa.SetCapitalSocial(const Value: real);
begin
  FCapitalSocial := Value;
end;

procedure TEmpresa.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TEmpresa.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TEmpresa.SetCnpj(const Value: string);
begin
  FCnpj := Value;
end;

procedure TEmpresa.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TEmpresa.SetDataAbertura(const Value: TDate);
begin
  FDataAbertura := Value;
end;

procedure TEmpresa.SetDataSituacao(const Value: TDate);
begin
  FDataSituacao := Value;
end;

procedure TEmpresa.SetDataSituacaoEspecial(const Value: TDate);
begin
  FDataSituacaoEspecial := Value;
end;

procedure TEmpresa.SetEfr(const Value: string);
begin
  FEfr := Value;
end;

procedure TEmpresa.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TEmpresa.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TEmpresa.SetMotivoSituacao(const Value: string);
begin
  FMotivoSituacao := Value;
end;

procedure TEmpresa.SetNaturezaJuridica(const Value: string);
begin
  FNaturezaJuridica := Value;
end;

procedure TEmpresa.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TEmpresa.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TEmpresa.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEmpresa.SetRua(const Value: string);
begin
  FRua := Value;
end;

procedure TEmpresa.SetSituacao(const Value: String);
begin
  FSituacao := Value;
end;

procedure TEmpresa.SetSituacaoEspecial(const Value: string);
begin
  FSituacaoEspecial := Value;
end;

procedure TEmpresa.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TEmpresa.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TEmpresa.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TEmpresa.SetUltimaAtualizacao(const Value: TDate);
begin
  FUltimaAtualizacao := Value;
end;

end.
