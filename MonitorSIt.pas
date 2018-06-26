unit MonitorSIt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Comp.BatchMove.Text, FireDAC.Stan.Intf, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FDSitViewer,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    dsSitViewer: TDataSource;
    grSitViewer: TDBGrid;
    DBMemo1: TDBMemo;
    openDialog: TOpenDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSitViewer: TFDSitViewer;
    FDSitViewerData: TStringField;
    FDSitViewerHora: TStringField;
    FDSitViewerIpServidor: TStringField;
    FDSitViewerBase: TStringField;
    FDSitViewerServico: TStringField;
    FDSitViewerClasse: TStringField;
    FDSitViewerMetodo: TStringField;
    FDSitViewerEventoLog: TStringField;
    FDSitViewerTexto: TStringField;
    pnlTop: TPanel;
    cbSitViewer: TComboBox;
    BitBtn1: TBitBtn;
    splSitViewer: TSplitter;
    procedure BitBtn1Click(Sender: TObject);
    procedure cbSitViewerSelect(Sender: TObject);
    procedure grSitViewerDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  If openDialog.Execute then
    FDSitViewer.ReadLogTxt(openDialog.FileName);
end;

procedure TForm1.cbSitViewerSelect(Sender: TObject);
begin
  FDSitViewer.Filter := EmptyStr;
  if cbSitViewer.ItemIndex <> 0 then
    FDSitViewer.Filter := Format('eventoLog = %s',[QuotedStr(cbSitViewer.Text)]);
  FDSitViewer.Filtered := True;
end;

procedure TForm1.grSitViewerDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if FDSitViewer.FieldByName('EventoLog').AsString = 'Erro'
 then
  grSitViewer.Canvas.Brush.Color:=$006262FF;
 grSitViewer.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
