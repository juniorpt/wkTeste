unit uFrmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uProcutosController, uDMProduto, Vcl.Imaging.jpeg,
  System.strutils, Vcl.Mask;

type
  TOperacao = (opNovo, opAlterar, opNavegar);
  TImageCarregada = (Img1, Img2, Img3);

  TfrmCadastroProduto = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    dbgPesquisar: TDBGrid;
    dsPesq: TDataSource;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    pnlTitulo: TPanel;
    pnlImage: TPanel;
    imgPoster: TImage;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    edtNome: TEdit;
    lblDescricao: TLabel;
    edtPreco: TEdit;
    lblPrecoVenda: TLabel;
    edtImg2: TEdit;
    edtImg1: TEdit;
    edtImg3: TEdit;
    btnAnterior: TButton;
    btnProximo: TButton;
    lblImagem: TLabel;
    shpCodProduto: TShape;
    shpDescricao: TShape;
    shpPrecoVenda: TShape;
    Shape4: TShape;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgPesquisarDblClick(Sender: TObject);
    procedure imgPosterDblClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao: TOperacao;
    FImageCarregada: TImageCarregada;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarProduto;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aoperacao: TOperacao);
    procedure CarregaImagem(pNomeBotao: string);
  public
    { Public declarations }

  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses
  uProdutosModel;

{$R *.dfm}

procedure TfrmCadastroProduto.Alterar;
var
  oProduto            : TProdutos;
  oProdutoController  : TProdutosController;
  sErro               : string;
  jp                  : TJpegimage;
  g                   : TGraphic;
begin
  oProduto            := TProdutos.Create;
  oProdutoController  := TProdutosController.Create;
  sErro               := '';


  try
    with oProduto do
    begin
      COD_PRODUTO   := StrToIntDef(EdtCodigo.Text, 0);
      DESCRICAO     := edtNome.Text;
      PRECOVENDA    := StrToFloatDef(edtPreco.Text, 0);
      Imagem1       := edtImg1.Text;
      Imagem2       := edtImg2.Text;
      Imagem3       := edtImg3.Text;
    end;

    if oProdutoController.Alterar(oProduto, sErro) = False then
      raise Exception.Create(sErro)
    else
      Application.MessageBox('Produto alterado com sucesso!', 'Informação', mb_ok + MB_ICONINFORMATION);
  finally
    FreeAndNil(oProduto);
    FreeAndNil(oProdutoController);
  end;


end;

procedure TfrmCadastroProduto.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TfrmCadastroProduto.btnAnteriorClick(Sender: TObject);
begin
  CarregaImagem('Anterior');
end;

procedure TfrmCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TfrmCadastroProduto.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadastroProduto.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmCadastroProduto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroProduto.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);

end;

procedure TfrmCadastroProduto.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfrmCadastroProduto.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
  edtCodigo.Text  := '';
  edtNome.Text    := '';
  edtPreco.Text   := '';
  edtImg1.Text    := '';
  edtImg2.Text    := '';
  edtImg3.Text    := '';
  imgPoster.Picture := nil;
end;

procedure TfrmCadastroProduto.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCadastroProduto.btnProximoClick(Sender: TObject);
begin
  CarregaImagem('Proximo');
end;


procedure TfrmCadastroProduto.CarregaImagem(pNomeBotao: string);
var
  iNroImagem : Integer;
begin
  if pNomeBotao = 'Novo' then
    iNroImagem := 0
  else
    iNroImagem := StrToIntDef((Copy(lblImagem.Caption, Length(lblImagem.Caption))), 0);

  if pNomeBotao = 'Anterior' then
  begin
     iNroImagem := iNroImagem - 1;
  end else if pNomeBotao = 'Proximo' then
     iNroImagem := iNroImagem + 1;

  case iNroImagem of
    0, 1: begin
      imgPoster.Picture.LoadFromFile(IfThen(Trim(edtImg1.Text) = '', GetCurrentDir + '\..\..\..\imgs\carregando.jpg', edtImg1.Text));
      FImageCarregada     := Img1;
      btnAnterior.Enabled := False;
      btnProximo.Enabled  := True;
      lblImagem.Caption   := 'Imagem 1';
    end;

    2: begin
      imgPoster.Picture.LoadFromFile(IfThen(Trim(edtImg2.Text) = '', GetCurrentDir + '\..\..\..\imgs\carregando.jpg', edtImg2.Text));
      FImageCarregada     := Img2;
      btnAnterior.Enabled := True;
      btnProximo.Enabled  := True;
      lblImagem.Caption   := 'Imagem 2';
    end;

    3: begin
      imgPoster.Picture.LoadFromFile(IfThen(Trim(edtImg3.Text) = '', GetCurrentDir + '\..\..\..\imgs\carregando.jpg', edtImg3.Text));
      FImageCarregada     := Img3;
      btnAnterior.Enabled := True;
      btnProximo.Enabled  := False;
      lblImagem.Caption   := 'Imagem 3';
    end;

  end;
  lblImagem.Left      := Trunc(pnlImage.Left + ((pnlImage.Width - lblImagem.Width)/2));
end;

procedure TfrmCadastroProduto.CarregarProduto;
var
  oProduto            : TProdutos;
  oProdutoController  : TProdutosController;
begin
  oProduto            := TProdutos.Create;
  oProdutoController  := TProdutosController.Create;

  try
    oProdutoController.CarregarProduto(oProduto, dsPesq.DataSet.FieldByName('COD_Produto').AsInteger);
    with oProduto do
    begin
      EdtCodigo.Text        := IntToStr(COD_PRODUTO);
      edtNome.Text          := DESCRICAO;
      edtPreco.Text         := FloatToStr(PRECOVENDA);
      edtImg1.Text          := Imagem1;
      edtImg2.Text          := Imagem2;
      edtImg3.Text          := Imagem3;

      CarregaImagem('Novo');
      if Trim(edtImg1.Text) <> '' then
      begin
        imgPoster.Picture.LoadFromFile(edtImg1.Text);
        FImageCarregada := Img1;
        btnAnterior.Enabled := False;
        btnProximo.Enabled  := True;
      end;

    end;
  finally
    FreeAndNil(oProdutoController);
    FreeAndNil(oProduto);
  end;

end;

procedure TfrmCadastroProduto.Configuracoes;
begin
  tbPesq.TabVisible       := False;
  tbDados.TabVisible      := False;
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TfrmCadastroProduto.dbgPesquisarDblClick(Sender: TObject);
begin
   Detalhar;
end;

procedure TfrmCadastroProduto.Detalhar;
begin
  CarregarProduto;
  FOperacao               := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
  HabilitarControles(opNavegar);
end;

procedure TfrmCadastroProduto.Excluir;
var
  oProdutoController : TProdutosController;
  sErro    : string;
begin
  oProdutoController := TProdutosController.Create;
  sErro    := '';

  try
    if (dmProdutos.cdsPesquisar.Active) and (dmProdutos.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir este produto: ' + edtNome.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
      begin
        if oProdutoController.Excluir(dmProdutos.cdsPesquisar.FieldByName('COD_PRODUTO').AsInteger, sErro) = False then
           raise Exception.Create(sErro);
        oProdutoController.Pesquisar(edtPesquisar.Text);
      end;
    end
    else
    begin
      raise Exception.Create('Não há registro para ser excluido!');
    end;


  finally
    FreeAndNil(oProdutoController);

  end;

end;

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  dmProdutos := TdmProdutos.Create(nil);
end;

procedure TfrmCadastroProduto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmProdutos);
end;

procedure TfrmCadastroProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmCadastroProduto.Gravar;
var
  oProdutosController : TProdutosController;
begin
  oProdutosController := TProdutosController.Create;
  try
    case FOperacao of
      opNovo: Inserir ;
      opAlterar: Alterar;
    end;
    oProdutosController.Pesquisar(edtPesquisar.Text);

  finally
    FreeAndNil(oProdutosController);
  end;

end;

procedure TfrmCadastroProduto.HabilitarControles(aoperacao: TOperacao);
begin
  case aoperacao of
    opNovo, opAlterar:
    begin
      edtNome.Enabled           := True;
      edtPreco.Enabled          := True;
      imgPoster.Enabled         := True;
      btnListar.Enabled         := False;
      btnFechar.Enabled         := False;
      btnAlterar.Enabled        := False;
      btnGravar.Enabled         := True;
      btnCancelar.Enabled       := True;
      edtNome.SetFocus;
    end;
    opNavegar:
    begin
      edtNome.Enabled           := False;
      edtPreco.Enabled          := False;
      imgPoster.Enabled         := False;
      btnListar.Enabled         := True;
      btnFechar.Enabled         := True;
      btnAlterar.Enabled        := True;
      btnGravar.Enabled         := False;
      btnCancelar.Enabled       := False;
    end;
  end;

end;

procedure TfrmCadastroProduto.imgPosterDblClick(Sender: TObject);
var
 dlgOpenPicture : TOpenDialog;
begin
 dlgOpenPicture := TOpenDialog.Create(self);

 try

   dlgOpenPicture.InitialDir := GetCurrentDir + '..\..\..\imgs';
   dlgOpenPicture.Options := [ofFileMustExist];
   dlgOpenPicture.Filter := 'Imagens Jpg|*.jpg;*.jpeg';
//   dlgOpenPicture.FilterIndex := 2;

    if dlgOpenPicture.Execute then
    begin
      case FImageCarregada of
        Img1: begin
          edtImg1.Text := dlgOpenPicture.FileName;
          imgPoster.Picture.LoadFromFile(edtImg1.Text);
        end;
        Img2: begin
          edtImg2.Text := dlgOpenPicture.FileName;
          imgPoster.Picture.LoadFromFile(edtImg2.Text);
        end;
        Img3: begin
          edtImg3.Text := dlgOpenPicture.FileName;
          imgPoster.Picture.LoadFromFile(edtImg3.Text);
        end;
      end;

    end
    else
    begin
      ShowMessage('Cancelada a operação');
    end;

 finally
   FreeAndNil(dlgOpenPicture);
 end;

end;

procedure TfrmCadastroProduto.Inserir;
var
  oProduto            : TProdutos;
  oProdutoController  : TProdutosController;
  sErro               : string;
begin
  oProduto            := TProdutos.Create;
  oProdutoController  := TProdutosController.Create;
  sErro               := '';

  try
    with oProduto do
    begin
      DESCRICAO   := edtNome.Text;
      PRECOVENDA  := StrToFloatDef(edtPreco.Text, 0);
      Imagem1     := edtImg1.Text;
      Imagem2     := edtImg2.Text;
      Imagem3     := edtImg3.Text;
    end;

    if oProdutoController.Inserir(oProduto, sErro) = False then
      raise Exception.Create(sErro)
    else
      Application.MessageBox('Produto cadastrado com sucesso!', 'Informação', mb_ok + MB_ICONINFORMATION);

  finally
    FreeAndNil(oProduto);
    FreeAndNil(oProdutoController);
  end;


end;

procedure TfrmCadastroProduto.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
  HabilitarControles(opNavegar);
end;

procedure TfrmCadastroProduto.Novo;
begin
  FOperacao               := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TfrmCadastroProduto.Pesquisar;
var
  oProdutosController: TProdutosController;
begin
  oProdutosController := TProdutosController.Create;
  try
    oProdutosController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oProdutosController);
  end;
end;

end.

