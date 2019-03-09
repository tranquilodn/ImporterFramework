program AppExample;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMainForm},
  Framework.Interfaces in '..\Framework\Framework.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
