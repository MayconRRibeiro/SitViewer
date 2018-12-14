object frmSitViewer: TfrmSitViewer
  Left = 0
  Top = 0
  Caption = 'Gerenciador - Sit Viewer DB1'
  ClientHeight = 453
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
    Top = 313
    Width = 775
    Height = 1
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -1
    ExplicitTop = 272
  end
  object pnlBot: TPanel
    Left = 0
    Top = 314
    Width = 775
    Height = 139
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
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
        DesignSize = (
          765
          109)
        object lbdfData: TLabel
          Left = 21
          Top = 5
          Width = 27
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfIpServidor: TLabel
          Left = 21
          Top = 43
          Width = 54
          Height = 13
          Caption = 'IpServidor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfBase: TLabel
          Left = 21
          Top = 62
          Width = 27
          Height = 13
          Caption = 'Base:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfHora: TLabel
          Left = 21
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Hora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfServico: TLabel
          Left = 297
          Top = 3
          Width = 39
          Height = 13
          Caption = 'Servico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfClasse: TLabel
          Left = 297
          Top = 22
          Width = 35
          Height = 13
          Caption = 'Classe:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfMetodo: TLabel
          Left = 21
          Top = 81
          Width = 40
          Height = 13
          Caption = 'Metodo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbdfEventoLog: TLabel
          Left = 297
          Top = 41
          Width = 55
          Height = 13
          Caption = 'EventoLog:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblData: TLabel
          Left = 93
          Top = 5
          Width = 3
          Height = 13
        end
        object lblHora: TLabel
          Left = 93
          Top = 24
          Width = 3
          Height = 13
        end
        object lblIpServidor: TLabel
          Left = 93
          Top = 43
          Width = 3
          Height = 13
        end
        object lblBase: TLabel
          Left = 93
          Top = 62
          Width = 3
          Height = 13
        end
        object lblMetodo: TLabel
          Left = 93
          Top = 81
          Width = 3
          Height = 13
        end
        object lblServico: TLabel
          Left = 381
          Top = 3
          Width = 3
          Height = 13
        end
        object lblClasse: TLabel
          Left = 381
          Top = 22
          Width = 3
          Height = 13
        end
        object lblEventoLog: TLabel
          Left = 381
          Top = 41
          Width = 3
          Height = 13
        end
        object lbRegisters: TLabel
          Left = 716
          Top = 94
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Registros'
        end
        object lbQtRegisters: TLabel
          Left = 709
          Top = 94
          Width = 3
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight, akBottom]
        end
      end
    end
  end
  object pcTop: TPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 313
    ActivePage = tsSitViewer
    Align = alClient
    TabOrder = 1
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
        Height = 285
        ExplicitHeight = 286
      end
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 285
        Align = alLeft
        TabOrder = 0
        object dlBox: TDirectoryListBox
          Left = 1
          Top = 1
          Width = 367
          Height = 283
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
        Height = 285
        Align = alClient
        TabOrder = 1
        object flBox: TFileListBox
          Left = 1
          Top = 1
          Width = 395
          Height = 283
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
      Caption = 'Log Sit'
      ImageIndex = 1
      object grSitViewer: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 48
        Width = 755
        Height = 207
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = dsSitViewer
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
            Width = 74
            Visible = True
          end>
      end
      object grFilterSitViewer: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 755
        Height = 39
        Align = alTop
        BiDiMode = bdLeftToRight
        DataSource = dsFilterSitViewer
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentBiDiMode = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyPress = grFilterSitViewerKeyPress
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
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Servico'
            Width = 130
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
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EventoLog'
            Width = 73
            Visible = True
          end>
      end
      object edtFiltro: TEdit
        Left = 0
        Top = 258
        Width = 761
        Height = 21
        Align = alBottom
        TabOrder = 2
        TextHint = 'Filtro'
        OnKeyPress = edtFiltroKeyPress
      end
    end
  end
  object dsSitViewer: TDataSource
    DataSet = FDSitViewer
    Left = 642
    Top = 214
  end
  object openDialog: TOpenDialog
    DefaultExt = '.txt'
    FileName = '.txt'
    InitialDir = 'C:'
    Left = 722
    Top = 214
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
    Left = 618
    Top = 164
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
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 722
    Top = 164
  end
  object cdsFilterSitViewer: TClientDataSet
    PersistDataPacket.Data = {
      0E0100009619E0BD0100000018000000090000000000030000000E0104446174
      610100490000000100055749445448020002000A0004486F7261010049000000
      01000557494454480200020008000A49705365727669646F7201004900000001
      00055749445448020002000F0004426173650100490000000100055749445448
      020002001400075365727669636F010049000000010005574944544802000200
      640006436C617373650100490000000100055749445448020002003200064D65
      746F646F0100490000000100055749445448020002003200094576656E746F4C
      6F67010049000000010005574944544802000200040005546578746F02004900
      000001000557494454480200020088130000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 617
    Top = 115
    object cdsFilterSitViewerData: TStringField
      DisplayWidth = 10
      FieldName = 'Data'
      Size = 10
    end
    object cdsFilterSitViewerHora: TStringField
      DisplayWidth = 8
      FieldName = 'Hora'
      Size = 8
    end
    object cdsFilterSitViewerIpServidor: TStringField
      DisplayWidth = 15
      FieldName = 'IpServidor'
      Size = 15
    end
    object cdsFilterSitViewerBase: TStringField
      DisplayWidth = 20
      FieldName = 'Base'
    end
    object cdsFilterSitViewerServico: TStringField
      DisplayWidth = 12
      FieldName = 'Servico'
      Size = 100
    end
    object cdsFilterSitViewerClasse: TStringField
      DisplayWidth = 7
      FieldName = 'Classe'
      Size = 50
    end
    object cdsFilterSitViewerMetodo: TStringField
      DisplayWidth = 6
      FieldName = 'Metodo'
      Size = 50
    end
    object cdsFilterSitViewerEventoLog: TStringField
      DisplayWidth = 10
      FieldName = 'EventoLog'
      Size = 4
    end
    object cdsFilterSitViewerTexto: TStringField
      DisplayWidth = 5000
      FieldName = 'Texto'
      Size = 5000
    end
  end
  object dsFilterSitViewer: TDataSource
    DataSet = cdsFilterSitViewer
    Left = 719
    Top = 123
  end
end
