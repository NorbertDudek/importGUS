unit ImportGUSTypes;

interface

type
  TFullReportResult = packed record
    NIP,
    Name,
    Street,
    Number,
    LocalNo,
    PostalCode,
    City,
    Country: WideString;
    ErrorMsg: WideString;
  end;

  TGetFullReportProc = function (ANIP: WideString): TFullReportResult; stdcall;

function GetFullReport(ANIP: string): TFullReportResult;

implementation
uses
  Windows;

function GetFullReport(ANIP: string): TFullReportResult;
var
  Handle: HMODULE;
  GetFullReportProc: TGetFullReportProc;
begin
  Handle := LoadLibrary('ImportGUS.dll');
  if Handle <> 0 then
  begin
    @GetFullReportProc := GetProcAddress(Handle, 'GetFullReport');
    if @GetFullReportProc <> nil then
      Result := GetFullReportProc(ANIP)
    else
      Result.ErrorMsg := 'GetFullReport function missing from library.';
    FreeLibrary(Handle);
  end
  else
    Result.ErrorMsg := 'Unable to load ImportGUS.dll library.';
end;

end.
