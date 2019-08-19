object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 442
  Width = 736
  object SqLiteConnection: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'Database=C:\DXE6\Projetos\NKFmx\Win32\Debug\nkdb.S3DB'
      'DriverID=SQLite')
    AfterConnect = SqLiteConnectionAfterConnect
    BeforeConnect = SqLiteConnectionBeforeConnect
    Left = 40
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 480
    Top = 117
  end
  object SqLiteSecurity: TFDSQLiteSecurity
    DriverLink = FDPhysSQLiteDriverLink1
    Left = 40
    Top = 74
  end
  object SqLiteValidate: TFDSQLiteValidate
    DriverLink = FDPhysSQLiteDriverLink1
    Left = 40
    Top = 133
  end
  object SqLiteBackup: TFDSQLiteBackup
    DriverLink = FDPhysSQLiteDriverLink1
    Catalog = 'MAIN'
    DestCatalog = 'MAIN'
    Left = 40
    Top = 190
  end
  object ScriptVersao: TFDScript
    SQLScripts = <
      item
        Name = '1001 Criar tabela de usu'#225'rios'
        SQL.Strings = (
          'CREATE TABLE usuarios (ID INTEGER PRIMARY KEY AUTOINCREMENT,'
          '                                        Codigo INTEGER,'
          
            '                                        DataCadastro DATE DEFAUL' +
            'T (datetime('#39'now'#39','#39'localtime'#39')),'
          '                                        DataExclusao DATE,'
          '                                        Usuario INTEGER,'
          
            '                                        Nome VARCHAR(100) NOT NU' +
            'LL UNIQUE,'
          '                                        Senha VARCHAR(15),'
          
            '                                        Adm BOOLEAN Default Fals' +
            'e,'
          '                                        IDContato INTEGER);')
      end
      item
        Name = '1002 Criar tabela de Contatos'
        SQL.Strings = (
          'CREATE TABLE IF NOT EXISTS contatos ('
          'ID            INTEGER PRIMARY KEY AUTOINCREMENT,'
          'Codigo    INTEGER,'
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime'#39')),'
          'DataExclusao  DATE ,'
          'Usuario           INTEGER,'
          'Nome'#9'      varchar(255),'
          'NomeFantasia  varchar(255),'
          'CpfCnpj'#9'      varchar(18),'
          'IeRg'#9'      varchar(12),'
          'Rua'#9'          varchar(255),'
          'Numero'#9'      varchar(4),'
          'Bairro'#9'      varchar(150),'
          'Cep           varchar(10),'
          'Cidade'#9'      varchar(100),'
          'Estado'#9'      varchar(2),'
          'DataNasc      date,'
          'Complemento   varchar(100),'
          'Observacoes   text,'
          'Cliente              BOOLEAN,'
          'Fornecedor    BOOLEAN,'
          'Profissional  BOOLEAN,'
          'UsuarioSistema BOOLEAN,'
          'Telefone1     varchar(14),'
          'Telefone2     varchar(14),'
          'Email1'#9'      varchar(100),'
          'Email2'#9'      varchar(100),'
          'HomePage      varchar(100),'
          'Grupo'#9'      integer,'
          'Sexo'#9'      varchar(9));'
          ''
          ''
          
            'INSERT INTO usuarios (Usuario,Nome,Senha,Adm,IDContato ) VALUES ' +
            '('#39'0'#39','#39'ADM'#39','#39'123'#39','#39'True'#39',1);'
          
            'INSERT INTO contatos (Nome,Profissional,Cliente,Fornecedor ) VAL' +
            'UES ('#39'ADM'#39',1,0,0);'
          '')
      end
      item
        Name = '1003 Criar tabela de imagem de contatos'
        SQL.Strings = (
          'CREATE TABLE contatos_imagem ('
          ' Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime'#39')),'
          ' DataExclusao DATE ,'
          ' IDContato  integer,'
          ' Imagem blob);')
      end
      item
        Name = '1004 Criar campo DataAtividade na tabela de Contatos'
        SQL.Strings = (
          'ALTER TABLE contatos ADD COLUMN DataAtividade DATE;')
      end
      item
        Name = '1005 Criar tabela de situa'#231#227'o de atendimento'
        SQL.Strings = (
          'CREATE TABLE tipos_atendimentos ('
          'Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          'DataExclusao DATE ,'
          'Usuario integer,'
          'Descricao VARCHAR(100),'
          'Cor INTEGER,'
          'CodigoTarefa INTEGER,'
          'Ordem integer'
          ');'
          ''
          '')
      end
      item
        Name = '0000 Criar tabela contas'
        SQL.Strings = (
          'CREATE TABLE contas ('
          '  ID        INTEGER PRIMARY KEY AUTOINCREMENT, '
          '  '
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime'#39')), '
          '  DataExclusao  DATE ,'
          '  Usuario          integer,'
          '  CodigoFJ integer,'
          '  Parcela varchar(7),'
          '  TipoCobranca VARCHAR(1) NOT NULL DEFAULT '#39'U'#39','
          '  Valor decimal(15,2),'
          '  DataPagamento date,'
          '  DataVencimento date,'
          '  CodigoMovimento integer,'
          '  CodigoChave integer,'
          '  CodigoConta integer, '
          '  CodigoConta integer, '
          '  TipoConta VARCHAR(1) NOT NULL DEFAULT '#39'R'#39','
          '  DataFinal date ,'
          '  Observacoes varchar(500) DEFAULT NULL);')
      end
      item
        Name = '0000 Criar tabela descri'#231#227'o de contas'
        SQL.Strings = (
          'CREATE TABLE contas_desc ('
          'ID INTEGER PRIMARY KEY AUTOINCREMENT,'
          'CodigoContaDesc INTEGER,'
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          'DataExclusao DATE ,'
          'Usuario integer,'
          'Descricao VARCHAR(100));'
          '')
      end
      item
        Name = '0000 Criar tabela de contas liquidadas'
        SQL.Strings = (
          'CREATE TABLE contas_liquidadas ('
          '  ID INTEGER PRIMARY KEY AUTOINCREMENT, '
          '  CodigoContaLiquidada INTEGER,'
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')), '
          '  DataExclusao DATE , '
          '  Usuario integer,  '
          '  CodigoConta bigint(20) DEFAULT NULL,'
          '  TipoPagamento bigint(20) DEFAULT NULL,'
          '  ValorPago decimal(15,2) DEFAULT NULL,'
          '  DataPagamento date DEFAULT NULL,'
          '  Observacoes varchar(255) DEFAULT NULL);'
          '  ')
      end
      item
        Name = '0000 Criar tabela de tipos de pagamentos'
        SQL.Strings = (
          'CREATE TABLE tipos_pagamentos ('
          'ID INTEGER PRIMARY KEY AUTOINCREMENT,'
          'CodigoTipoPagamento INTEGER,'
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          'DataExclusao DATE ,'
          'Usuario integer,'
          'Descricao VARCHAR(100));')
      end
      item
        Name = '0000 Criar tabela de agendamentos'
        SQL.Strings = (
          ''
          'CREATE TABLE agendamento ('
          '  ID INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  CodigoAgendamento INTEGER,'
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          '  DataExclusao DATE ,'
          '  Usuario integer,'
          '  DataAgenda date DEFAULT NULL,'
          '  HorarioInicio time DEFAULT NULL,'
          '  HorarioFinal time DEFAULT NULL,'
          '  CodigoCliente integer DEFAULT NULL,'
          '  SituacaoAgendamento integer,'
          '  CodigoProfissional integer,'
          '  CodigoPagamento integer,'
          '  CodigoEntrada integer,'
          '  Anotacoes text);')
      end
      item
        Name = '0000 Criar tabela de movimentos'
        SQL.Strings = (
          'CREATE TABLE movimentos ('
          '  Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          '  DataExclusao DATE ,'
          '  Usuario integer,'
          '  CodigoFJ integer,'
          '  CodigoProfissional integer,'
          '  StatusMovimento integer,'
          '  DataFechamento date ,'
          '  CodigoConta integer,'
          '  Observacoes varchar(255),'
          '  Tipo varchar(1) NOT NULL DEFAULT '#39'R'#39
          '  );'
          ''
          'CREATE TABLE movimentos_log ('
          '  Codigo INTEGER,'
          '  DataCadastro DATE ,'
          '  DataExclusao DATE ,'
          '  Usuario integer,'
          '  CodigoFJ integer,'
          '  CodigoProfissional integer,'
          '  StatusMovimento integer,'
          '  DataFechamento date ,'
          '  CodigoConta integer,'
          '  Observacoes varchar(255),'
          '  TipoMovimento varchar(1) NOT NULL DEFAULT '#39'R'#39','
          '  Tipo VARCHAR(1)'
          '  );')
      end
      item
        Name = '1006 Criar tipos de Atendimentos Padr'#227'o'
        SQL.Strings = (
          
            'ALTER TABLE tipos_atendimentos ADD COLUMN Travado BOOLEAN DEFAUL' +
            'T 0;'
          ''
          ''
          '')
      end
      item
        Name = '1007 Criar tabela de tarefas'
        SQL.Strings = (
          'CREATE TABLE tarefas ('
          'Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          'DataExclusao DATE ,'
          'Usuario integer,'
          'Descricao VARCHAR(100),'
          'Tipo varchar(1) NOT NULL DEFAULT '#39'R'#39
          ''
          ');'
          ''
          'CREATE TABLE atendimentos( '
          'Codigo INTEGER PRIMARY KEY AUTOINCREMENT, '
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')), '
          'DataExclusao DATE , '
          'Usuario integer, '
          'DataAtendimento date DEFAULT NULL, '
          'HorarioInicio time DEFAULT NULL, '
          'HorarioFinal time DEFAULT NULL, '
          'CodigoContato integer DEFAULT NULL, '
          'TipoAtendimento integer, '
          'CodigoProfissional integer, '
          'CodigoTarefa Integer,'
          'CodigoPagamento integer, '
          'CodigoEntrada integer, '
          'Anotacoes text ,'
          'Tipo varchar(1) NOT NULL DEFAULT '#39'R'#39' );'
          ''
          'CREATE TABLE atendimentos_det ( '
          'Codigo INTEGER PRIMARY KEY AUTOINCREMENT, '
          'DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')), '
          'DataExclusao DATE , '
          'Usuario integer, '
          'CodigoAtendimento integer DEFAULT NULL, '
          'ValorUnitario decimal(15,2) DEFAULT NULL, '
          'IDItem integer DEFAULT NULL, '
          'Quantidade decimal(15,2) DEFAULT NULL, '
          'ValorCusto decimal(15,2));')
      end
      item
        Name = '1008 Criar tabela de servicos e produtos'
        SQL.Strings = (
          'CREATE TABLE IF NOT EXISTS itens ('
          '  ID INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          '  DataExclusao DATE ,'
          ' Codigo INTEGER, '
          ' Usuario integer,'
          '  Descricao varchar(50) DEFAULT NULL,'
          '  CodigoBarra varchar(25) NOT NULL,'
          '  Tipo varchar(1) DEFAULT '#39'P'#39','
          '  Estoque decimal(15,2) DEFAULT NULL,'
          '  EstoqueMinimo decimal(15,2) DEFAULT NULL,'
          '  ValorCompra decimal(15,2) DEFAULT NULL,'
          '  ValorVenda decimal(15,2) DEFAULT NULL,'
          '  PorcentagemLucro decimal(15,2) DEFAULT NULL,'
          '  ValorPromocao decimal(15,2) DEFAULT NULL,'
          '  PorcentagemPromocao decimal(15,2) DEFAULT NULL,'
          '  AplicarPromocao tinyint(1) DEFAULT '#39'0'#39','
          '  Interno tinyint(1) DEFAULT '#39'0'#39','
          '  Comissao tinyint(1) DEFAULT '#39'0'#39','
          '  PorcentagemComissao decimal(15,2) DEFAULT NULL,'
          '  UnidadeMedida decimal(15,2) NOT NULL DEFAULT '#39'1.00'#39','
          '  Unidade varchar(2) NOT NULL,'
          '  Observacoes varchar(255) DEFAULT NULL,'
          '  ControleEstoque tinyint(1) DEFAULT NULL);'
          ''
          ''
          'CREATE TABLE IF NOT EXISTS itens_imagem ('
          ' Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime'#39')),'
          ' DataExclusao DATE ,'
          ' IDItem  integer,'
          ' Imagem blob);')
      end
      item
        Name = '1009 Criar tabelas contas'
        SQL.Strings = (
          '  CREATE TABLE contas ('
          '  ID                     INTEGER PRIMARY KEY AUTOINCREMENT,   '
          '  DataCadastro   DATE DEFAULT (datetime('#39'now'#39','#39'localtime'#39')), '
          '  DataExclusao    DATE ,'
          '  Usuario              integer,'
          '  IDContato          integer,'
          '  Parcela              varchar(7),'
          '  TipoCobranca        VARCHAR(1) NOT NULL DEFAULT '#39'U'#39',  '
          '  NumeroDocumento    VARCHAR(15),'
          '  CodigoBarra        VARCHAR(70),'
          '  ValorConta          decimal(15,2),'
          '  DataLiquidacao      date,'
          '  DataEmissao         date,'
          '  DataVencimento      date,'
          '  IDAtendimento       integer,'
          '  CodigoChave         integer,'
          '  IDCategoria     integer, '
          '  Status                 VARCHAR(1), '
          '  TipoConta           VARCHAR(1) NOT NULL DEFAULT '#39'R'#39','
          '  Observacoes         TEXT);  '
          '  '
          '  CREATE TABLE contas_liquidadas ('
          '  ID              INTEGER PRIMARY KEY AUTOINCREMENT, '
          '  DataCadastro    DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')), '
          '  DataExclusao    DATE , '
          '  Usuario         integer,  '
          '  IDConta         bigint(20) DEFAULT NULL,'
          '  IDTipoPagamento bigint(20) DEFAULT NULL,'
          '  ValorPago       decimal(15,2) DEFAULT NULL,'
          '  DataPagamento   date DEFAULT NULL,'
          '  Observacoes     varchar(255) DEFAULT NULL);'
          '  '
          '  CREATE TABLE contas_categorias ('
          '  ID           INTEGER PRIMARY KEY AUTOINCREMENT,  '
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          '  DataExclusao DATE ,'
          '  Usuario      integer,'
          '  Descricao    VARCHAR(100));'
          '  '
          '  CREATE TABLE tipos_pagamentos ('
          '  ID           INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  DataCadastro DATE DEFAULT (datetime('#39'now'#39','#39'localtime '#39')),'
          '  DataExclusao DATE ,'
          '  Usuario      integer,'
          '  Descricao    VARCHAR(100));')
      end
      item
        Name = '1010 Criar tabela aplicativo m'#243'vel'
        SQL.Strings = (
          'CREATE TABLE IF NOT EXISTS apk ('
          '  Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  BotaoCaption varchar(100),'
          '  Consulta text,'
          '  Usuario integer,'
          '  Customizar text,'
          '  Estilo varchar(50) )')
      end>
    Connection = SqLiteConnection
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 152
    Top = 16
  end
  object ScriptExecutar: TFDScript
    SQLScripts = <>
    Connection = SqLiteConnection
    Params = <>
    Macros = <>
    Left = 152
    Top = 75
  end
  object TetheringManager1: TTetheringManager
    Text = 'TetheringManager1'
    Enabled = False
    AllowedAdapters = 'Network'
    Left = 312
    Top = 24
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'MasterTetheringAppProfile1'
    Group = 'MyGroup'
    Enabled = False
    Actions = <
      item
        Name = 'actAdd'
        IsPublic = True
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'MyDataSet'
        IsPublic = True
        ResType = Stream
      end>
    Left = 312
    Top = 72
  end
  object QuerySelect: TFDQuery
    Connection = SqLiteConnection
    Left = 480
    Top = 16
  end
  object QueryExecute: TFDQuery
    Connection = SqLiteConnection
    Left = 480
    Top = 67
  end
  object fdTabelas: TFDTable
    Connection = SqLiteConnection
    Left = 480
    Top = 176
  end
  object TabSelect: TFDQuery
    Connection = SqLiteConnection
    Left = 624
    Top = 16
  end
  object tabClientes: TFDQuery
    Connection = SqLiteConnection
    Left = 624
    Top = 72
  end
  object tabBuscaAvancada: TFDQuery
    Connection = SqLiteConnection
    Left = 629
    Top = 144
  end
  object tabAtendimentos: TFDQuery
    Connection = SqLiteConnection
    Left = 629
    Top = 216
  end
  object tabImagem: TFDQuery
    Connection = SqLiteConnection
    Left = 104
    Top = 312
  end
  object tabContas: TFDQuery
    Connection = SqLiteConnection
    Left = 629
    Top = 264
  end
  object tabMovimentos: TFDQuery
    Connection = SqLiteConnection
    Left = 637
    Top = 344
  end
end
