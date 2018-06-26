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
  nCont: integer;
  slArchive: TStringList;
  slRegister: TStringList;
  sLine: string;
  nTextPosition:integer;
begin
  slArchive := TStringList.Create;
  try
    slArchive.LoadFromFile(psFileName);

    slRegister := TStringList.Create;
    try
      slRegister.Delimiter := ';';
      slRegister.StrictDelimiter := True;

      for nCont := 0 to Pred(slArchive.Count) do
      begin
        sLine := slArchive[nCont];
        nTextPosition := Pos('texto=', sLine);

        sLine := Copy(sLine, 1, nTextPosition);
        sLine := StringReplace(sLine, ',', ';', [rfReplaceAll]);
        sLine := sLine + Copy(slArchive[nCont], nTextPosition, slArchive[nCont].Length);

        slRegister.DelimitedText := sLine;
        GetValueLogTxt(Self,slRegister);
      end;
    finally
      FreeAndNil(slRegister);
    end;
  finally
    FreeAndNil(slArchive);
  end;
end;

procedure TFDSitViewer.GetValueLogTxt(pLogData: TFDMemTable;const pSlRegister: TStringList);
var
  svTexto: integer;
begin
  InitSitViewer;
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

function TFDSitViewer.getSvTexto(const pSlRegister: TStringList): integer;
var
  svTexto: integer;
begin
  svTexto := 10;
{ //Item a Discutir  {
if (pSlRegister.GetValue(Ord(svMetodo)) = 'Execute') Or
    (pSlRegister.GetValue(Ord(svMetodo)) = 'Inicializar') Or
    (pSlRegister.GetValue(Ord(svMetodo)) = 'ExecutarServico') then
}
  // <= 5 Equals to Maximum Length of ThreadId Row And we want to Ignore It.
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
