unit uContatos;

interface

uses FireDAC.Comp.Client,System.SysUtils,System.StrUtils,System.DateUtils;

type
   TContatos = class
    private
    FBairro: string;
    FUsuarioSistema: Boolean;
    FProfissional: Boolean;
    FCliente: Boolean;
    FDataNasc: TDate;
    FCodigo: Integer;
    FDataExclusao: TDate;
    FCep: string;
    FCpfCnpj: string;
    FID: Integer;
    FNumero: string;
    FIeRg: string;
    FTelefone2: string;
    FFornecedor: Boolean;
    FHomePage: string;
    FComplemento: string;
    FDataCadastro: TDate;
    FTelefone1: string;
    FSexo: string;
    FNome: string;
    FUsuario: Integer;
    FEmail2: string;
    FCidade: string;
    FGrupo: Integer;
    FEstado: string;
    FNomeFantasia: string;
    FEmail1: string;
    FObservacoes: string;
    FRua: string;
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCliente(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetComplemento(const Value: string);
    procedure SetCpfCnpj(const Value: string);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDataExclusao(const Value: TDate);
    procedure SetDataNasc(const Value: TDate);
    procedure SetEmail1(const Value: string);
    procedure SetEmail2(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetFornecedor(const Value: Boolean);
    procedure SetGrupo(const Value: Integer);
    procedure SetHomePage(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetIeRg(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeFantasia(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetObservacoes(const Value: string);
    procedure SetProfissional(const Value: Boolean);
    procedure SetRua(const Value: string);
    procedure SetSexo(const Value: string);
    procedure SetTelefone1(const Value: string);
    procedure SetTelefone2(const Value: string);
    procedure SetUsuario(const Value: Integer);
    procedure SetUsuarioSistema(const Value: Boolean);
    protected

    public
      property ID :Integer read FID write SetID;
      property Codigo :Integer read FCodigo write SetCodigo;
      property DataCadastro :TDate read FDataCadastro write SetDataCadastro;
      property DataExclusao :TDate read FDataExclusao write SetDataExclusao;
      property Usuario :Integer read FUsuario write SetUsuario;
      property Nome	:string read FNome write SetNome;
      property NomeFantasia :string read FNomeFantasia write SetNomeFantasia;
      property CpfCnpj :string read FCpfCnpj write SetCpfCnpj;
      property IeRg:string read FIeRg write SetIeRg;
      property Rua:string read FRua write SetRua;
      property Numero:string read FNumero write SetNumero;
      property Bairro:string read FBairro write SetBairro;
      property Cep:string read FCep write SetCep;
      property Cidade:string read FCidade write SetCidade;
      property Estado:string read FEstado write SetEstado;
      property DataNasc :TDate read FDataNasc write SetDataNasc;
      property Complemento :string read FComplemento write SetComplemento;
      property Observacoes :string read FObservacoes write SetObservacoes;
      property Cliente :Boolean read FCliente write SetCliente;
      property Fornecedor :Boolean read FFornecedor write SetFornecedor;
      property Profissional :Boolean read FProfissional write SetProfissional;
      property UsuarioSistema :Boolean read FUsuarioSistema write SetUsuarioSistema;
      property Telefone1 :string read FTelefone1 write SetTelefone1;
      property Telefone2 :string read FTelefone2 write SetTelefone2;
      property Email1 :string read FEmail1 write SetEmail1;
      property Email2 :string read FEmail2 write SetEmail2;
      property HomePage :string read FHomePage write SetHomePage;
      property Grupo :Integer read FGrupo write SetGrupo;
      property Sexo	:string read FSexo write SetSexo;

      procedure Inserir;
      procedure Contato(ID :Integer);

    published

   end;



implementation

{ TContatos }

uses dPrincipal, uFuncoes;

procedure TContatos.Contato(ID: Integer);
var tabContatos :TFDQuery;
begin
   tabContatos := TFDQuery.Create(nil);
   tabContatos.Connection := dmPrincipal.SqLiteConnection;
   tabContatos.SQL.Clear;
   tabContatos.Open('SELECT  '+
                    'Codigo,Nome,Email1,CpfCnpj,Cliente,Fornecedor,Profissional,DataCadastro, '+
                    'Usuario, '+
                    'NomeFantasia, Rua,          Numero, '+
                    'Bairro,       Cep,          Cidade, '+
                    'Estado,          Complemento, '+
                    'Observacoes,  Telefone1,    Telefone2, '+
                    'Email2,       HomePage,     Grupo, '+
                    'Sexo '+

                    'FROM contatos WHERE ID ='+QuotedStr(IntToStr(ID)));
   if tabContatos.RecordCount = 1 then begin
      Nome         := tabContatos.FieldByName('Nome').AsString;
      Email1       := tabContatos.FieldByName('Email1').AsString;
      CpfCnpj      := tabContatos.FieldByName('CpfCnpj').AsString;
      Cliente      := tabContatos.FieldByName('Cliente').AsBoolean;
      Fornecedor   := tabContatos.FieldByName('Fornecedor').AsBoolean;
      Profissional := tabContatos.FieldByName('Profissional').AsBoolean;
      //DataCadastro := tabContatos.FieldByName('DataCadastro').Value;
      //DataExclusao := tabContatos.FieldByName('DataExclusao').Value;
//      Usuario  := tabContatos.FieldByName('Usuario').Value;
      NomeFantasia := tabContatos.FieldByName('NomeFantasia').AsString;
      //IeRg  := tabContatos.FieldByName('IeRg').Value;
      Rua  := tabContatos.FieldByName('Rua').AsString;
      Numero  := tabContatos.FieldByName('Numero').AsString;
      Bairro  := tabContatos.FieldByName('Bairro').AsString;
      Cep    := tabContatos.FieldByName('Cep').AsString;
      Cidade  := tabContatos.FieldByName('Cidade').AsString;
      Estado   := tabContatos.FieldByName('Estado').AsString;
      //DataNasc  := tabContatos.FieldByName('DataNasc').Value;
      Complemento  := tabContatos.FieldByName('Complemento').AsString;
      Observacoes   := tabContatos.FieldByName('Observacoes').AsString;
      Telefone1  := tabContatos.FieldByName('Telefone1').AsString;
      Telefone2   := tabContatos.FieldByName('Telefone2').AsString;
      Email2   := tabContatos.FieldByName('Email2').AsString;
      HomePage  := tabContatos.FieldByName('HomePage').AsString;
//      Grupo     := tabContatos.FieldByName('Grupo').AsString;
      Sexo     := tabContatos.FieldByName('Sexo').AsString;
   end;
end;

procedure TContatos.Inserir;
var tabContatos :TFDQuery;
    sFields :String;

begin

   tabContatos := TFDQuery.Create(nil);
   tabContatos.Connection := dmPrincipal.SqLiteConnection;


   sFields := 'Codigo,DataExclusao,Usuario,Nome,'+
              'NomeFantasia,CpfCnpj,IeRg,Rua,Numero,Bairro,Cep,'+
              'Cidade,Estado,DataNasc,Complemento,Observacoes,'+
              'Cliente,Fornecedor,Profissional,UsuarioSistema,'+
              'Telefone1,Telefone2,Email1,Email2,HomePage,'+
              'Grupo,Sexo,DataAtividade';

   tabContatos.SQL.Clear;

   if  ID = 0 then

   tabContatos.SQL.Add('INSERT INTO contatos ('+sFields+') VALUES (:'+StringReplace(sFields,',',',:',[rfReplaceAll])+')')

   else begin
      tabContatos.SQL.Add('UPDATE contatos SET ' +
                          'Codigo =:Codigo ,DataExclusao =:DataExclusao,Usuario =:Usuario,Nome =:Nome,'+
                          'NomeFantasia =:NomeFantasia,CpfCnpj =:CpfCnpj,IeRg =:IeRg,Rua =:Rua,Numero=:Numero,'+
                          'Bairro=:Bairro,Cep =:Cep,'+
                          'Cidade =:Cidade,Estado=:Estado,DataNasc =:DataNasc,Complemento =:Complemento,'+
                          'Observacoes =:Observacoes,'+
                          'Cliente =:Cliente,Fornecedor=:Fornecedor,Profissional=:Profissional,UsuarioSistema=:UsuarioSistema,'+
                          'Telefone1=:Telefone1,Telefone2=:Telefone2,Email1=:Email1,Email2=:Email2,HomePage=:HomePage,'+
                          'Grupo =:Grupo,Sexo=:Sexo,DataAtividade=:DataAtividade WHERE ID =:ID ');
      tabContatos.ParamByName('ID').Value      := ID;
   end;



   tabContatos.ParamByName('Codigo').Value       := Codigo;
   if DateToStr(DataExclusao) <> '30/12/1899' then
      tabContatos.ParamByName('DataExclusao').AsDateTime := DataExclusao
   else
      tabContatos.ParamByName('DataExclusao').AsString := '';

   tabContatos.ParamByName('DataAtividade').AsDateTime := Now();
   tabContatos.ParamByName('Usuario').Value      := Usuario;
   tabContatos.ParamByName('Nome').Value         := Nome;
   tabContatos.ParamByName('NomeFantasia').Value := NomeFantasia;
   tabContatos.ParamByName('CpfCnpj').Value      := CpfCnpj;
   tabContatos.ParamByName('IeRg').Value         := IeRg;
   tabContatos.ParamByName('Rua').Value          := Rua;
   tabContatos.ParamByName('Numero').Value       := Numero;
   tabContatos.ParamByName('Bairro').Value       := Bairro;
   tabContatos.ParamByName('Cep').Value          := Cep;
   tabContatos.ParamByName('Cidade').Value       := Cidade;
   tabContatos.ParamByName('Estado').Value       := Estado;
   tabContatos.ParamByName('DataNasc').Value     := DataNasc;
   tabContatos.ParamByName('Complemento').Value  := Complemento;
   tabContatos.ParamByName('Observacoes').Value  := Observacoes;
   tabContatos.ParamByName('Cliente').Value      := Cliente;
   tabContatos.ParamByName('Fornecedor').Value   := Fornecedor;
   tabContatos.ParamByName('Profissional').Value := Profissional;
   tabContatos.ParamByName('UsuarioSistema').Value := UsuarioSistema;
   tabContatos.ParamByName('Telefone1').Value    := Telefone1;
   tabContatos.ParamByName('Telefone2').Value    := Telefone2;
   tabContatos.ParamByName('Email1').Value       := Email1;
   tabContatos.ParamByName('Email2').Value       := Email2;
   tabContatos.ParamByName('HomePage').Value     := HomePage;
   tabContatos.ParamByName('Grupo').Value        := Grupo;
   tabContatos.ParamByName('Sexo').Value         := Sexo;
   tabContatos.ExecSQL;

   Notificacoes('','Dados salvo com sucesso',Nome);

   FreeAndNil(tabContatos);

end;

procedure TContatos.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TContatos.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TContatos.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TContatos.SetCliente(const Value: Boolean);
begin
  FCliente := Value;
end;

procedure TContatos.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TContatos.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TContatos.SetCpfCnpj(const Value: string);
begin
  FCpfCnpj := Value;
end;

procedure TContatos.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TContatos.SetDataExclusao(const Value: TDate);
begin
  FDataExclusao := Value;
end;

procedure TContatos.SetDataNasc(const Value: TDate);
begin
  FDataNasc := Value;
end;

procedure TContatos.SetEmail1(const Value: string);
begin
  FEmail1 := Value;
end;

procedure TContatos.SetEmail2(const Value: string);
begin
  FEmail2 := Value;
end;

procedure TContatos.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TContatos.SetFornecedor(const Value: Boolean);
begin
  FFornecedor := Value;
end;

procedure TContatos.SetGrupo(const Value: Integer);
begin
  FGrupo := Value;
end;

procedure TContatos.SetHomePage(const Value: string);
begin
  FHomePage := Value;
end;

procedure TContatos.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TContatos.SetIeRg(const Value: string);
begin
  FIeRg := Value;
end;

procedure TContatos.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TContatos.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TContatos.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TContatos.SetObservacoes(const Value: string);
begin
  FObservacoes := Value;
end;

procedure TContatos.SetProfissional(const Value: Boolean);
begin
  FProfissional := Value;
end;

procedure TContatos.SetRua(const Value: string);
begin
  FRua := Value;
end;

procedure TContatos.SetSexo(const Value: string);
begin
  FSexo := Value;
end;

procedure TContatos.SetTelefone1(const Value: string);
begin
  FTelefone1 := Value;
end;

procedure TContatos.SetTelefone2(const Value: string);
begin
  FTelefone2 := Value;
end;

procedure TContatos.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

procedure TContatos.SetUsuarioSistema(const Value: Boolean);
begin
  FUsuarioSistema := Value;
end;

end.
