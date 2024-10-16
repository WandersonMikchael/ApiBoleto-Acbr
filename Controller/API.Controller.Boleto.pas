unit API.Controller.Boleto;

interface

uses
  Horse,
  System.StrUtils,
  System.SysUtils,
  System.Classes,
  System.NetEncoding,
  Horse.GBSwagger.Register,
  Horse.GBSwagger.Controller,
  GBSwagger.Path.Attributes,
  API.Model.Boleto,
  API.Service.BoletoService,
  System.JSON,
  REST.Json,
  API.Utils.FuncoesAuxiliares;

type
  [SwagPath('v1', 'Boleto')]
  TControllerBoleto = class(THorseGBSwagger)
  public
    [SwagPOST('GerarBoleto', 'Gerar Boleto')]
    [SwagResponse(200, TModelBoletoResponse, 'Retorno com sucesso')]
    [SwagParamBody('Boletos', TModelBoletosRequest)]
    procedure GerarBoleto;

    [SwagPOST('GerarRemessa', 'Gerar Arquivo Remessa')]
    [SwagResponse(200, TModelBoletosRequest, 'Retorno com sucesso')]
    [SwagParamBody('GerarRemessa', TModelBoletosRequest)]
    procedure GerarRemessa;

    [SwagPOST('GerarRetorno', 'Gerar Arquivo Retorno')]
    [SwagResponse(200, TModelBoletosRequest, 'Retorno com sucesso')]
    [SwagParamBody('GerarRetorno', TModelBoletosRequest)]
    procedure GerarRetorno;
  end;

implementation

{ TControllerBoleto }

procedure TControllerBoleto.GerarBoleto;
var
  BoletoService: TBoletoService;
  Requisicao: TModelBoletosRequest;
  Response : TModelBoletoResponse;
begin
  Requisicao := TJson.JsonToObject<TModelBoletosRequest>(FRequest.Body);
  try
    BoletoService := TBoletoService.Create;
    Response := BoletoService.GerarBoleto(Requisicao);
    FResponse.Send(JsonToObject(Response));
  finally
    FreeAndNil(Response);
    FreeAndNil(BoletoService);
    FreeAndNil(Requisicao);
  end;
end;

procedure TControllerBoleto.GerarRemessa;
var
  RootObject: TModelBoletosRequest;
  JSONInput: TJSONObject;
begin
  try
    // Tenta ler o JSON do corpo da requisição
    JSONInput := TJSONObject.ParseJSONValue(FRequest.Body) as TJSONObject;
    if not Assigned(JSONInput) then
    begin
      FResponse.Send('Invalid JSON format').Status(400);
      Exit;
    end;

    // Desserializa o JSON para o objeto RootObject
    RootObject := TJson.JsonToObject<TModelBoletosRequest>(JSONInput.ToString);
    try
      // Sucesso na desserialização
      FResponse.Send('Desserialização bem-sucedida').Status(200);
    finally
      RootObject.Free;
    end;
  except
    on E: Exception do
    begin
      FResponse.Send('Erro na desserialização: ' + E.Message).Status(400);
    end;
  end;
end;

procedure TControllerBoleto.GerarRetorno;
var
  RootObject: TModelBoletosRequest;
  JSONInput: TJSONObject;
begin
  try
    // Tenta ler o JSON do corpo da requisição
    JSONInput := TJSONObject.ParseJSONValue(FRequest.Body) as TJSONObject;
    if not Assigned(JSONInput) then
    begin
      FResponse.Send('Invalid JSON format').Status(400);
      Exit;
    end;

    // Desserializa o JSON para o objeto RootObject
    RootObject := TJson.JsonToObject<TModelBoletosRequest>(JSONInput.ToString);
    try
      // Sucesso na desserialização
      FResponse.Send('Desserialização bem-sucedida').Status(200);
    finally
      RootObject.Free;
    end;
  except
    on E: Exception do
    begin
      FResponse.Send('Erro na desserialização: ' + E.Message).Status(400);
    end;
  end;
end;

initialization
  THorseGBSwaggerRegister.RegisterPath(TControllerBoleto);

end.

