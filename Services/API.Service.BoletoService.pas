unit API.Service.BoletoService;

interface

uses
  Windows,
  System.Classes,
  System.SysUtils,
  API.Model.Boleto,
  ACBrBoleto,
  ACBrBoletoFCFR,
  ACBrUtil,
  ACBrBoletoConversao,
  ACBrBoletoFPDF,
  API.Utils.BoletoConversao,
  System.NetEncoding,
  API.Utils.FuncoesAuxiliares;

type
  TBoletoService = class
  private

  public
    BoletoApi: TACBrBoleto;
    PdfBoletoApi: TACBrBoletoFCFR;
    BoletoFDPdfApi: TACBrBoletoFPDF;
    procedure ConfigurarComponente(Requisicao: TModelBoletosRequest);
    function GerarBoleto(const Requisicao: TModelBoletosRequest):TModelBoletoResponse;
    procedure IncluirTitulo(Requisicao: TModelBoletosRequest);
    function RetornaCaminhoTemporario: String;
  end;

implementation

procedure TBoletoService.ConfigurarComponente(Requisicao: TModelBoletosRequest);
var
  Beneficiario   : TACBrCedente;
  Banco          : TACBrBanco;
  Boleto         : TACBrBoleto;
  WebService     : TACBrWebService;
  BeneficiarioWS : TACBrCedenteWS;
  CobAnterior    : TACBrTipoCobranca;

  BoletoUtils    : TBoletoConversaoUtils;
begin
  Boleto := BoletoApi;
  WebService := Boleto.Configuracoes.WebService;

  Boleto.PrefixArqRemessa                  := Requisicao.PrefixArqRemessa;
  Boleto.LayoutRemessa                     := TACBrLayoutRemessa(Requisicao.LayoutRemessa);
  Boleto.Homologacao                       := Requisicao.Homologacao;

  Boleto.ImprimirMensagemPadrao            := Requisicao.ImprimirMensagemPadrao;
  Boleto.LeCedenteRetorno                  := Requisicao.LeCedenteRetorno;
  Boleto.LerNossoNumeroCompleto            := Requisicao.LerNossoNumeroCompleto;
  Boleto.RemoveAcentosArqRemessa           := Requisicao.RemoveAcentosArqRemessa;


  Beneficiario   := Boleto.Cedente;
  BeneficiarioWS := Beneficiario.CedenteWS;

  Beneficiario.Agencia                       := Requisicao.Banco.Agencia;
  Beneficiario.AgenciaDigito                 := Requisicao.Banco.AgenciaDigito;
  Beneficiario.Conta                         := Requisicao.Banco.Conta;
  Beneficiario.ContaDigito                   := Requisicao.Banco.ContaDigito;
  Beneficiario.DigitoVerificadorAgenciaConta := Requisicao.Banco.DigitoVerificadorAgenciaConta;
  Beneficiario.Convenio                      := Requisicao.Banco.Convenio;
  Beneficiario.Modalidade                    := Requisicao.Banco.Modalidade;
  Beneficiario.Operacao                      := Requisicao.Banco.Operacao;
  Beneficiario.CodigoTransmissao             := Requisicao.Banco.CodigoTransmissao;
  Beneficiario.CodigoCedente                 := Requisicao.Banco.CodigoCedente;

  if Length(OnlyNumber(Requisicao.Cedente.CpfCnpj)) = 14 then
    Beneficiario.TipoInscricao               := pJuridica
  else
    Beneficiario.TipoInscricao               := pFisica;

  Beneficiario.TipoDocumento                 := TACBrTipoDocumento(Requisicao.Cedente.TipoDocumento);

  Beneficiario.IdentDistribuicao             := TACBrIdentDistribuicao(Requisicao.Cedente.IdentDistribuicao);
  Beneficiario.ResponEmissao                 := TACBrResponEmissao(Requisicao.Cedente.ResponEmissao);
  Beneficiario.CaracTitulo                   := TACBrCaracTitulo(Requisicao.Cedente.CaracTitulo);
  Beneficiario.TipoCarteira                  := TACBrTipoCarteira(Requisicao.Cedente.TipoDocumento);

  Beneficiario.CNPJCPF                       := Requisicao.Cedente.CpfCnpj;
  Beneficiario.Nome                          := Requisicao.Cedente.Nome;
  Beneficiario.Logradouro                    := Requisicao.Cedente.Logradouro;
  Beneficiario.NumeroRes                     := Requisicao.Cedente.Numero;
  Beneficiario.Complemento                   := Requisicao.Cedente.Complemento;
  Beneficiario.Bairro                        := Requisicao.Cedente.Bairro;
  Beneficiario.Cidade                        := Requisicao.Cedente.Cidade;
  Beneficiario.UF                            := Requisicao.Cedente.Uf;
  Beneficiario.CEP                           := Requisicao.Cedente.Cep;
  Beneficiario.Telefone                      := Requisicao.Cedente.Bairro;


  Banco := Boleto.Banco;
  Banco.TipoCobranca        := BoletoUtils.GetBancoApi(Requisicao.Banco.CodigoBanco);
  Banco.LayoutVersaoArquivo := StrToIntDef(Requisicao.Banco.VersaoArquivo,0);
  Banco.LayoutVersaoLote    := StrToIntDef(Requisicao.Banco.VersaoLote,0);
  Banco.CIP                 := Requisicao.Banco.CIP;
  Banco.Numero              := Requisicao.Banco.CodigoBanco;

  if Assigned(BoletoApi.ACBrBoletoFC) then
    BoletoApi.ACBrBoletoFC.DirLogo := 'C:\Repositorio\ACBr\Fontes\ACBrBoleto\Logos\Colorido\png\';

  BoletoApi.ACBrBoletoFC.LayOut := lPadrao;

  PdfBoletoApi.FastReportFile := 'C:\Repositorio\ACBr\Exemplos\ACBrBoleto\Delphi\Report\Boleto.fr3';
  PdfBoletoApi.MostrarPreview := False;
  PdfBoletoApi.MostrarSetup   := False;

end;


function TBoletoService.RetornaCaminhoTemporario : String;
var
  DiretorioTemp : PChar;
  TempBuffer    : Dword;
begin
  TempBuffer := 255;
  GetMem(DiretorioTemp,255);
  try
    GetTempPath(tempbuffer,diretoriotemp);
    var  DataHoraStr := FormatDateTime('yyyymmddhhnnss', Now);
    result := DiretorioTemp + 'Boleto'+DataHoraStr+'.pdf';
  finally
    FreeMem(diretoriotemp);
  end;
end;

function TBoletoService.GerarBoleto(const Requisicao: TModelBoletosRequest):TModelBoletoResponse;
var
  i : Integer;
begin
  BoletoApi := TACBrBoleto.Create(nil);

  PdfBoletoApi:= TACBrBoletoFCFR.Create(BoletoApi);

  //BoletoFDPdfApi   := TACBrBoletoFPDF.Create(BoletoApi);

  BoletoApi.ACBrBoletoFC := PdfBoletoApi;
  try
    ConfigurarComponente(Requisicao);
    IncluirTitulo(Requisicao);
    PdfBoletoApi.NomeArquivo :=  RetornaCaminhoTemporario;
    Requisicao.NomeArquivo := PdfBoletoApi.NomeArquivo;

    Result := TModelBoletoResponse.Create;
    try
      BoletoApi.GerarPDF;

      for I := 0 to BoletoApi.ListadeBoletos.Count -1 do
      begin
        Result.Boleto := ConverterPdfParaBase64(Requisicao.NomeArquivo);
        Result.NossoNumero :=  BoletoApi.ListadeBoletos[i].NossoNumero;
      end;

      DeleteFile(Requisicao.NomeArquivo);
    except
      on E: Exception do
        Result.Erro := E.Message;
    end;


  finally
    FreeAndNil(BoletoFDPdfApi);
    FreeAndNil(BoletoApi);
  end;
end;

procedure TBoletoService.IncluirTitulo(Requisicao: TModelBoletosRequest);
var
  Titulo : TACBrTitulo;
  VQtdeCarcA, VQtdeCarcB, VQtdeCarcC :Integer;
  VLinha, logo : string;
  i: Integer;
  ArrayBoletos: TArrayBoletos;
begin
  ArrayBoletos := Requisicao.Boletos;

  for i := Low(ArrayBoletos) to High(ArrayBoletos) do
  begin
    Titulo := BoletoApi.CriarTituloNaLista;


    Titulo.Vencimento        := ArrayBoletos[i].DataVencimento;
    Titulo.DataDocumento     := ArrayBoletos[i].DataDocumento;
    Titulo.NumeroDocumento   := ArrayBoletos[i].NumeroDocumento;
    Titulo.EspecieDoc        := ArrayBoletos[i].EspecieDoc;
    Titulo.EspecieMod        := ArrayBoletos[i].EspecieMod;

    if ArrayBoletos[i].Aceite then
       Titulo.Aceite := atSim
    else
       Titulo.Aceite := atNao;

    Titulo.DataProcessamento := Now;
    Titulo.Carteira          := Requisicao.Banco.Carteira;
    Titulo.NossoNumero       := ArrayBoletos[i].NossoNumero;
    Titulo.ValorDocumento    := ArrayBoletos[i].ValorDocumento;

    with Titulo.Sacado do
    begin
      NomeSacado := ArrayBoletos[i].Sacado.NomeSacado;
      CNPJCPF    := OnlyNumber(ArrayBoletos[i].Sacado.CPFCNPJSacado);
      Logradouro := ArrayBoletos[i].Sacado.EnderecoSacado;
      Numero     := ArrayBoletos[i].Sacado.NumeroSacado;
      Bairro     := ArrayBoletos[i].Sacado.BairroSacado;
      Cidade     := ArrayBoletos[i].Sacado.CidadeSacado;
      UF         := ArrayBoletos[i].Sacado.EstadoSacado;
      CEP        := OnlyNumber(ArrayBoletos[i].Sacado.CepSacado);
    end;
  end;
end;

end.