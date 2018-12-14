program SitDB1Project;

uses
  Vcl.Forms,
  SitViewer in 'SitViewer.pas' {frmSitViewer},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSitViewer, frmSitViewer);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
