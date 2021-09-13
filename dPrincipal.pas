unit dPrincipal;

interface

uses
  System.SysUtils, System.StrUtils,System.Classes,  System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  System.IOUtils, FMX.Dialogs,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, IPPeerClient, IPPeerServer,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, System.Tether.Manager,
  System.Tether.AppProfile, FireDAC.Comp.Script, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TdmPrincipal = class(TDataModule)
    SqLiteConnection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    SqLiteSecurity: TFDSQLiteSecurity;
    SqLiteValidate: TFDSQLiteValidate;
    SqLiteBackup: TFDSQLiteBackup;
    ScriptVersao: TFDScript;
    ScriptExecutar: TFDScript;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    QuerySelect: TFDQuery;
    QueryExecute: TFDQuery;
    fdTabelas: TFDTable;
    TabSelect: TFDQuery;
    tabClientes: TFDQuery;
    tabBuscaAvancada: TFDQuery;
    tabAtendimentos: TFDQuery;
    tabImagem: TFDQuery;
    tabContas: TFDQuery;
    tabMovimentos: TFDQuery;
    procedure SqLiteConnectionBeforeConnect(Sender: TObject);
    procedure SqLiteConnectionAfterConnect(Sender: TObject);
    procedure UpdateVersion;
    function GetVersion(var FDConexao :TFDConnection): Integer;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PathDB :String;
    tabTarefas :TFDQuery;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uPrincipal;

{$R *.dfm}

procedure TdmPrincipal.SqLiteConnectionAfterConnect(Sender: TObject);
begin
   SqLiteConnection.ExecSQL('CREATE TABLE IF NOT EXISTS sistema '+
                            '(Codigo INTEGER PRIMARY KEY AUTOINCREMENT,'+
                            'DataCadastro DATE DEFAULT (datetime('+QuotedStr('now')+ ','+QuotedStr('localtime ')+')),'+
                            'DataExclusao DATE ,'+
                            'Usuario integer,'+
                            'Versao integer default 100);'+

                            'CREATE TABLE IF NOT EXISTS sistema_log ('+
                            'Codigo INTEGER,'+
                            'DataCadastro DATE,'+
                            'DataExclusao DATE,'+
                            'Usuario integer,'+
                            'Versao integer,'+
                            'Tipo VARCHAR(1),'+
                            'Data DATE DEFAULT (datetime('+QuotedStr('now')+ ','+QuotedStr('localtime')+')))');
   UpdateVersion;

   tabTarefas := TFDQuery.Create(Self);
   tabTarefas.Connection := sqLiteConnection;
end;

procedure TdmPrincipal.SqLiteConnectionBeforeConnect(Sender: TObject);
var
   Path :TStringList;
   vDir :string;
begin

   {$IF DEFINED(iOS) or DEFINED(android)}
    SqLiteConnection.Params.Values['DataBase'] := TPath.Combine(TPath.GetDocumentsPath,'DelphiCreative.S3DB');
   {$ENDIF}

   {$IF DEFINED (MSWINDOWS)}
   vDir := 'C:\DelphiCreative';
   if not DirectoryExists(vDir) then CreateDir(vDir);
   if not DirectoryExists(vDir+'\Data') then CreateDir(vDir+'\Data');

   Path := TStringList.Create;

   if not FileExists(GetCurrentDir+'\config.ini') then begin
      Path.Add(vDir+'\Data\DelphiCreative.S3DB');
      Path.SaveToFile(GetCurrentDir+'\config.ini');
   end;

   if FileExists(GetCurrentDir+'\config.ini') then
      Path.LoadFromFile(GetCurrentDir+'\config.ini');

   PathDB := Path.Strings[0];
   SqLiteConnection.Params.Values['DataBase'] := PathDB;

   {$ENDIF}
end;

procedure TdmPrincipal.UpdateVersion;
var
   i ,CurVer,NewVer,ScripVer :Integer;
begin
   NewVer := uPrincipal.AppVersion;
   CurVer := GetVersion(SqLiteConnection);

   try
      if CurVer < NewVer then begin
         for i := 0 to ScriptVersao.SQLScripts.Count - 1 do begin
            if ((LeftStr(ScriptVersao.SQLScripts[i].Name,4)).ToInteger > CurVer ) and
               ((LeftStr(ScriptVersao.SQLScripts[i].Name,4)).ToInteger <= NewVer) then begin
                 ScriptExecutar.ExecuteScript(ScriptVersao.SQLScripts[i].SQL);
                 SqLiteConnection.ExecSQL('UPDATE sistema SET versao = '+LeftStr(ScriptVersao.SQLScripts[i].Name,4));
               end;
         end;
      end;
   except
      on E : Exception do
         raise Exception.Create('Error Message'+ E.Message);
   end;

end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
   SqLiteConnection.Connected := True;
end;

function TdmPrincipal.GetVersion(var FDConexao :TFDConnection): Integer;
var v :Variant;
begin
   try
      FDConexao.Open;
      v := FDConexao.ExecSQLScalar('SELECT versao FROM sistema');
      if not VarIsNull(v) then
         if v = 0 then begin
            FDConexao.ExecSQL('INSERT INTO sistema (versao) VALUES (100)');
            Result := 100;
         end else
            Result := (v)
      else
         Result := -1;
   except
      on E:Exception do begin
         raise Exception.Create('GetVersion ' + E.Message);
      end;
   end;
end;

end.
