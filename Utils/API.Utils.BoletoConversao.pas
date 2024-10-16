unit API.Utils.BoletoConversao;

interface

uses
  System.Classes,
  System.SysUtils,
  ACBrBoleto,
  ACBrUtil,
  ACBrBoletoConversao;

type
  TBoletoConversaoUtils = class
  public
    function GetBancoApi(NumeroBanco:Integer; Carteira: String = ''):TACBrTipoCobranca;
  end;

implementation

function TBoletoConversaoUtils.GetBancoApi(NumeroBanco:Integer; Carteira: String = ''):TACBrTipoCobranca;
begin
  case NumeroBanco of
    001: Result := cobBancoDoBrasil;
    003: Result := cobBancoDaAmazonia;
    004: Result := cobBancoDoNordeste;
    008,033,353: Result := cobSantander;
    021: Result := cobBanestes;
    025: Result := cobBancoAlfa;
    041: Result := cobBanrisul;
    047: Result := cobBanese;
    070: Result := cobBRB;
    077: Result := cobBancoInter;
    084: Result := cobUniprimeNortePR;
    085: Result := cobBancoCECRED;
    091: Result := cobUnicredRS;
    097: Result := cobCrediSIS;
    099: Result := cobUniprime;
    104: Result := cobCaixaEconomica;
    107: Result := cobBancoBocomBBM;
    133: Result := cobBancoCresol;
    136: Result := cobUnicredES;
    174: Result := cobBancoPefisa;
    208: Result := cobBTGPactual;
    212: Result := cobBancoOriginal;
    218: Result := cobBS2;
    224: Result := cobBancoFibra;
    237: Result := cobBradesco;
    246: Result := cobBancoABCBrasil;
    274: Result := cobMoneyPlus;
    329: Result := cobBancoQITechSCD;
    336: Result := cobBancoC6;
    341: Result := cobItau;
    389: Result := cobBancoMercantil;
    399: Result := cobHSBC;
    422: Result := cobBancoSafra;
    457: Result := cobBancoUY3;
    604: Result := cobBancoIndustrialBrasil;
    633: Result := cobBancoRendimento;
    637: begin
           if StrToInt(Carteira) = 109 then
             Result := cobBancoSofisaItau
           else
             Result := cobBancoSofisaSantander;
         end;
    643: begin
           if StrToInt(Carteira) = 9 then
             Result := cobBancoPineBradesco
           else
             Result := cobBancoPine;
         end;
    655: Result := cobBancoVotorantim;
    707: Result := cobDaycoval;
    745: Result := cobCitiBank;
    748: Result := cobSicred;
    756: Result := cobBancoob;
  end;
end;

end.
