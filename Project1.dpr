program Project1;

uses
  Vcl.Forms,
  MonitorSIt in 'MonitorSIt.pas' {frmSitViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSitViewer, frmSitViewer);
  Application.Run;
end.
