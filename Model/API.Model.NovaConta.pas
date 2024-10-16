unit API.Model.NovaConta;

interface

uses
  GBSwagger.Model.Attributes, System.SysUtils, System.Classes, System.JSON,
  System.Generics.Collections, System.DateUtils, REST.Json.Types, REST.Json;

type
  TNovaContaRequest = class
  private
    FCodigoCliente: string;
    FNomeCliente: string;

  public
    constructor Create;
    destructor Destroy; override;

  published
    property CodigoCliente: string read FCodigoCliente write FCodigoCliente;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
  end;

  TNovaContaResponse = class
  private
    FUserName: string;
    FPassword: string;

  public
    constructor Create;
    destructor Destroy; override;

  published
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
  end;

implementation

{ TNovaContaRequest }

constructor TNovaContaRequest.Create;
begin
  inherited Create;
end;

destructor TNovaContaRequest.Destroy;
begin

  inherited;
end;


{ TNovaContaResponse }

constructor TNovaContaResponse.Create;
begin
  inherited Create;
end;

destructor TNovaContaResponse.Destroy;
begin

  inherited;
end;

end.

