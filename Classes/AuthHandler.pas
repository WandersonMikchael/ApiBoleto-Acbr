unit AuthHandler;

interface

uses
  Horse, SysUtils, MySQLConnectionModule, System.NetEncoding; // Substitui Base64 por System.NetEncoding

procedure AuthMiddleware(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure AuthMiddleware(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  AuthHeader: string;
  DecodedAuth: string;
  Username, Password: string;
  UserID: Integer;
  MySQLConnection: TMySQLConnectionModule;
  TokenHomologacao, TokenProducao: string;
begin
  AuthHeader := Req.Headers['Authorization'];

  if AuthHeader.IsEmpty or not AuthHeader.StartsWith('Basic ') then
  begin
    Res.Status(401).Send('Authorization header missing or invalid');
    Exit;
  end;

  // Decodifica o header Basic (formato: "Basic <Base64(username:password)>")
  DecodedAuth := TNetEncoding.Base64.Decode(AuthHeader.Substring(6));
  Username := DecodedAuth.Split([':'])[0];
  Password := DecodedAuth.Split([':'])[1];

  MySQLConnection := TMySQLConnectionModule.Create(nil);
  try
    // Consulta o banco de dados para validar o usuário (ID no banco)
    UserID := MySQLConnection.GetUserID(Username); // Usa o username como identificador interno

    if UserID > 0 then
    begin
      // Verifica os tokens no banco para homologação ou produção
      if MySQLConnection.ValidateTokens(UserID, Password, TokenHomologacao, TokenProducao) then
      begin
        // Autenticação válida
        Next();
      end
      else
        Res.Status(403).Send('Invalid token');
    end
    else
      Res.Status(401).Send('Invalid username or password');
  finally
    MySQLConnection.Free;
  end;
end;

end.

