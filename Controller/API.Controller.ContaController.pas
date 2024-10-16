unit API.Controller.ContaController;

interface

uses
  Horse,
  System.StrUtils,
  System.SysUtils,
  Horse.GBSwagger.Register,
  Horse.GBSwagger.Controller,
  GBSwagger.Path.Attributes,
  API.Model.NovaConta,
  API.Service.ContaService,
  System.JSON,
  REST.Json,
  API.Utils.FuncoesAuxiliares;

type
  [SwagPath('v1', 'CriarContaCliente')]
  TControllerContaCliente = class(THorseGBSwagger)
  public
    [SwagPOST('CriarContaCliente', 'Criar Conta Cliente')]
    [SwagResponse(200, TNovaContaResponse, 'Retorno com sucesso')]
    [SwagParamBody('Conta Cliente', TNovaContaRequest)]
    procedure InserirConta;
  end;


implementation

procedure TControllerContaCliente.InserirConta;
var
  NovaConta: TNovaContaRequest;
  ContaService: TContaService;
  Response: TNovaContaResponse;
begin
  NovaConta := TJson.JsonToObject<TNovaContaRequest>(FRequest.Body);
  ContaService := TContaService.Create;
  try
    Response := ContaService.InserirConta(NovaConta.NomeCliente);
    FResponse.Send(JsonToObject(Response));
  finally
    FreeAndNil(Response);
    FreeAndNil(ContaService);
    FreeAndNil(ContaService);
  end;
end;

initialization
  THorseGBSwaggerRegister.RegisterPath(TControllerContaCliente);
end.

