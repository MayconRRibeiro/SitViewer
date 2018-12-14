unit FDSitViewer;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  nIndexSitViewer = (svData,svHora,svIpServidor,svGuid,svExecutavel,svBase,
    svServico,svClasse,svMetodo,svEventoLog);

type
  TFDSitViewer = class(TFDMemTable)
  private
    procedure GetValueLogTxt(pLogData: TFDMemTable;const pSlRegister: TStringList);
    procedure InitSitViewer;
    function getSvTexto(const pSlRegister: TStringList): integer;
    function FixLineRegister(var pnIndexLine: integer;const pslArchive: TStringList): string;
  public
    procedure ReadLogTxt(psFileName: String);
  end;

procedure Register;

implementation

type
  TStringListHelper = class helper for TStringList
    function GetValue(const pIndice: integer): string;
  end;

procedure TFDSitViewer.ReadLogTxt(psFileName: String);
var
  nIndexLine: integer;
  slArchive: TStringList;
  slRegister: TStringList;
  sOriginalLine: string;
  sFormattedLine: string;
  nTextPosition:integer;
  lFileStream: TFileStream;
begin
  slArchive := TStringList.Create;
  lFileStream := TFileStream.Create(psFileName, fmOpenRead or fmShareDenyNone);
  try
    slArchive.LoadFromStream(lFileStream);

    slRegister := TStringList.Create;
    try
      slRegister.Delimiter := ';';
      slRegister.StrictDelimiter := True;

      nIndexLine := 0;
      InitSitViewer;
      Self.EmptyDataSet;
      while nIndexLine < slArchive.Count do
      begin
        sOriginalLine := slArchive[nIndexLine];
        nTextPosition := Pos('texto='.ToUpper, sOriginalLine.ToUpper);

        if nTextPosition = 0 then
        begin
          sOriginalLine := FixLineRegister(nIndexLine,slArchive);
          nTextPosition := Pos('texto='.ToUpper, sOriginalLine.ToUpper);
          Self.Delete;
        end;

        sFormattedLine := Copy(sOriginalLine, 1, nTextPosition);
        sFormattedLine := StringReplace(sFormattedLine, ',', ';', [rfReplaceAll]);
        sFormattedLine := sFormattedLine +
          Copy(sOriginalLine, nTextPosition, sOriginalLine.Length);

        slRegister.DelimitedText := sFormattedLine;
        GetValueLogTxt(Self,slRegister);
        nIndexLine := Succ(nIndexLine);
      end;
    finally
      FreeAndNil(slRegister);
    end;
  finally
    FreeAndNil(slArchive);
    lFileStream.Free;
  end;
end;

procedure TFDSitViewer.GetValueLogTxt(pLogData: TFDMemTable;const pSlRegister: TStringList);
var
  svTexto: integer;
begin
  svTexto := getSvTexto(pSlRegister);
  with pSlRegister do
  begin
    pLogData.AppendRecord(
      [
        GetValue(Ord(svData)),
        GetValue(Ord(svHora)),
        GetValue(Ord(svIpServidor)),
        GetValue(Ord(svBase)),
        GetValue(Ord(svServico)),
        GetValue(Ord(svClasse)),
        GetValue(Ord(svMetodo)),
        GetValue(Ord(svEventoLog)),
        GetValue(svTexto)
      ]
    );
  end;
end;

procedure TFDSitViewer.InitSitViewer;
begin
  if not Self.Active then
    Self.Open;
end;

function TFDSitViewer.FixLineRegister(var pnIndexLine: integer;const pslArchive: TStringList): string;
var
  sLine: string;
begin
  sLine := pslArchive[Pred(pnIndexLine)];
  while Pos('data="', pslArchive[pnIndexLine]) = 0 do
  begin
    sLine := sLine+pslArchive[pnIndexLine];
    pnIndexLine := Succ(pnIndexLine);
  end;
  pnIndexLine := Pred(pnIndexLine);
  result := sLine;
end;

function TFDSitViewer.getSvTexto(const pSlRegister: TStringList): integer;
var
  svTexto: integer;
begin
  svTexto := 10;
  if pSlRegister.GetValue(svTexto).Length <= 5 then
    svTexto := 11;
  result := svTexto;
end;

{ TStringListHelper }

function TStringListHelper.GetValue(const pIndice: integer): string;
var
  EqualsPosition: integer;
begin
  EqualsPosition := Pos('=', Self[pIndice].Trim);
  result := (Copy(Self[pIndice].Trim, EqualsPosition + 2, Self[pIndice].Trim.Length - EqualsPosition - 2)).Trim;
end;

procedure Register;
begin
  RegisterComponents('DB1', [TFDSitViewer]);
end;

end.
