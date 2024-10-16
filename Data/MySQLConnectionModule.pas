unit MySQLConnectionModule;

interface

uses
  SysUtils, Classes, Data.DB, Vcl.Forms, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys.MySQL;

type
  TMySQLConnectionModule = class
  private
    FConnection: TFDConnection;

  public
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;

    function InserirConta(const Nome, UserName, Password: string): Boolean;
    function GetUserPassword(const AUsername: string): string;
  end;

implementation

constructor TMySQLConnectionModule.Create(AOwner: TComponent);
var
  FDriver: TFDPhysMySQLDriverLink;
begin
  inherited Create;

  // Criação da conexão e do driver
  FDriver := TFDPhysMySQLDriverLink.Create(nil);
  FConnection := TFDConnection.Create(nil);

  try
    // Configurando o driver
    FDriver.DriverID := 'MySQL';
    FDriver.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';

    // Configurando a conexão
    FConnection.DriverName := 'MySQL';
    FConnection.Params.Database := 'boletoAcbr';
    FConnection.Params.UserName := 'root'; // Ajustar conforme necessário
    FConnection.Params.Password := '12345678'; // Ajustar conforme necessário
    FConnection.Params.Add('Server=localhost');

    FConnection.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Error connecting to MySQL: ' + E.Message);
  end;
end;

destructor TMySQLConnectionModule.Destroy;
begin
  FConnection.Free;
  inherited;
end;


function TMySQLConnectionModule.GetUserPassword(const AUsername: string): string;
var
  Query: TFDQuery;
begin
  Result := '';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'SELECT Password FROM serviceaccounts WHERE Username = :Username';
    Query.ParamByName('Username').AsString := AUsername;
    Query.Open;

    if not Query.IsEmpty then
      Result := Query.FieldByName('Password').AsString;
  finally
    Query.Free;
  end;
end;

function TMySQLConnectionModule.InserirConta(const Nome: string; const UserName, Password: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'INSERT INTO serviceaccounts (ServiceAccounts, Username, Password) VALUES (:ServiceAccounts, :UserName, :Password)';
    Query.ParamByName('ServiceAccounts').AsString := Nome;
    Query.ParamByName('UserName').AsString := UserName;
    Query.ParamByName('Password').AsString := Password;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;


end.

