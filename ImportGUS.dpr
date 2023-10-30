library ImportGUS;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  XML.XMLIntf,
  UslugaBIRzewnPubl in 'UslugaBIRzewnPubl.pas',
  WyszukiwarkaRegon in 'WyszukiwarkaRegon.pas',
  ImportGUSTypes in 'ImportGUSTypes.pas';

{$R *.res}

const
  UserKey = 'c2799aa3ac934df4a3c9';

function GetFullReport(ANIP: WideString): TFullReportResult; stdcall;
var
  wyszukiwarka: TWyszukiwarkaRegon;
  node: IXMLNode;
begin
  wyszukiwarka := TWyszukiwarkaRegon.Create;
  if wyszukiwarka.Login(UserKey) then
  begin
    if wyszukiwarka.InfoByNIP(ANIP) then
    begin
      node := wyszukiwarka.SearchResult.ChildNodes.FindNode('root').ChildNodes.FindNode('dane');
      node := node.ChildNodes.FindNode('Regon');
      if (node <> nil) and (node.Text <> '') then
      begin
        if wyszukiwarka.FullReport(node.Text) then
        begin
          node := wyszukiwarka.SearchResult.ChildNodes.FindNode('root').ChildNodes.FindNode('dane');
          if (node <> nil) and node.HasChildNodes  then
          begin
            Result.NIP := ANIP;
            Result.Name := node.ChildNodes.FindNode('praw_nazwa').Text;
            Result.Street := node.ChildNodes.FindNode('praw_adSiedzUlica_Nazwa').Text;
            Result.Number := node.ChildNodes.FindNode('praw_adSiedzNumerNieruchomosci').Text;
            Result.LocalNo := node.ChildNodes.FindNode('praw_adSiedzNumerLokalu').Text;
            Result.PostalCode := node.ChildNodes.FindNode('praw_adSiedzKodPocztowy').Text;
            Result.City := node.ChildNodes.FindNode('praw_adSiedzMiejscowosc_Nazwa').Text;
            Result.Country := node.ChildNodes.FindNode('praw_adSiedzKraj_Nazwa').Text;
          end;
        end
        else
          Result.ErrorMsg := wyszukiwarka.ErrorMessage;
      end
      else
        Result.ErrorMsg := wyszukiwarka.ErrorMessage;
    end
    else
      Result.ErrorMsg := 'Unable to log in.';
  end;
end;



exports
  GetFullReport;

begin
end.
