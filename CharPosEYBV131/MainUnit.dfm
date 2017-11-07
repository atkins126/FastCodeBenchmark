object MainForm: TMainForm
  Left = 156
  Top = 134
  Caption = 'CharPosEY B & V Tool for Fastcode Version 1.3.1'
  ClientHeight = 658
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Validation'
  end
  object Label2: TLabel
    Left = 8
    Top = 160
    Width = 54
    Height = 13
    Caption = 'Benchmark'
  end
  object Label3: TLabel
    Left = 792
    Top = 56
    Width = 71
    Height = 13
    Caption = 'SpreadBench1'
  end
  object Label4: TLabel
    Left = 791
    Top = 96
    Width = 71
    Height = 13
    Caption = 'SpreadBench2'
  end
  object Label5: TLabel
    Left = 791
    Top = 136
    Width = 74
    Height = 13
    Caption = 'Max Spread [%]'
  end
  object Label6: TLabel
    Left = 791
    Top = 176
    Width = 72
    Height = 13
    Caption = 'Function Name'
  end
  object Label7: TLabel
    Left = 791
    Top = 368
    Width = 97
    Height = 13
    Caption = 'Alignment Spread[%]'
  end
  object Label8: TLabel
    Left = 791
    Top = 408
    Width = 81
    Height = 13
    Caption = 'Function Name 1'
  end
  object Label9: TLabel
    Left = 791
    Top = 448
    Width = 81
    Height = 13
    Caption = 'Function Name 2'
  end
  object Label10: TLabel
    Left = 480
    Top = 56
    Width = 67
    Height = 13
    Caption = 'Functionname'
  end
  object Label11: TLabel
    Left = 728
    Top = 56
    Width = 54
    Height = 13
    Caption = 'Benchmark'
  end
  object Label12: TLabel
    Left = 624
    Top = 56
    Width = 87
    Height = 13
    Caption = 'FunctionAlignment'
  end
  object Label13: TLabel
    Left = 791
    Top = 288
    Width = 94
    Height = 13
    Caption = 'AlignSpreadBench1'
  end
  object Label14: TLabel
    Left = 791
    Top = 328
    Width = 94
    Height = 13
    Caption = 'AlignSpreadBench2'
  end
  object ValidateButton: TButton
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Validate'
    TabOrder = 4
    OnClick = ValidateButtonClick
  end
  object ValidationEdit: TEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'ValidationEdit'
  end
  object BitBtn1: TBitBtn
    Left = 847
    Top = 608
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkClose
  end
  object ReportRichEdit: TRichEdit
    Left = 480
    Top = 72
    Width = 305
    Height = 529
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'ReportRichEdit')
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 8
  end
  object BenchmarkButton: TButton
    Left = 32
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Benchmark'
    TabOrder = 3
    OnClick = BenchmarkButtonClick
  end
  object RuntimeEdit: TEdit
    Left = 8
    Top = 176
    Width = 121
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    Text = 'RuntimeEdit'
  end
  object FunctionSelectionRadioGroup: TRadioGroup
    Left = 136
    Top = 72
    Width = 338
    Height = 577
    Caption = 'Function Selection'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'CharPosEY_Sha_Pas_1_a'
      'CharPosEY_Sha_Pas_1_b'
      'CharPosEY_Sha_Pas_1_c'
      'CharPosEY_Sha_Pas_1_d'
      'CharPosEY_Sha_Pas_2_a'
      'CharPosEY_Sha_Pas_2_b'
      'CharPosEY_Sha_Pas_2_c'
      'CharPosEY_Sha_Pas_2_d'
      'CharPosEY_Sha_Pas_3_a'
      'CharPosEY_Sha_Pas_3_b'
      'CharPosEY_Sha_Pas_3_c'
      'CharPosEY_Sha_Pas_3_d'
      'CharPosEY_Sha_Asm_1_a'
      'CharPosEY_Sha_Asm_1_b'
      'CharPosEY_Sha_Asm_1_c'
      'CharPosEY_Sha_Asm_1_d'
      'CharPosEY_DKC_Pas_6_a'
      'CharPosEY_DKC_Pas_6_b'
      'CharPosEY_DKC_Pas_6_c'
      'CharPosEY_DKC_Pas_6_d'
      'CharPosEY_DKC_IA32_16_a'
      'CharPosEY_DKC_IA32_16_b'
      'CharPosEY_DKC_IA32_16_c'
      'CharPosEY_DKC_IA32_16_d'
      'CharPosEY_DKC_IA32_18_a'
      'CharPosEY_DKC_IA32_18_b'
      'CharPosEY_DKC_IA32_18_c'
      'CharPosEY_DKC_IA32_18_d'
      'CharPosEY_DKC_IA32_19_a'
      'CharPosEY_DKC_IA32_19_b'
      'CharPosEY_DKC_IA32_19_c'
      'CharPosEY_DKC_IA32_19_d'
      'CharPosEY_JOH_PAS_a'
      'CharPosEY_JOH_PAS_b'
      'CharPosEY_JOH_PAS_c'
      'CharPosEY_JOH_PAS_d'
      'CharPosEY_JOH_IA32_a'
      'CharPosEY_JOH_IA32_b'
      'CharPosEY_JOH_IA32_c'
      'CharPosEY_JOH_IA32_d'
      'CharPosEY_JOH_PAS_2_a'
      'CharPosEY_JOH_PAS_2_b'
      'CharPosEY_JOH_PAS_2_c'
      'CharPosEY_JOH_PAS_2_d'
      'CharPosEY_JOH_IA32_2_a'
      'CharPosEY_JOH_IA32_2_b'
      'CharPosEY_JOH_IA32_2_c'
      'CharPosEY_JOH_IA32_2_d'
      'CharPosEY_JOH_PAS_1_a'
      'CharPosEY_JOH_PAS_1_b'
      'CharPosEY_JOH_PAS_1_c'
      'CharPosEY_JOH_PAS_1_d'
      'CharPosEY_JOH_PAS_3_a'
      'CharPosEY_JOH_PAS_3_b'
      'CharPosEY_JOH_PAS_3_c'
      'CharPosEY_JOH_PAS_3_d'
      'CharPosEY_JOH_IA32_1_a'
      'CharPosEY_JOH_IA32_1_b'
      'CharPosEY_JOH_IA32_1_c'
      'CharPosEY_JOH_IA32_1_d'
      'CharPosEY_JOH_IA32_3_a'
      'CharPosEY_JOH_IA32_3_b'
      'CharPosEY_JOH_IA32_3_c'
      'CharPosEY_JOH_IA32_3_d'
      'CharPosEY_JOH_PAS_4_a'
      'CharPosEY_JOH_PAS_4_b'
      'CharPosEY_JOH_PAS_4_c'
      'CharPosEY_JOH_PAS_4_d'
      'CharPosEY_JOH_IA32_4_a'
      'CharPosEY_JOH_IA32_4_b'
      'CharPosEY_JOH_IA32_4_c'
      'CharPosEY_JOH_IA32_4_d')
    TabOrder = 10
    OnClick = FunctionSelectionRadioGroupClick
  end
  object BenchmarkAllButton: TButton
    Left = 680
    Top = 608
    Width = 97
    Height = 41
    Caption = 'Benchmark All'
    TabOrder = 0
    OnClick = BenchmarkAllButtonClick
  end
  object SpreadBench1Edit: TEdit
    Left = 791
    Top = 72
    Width = 121
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Text = 'SpreadBench1Edit'
  end
  object SpreadBench2Edit: TEdit
    Left = 791
    Top = 112
    Width = 121
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = 'SpreadBench2Edit'
  end
  object ValidateAllButton: TButton
    Left = 568
    Top = 608
    Width = 97
    Height = 41
    Caption = 'Validate All'
    TabOrder = 1
    OnClick = ValidateAllButtonClick
  end
  object ClearButton: TButton
    Left = 480
    Top = 608
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 13
    OnClick = ClearButtonClick
  end
  object MaxSpreadBenchPercentageEdit: TEdit
    Left = 791
    Top = 152
    Width = 121
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 14
    Text = 'MaxSpreadBenchPercentageEdit'
    OnClick = MaxSpreadBenchPercentageEditClick
  end
  object FunctionNameEdit: TEdit
    Left = 791
    Top = 192
    Width = 145
    Height = 21
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
    Text = 'FunctionNameEdit'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 41
    Align = alTop
    TabOrder = 16
    object SaveReportSpeedButton: TSpeedButton
      Left = 16
      Top = 8
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      OnClick = SaveReportSpeedButtonClick
    end
    object PrintReportSpeedButton: TSpeedButton
      Left = 48
      Top = 8
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = PrintReportSpeedButtonClick
    end
  end
  object BenchTestButton: TButton
    Left = 815
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Bench Test'
    TabOrder = 2
    OnClick = BenchTestButtonClick
  end
  object AlignFunctionName1Edit: TEdit
    Left = 791
    Top = 424
    Width = 145
    Height = 21
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 17
    Text = 'AlignFunctionName1Edit'
  end
  object AlignFunctionName2Edit: TEdit
    Left = 791
    Top = 464
    Width = 145
    Height = 21
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 18
    Text = 'AlignFunctionName2Edit'
  end
  object AlignMaxSpreadBenchPercentageEdit: TEdit
    Left = 791
    Top = 384
    Width = 121
    Height = 21
    Hint = 
      'Spread due to differences in code alignment inclusive measuremen' +
      't errors'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 19
    Text = 'AlignMaxSpreadBenchPercentageEdit'
  end
  object SpreadTestButton: TButton
    Left = 815
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Spread Test'
    TabOrder = 5
    OnClick = SpreadTestButtonClick
  end
  object CleanResultsButton: TButton
    Left = 815
    Top = 496
    Width = 75
    Height = 25
    Hint = 
      'Removes multiple results from same function. Preserves the faste' +
      'st result'
    Caption = 'Clean Results'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = CleanResultsButtonClick
  end
  object CharPosEdit: TEdit
    Left = 8
    Top = 376
    Width = 121
    Height = 21
    TabOrder = 21
    Text = 'CharPosEdit'
    Visible = False
  end
  object AlignSpreadBench1Edit: TEdit
    Left = 791
    Top = 304
    Width = 121
    Height = 21
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 22
    Text = 'AlignSpreadBench1Edit'
  end
  object AlignSpreadBench2Edit: TEdit
    Left = 791
    Top = 344
    Width = 121
    Height = 21
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 23
    Text = 'AlignSpreadBench2Edit'
  end
  object ErrorTrapOnCheckBox: TCheckBox
    Left = 16
    Top = 256
    Width = 97
    Height = 17
    Caption = 'Errortrap On'
    TabOrder = 24
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 48
    Top = 280
  end
end
