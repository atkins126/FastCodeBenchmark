object AboutForm: TAboutForm
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 213
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 209
    Height = 161
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 57
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000000000330077000000000000000000000000003B077070
        000000000000000000000000BB807007000000000000000000000300B0007000
        70000000000000000000330070070700070000000000000000003B0700700070
        00700000000000000000BB800700000700070000000000000300B00070000000
        7000700000000000330070070000000007000700000000003B07007000000000
        0070070000000000BB800700000000000007070000000300B000700000000070
        000077000000330070070000000007000000803300003B070070000000000000
        000800330000BB8007000000000000000080BBBB0300B0007000000000700000
        08000BB0330070070000000707000000803300003B0700700000007070000008
        00330000BB8007000000070700000080BBBB0000B00070000000007000000800
        0BB0000070070000000007000000803300000000707000007770000000080033
        0000000087000007070700000080BBBB00000000080000077777000008000BB0
        0000000000800007070700008033000000000000000800007770000800330000
        000000000000800000000080BBBB00000000000000000800000008000BB00000
        0000000000000080000080330000000000000000000000080008003300000000
        00000000000000008080BBBB00000000000000000000000008000BB000000000
        00000000FFFF33FFFFFF21FFFFFF00FFFFFB007FFFF3003FFFF2001FFFF0000F
        FFB00007FF300003FF200003FF000003FB000003F3000000F2000000F0000010
        B00000393000000F2000000F0000010F0000039F000000FF000000FF000010FF
        800039FFC0000FFFE0000FFFF0010FFFF8039FFFFC00FFFFFE00FFFFFF10FFFF
        FFB9FFFF}
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 8
      Top = 80
      Width = 148
      Height = 26
      Caption = 'Product Name: CompareText Benchmark and Validation Tool'
      WordWrap = True
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 112
      Width = 94
      Height = 13
      Caption = 'Copyright: Fastcode'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 136
      Width = 155
      Height = 13
      Caption = 'Author: Dennis Kjaer Christensen'
      WordWrap = True
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 71
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
