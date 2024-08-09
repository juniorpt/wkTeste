object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Delphi'
  ClientHeight = 620
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 71
    Align = alTop
    TabOrder = 0
    DesignSize = (
      751
      71)
    object btnProdutos: TBitBtn
      Left = 10
      Top = 17
      Width = 66
      Height = 48
      Caption = 'Produtos'
      TabOrder = 0
      WordWrap = True
      OnClick = btnProdutosClick
    end
    object btnPedidos: TBitBtn
      Left = 98
      Top = 17
      Width = 66
      Height = 48
      Caption = 'Pedidos'
      TabOrder = 1
      WordWrap = True
      OnClick = btnPedidosClick
    end
    object btnFechar1: TBitBtn
      Left = 666
      Top = 13
      Width = 66
      Height = 48
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Default = True
      TabOrder = 2
      WordWrap = True
      OnClick = btnFechar1Click
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 71
    Width = 751
    Height = 531
    Align = alClient
    TabOrder = 1
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 602
    Width = 751
    Height = 18
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl2: TLabel
      Left = 440
      Top = 8
      Width = 3
      Height = 15
      Visible = False
    end
    object statInformacao: TStatusBar
      Left = 1
      Top = 1
      Width = 344
      Height = 16
      Align = alLeft
      Panels = <
        item
          Width = 175
        end>
    end
    object statConsulta: TStatusBar
      Left = 345
      Top = 1
      Width = 405
      Height = 16
      Align = alClient
      Panels = <
        item
          Width = 250
        end
        item
          Width = 50
        end>
      SimplePanel = True
    end
    object pb1: TProgressBar
      Left = 376
      Top = 1
      Width = 150
      Height = 17
      TabOrder = 2
      Visible = False
    end
  end
end
