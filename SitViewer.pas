unit SitViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Comp.BatchMove.Text, FireDAC.Stan.Intf, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FDSitViewer,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.FileCtrl, Vcl.Mask;

type
  TfrmSitViewer = class(TForm)
    dsSitViewer: TDataSource;
    openDialog: TOpenDialog;
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
    pnlBot: TPanel;
    splSitViewer: TSplitter;
    pcBottom: TPageControl;
    tsTexto: TTabSheet;
    tsDetalhes: TTabSheet;
    lbdfData: TLabel;
    lbdfIpServidor: TLabel;
    lbdfBase: TLabel;
    lbdfHora: TLabel;
    lbdfServico: TLabel;
    lbdfClasse: TLabel;
    lbdfMetodo: TLabel;
    lbdfEventoLog: TLabel;
    dbMmTexto: TDBMemo;
    lblData: TLabel;
    lblHora: TLabel;
    lblIpServidor: TLabel;
    lblBase: TLabel;
    lblMetodo: TLabel;
    lblServico: TLabel;
    lblClasse: TLabel;
    lblEventoLog: TLabel;
    lbRegisters: TLabel;
    lbQtRegisters: TLabel;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    cdsFilterSitViewer: TClientDataSet;
    dsFilterSitViewer: TDataSource;
    cdsFilterSitViewerData: TStringField;
    cdsFilterSitViewerHora: TStringField;
    cdsFilterSitViewerIpServidor: TStringField;
    cdsFilterSitViewerBase: TStringField;
    cdsFilterSitViewerServico: TStringField;
    cdsFilterSitViewerClasse: TStringField;
    cdsFilterSitViewerMetodo: TStringField;
    cdsFilterSitViewerEventoLog: TStringField;
    cdsFilterSitViewerTexto: TStringField;
    pcTop: TPageControl;
    tsDirectory: TTabSheet;
    splMiddleDirectory: TSplitter;
    pnlLeft: TPanel;
    dlBox: TDirectoryListBox;
    pnlRight: TPanel;
    flBox: TFileListBox;
    tsSitViewer: TTabSheet;
    grSitViewer: TDBGrid;
    grFilterSitViewer: TDBGrid;
    edtFiltro: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure cbFilterEventoLogSelect(Sender: TObject);
    procedure grSitViewerDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure flBoxDblClick(Sender: TObject);
    procedure dlBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FDSitViewerAfterScroll(DataSet: TDataSet);
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure cbFilterMetodoSelect(Sender: TObject);
    procedure grFilterSitViewerKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetLabelValueInDetailsTab;
  end;

var
  frmSitViewer: TfrmSitViewer;

implementation

uses
  IniFiles;

{$R *.dfm}

procedure TfrmSitViewer.BitBtn1Click(Sender: TObject);
begin
  If openDialog.Execute then
    FDSitViewer.ReadLogTxt(openDialog.FileName);
end;

procedure TfrmSitViewer.cbFilterEventoLogSelect(Sender: TObject);
begin
  FDSitViewer.Filter := EmptyStr;
  {if cbFilterEventoLog.ItemIndex <> 0 then
    FDSitViewer.Filter := Format('eventoLog = %s', [QuotedStr(cbFilterEventoLog.Text)]);
  }
  FDSitViewer.Filtered := True;
end;

procedure TfrmSitViewer.cbFilterMetodoSelect(Sender: TObject);
begin
  FDSitViewer.Filter := EmptyStr;
  {if cbFilterMetodo.ItemIndex <> 0 then
    FDSitViewer.Filter := Format('Metodo = %s', [QuotedStr(cbFilterMetodo.Text)]);}
  FDSitViewer.Filtered := True;
end;

procedure TfrmSitViewer.dlBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RIGHT then
    dlBox.OpenCurrent;
end;

procedure TfrmSitViewer.edtFiltroKeyPress(Sender: TObject; var Key: Char);
var
  sFieldsFilter: TStringBuilder;
  i: Integer;
begin
  if Key <> #13 then
    Exit;

  FDSitViewer.DisableControls;
  try
    FDSitViewer.Filtered := False;

    FDSitViewer.FilterOptions := [foCaseInsensitive,foNoPartialCompare];

    sFieldsFilter := TStringBuilder.Create;
    for i := 0 to Pred(grSitViewer.Columns.Count) do
    begin
      sFieldsFilter.Append(Format('%s Like %s',[grSitViewer.Columns[i].FieldName,
        QuotedStr('%' + edtFiltro.Text + '%')]));
      if i < Pred(grSitViewer.Columns.Count) then
        sFieldsFilter.Append(' Or ');
    end;

    FDSitViewer.Filter := sFieldsFilter.ToString;
    FDSitViewer.Filtered := True;
  finally
    FDSitViewer.EnableControls;
  end;
end;

procedure TfrmSitViewer.FDSitViewerAfterScroll(DataSet: TDataSet);
begin
  SetLabelValueInDetailsTab;
end;

procedure TfrmSitViewer.flBoxDblClick(Sender: TObject);
begin
  if flBox.ItemIndex < 0 then
    Exit;

  FDSitViewer.ReadLogTxt(flBox.FileName);
  FDSitViewer.First;
  pcTop.ActivePage := tsSitViewer;
end;

procedure TfrmSitViewer.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  lFileName: string;
  sInitialDirectory: string;
begin
  sInitialDirectory := 'C:\LogSit';
  lFileName := ExtractFilePath(ParamStr(0)) + 'SitViewer.ini';
  IniFile := TIniFile.Create(lFileName);

  dlBox.Directory := IniFile.ReadString('Options', 'Directory', sInitialDirectory);
  dlBox.Directory := sInitialDirectory;

  IniFile.Free;
  pcTop.ActivePage := tsDirectory;
  pcBottom.ActivePage := tsDetalhes;

  cdsFilterSitViewer.AppendRecord([]);
end;

procedure TfrmSitViewer.grFilterSitViewerKeyPress(Sender: TObject; var Key: Char);
var
  nGrColumnIndex: Integer;
  sGrColumnName: String;
begin
  if Key = #13 then
  begin
    if (cdsFilterSitViewer.state in dsEditModes) then
      cdsFilterSitViewer.Post;

    nGrColumnIndex := grFilterSitViewer.SelectedIndex;
    sGrColumnName := grFilterSitViewer.SelectedField.FieldName;

    FDSitViewer.Filtered := False;

    FDSitViewer.FilterOptions := [foCaseInsensitive,foNoPartialCompare];

    if grFilterSitViewer.Fields[nGrColumnIndex].AsString.IsEmpty then
      Exit;

      cdsFilterSitViewer.Filter := Format('%s = %s',[
        sGrColumnName, grFilterSitViewer.Fields[nGrColumnIndex].AsString.QuotedString]);

      FDSitViewer.Filter := cdsFilterSitViewer.Filter;
      FDSitViewer.Filtered := True;
  end;
end;

procedure TfrmSitViewer.grSitViewerDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if FDSitViewer.FieldByName('EventoLog').AsString = 'Erro' then
    grSitViewer.Canvas.Brush.Color := $006262FF;
  grSitViewer.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSitViewer.SetLabelValueInDetailsTab;
begin
  lblData.Caption := FDSitViewer.FieldByName('Data').AsString;
  lblHora.Caption := FDSitViewer.FieldByName('Hora').AsString;
  lblIpServidor.Caption := FDSitViewer.FieldByName('IpServidor').AsString;
  lblBase.Caption := FDSitViewer.FieldByName('Base').AsString;
  lblMetodo.Caption := FDSitViewer.FieldByName('Metodo').AsString;
  lblServico.Caption := FDSitViewer.FieldByName('Servico').AsString;
  lblClasse.Caption := FDSitViewer.FieldByName('Classe').AsString;
  lblEventoLog.Caption := FDSitViewer.FieldByName('EventoLog').AsString;
  lbQtRegisters.Caption := IntToStr(FDSitViewer.RecordCount);
end;

end.
