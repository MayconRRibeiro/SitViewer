program SitDB1Project;

uses
  Vcl.Forms,
  SitViewer in 'SitViewer.pas' {frmSitViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSitViewer, frmSitViewer);
  Application.Run;
end.
