unit API.Utils.FuncoesAuxiliares;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Generics.Collections,
  REST.Json, System.NetEncoding;

function ConverterBase64ParaPdf(const Base64: string; const CaminhoArquivo: string): Boolean;

function ConverterPdfParaBase64(const CaminhoArquivo: string): string;

function JsonToObject(Obj: TObject): string;

implementation

function ConverterBase64ParaPdf(const Base64: string; const CaminhoArquivo: string): Boolean;
var
  ByteArray: TBytes;
  FileStream: TFileStream;
begin
  try
    // Decodifica a string Base64 para um array de bytes
    ByteArray := TNetEncoding.Base64.DecodeStringToBytes(Base64);

    // Cria o arquivo PDF no caminho especificado
    FileStream := TFileStream.Create(CaminhoArquivo, fmCreate);
    try
      // Escreve os bytes no arquivo
      FileStream.WriteBuffer(ByteArray[0], Length(ByteArray));
    finally
      FileStream.Free;
    end;

    Result := True; // Retorna verdadeiro se a operação for bem-sucedida
  except
    on E: Exception do
      raise Exception.Create('Erro ao converter Base64 para PDF: ' + E.Message);
  end;
end;

function ConverterPdfParaBase64(const CaminhoArquivo: string): string;
var
  FileStream: TFileStream;
  ByteArray: TBytes;
begin
  if not FileExists(CaminhoArquivo) then
  begin
    raise Exception.Create('O arquivo do boleto não foi encontrado no caminho: ' + CaminhoArquivo);
  end;

  FileStream := TFileStream.Create(CaminhoArquivo, fmOpenRead or fmShareDenyWrite);
  try
    if FileStream.Size = 0 then
    begin
      raise Exception.Create('O arquivo do boleto está vazio.');
    end;

    SetLength(ByteArray, FileStream.Size);
    FileStream.ReadBuffer(ByteArray[0], FileStream.Size);

    Result := TNetEncoding.Base64.EncodeBytesToString(ByteArray);
  finally
    FileStream.Free;
  end;
end;

function JsonToObject(Obj: TObject): string;
var
  json: TJSONObject;
begin
  json := TJson.ObjectToJsonObject(Obj);
  try
    try
      Result := json.ToJSON;
    except
      on E: Exception do
        raise Exception.Create('Error converter Objeto para Json: ' + E.Message);
    end;
  finally
    json.DisposeOf;
  end;
end;

end.

