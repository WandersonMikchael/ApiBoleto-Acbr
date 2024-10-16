unit API.Service.ContaService;

interface

uses
  API.Model.NovaConta, MySQLConnectionModule, System.SysUtils;

type
  TContaService = class
  private
    FMySQLModule: TMySQLConnectionModule;
    function GenerateAlphanumericGUID: string;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirConta(const NomeCliente: string): TNovaContaResponse;
  end;

implementation

constructor TContaService.Create;
begin
  FMySQLModule := TMySQLConnectionModule.Create(nil);
end;

destructor TContaService.Destroy;
begin
  FMySQLModule.Free;
  inherited;
end;

function TContaService.InserirConta(const NomeCliente: string): TNovaContaResponse;
var
  UserName, Password: string;
begin
  UserName := GenerateAlphanumericGUID;
  Password := GenerateAlphanumericGUID;

  if FMySQLModule.InserirConta(NomeCliente, UserName, Password) then
  begin
    Result := TNovaContaResponse.Create;
    Result.UserName := UserName;
    Result.Password := Password;
  end
  else
    raise Exception.Create('Erro ao inserir a conta no banco de dados.');
end;

function TContaService.GenerateAlphanumericGUID: string;
var
  GUID: TGuid;
begin
  GUID := TGuid.NewGuid;
  Result := GUID.ToString.Replace('-', '').Replace('{', '').Replace('}', '');
end;


end.

