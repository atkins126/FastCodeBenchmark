object fBenchmark: TfBenchmark
  Left = 179
  Top = 89
  Caption = 'Fastcode MM challenge B&V'
  ClientHeight = 561
  ClientWidth = 865
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    865
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object gbBenchmarks: TGroupBox
    Left = 8
    Top = 4
    Width = 774
    Height = 323
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Benchmarks'
    TabOrder = 0
    DesignSize = (
      774
      323)
    object bRunSelectedBenchmark: TBitBtn
      Left = 393
      Top = 194
      Width = 369
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Run Selected Benchmark'
      TabOrder = 0
      OnClick = bRunSelectedBenchmarkClick
    end
    object bRunAllCheckedBenchmarks: TBitBtn
      Left = 393
      Top = 226
      Width = 369
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Run All Checked Benchmarks'
      TabOrder = 1
      OnClick = bRunAllCheckedBenchmarksClick
    end
    object mBenchmarkDescription: TMemo
      Left = 8
      Top = 196
      Width = 378
      Height = 115
      Anchors = [akLeft, akRight, akBottom]
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object ValidateButton: TBitBtn
      Left = 393
      Top = 286
      Width = 181
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Validate'
      TabOrder = 3
      OnClick = ValidateButtonClick
    end
    object RunTimeEdit: TEdit
      Left = 393
      Top = 258
      Width = 369
      Height = 21
      Anchors = [akRight, akBottom]
      ReadOnly = True
      TabOrder = 4
    end
    object ExtraValidateButton: TBitBtn
      Left = 577
      Top = 286
      Width = 185
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Extra Validate'
      TabOrder = 5
      OnClick = ValidateButtonClick
    end
    object ListViewBenchmarks: TListView
      Left = 8
      Top = 16
      Width = 754
      Height = 175
      Anchors = [akLeft, akTop, akRight, akBottom]
      Checkboxes = True
      Columns = <
        item
          Caption = 'Benchmarks'
          Width = 200
        end
        item
          Caption = 'Category'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'Speed Weigth'
          Width = 80
        end
        item
          Alignment = taRightJustify
          Caption = 'Mem Usage Weigth'
          Width = 110
        end
        item
          Alignment = taRightJustify
          Caption = 'Relative Weigth'
          Width = 90
        end
        item
          Alignment = taRightJustify
          Caption = 'Global Weigth'
          Width = 80
        end>
      ColumnClick = False
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenuBenchmarks
      TabOrder = 6
      ViewStyle = vsReport
      OnSelectItem = ListViewBenchmarksSelectItem
    end
  end
  object BitBtn1: TBitBtn
    Left = 683
    Top = 533
    Width = 101
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
  object bGraph: TBitBtn
    Left = 8
    Top = 531
    Width = 101
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'View Graphs'
    TabOrder = 2
    OnClick = bGraphClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 332
    Width = 775
    Height = 196
    ActivePage = TabSheetScores
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TabSheetBenchmarkResults: TTabSheet
      Caption = 'Benchmark Results'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ListViewResults: TListView
        Left = 0
        Top = 36
        Width = 767
        Height = 132
        Align = alClient
        Columns = <
          item
            Caption = 'Benchmark'
          end
          item
            Caption = 'Memory Manager'
          end
          item
            Caption = 'Time Ran'
          end
          item
            Alignment = taRightJustify
            Caption = 'Ticks (M)'
          end
          item
            Alignment = taRightJustify
            Caption = 'Peak Addr Space (K)'
          end
          item
            Caption = 'CurrentSession'
            Width = 0
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnCompare = ListViewResultsCompare
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 767
        Height = 36
        AutoSize = True
        ButtonHeight = 36
        ButtonWidth = 107
        Caption = 'ToolBar1'
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 1
        object ToolButtonCopyResults: TToolButton
          Left = 0
          Top = 0
          Caption = 'Copy to Clipboard'
          ImageIndex = 0
          OnClick = ToolButtonCopyResultsClick
        end
        object bRenameMM: TToolButton
          Left = 107
          Top = 0
          Caption = 'Rename MM'
          ImageIndex = 3
          OnClick = bRenameMMClick
        end
        object ToolButton1: TToolButton
          Left = 214
          Top = 0
          Caption = 'Delete results for MM'
          ImageIndex = 2
          OnClick = ToolButton1Click
        end
        object ToolButtonDeleteResults: TToolButton
          Left = 321
          Top = 0
          Caption = 'Delete All Results'
          ImageIndex = 1
          OnClick = ToolButtonDeleteResultsClick
        end
      end
    end
    object TabSheetValidation: TTabSheet
      Caption = 'Validation Results'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoValidation: TMemo
        Left = 0
        Top = 0
        Width = 767
        Height = 168
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetProgress: TTabSheet
      Caption = 'Progress'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object mResults: TMemo
        Left = 0
        Top = 0
        Width = 767
        Height = 168
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetScores: TTabSheet
      Caption = 'Scores'
      ImageIndex = 3
      object MemoScores: TMemo
        Left = 0
        Top = 0
        Width = 767
        Height = 168
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'MemoScores')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetCPU: TTabSheet
      Caption = 'Environment'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoCPU: TMemo
        Left = 0
        Top = 0
        Width = 767
        Height = 168
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object btnCopySummary: TBitBtn
    Left = 120
    Top = 531
    Width = 161
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Copy Summary to Clipboard'
    TabOrder = 4
    OnClick = btnCopySummaryClick
  end
  object ImageList1: TImageList
    Left = 4
    Top = 280
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0000000000000000000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000000005B7000005B6000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F000000000000000000000000000005D8000005
      BA000005B7000005B700000000000000000000000000000000000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF00000000000000000000000000000000000000
      00000005B7000005B7000005B600000000000005B6000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000005B6000005C8000005C8000005CD000005B400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F000000000000000000000000000000
      000000000000000000000005C1000005C1000005D80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000005B6000005D8000005CD000005D8000005E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000808000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000005E3000005D8000005D40000000000000000000005E3000005EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000000000808000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000005
      F2000005D8000005EF00000000000000000000000000000000000005F2000005
      F200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000005F2000005
      F2000005F2000000000000000000000000000000000000000000000000000005
      F2000005F2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000808000008080000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000005F2000005F2000005
      F200000000000000000000000000000000000000000000000000000000000000
      0000000000000005F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF0000000000000000000005F2000005F2000005F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000005F2000005F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      C003C003C0030000DFFBC003DFFB0000DDFBC003DFFB0000D8FBC003DFFB0000
      D27BC003DFFB0000D73BC003DFFB0000DF9BC003DFFB0000DFCBC003DFFB0000
      DFEBC003DFFB0000DFFBC003DFFB0000DFFBC003DFFB0000C003C003C0030000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FC00FFFC847FFC00FC009FF900EFFC00
      FC008FF331BF2000FC0087E739FF00000000C3CF993F00000000F11FCA1F0000
      0000F83FF40F00000000FC7F9C0700000023F83F960300000001F19FCB010000
      0000E3CFFF80E0000023C7E7F7C0F80000638FFBFFE0F00000C31FFFEFF0E001
      01073FFFFFF8C40303FFFFFFFFFCEC0700000000000000000000000000000000
      000000000000}
  end
  object PopupMenuBenchmarks: TPopupMenu
    Images = ImageList1
    Left = 28
    Top = 44
    object PopupClearAllCheckMarks: TMenuItem
      Caption = 'Clear All Check Marks'
      ImageIndex = 6
      OnClick = PopupClearAllCheckMarksClick
    end
    object PopupSelectAllCheckMarks: TMenuItem
      Caption = 'Check All Benchmarks'
      ImageIndex = 4
      OnClick = PopupSelectAllCheckMarksClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllDefaultBenchmarks: TMenuItem
      Caption = 'Check All Default Benchmarks'
      ImageIndex = 5
      OnClick = PopupCheckAllDefaultBenchmarksClick
    end
    object PopupCheckAllThreadedBenchmarks: TMenuItem
      Caption = 'Check Special Thread Benchmarks'
      OnClick = PopupCheckAllThreadedBenchmarksClick
    end
  end
end
