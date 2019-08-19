unit uCepWS;

interface

uses
  IdHTTP,System.JSON,System.Classes,System.StrUtils,System.SysUtils,
  IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP,
  FMX.Dialogs;

type
  TCep = class
  private
    FLogradouro: String;
    FIbge: Integer;
    FBairro: String;
    FUf: String;
    FCep: String;
    FLocalidade: String;
    FComplemento: String;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetIbge(const Value: Integer);
    procedure SetLocalidade(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetUf(const Value: String);
  published

   property Cep: String read FCep write SetCep;
   property Logradouro: String read FLogradouro write SetLogradouro;
   property Complemento: String read FComplemento write SetComplemento;
   property Bairro: String read FBairro write SetBairro;
   property Localidade: String read FLocalidade write SetLocalidade;
   property Uf: String read FUf write SetUf;
   property Ibge :Integer read FIbge write SetIbge;
   public
   procedure Consultar(Cep :String);
  end;

implementation



{ TCep }

uses uFuncoes;

procedure TCep.Consultar(Cep: String);
var
   HTTP: TIdHTTP;
   JStream  : TStringStream;
   JSON : TJSONObject;
begin

   JStream          := TStringStream.Create('');
   HTTP                := TIdHTTP.Create(nil);
   try
      HTTP.Get('http://viacep.com.br/ws/'+cep+'/json/', JStream);
   except
      FreeAndNil(HTTP);
      FreeAndNil(JStream);
      Exit;
   end;

   JSON := nil;
   try
      try
        JSON := TJSONObject.ParseJSONValue(TEncoding.ANSI.GetBytes(JStream.DataString), 0) as TJSONObject;
        Bairro      := JSON.GetValue('bairro').Value;
        Logradouro  := JSON.GetValue('logradouro').Value;
        Cep         := Desformata(JSON.GetValue('cep').Value);
        Localidade  := JSON.GetValue('localidade').Value;
        Uf          := JSON.GetValue('uf').Value;
        Complemento := JSON.GetValue('complemento').Value;
      except
         on E:Exception do begin
	          showmessage(E.Message);
         end;
      end;
   finally
      FreeAndNil(JSON);
      FreeAndNil(HTTP);
      FreeAndNil(JStream);
   end;

end;

procedure TCep.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCep.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCep.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TCep.SetIbge(const Value: Integer);
begin
  FIbge := Value;
end;

procedure TCep.SetLocalidade(const Value: String);
begin
  FLocalidade := Value;
end;

procedure TCep.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TCep.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
