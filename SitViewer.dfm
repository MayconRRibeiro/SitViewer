object frmSitViewer: TfrmSitViewer
  Left = 0
  Top = 0
  Caption = 'Gerenciador - Sit Viewer'
  ClientHeight = 451
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splSitViewer: TSplitter
    Left = 0
    Top = 311
    Width = 775
    Height = 1
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -1
    ExplicitTop = 272
  end
  object pcTop: TPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 311
    ActivePage = tsSitViewer
    Align = alClient
    TabOrder = 0
    object tsDirectory: TTabSheet
      Caption = 'Arquivos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object splMiddleDirectory: TSplitter
        Left = 369
        Top = 0
        Width = 1
        Height = 283
        ExplicitHeight = 286
      end
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 283
        Align = alLeft
        TabOrder = 0
        object dlBox: TDirectoryListBox
          Left = 1
          Top = 1
          Width = 367
          Height = 281
          Align = alClient
          FileList = flBox
          TabOrder = 0
          OnKeyDown = dlBoxKeyDown
        end
      end
      object pnlRight: TPanel
        Left = 370
        Top = 0
        Width = 397
        Height = 283
        Align = alClient
        TabOrder = 1
        object flBox: TFileListBox
          Left = 1
          Top = 1
          Width = 395
          Height = 281
          Align = alClient
          ItemHeight = 13
          Mask = '*.txt'
          TabOrder = 0
          OnDblClick = flBoxDblClick
        end
      end
    end
    object tsSitViewer: TTabSheet
      AlignWithMargins = True
      Caption = 'Data'
      ImageIndex = 1
      object grSitViewer: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 755
        Height = 211
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = dsSitViewer
        DrawingStyle = gdsGradient
        ParentBiDiMode = False
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
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Classe'
            Width = 159
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Metodo'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EventoLog'
            Width = 55
            Visible = True
          end>
      end
      object pnlTop: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 755
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object grpGridFilter: TGroupBox
          Left = 0
          Top = -2
          Width = 755
          Height = 51
          Caption = ' Filtros '
          TabOrder = 0
          object lblFilterEventoLog: TLabel
            Left = 608
            Top = 21
            Width = 58
            Height = 13
            Caption = 'EventoLog :'
          end
          object cbSitViewer: TComboBox
            Left = 671
            Top = 18
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
        end
      end
    end
    object tsDataOptions: TTabSheet
      Caption = 'Op'#231#245'es'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object pnlBot: TPanel
    Left = 0
    Top = 312
    Width = 775
    Height = 139
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pcBottom: TPageControl
      Left = 1
      Top = 1
      Width = 773
      Height = 137
      ActivePage = tsTexto
      Align = alClient
      TabOrder = 0
      object tsTexto: TTabSheet
        Caption = 'Texto'
        object dbMmTexto: TDBMemo
          Left = 0
          Top = 0
          Width = 765
          Height = 109
          Align = alClient
          DataField = 'Texto'
          DataSource = dsSitViewer
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsDetalhes: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbdfData: TLabel
          Left = 21
          Top = 5
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object lbdfIpServidor: TLabel
          Left = 21
          Top = 43
          Width = 50
          Height = 13
          Caption = 'IpServidor'
        end
        object lbdfBase: TLabel
          Left = 21
          Top = 62
          Width = 23
          Height = 13
          Caption = 'Base'
        end
        object lbdfHora: TLabel
          Left = 21
          Top = 24
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object lbdfServico: TLabel
          Left = 297
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Servico'
        end
        object lbdfClasse: TLabel
          Left = 297
          Top = 22
          Width = 31
          Height = 13
          Caption = 'Classe'
        end
        object lbdfMetodo: TLabel
          Left = 21
          Top = 81
          Width = 36
          Height = 13
          Caption = 'Metodo'
        end
        object lbdfEventoLog: TLabel
          Left = 297
          Top = 41
          Width = 51
          Height = 13
          Caption = 'EventoLog'
        end
        object lblData: TLabel
          Left = 98
          Top = 5
          Width = 3
          Height = 13
        end
        object lblHora: TLabel
          Left = 98
          Top = 24
          Width = 3
          Height = 13
        end
        object lblIpServidor: TLabel
          Left = 98
          Top = 43
          Width = 3
          Height = 13
        end
        object lblBase: TLabel
          Left = 98
          Top = 62
          Width = 3
          Height = 13
        end
        object lblMetodo: TLabel
          Left = 98
          Top = 81
          Width = 3
          Height = 13
        end
        object lblServico: TLabel
          Left = 386
          Top = 3
          Width = 3
          Height = 13
        end
        object lblClasse: TLabel
          Left = 386
          Top = 22
          Width = 3
          Height = 13
        end
        object lblEventoLog: TLabel
          Left = 386
          Top = 41
          Width = 3
          Height = 13
        end
      end
    end
  end
  object dsSitViewer: TDataSource
    DataSet = FDSitViewer
    Left = 360
    Top = 160
  end
  object openDialog: TOpenDialog
    DefaultExt = '.txt'
    FileName = '.txt'
    InitialDir = 'C:'
    Left = 440
    Top = 160
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 720
  end
  object FDSitViewer: TFDSitViewer
    AfterScroll = FDSitViewerAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 616
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
