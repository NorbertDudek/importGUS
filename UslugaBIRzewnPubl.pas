// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl.xsd
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_wsdl0.xsd
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_wsdl0.xsd>0
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_xsd0.xsd
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_xsd1.xsd
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_xsd2.xsd
//  >Import : https://Wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl_xsd3.xsd
// Encoding : utf-8
// Codegen  : [wfOutputLiteralTypes+, wfMapArraysToClasses+]
// Version  : 1.0
// (2016-09-29 00:18:03 - - $Rev: 76228 $)
// ************************************************************************ //

unit UslugaBIRzewnPubl;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  ParametryWyszukiwania = class;                { "http://CIS/BIR/PUBL/2014/07/DataContract"[GblCplx] }



  // ************************************************************************ //
  // XML       : ParametryWyszukiwania, global, <complexType>
  // Namespace : http://CIS/BIR/PUBL/2014/07/DataContract
  // ************************************************************************ //
  ParametryWyszukiwania = class(TRemotable)
  private
    FKrs: string;
    FKrs_Specified: boolean;
    FKrsy: string;
    FKrsy_Specified: boolean;
    FNip: string;
    FNip_Specified: boolean;
    FNipy: string;
    FNipy_Specified: boolean;
    FRegon: string;
    FRegon_Specified: boolean;
    FRegony14zn: string;
    FRegony14zn_Specified: boolean;
    FRegony9zn: string;
    FRegony9zn_Specified: boolean;
    procedure SetKrs(Index: Integer; const Astring: string);
    function  Krs_Specified(Index: Integer): boolean;
    procedure SetKrsy(Index: Integer; const Astring: string);
    function  Krsy_Specified(Index: Integer): boolean;
    procedure SetNip(Index: Integer; const Astring: string);
    function  Nip_Specified(Index: Integer): boolean;
    procedure SetNipy(Index: Integer; const Astring: string);
    function  Nipy_Specified(Index: Integer): boolean;
    procedure SetRegon(Index: Integer; const Astring: string);
    function  Regon_Specified(Index: Integer): boolean;
    procedure SetRegony14zn(Index: Integer; const Astring: string);
    function  Regony14zn_Specified(Index: Integer): boolean;
    procedure SetRegony9zn(Index: Integer; const Astring: string);
    function  Regony9zn_Specified(Index: Integer): boolean;
  published
    property Krs:        string  Index (IS_OPTN or IS_NLBL) read FKrs write SetKrs stored Krs_Specified;
    property Krsy:       string  Index (IS_OPTN or IS_NLBL) read FKrsy write SetKrsy stored Krsy_Specified;
    property Nip:        string  Index (IS_OPTN or IS_NLBL) read FNip write SetNip stored Nip_Specified;
    property Nipy:       string  Index (IS_OPTN or IS_NLBL) read FNipy write SetNipy stored Nipy_Specified;
    property Regon:      string  Index (IS_OPTN or IS_NLBL) read FRegon write SetRegon stored Regon_Specified;
    property Regony14zn: string  Index (IS_OPTN or IS_NLBL) read FRegony14zn write SetRegony14zn stored Regony14zn_Specified;
    property Regony9zn:  string  Index (IS_OPTN or IS_NLBL) read FRegony9zn write SetRegony9zn stored Regony9zn_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://CIS/BIR/PUBL/2014/07
  // soapAction: |http://CIS/BIR/2014/07/IUslugaBIR/PobierzCaptcha|http://CIS/BIR/2014/07/IUslugaBIR/SprawdzCaptcha|http://CIS/BIR/2014/07/IUslugaBIR/SetValue|http://CIS/BIR/2014/07/IUslugaBIR/GetValue|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/Zaloguj|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/Wyloguj|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DaneSzukaj|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DanePobierzPelnyRaport|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DaneKomunikat
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : e3
  // service   : UslugaBIRzewnPubl
  // port      : e3
  // URL       : https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc
  // ************************************************************************ //
  IUslugaBIRzewnPubl = interface(IInvokable)
  ['{D7CE4B00-F3F7-50C4-6AEC-2C5F2A6B2C33}']
    function  PobierzCaptcha: string; stdcall;
    function  SprawdzCaptcha(const pCaptcha: string): Boolean; stdcall;
    function  SetValue(const pNazwaParametru: string; const pWartoscParametru: string): string; stdcall;
    function  GetValue(const pNazwaParametru: string): string; stdcall;
    function  Zaloguj(const pKluczUzytkownika: string): string; stdcall;
    function  Wyloguj(const pIdentyfikatorSesji: string): Boolean; stdcall;
    function  DaneSzukaj(const pParametryWyszukiwania: ParametryWyszukiwania): string; stdcall;
    function  DanePobierzPelnyRaport(const pRegon: string; const pNazwaRaportu: string): string; stdcall;
    function  DaneKomunikat: string; stdcall;
  end;

function GetIUslugaBIRzewnPubl(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IUslugaBIRzewnPubl;


implementation
  uses System.SysUtils;

function GetIUslugaBIRzewnPubl(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IUslugaBIRzewnPubl;
const
//  defWSDL = 'https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl.xsd';
//  defURL  = 'https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc';
  defWSDL = 'https://wyszukiwarkaregon.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl.xsd';
  defURL  = 'https://wyszukiwarkaregon.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc';
  defSvc  = 'UslugaBIRzewnPubl';
  defPrt  = 'e3';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IUslugaBIRzewnPubl);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure ParametryWyszukiwania.SetKrs(Index: Integer; const Astring: string);
begin
  FKrs := Astring;
  FKrs_Specified := True;
end;

function ParametryWyszukiwania.Krs_Specified(Index: Integer): boolean;
begin
  Result := FKrs_Specified;
end;

procedure ParametryWyszukiwania.SetKrsy(Index: Integer; const Astring: string);
begin
  FKrsy := Astring;
  FKrsy_Specified := True;
end;

function ParametryWyszukiwania.Krsy_Specified(Index: Integer): boolean;
begin
  Result := FKrsy_Specified;
end;

procedure ParametryWyszukiwania.SetNip(Index: Integer; const Astring: string);
begin
  FNip := Astring;
  FNip_Specified := True;
end;

function ParametryWyszukiwania.Nip_Specified(Index: Integer): boolean;
begin
  Result := FNip_Specified;
end;

procedure ParametryWyszukiwania.SetNipy(Index: Integer; const Astring: string);
begin
  FNipy := Astring;
  FNipy_Specified := True;
end;

function ParametryWyszukiwania.Nipy_Specified(Index: Integer): boolean;
begin
  Result := FNipy_Specified;
end;

procedure ParametryWyszukiwania.SetRegon(Index: Integer; const Astring: string);
begin
  FRegon := Astring;
  FRegon_Specified := True;
end;

function ParametryWyszukiwania.Regon_Specified(Index: Integer): boolean;
begin
  Result := FRegon_Specified;
end;

procedure ParametryWyszukiwania.SetRegony14zn(Index: Integer; const Astring: string);
begin
  FRegony14zn := Astring;
  FRegony14zn_Specified := True;
end;

function ParametryWyszukiwania.Regony14zn_Specified(Index: Integer): boolean;
begin
  Result := FRegony14zn_Specified;
end;

procedure ParametryWyszukiwania.SetRegony9zn(Index: Integer; const Astring: string);
begin
  FRegony9zn := Astring;
  FRegony9zn_Specified := True;
end;

function ParametryWyszukiwania.Regony9zn_Specified(Index: Integer): boolean;
begin
  Result := FRegony9zn_Specified;
end;

initialization
  { IUslugaBIRzewnPubl }
  InvRegistry.RegisterInterface(TypeInfo(IUslugaBIRzewnPubl), 'http://CIS/BIR/PUBL/2014/07', 'utf-8');
  InvRegistry.RegisterAllSOAPActions(TypeInfo(IUslugaBIRzewnPubl), '|http://CIS/BIR/2014/07/IUslugaBIR/PobierzCaptcha'
                                                                  +'|http://CIS/BIR/2014/07/IUslugaBIR/SprawdzCaptcha'
                                                                  +'|http://CIS/BIR/2014/07/IUslugaBIR/SetValue'
                                                                  +'|http://CIS/BIR/2014/07/IUslugaBIR/GetValue'
                                                                  +'|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/Zaloguj'
                                                                  +'|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/Wyloguj'
                                                                  +'|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DaneSzukaj'
                                                                  +'|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DanePobierzPelnyRaport'
                                                                  +'|http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/DaneKomunikat'
                                                                  );
  InvRegistry.RegisterInvokeOptions(TypeInfo(IUslugaBIRzewnPubl), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(IUslugaBIRzewnPubl), ioSOAP12);
  { IUslugaBIRzewnPubl.PobierzCaptcha }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'PobierzCaptcha', '',
                                 '[ReturnName="PobierzCaptchaResult", RequestNS="http://CIS/BIR/2014/07", ResponseNS="http://CIS/BIR/2014/07"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'PobierzCaptcha', 'PobierzCaptchaResult', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.SprawdzCaptcha }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'SprawdzCaptcha', '',
                                 '[ReturnName="SprawdzCaptchaResult", RequestNS="http://CIS/BIR/2014/07", ResponseNS="http://CIS/BIR/2014/07"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'SprawdzCaptcha', 'pCaptcha', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.SetValue }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'SetValue', '',
                                 '[ReturnName="SetValueResult", RequestNS="http://CIS/BIR/2014/07", ResponseNS="http://CIS/BIR/2014/07"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'SetValue', 'pNazwaParametru', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'SetValue', 'pWartoscParametru', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.GetValue }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'GetValue', '',
                                 '[ReturnName="GetValueResult", RequestNS="http://CIS/BIR/2014/07", ResponseNS="http://CIS/BIR/2014/07"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'GetValue', 'pNazwaParametru', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.Zaloguj }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'Zaloguj', '',
                                 '[ReturnName="ZalogujResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'Zaloguj', 'pKluczUzytkownika', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'Zaloguj', 'ZalogujResult', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.Wyloguj }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'Wyloguj', '',
                                 '[ReturnName="WylogujResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'Wyloguj', 'pIdentyfikatorSesji', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.DaneSzukaj }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'DaneSzukaj', '',
                                 '[ReturnName="DaneSzukajResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DaneSzukaj', 'pParametryWyszukiwania', '',
                                '[Namespace="http://CIS/BIR/PUBL/2014/07/DataContract"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DaneSzukaj', 'DaneSzukajResult', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.DanePobierzPelnyRaport }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'DanePobierzPelnyRaport', '',
                                 '[ReturnName="DanePobierzPelnyRaportResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DanePobierzPelnyRaport', 'pRegon', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DanePobierzPelnyRaport', 'pNazwaRaportu', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DanePobierzPelnyRaport', 'DanePobierzPelnyRaportResult', '',
                                '', IS_NLBL);
  { IUslugaBIRzewnPubl.DaneKomunikat }
  InvRegistry.RegisterMethodInfo(TypeInfo(IUslugaBIRzewnPubl), 'DaneKomunikat', '',
                                 '[ReturnName="DaneKomunikatResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IUslugaBIRzewnPubl), 'DaneKomunikat', 'DaneKomunikatResult', '',
                                '', IS_NLBL);
  RemClassRegistry.RegisterXSClass(ParametryWyszukiwania, 'http://CIS/BIR/PUBL/2014/07/DataContract', 'ParametryWyszukiwania');

end.
