object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 439
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object splSitViewer: TSplitter
    Left = 0
    Top = 293
    Width = 775
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 57
    ExplicitWidth = 773
  end
  object grSitViewer: TDBGrid
    Left = 0
    Top = 51
    Width = 775
    Height = 242
    Align = alClient
    DataSource = dsSitViewer
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grSitViewerDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Data'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IpServidor'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Servico'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Classe'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Metodo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EventoLog'
        Width = 55
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 296
    Width = 775
    Height = 143
    Align = alBottom
    DataField = 'texto'
    DataSource = dsSitViewer
    TabOrder = 1
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 51
    Align = alTop
    TabOrder = 2
    object cbSitViewer: TComboBox
      Left = 83
      Top = 6
      Width = 66
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = '[ Todos ]'
      OnSelect = cbSitViewerSelect
      Items.Strings = (
        '[ Todos ]'
        'Sql'
        'Info'
        'Erro')
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Abrir Log...'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object dsSitViewer: TDataSource
    DataSet = FDSitViewer
    Left = 112
    Top = 368
  end
  object openDialog: TOpenDialog
    DefaultExt = '.txt'
    FileName = '.txt'
    InitialDir = 'C:'
    Left = 184
    Top = 368
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 720
  end
  object FDSitViewer: TFDSitViewer
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 720
    Top = 56
    object FDSitViewerData: TStringField
      DisplayWidth = 10
      FieldName = 'Data'
      Size = 10
    end
    object FDSitViewerHora: TStringField
      DisplayWidth = 8
      FieldName = 'Hora'
      Size = 8
    end
    object FDSitViewerIpServidor: TStringField
      DisplayWidth = 15
      FieldName = 'IpServidor'
      Size = 15
    end
    object FDSitViewerBase: TStringField
      DisplayWidth = 20
      FieldName = 'Base'
    end
    object FDSitViewerServico: TStringField
      DisplayWidth = 12
      FieldName = 'Servico'
      Size = 100
    end
    object FDSitViewerClasse: TStringField
      DisplayWidth = 7
      FieldName = 'Classe'
      Size = 50
    end
    object FDSitViewerMetodo: TStringField
      DisplayWidth = 6
      FieldName = 'Metodo'
      Size = 50
    end
    object FDSitViewerEventoLog: TStringField
      DisplayWidth = 10
      FieldName = 'EventoLog'
      Size = 4
    end
    object FDSitViewerTexto: TStringField
      DisplayWidth = 5000
      FieldName = 'Texto'
      Size = 5000
    end
  end
end
