unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

uses
  Xml.XMLDoc,
  XML.XMLIntf,
  UslugaBIRzewnPubl,
  WyszukiwarkaRegon,
  ImportGUSTypes;

{$R *.dfm}

type
  TX = record
    NIP,
    Name,
    Street,
    Number,
    PostalCode,
    City,
    Country: string;

    ErrorMsg: string;
  end;


type
  TGetFullReport = function (ANIP: WideString): TFullReportResult; stdcall;

procedure TForm1.Button2Click(Sender: TObject);
var
  Handle: HMODULE;
  GetFullReport: TGetFullReport;
  x: TFullReportResult;
begin
  Handle := LoadLibrary('ImportGUS.dll');
  if Handle <> 0 then
  begin
    @GetFullReport := GetProcAddress(Handle, 'GetFullReport');
    if @GetFullReport <> nil then
    begin
      x := GetFullReport('7712925749');
    end;
    FreeLibrary(Handle);
  end;
end;

procedure TForm1.FormClick(Sender: TObject);
const
  UserKey = 'c2799aa3ac934df4a3c9';
  NIP = '7712925749';
var
  wyszukiwarka: TWyszukiwarkaRegon;
  node: IXMLNode;
  x: TX;
begin
  try
    wyszukiwarka := TWyszukiwarkaRegon.Create;
    if wyszukiwarka.Login(UserKey) then
    begin
      if wyszukiwarka.InfoByNIP(NIP) then
      begin
        node := wyszukiwarka.SearchResult.ChildNodes.FindNode('root').ChildNodes.FindNode('dane');
        x.NIP := NIP;
        x.Name := node.ChildNodes.FindNode('Nazwa').Text;
        x.Street := node.ChildNodes.FindNode('Ulica').Text;
        x.Number := '';
        x.PostalCode := node.ChildNodes.FindNode('KodPocztowy').Text;
        x.City := node.ChildNodes.FindNode('Miejscowosc').Text;
        x.Country := '';

        node := node.ChildNodes.FindNode('Regon');
        if (node <> nil) and (node.text <> '') then
        begin
          if wyszukiwarka.FullReport(node.Text) then
          begin
            wyszukiwarka.SearchResult.SaveToFile('P:\!temp\test.xml');
            node := wyszukiwarka.SearchResult.ChildNodes.FindNode('root').ChildNodes.FindNode('dane');
            if (node <> nil) and node.HasChildNodes  then
            begin
              x.NIP := NIP;
              x.Name := node.ChildNodes.FindNode('praw_nazwa').Text;
              x.Street := node.ChildNodes.FindNode('praw_adSiedzUlica_Nazwa').Text;
              x.Number := node.ChildNodes.FindNode('praw_adSiedzNumerNieruchomosci').Text;
              x.PostalCode := node.ChildNodes.FindNode('praw_adSiedzKodPocztowy').Text;
              x.City := node.ChildNodes.FindNode('praw_adSiedzMiejscowosc_Nazwa').Text;
              x.Country := node.ChildNodes.FindNode('praw_adSiedzKraj_Nazwa').Text;
            end;
          end
          else
            x.ErrorMsg := wyszukiwarka.ErrorMessage;
        end;
      end
      else
        x.ErrorMsg := wyszukiwarka.ErrorMessage;
      wyszukiwarka.Logout;
    end
    else
      x.ErrorMsg := 'Cannot login';
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;


  Caption := x.ErrorMsg;
end;


end.
