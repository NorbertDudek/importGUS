program GUSAPI;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UslugaBIRzewnPubl in '..\UslugaBIRzewnPubl.pas',
  WyszukiwarkaRegon in '..\WyszukiwarkaRegon.pas',
  ImportGUSTypes in '..\ImportGUSTypes.pas';

{$R *.res}



begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
