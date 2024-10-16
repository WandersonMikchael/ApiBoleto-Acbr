unit AuthService;

interface

uses
  System.SysUtils, MySQLConnectionModule;

type
  TAuthService = class
  private
    Conexao: TMySQLConnectionModule;
  public
    function ValidateCredentials(const AUsername, APassword: string): Boolean;
  end;

implementation

{ TAuthService }

function TAuthService.ValidateCredentials(const AUsername, APassword: string): Boolean;
var
  StoredPassword: string;
begin
  Conexao :=  TMySQLConnectionModule.Create(nil);
  try
    Result := False;

    StoredPassword := Conexao.GetUserPassword(AUsername);

    if StoredPassword <> '' then
      Result := APassword.Equals(StoredPassword);
  finally
    FreeAndNil(Conexao)
  end;
end;

end.

