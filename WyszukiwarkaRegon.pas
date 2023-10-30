unit WyszukiwarkaRegon;

interface

uses
  XMLIntf, IdHTTP, System.Classes;

type
  TWyszukiwarkaRegon = class
  private
    const
      WSDLUrl = 'https://wyszukiwarkaregon.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc';
      ActionUrl = 'http://CIS/BIR/PUBL/2014/07/IUslugaBIRzewnPubl/';
  private
    FHttp: TIdHttp;
    FRequest: TStringStream;
    FResponse: TStringStream;
    FSearchResult: IXMLDocument;
    FSessionId: string;
    FErrorMessage: string;

    function XMLFromResponse(const Response: string): IXMLDocument;
    function GetResponse(const Action, Body: string): string;
    procedure GetErrorMessage;
  public
    constructor Create;
    destructor Destroy; override;

    function Login(const UserKey: string): Boolean;
    procedure Logout;

    function InfoByNIP(const NIP: string): Boolean;
    function FullReport(const REGON: string): Boolean;

    property SearchResult: IXMLDocument read FSearchResult;
    property ErrorMessage: string read FErrorMessage;
  end;

implementation

uses
  System.SysUtils, XMLDoc;

{ TWyszukiwarkaRegon }

constructor TWyszukiwarkaRegon.Create;
begin
  FErrorMessage := '';
  FSearchResult := nil;
  FHttp := TIdHTTP.Create;
  FHttp.Request.Clear;
  FHttp.Request.ContentType := 'application/soap+xml';
  FHttp.Request.ContentEncoding := 'utf-8';
  FHttp.Request.CharSet := 'utf-8';
  FHttp.Request.UserAgent := 'MoHa Client';
  FRequest := TStringStream.Create('', TEncoding.UTF8);
  FResponse := TStringStream.Create('', TEncoding.UTF8);
end;

destructor TWyszukiwarkaRegon.Destroy;
begin
  FHttp.DisposeOf;
  FSearchResult := nil;
  FRequest.DisposeOf;
  FResponse.DisposeOf;
  inherited;
end;

function TWyszukiwarkaRegon.FullReport(const REGON: string): Boolean;
var
  body: string;
begin
  body := '';
  body := body + '<ns:pRegon>' + REGON + '</ns:pRegon>'#13#10;
  body := body + '<ns:pNazwaRaportu>PublDaneRaportPrawna</ns:pNazwaRaportu>'#13#10;
  FSearchResult := XMLFromResponse(GetResponse('DanePobierzPelnyRaport', body));
  Result := FSearchResult <> nil;
  if not Result then
    GetErrorMessage;
end;

function TWyszukiwarkaRegon.GetResponse(const Action, Body: string): string;
var
  p: Integer;
begin
  FErrorMessage := '';
  //set FRequest
  FRequest.Clear;
  FRequest.WriteString('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:ns="http://CIS/BIR/PUBL/2014/07" xmlns:dat="http://CIS/BIR/PUBL/2014/07/DataContract">'#13#10);
  FRequest.WriteString('<soap:Header xmlns:wsa="http://www.w3.org/2005/08/addressing">'#13#10);
  FRequest.WriteString('<wsa:To>' + WSDLUrl + '</wsa:To>');
  FRequest.WriteString('<wsa:Action>' + ActionUrl + Action + '</wsa:Action>'#13#10);
  FRequest.WriteString('</soap:Header>'#13#10);
  FRequest.WriteString('   <soap:Body>'#13#10);
  FRequest.WriteString('      <ns:' + Action + '>'#13#10);
  FRequest.WriteString(          Body);
  FRequest.WriteString('      </ns:' + Action + '>'#13#10);
  FRequest.WriteString('   </soap:Body>'#13#10);
  FRequest.WriteString('</soap:Envelope>');
  FRequest.Position := 0;

  //set custom headers
  FHttp.Request.CustomHeaders.Clear;
  FHttp.Request.CustomHeaders.AddValue('action', ActionUrl + Action);
  if FSessionId <> '' then
    FHttp.Request.CustomHeaders.AddValue('sid', FSessionId);

  //send Request
  FResponse.Clear;
  FHttp.Post(WSDLUrl, FRequest, FResponse);

  //get Response text from Response
  Result := FResponse.DataString;
  p := Pos('<' + Action + 'Result>', Result);
  if p > 0 then
  begin
    Delete(Result, 1, p + Length(Action) + 7);
    p := Pos('</' + Action + 'Result>', Result);
    if p > 0 then
    begin
      Result := Copy(Result, 1, p - 1);
      Result := StringReplace(Result, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '&gt;', '>', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '&#xD;', '', [rfReplaceAll, rfIgnoreCase]);
    end
    else
      Result := '';
  end
  else
    Result := '';
  FRequest.Clear;
  FResponse.Clear;
end;

function TWyszukiwarkaRegon.InfoByNIP(const NIP: string): Boolean;
var
  body: string;
begin
  body := '';
  body := body + '<ns:pParametryWyszukiwania>'#13#10;
  body := body + '  <dat:Nip>' + NIP + '</dat:Nip>'#13#10;
  body := body + '</ns:pParametryWyszukiwania>'#13#10;
  FSearchResult := XMLFromResponse(GetResponse('DaneSzukaj', body));
  Result := FSearchResult <> nil;
  if not Result then
    GetErrorMessage;
end;

function TWyszukiwarkaRegon.Login(const UserKey: string): Boolean;
var
  body: string;
begin
  body := '<ns:pKluczUzytkownika>' + UserKey + '</ns:pKluczUzytkownika>'#13#10;
  FSessionId := GetResponse('Zaloguj', body);
  Result := FSessionId <> '';
end;

procedure TWyszukiwarkaRegon.Logout;
var
  body: string;
begin
  body := '<ns:pIdentyfikatorSesji>' + FSessionId + '</ns:pIdentyfikatorSesji>'#13#10;
  GetResponse('Wyloguj', body);
end;

procedure TWyszukiwarkaRegon.GetErrorMessage;
var
  body: string;
begin
  body := '<ns:DaneKomunikat/>'#13#10;
  FErrorMessage := GetResponse('DaneKomunikat', body);
end;

function TWyszukiwarkaRegon.XMLFromResponse(const Response: string): IXMLDocument;
begin
  if Response <> '' then
  begin
    Result := TXMLDocument.Create(nil);
    Result.Active := True;
    Result.LoadFromXML(Response);
  end
  else
    Result := nil;
end;

end.
