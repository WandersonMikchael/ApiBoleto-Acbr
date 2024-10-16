
unit API.Model.Clientes;

interface

uses
  GBSwagger.Model.Attributes;

type
  TModelClientes = class
  private
    FID : Integer;
    FNome: string;
    FDataDeInclusao : TDateTime;
    FCreditoPreAprovado: Double;
    FDiasPraPagar: Integer;
  public
    property ID : Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property DataDeInclusao : TDateTime read FDataDeInclusao write FDataDeInclusao;
    property CreditoPreAprovado: Double read FCreditoPreAprovado write FCreditoPreAprovado;
    property DiasPraPagar: Integer read FDiasPraPagar write FDiasPraPagar;
  end;

implementation

end.

