unit API.Swagger.Doc;

interface

uses
  Horse.GBSwagger;

procedure StartDocumentation;

implementation

procedure StartDocumentation;
begin
  Swagger
      .Info
        .Title('API de Cobrança - ACBr ')
        .Description('API para geração de boletos')
        .Contact
          .Name('Wanderson Gomes')
          .Email('wanderson.gomes@iob.com.br')
          .URL('https://iob.com.br/iob-business/')
        .&End
      .&end;

  Swagger
    .Config
      .ClassPrefixes('TModel')
    .&End;
end;

initialization
  StartDocumentation;

end.

