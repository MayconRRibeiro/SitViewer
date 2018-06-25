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
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FDSitViewer;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ComboBox1: TComboBox;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    FDSitViewer.ReadLogTxt(OpenDialog1.FileName);
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
begin
  FDSitViewer.Filter := Format('eventoLog = %s',[QuotedStr(Combobox1.Text)]);
  FDSitViewer.Filtered := True;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if FDSitViewer.FieldByName('EventoLog').AsString = 'Erro'
 then
  DBGrid1.Canvas.Brush.Color:=clRed;
 DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
