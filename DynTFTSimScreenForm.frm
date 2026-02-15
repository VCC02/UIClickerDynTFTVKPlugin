object frmDynTFTSimScreen: TfrmDynTFTSimScreen
  Left = 444
  Height = 984
  Top = 242
  Width = 798
  Caption = 'DynTFT SimScreen'
  ClientHeight = 984
  ClientWidth = 798
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  LCLVersion = '8.4'
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  object imgScreen: TImage
    Left = 8
    Height = 929
    Top = 47
    Width = 782
    Anchors = [akTop, akLeft, akRight, akBottom]
    OnMouseDown = imgScreenMouseDown
    OnMouseMove = imgScreenMouseMove
    OnMouseUp = imgScreenMouseUp
  end
  object lblScreenWidth: TLabel
    Left = 120
    Height = 13
    Top = 2
    Width = 68
    Caption = 'Screen Width:'
    ParentColor = False
  end
  object lblScreenHeight: TLabel
    Left = 363
    Height = 13
    Top = 2
    Width = 71
    Caption = 'Screen Height:'
    ParentColor = False
  end
  object lblWidth: TLabel
    Left = 136
    Height = 41
    Top = 27
    Width = 10
    AutoSize = False
    Color = clRed
    ParentColor = False
    Transparent = False
    Visible = False
  end
  object lblHeight: TLabel
    Left = 424
    Height = 14
    Top = 27
    Width = 52
    AutoSize = False
    Color = clRed
    ParentColor = False
    Transparent = False
    Visible = False
  end
  object pnlCoords: TPanel
    Left = 8
    Height = 27
    Top = 7
    Width = 105
    Caption = 'pnlCoords'
    ParentBackground = False
    TabOrder = 0
  end
  object trbScreenWidth: TTrackBar
    Left = 232
    Height = 26
    Top = 8
    Width = 104
    Max = 1024
    Position = 0
    OnChange = trbScreenWidthChange
    TabOrder = 1
  end
  object trbScreenHeight: TTrackBar
    Left = 493
    Height = 26
    Top = 8
    Width = 105
    Max = 1024
    Position = 0
    OnChange = trbScreenHeightChange
    TabOrder = 2
  end
  object chkShowWidthLine: TCheckBox
    Left = 120
    Height = 17
    Top = 21
    Width = 97
    Caption = 'Show Width Line'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = chkShowWidthLineClick
  end
  object chkShowHeightLine: TCheckBox
    Left = 363
    Height = 17
    Top = 21
    Width = 100
    Caption = 'Show Height Line'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = chkShowHeightLineClick
  end
  object tmrStartup: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmrStartupTimer
    Left = 632
    Top = 160
  end
end
