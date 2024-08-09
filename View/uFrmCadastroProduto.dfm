object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produtos'
  ClientHeight = 482
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 432
    Width = 722
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFechar: TButton
      Left = 1184
      Top = 5
      Width = 120
      Height = 40
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 722
    Height = 432
    ActivePage = tbDados
    Align = alClient
    TabOrder = 0
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 80
        Align = alTop
        BevelOuter = bvNone
        Color = 8874787
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object edtPesquisar: TLabeledEdit
          Left = 20
          Top = 35
          Width = 400
          Height = 27
          EditLabel.Width = 135
          EditLabel.Height = 18
          EditLabel.Caption = 'Digite para Pesquisar'
          EditLabel.Color = clYellow
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWhite
          EditLabel.Font.Height = -15
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentColor = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object btnPesquisar: TButton
          Left = 500
          Top = 22
          Width = 120
          Height = 40
          Caption = 'Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 354
        Width = 714
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = 8874787
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 500
          Top = 5
          Width = 120
          Height = 40
          Caption = 'Novo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 200
          Top = 5
          Width = 120
          Height = 40
          Caption = 'Detalhar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 350
          Top = 5
          Width = 120
          Height = 40
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object dbgPesquisar: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 83
        Width = 708
        Height = 268
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgPesquisarDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOVENDA'
            Title.Caption = 'Pre'#231'o'
            Width = 100
            Visible = True
          end>
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object Shape4: TShape
        Left = 0
        Top = 0
        Width = 714
        Height = 48
        Align = alTop
        Pen.Color = clWhite
        ExplicitTop = 8
        ExplicitWidth = 1326
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 363
        Width = 714
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = 8874787
        ParentBackground = False
        TabOrder = 0
        object btnListar: TButton
          Left = 328
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 0
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 409
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 490
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 571
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btnCancelarClick
        end
      end
      object pnlTitulo: TPanel
        Left = 0
        Top = 48
        Width = 714
        Height = 315
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = 8874787
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lblCodigo: TLabel
          Left = 16
          Top = 48
          Width = 48
          Height = 18
          Caption = 'C'#243'digo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDescricao: TLabel
          Left = 16
          Top = 103
          Width = 44
          Height = 18
          Caption = 'Nome:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPrecoVenda: TLabel
          Left = 16
          Top = 156
          Width = 41
          Height = 18
          Caption = 'Pre'#231'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblImagem: TLabel
          Left = 530
          Top = 217
          Width = 4
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shpCodProduto: TShape
          Left = 86
          Top = 34
          Width = 90
          Height = 41
          Pen.Color = clWhite
          Shape = stRoundRect
        end
        object shpDescricao: TShape
          Left = 86
          Top = 89
          Width = 363
          Height = 41
          Pen.Color = clWhite
          Shape = stRoundRect
        end
        object shpPrecoVenda: TShape
          Left = 86
          Top = 146
          Width = 90
          Height = 41
          Pen.Color = clWhite
          Shape = stRoundRect
        end
        object pnlImage: TPanel
          Left = 486
          Top = 23
          Width = 142
          Height = 186
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object imgPoster: TImage
            Left = 2
            Top = 2
            Width = 138
            Height = 182
            Cursor = crHandPoint
            Align = alClient
            Stretch = True
            OnDblClick = imgPosterDblClick
            ExplicitTop = 4
            ExplicitHeight = 264
          end
          object edtImg1: TEdit
            Left = 18
            Top = 31
            Width = 103
            Height = 28
            Alignment = taRightJustify
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object edtImg3: TEdit
            Left = 18
            Top = 120
            Width = 103
            Height = 28
            Alignment = taRightJustify
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object edtImg2: TEdit
            Left = 15
            Top = 80
            Width = 103
            Height = 28
            Alignment = taRightJustify
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
        object edtCodigo: TEdit
          Left = 93
          Top = 41
          Width = 80
          Height = 27
          Alignment = taRightJustify
          BorderStyle = bsNone
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtNome: TEdit
          Left = 93
          Top = 96
          Width = 344
          Height = 27
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtPreco: TEdit
          Left = 93
          Top = 151
          Width = 80
          Height = 27
          Alignment = taRightJustify
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object btnAnterior: TButton
          Left = 482
          Top = 250
          Width = 70
          Height = 40
          Caption = '< Imagem Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          WordWrap = True
          OnClick = btnAnteriorClick
        end
        object btnProximo: TButton
          Left = 558
          Top = 250
          Width = 70
          Height = 40
          Caption = 'Pr'#243'xima Imagem >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          WordWrap = True
          OnClick = btnProximoClick
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = dmProdutos.cdsPesquisar
    Left = 244
    Top = 264
  end
end
