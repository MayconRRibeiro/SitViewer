unit FDSitViewer;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFDSitViewer = class(TFDMemTable)
  private
    procedure GetValueLogTxt(pLogData: TFDMemTable; pSlRegistro: TStringList);
    procedure InitSitViewer;
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
  nCont: Integer;
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

procedure TFDSitViewer.GetValueLogTxt(pLogData: TFDMemTable; pSlRegistro: TStringList);
var
  fieldName: String;
  fieldValue: String;
  qtFields: Integer;
  nCont: Integer;
begin
  InitSitViewer;
  with pSlRegistro do
  begin
  pLogData.AppendRecord(
    [
      GetValue(0),
      GetValue(1),
      GetValue(2),
      GetValue(5),
      GetValue(6),
      GetValue(7),
      GetValue(8),
      GetValue(9),
      GetValue(10)
    ]
  );
  end;
end;

procedure TFDSitViewer.InitSitViewer;
begin
  if not Self.Active then
    Self.Open;
end;

{ TStringListHelper }

function TStringListHelper.GetValue(const pIndice: integer): string;
var
  PosicaoIgual: integer;
begin
  PosicaoIgual := Pos('=', Self[pIndice].Trim);
  result := (Copy(Self[pIndice].Trim, PosicaoIgual + 2, Self[pIndice].Trim.Length - PosicaoIgual - 2)).Trim;
end;

procedure Register;
begin
  RegisterComponents('DB1', [TFDSitViewer]);
end;

end.
