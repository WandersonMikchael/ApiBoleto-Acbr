unit API.Model.Boleto;

interface

uses
  GBSwagger.Model.Attributes, System.SysUtils, System.Classes, System.JSON,
  System.Generics.Collections, System.DateUtils, REST.Json.Types;

type
  TPath = class
  private
    FBOLETOFR3: string;
    FLOGOMARCA: string;
    FMostrarSenha: string;
  public
  published
    property BOLETOFR3: string read FBOLETOFR3 write FBOLETOFR3;
    property LOGOMARCA: string read FLOGOMARCA write FLOGOMARCA;
    property MostrarSenha: string read FMostrarSenha write FMostrarSenha;
  end;

  TEmail = class
  private
    FFromEmail: string;
    FFromName: string;
    FHost: string;
    FMostrarSenha: string;
    FPassWord: string;
    FPort: string;
    FSSL: string;
    FTLS: string;
    FUserName: string;
  public
  published
    property FromEmail: string read FFromEmail write FFromEmail;
    property FromName: string read FFromName write FFromName;
    property Host: string read FHost write FHost;
    property MostrarSenha: string read FMostrarSenha write FMostrarSenha;
    property PassWord: string read FPassWord write FPassWord;
    property Port: string read FPort write FPort;
    property SSL: string read FSSL write FSSL;
    property TLS: string read FTLS write FTLS;
    property UserName: string read FUserName write FUserName;
  end;

  TWebService = class
  private
    FAmbiente: string;
    FArquivoCRT: string;
    FArquivoKEY: string;
    FArquivoPFX: string;
    FClientId: string;
    FClientSecret: string;
    FIndicadorPix: string;
    FKeyUser: string;
    FSSLCryptLib: string;
    FSSLHttpLib: string;
    FSSLType: string;
    FSSLXmlSignLib: string;
    FScope: string;
    FSenha: string;
  public
  published
    property Ambiente: string read FAmbiente write FAmbiente;
    property ArquivoCRT: string read FArquivoCRT write FArquivoCRT;
    property ArquivoKEY: string read FArquivoKEY write FArquivoKEY;
    property ArquivoPFX: string read FArquivoPFX write FArquivoPFX;
    property ClientId: string read FClientId write FClientId;
    property ClientSecret: string read FClientSecret write FClientSecret;
    property IndicadorPix: string read FIndicadorPix write FIndicadorPix;
    property KeyUser: string read FKeyUser write FKeyUser;
    property SSLCryptLib: string read FSSLCryptLib write FSSLCryptLib;
    property SSLHttpLib: string read FSSLHttpLib write FSSLHttpLib;
    property SSLType: string read FSSLType write FSSLType;
    property SSLXmlSignLib: string read FSSLXmlSignLib write FSSLXmlSignLib;
    property Scope: string read FScope write FScope;
    property Senha: string read FSenha write FSenha;
  end;

  TBanco = class
  private
    FCodigoBanco: Integer;
    FAgencia: string;
    FAgenciaDigito: string;
    FConta:string;
    FContaDigito: string;
    FDigitoVerificadorAgenciaConta: string;
    FConvenio: string;
    FModalidade: string;
    FOperacao: string;
    FCodigoTransmissao: string;
    FCodigoCedente: string;
    fCarteira: string;
    FCIP: string;
    FCNAB: string;
    FVersaoArquivo: string;
    FVersaoLote: string;
  public
  published
    property CodigoBanco: Integer read FCodigoBanco write FCodigoBanco;
    property Agencia: string read FAgencia write FAgencia;
    property AgenciaDigito: string read FAgenciaDigito write FAgenciaDigito;
    property Conta: string read FConta write FConta;
    property ContaDigito: string read FContaDigito write FContaDigito;
    property DigitoVerificadorAgenciaConta: string read FDigitoVerificadorAgenciaConta write FDigitoVerificadorAgenciaConta;
    property Convenio: string read FConvenio write FConvenio;
    property Modalidade: string read FModalidade write FModalidade;
    property Operacao: string read FOperacao write FOperacao;
    property CodigoTransmissao: string read FCodigoTransmissao write FCodigoTransmissao;
    property CodigoCedente: string read FCodigoCedente write FCodigoCedente;
    property Carteira: string read FCarteira write FCarteira;
    property CIP: string read FCIP write FCIP;
    property CNAB: string read FCNAB write FCNAB;
    property VersaoArquivo: string read FVersaoArquivo write FVersaoArquivo;
    property VersaoLote: string read FVersaoLote write FVersaoLote;
  end;

  TSacado = class
  private
    FBairroSacado: string;
    FCPFCNPJSacado: string;
    FCepSacado: string;
    FCidadeSacado: string;
    FEnderecoSacado: string;
    FEstadoSacado: string;
    FNomeSacado: string;
    FNumeroSacado:string;
  public
  published
    property BairroSacado: string read FBairroSacado write FBairroSacado;
    property CPFCNPJSacado: string read FCPFCNPJSacado write FCPFCNPJSacado;
    property CepSacado: string read FCepSacado write FCepSacado;
    property CidadeSacado: string read FCidadeSacado write FCidadeSacado;
    property EnderecoSacado: string read FEnderecoSacado write FEnderecoSacado;
    property EstadoSacado: string read FEstadoSacado write FEstadoSacado;
    property NomeSacado: string read FNomeSacado write FNomeSacado;
    property NumeroSacado: string read FNumeroSacado write FNumeroSacado;
  end;

  TBoletos = class
  private
    FDataDocumento: TDateTime;
    FDataProcessamento: TDateTime;
    FDataVencimento: TDateTime;
    FDemonstrativo: string;
    FInstrucoesCaixa1: string;
    FLayoutBoleto: string;
    FNossoNumero: string;
    FNumeroControle: string;
    FNumeroDocumento: string;
    FPersonalizacaoIdentificacaoCedente: string;
    FSacado: TSacado;
    FTipoDocumentoCobranca: string;
    FValorDocumento: Double;
    FEspecieDoc:string;
    FEspecieMod:string;
    FAceite:Boolean;
  public
  published
    property DataDocumento: TDateTime read FDataDocumento write FDataDocumento;
    property DataProcessamento: TDateTime read FDataProcessamento write FDataProcessamento;
    property DataVencimento: TDateTime read FDataVencimento write FDataVencimento;
    property Demonstrativo: string read FDemonstrativo write FDemonstrativo;
    property InstrucoesCaixa1: string read FInstrucoesCaixa1 write FInstrucoesCaixa1;
    property LayoutBoleto: string read FLayoutBoleto write FLayoutBoleto;
    property NossoNumero: string read FNossoNumero write FNossoNumero;
    property NumeroControle: string read FNumeroControle write FNumeroControle;
    property NumeroDocumento: string read FNumeroDocumento write FNumeroDocumento;
    property PersonalizacaoIdentificacaoCedente: string read FPersonalizacaoIdentificacaoCedente write FPersonalizacaoIdentificacaoCedente;
    property Sacado: TSacado read FSacado;
    property TipoDocumentoCobranca: string read FTipoDocumentoCobranca write FTipoDocumentoCobranca;
    property ValorDocumento: Double read FValorDocumento write FValorDocumento;
    property EspecieDoc: string read FEspecieDoc write FEspecieDoc;
    property EspecieMod: string read FEspecieMod write FEspecieMod;
    property Aceite: Boolean read FAceite write FAceite;
  end;

  TCedente = class
  private
    FBairro: string;
    FCep: string;
    FCidade: string;
    FComplemento: string;
    FCpfCnpj: string;
    FLogradouro: string;
    FNome: string;
    FNumero: string;
    FTelefone: string;
    FUf: string;
    FCodigoCedente:string;
    FModalidade:Integer;
    FCodigoTransmissao:string;
    FConvenio:Integer;
    FCaracTitulo:Integer;
    FTipoDocumento:Integer;
    FTipoCarteira:Integer;
    FTipoInscricao:Integer;
    FIdentDistribuicao:Integer;
    FResponEmissao:Integer;
    FOperacao:string;
    FChavePix:string;
    FTipoChavePIX:Integer;
  public
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Cidade: string read FCidade write FCidade;
    property Complemento: string read FComplemento write FComplemento;
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Nome: string read FNome write FNome;
    property Numero: string read FNumero write FNumero;
    property Telefone: string read FTelefone write FTelefone;
    property Uf: string read FUf write FUf;
    property CodigoCedente: string read FCodigoCedente write FCodigoCedente;
    property Modalidade: Integer read FModalidade write FModalidade;
    property CodigoTransmissao: string read FCodigoTransmissao write FCodigoTransmissao;
    property Convenio: Integer read FConvenio write FConvenio;
    property CaracTitulo: Integer read FCaracTitulo write FCaracTitulo;
    property TipoDocumento: Integer read FTipoDocumento write FTipoDocumento;
    property TipoCarteira: Integer read FTipoCarteira write FTipoCarteira;
    property TipoInscricao: Integer read FTipoInscricao write FTipoInscricao;
    property IdentDistribuicao: Integer read FIdentDistribuicao write FIdentDistribuicao;
    property ResponEmissao: Integer read FResponEmissao write FResponEmissao;
    property Operacao: string read FOperacao write FOperacao;
    property ChavePix: string read FChavePix write FChavePix;
    property TipoChavePIX: Integer read FTipoChavePIX write FTipoChavePIX;
  end;

  TContaCorrente = class
  private
    FDadoConfiguracao1: string;
    FDadoConfiguracao2: string;
    FDadoConfiguracao3: string;
    FDadoConfiguracao4: string;
    FDadoConfiguracao5: string;
    FFimNossoNumero: string;
    FInicioNossoNumero: string;
    FLocalPagamento: string;
    FProximoNossoNumero: string;
  public
  published
    property DadoConfiguracao1: string read FDadoConfiguracao1 write FDadoConfiguracao1;
    property DadoConfiguracao2: string read FDadoConfiguracao2 write FDadoConfiguracao2;
    property DadoConfiguracao3: string read FDadoConfiguracao3 write FDadoConfiguracao3;
    property DadoConfiguracao4: string read FDadoConfiguracao4 write FDadoConfiguracao4;
    property DadoConfiguracao5: string read FDadoConfiguracao5 write FDadoConfiguracao5;
    property FimNossoNumero: string read FFimNossoNumero write FFimNossoNumero;
    property InicioNossoNumero: string read FInicioNossoNumero write FInicioNossoNumero;
    property LocalPagamento: string read FLocalPagamento write FLocalPagamento;
    property ProximoNossoNumero: string read FProximoNossoNumero write FProximoNossoNumero;
  end;

  TArrayBoletos = array of TBoletos;

  TModelBoletosRequest = class
  private
    FBanco: TBanco;
    FBoletos: TArrayBoletos;
    FCedente: TCedente;
    FContaCorrente: TContaCorrente;
    FCpfCnpj: string;
    FEmail: TEmail;
    FIdCarteira: string;
    FPath: TPath;
    FTipoCorLogo: string;
    FTipoGeracaoAgrupada: string;
    FTipoGeracaoListaIndividual: string;
    FWebService: TWebService;
    FPrefixArqRemessa: string;
    FLayoutRemessa:Integer;
    FHomologacao:Boolean;
    FImprimirMensagemPadrao:Boolean;
    FLeCedenteRetorno:Boolean;
    FLerNossoNumeroCompleto:Boolean;
    FRemoveAcentosArqRemessa:Boolean;
    FNomeArquivo:string;
  public
    constructor Create;
    destructor Destroy; override;

  published
    property Banco: TBanco read FBanco;
    property Boletos: TArrayBoletos read FBoletos write FBoletos;
    property Cedente: TCedente read FCedente;
    property ContaCorrente: TContaCorrente read FContaCorrente;
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property Email: TEmail read FEmail;
    property IdCarteira: string read FIdCarteira write FIdCarteira;
    property Path: TPath read FPath;
    property TipoCorLogo: string read FTipoCorLogo write FTipoCorLogo;
    property TipoGeracaoAgrupada: string read FTipoGeracaoAgrupada write FTipoGeracaoAgrupada;
    property TipoGeracaoListaIndividual: string read FTipoGeracaoListaIndividual write FTipoGeracaoListaIndividual;
    property WebService: TWebService read FWebService;
    property PrefixArqRemessa: string read FPrefixArqRemessa write FPrefixArqRemessa;
    property LayoutRemessa: Integer read FLayoutRemessa write FLayoutRemessa;
    property Homologacao: Boolean read FHomologacao write FHomologacao;
    property ImprimirMensagemPadrao: Boolean read FImprimirMensagemPadrao write FImprimirMensagemPadrao;
    property LeCedenteRetorno: Boolean read FLeCedenteRetorno write FLeCedenteRetorno;
    property LerNossoNumeroCompleto: Boolean read FLerNossoNumeroCompleto write FLerNossoNumeroCompleto;
    property RemoveAcentosArqRemessa: Boolean read FRemoveAcentosArqRemessa write FRemoveAcentosArqRemessa;
    property NomeArquivo: string read FNomeArquivo write FNomeArquivo;
  end;

  TModelBoletoResponse = class
  private
    FBoleto: TBytes;
    FNossoNumero:string;
    FSucesso: Boolean;
    FErro:string;

  public
    constructor Create;
    destructor Destroy; override;

  published
    property Boleto: TBytes read FBoleto write FBoleto;
    property NossoNumero: string read FNossoNumero write FNossoNumero;
    property Sucesso: Boolean read FSucesso write FSucesso;
    property Erro: string read FErro write FErro;
  end;

implementation

{ TModelBoletos }

constructor TModelBoletosRequest.Create;
begin
  inherited Create;
end;

destructor TModelBoletosRequest.Destroy;
begin

  inherited;
end;

{ TModelBoletoResponse }

constructor TModelBoletoResponse.Create;
begin
  inherited Create;
end;

destructor TModelBoletoResponse.Destroy;
begin

  inherited;
end;

end.

