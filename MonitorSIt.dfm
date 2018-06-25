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
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 8
    Top = 39
    Width = 721
    Height = 177
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
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
    Left = 8
    Top = 222
    Width = 721
    Height = 149
    DataField = 'texto'
    DataSource = DataSource1
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Abrir Log...'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object ComboBox1: TComboBox
    Left = 89
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    OnSelect = ComboBox1Select
    Items.Strings = (
      'Sql'
      'Info'
      'Error')
  end
  object DataSource1: TDataSource
    DataSet = FDSitViewer
    Left = 112
    Top = 368
  end
  object OpenDialog1: TOpenDialog
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
      Size = 50
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
