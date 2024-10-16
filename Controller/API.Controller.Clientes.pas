
unit API.Controller.Clientes;

interface

uses
  Horse,

  System.StrUtils,
  System.SysUtils,
  System.Classes,

  Horse.GBSwagger.Register,
  Horse.GBSwagger.Controller,
  GBSwagger.Path.Attributes,

  API.Model.Clientes;

type
  [SwagPath('v1', 'clientes')]
  TControllerClientes = class(THorseGBSwagger)
  private

  public
    [SwagGet('clientes', 'Descrição do Endpoint')]
    [SwagResponse(200, TModelClientes, 'Retorno com sucesso')]
    procedure DoListClientes;

    [SwagPost('clientes', 'Descrição do Endpoint')]
    [SwagResponse(200, TModelClientes, 'Retorno com sucesso')]
    procedure DoPost;

    [SwagPut('clientes', 'Descrição do Endpoint')]
    [SwagResponse(200, TModelClientes, 'Retorno com sucesso')]
    procedure DoPut;

    [SwagDelete('clientes', 'Descrição do Endpoint')]
    [SwagResponse(200, TModelClientes, 'Retorno com sucesso')]
    procedure DoDelete;
  end;


implementation

{ TControllerClientes }

procedure TControllerClientes.DoDelete;
begin
  FResponse.Send('Delete');
end;

procedure TControllerClientes.DoListClientes;
begin
  FResponse.Send('List');
end;

procedure TControllerClientes.DoPost;
begin
  FResponse.Send('Post');
end;

procedure TControllerClientes.DoPut;
begin
  FResponse.Send('Put');
end;

//initialization
//
//THorseGBSwaggerRegister.RegisterPath(TControllerClientes);

end.

