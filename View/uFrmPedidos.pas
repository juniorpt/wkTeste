unit uFrmPedidos;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, uPedidoController, uDMPedido,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, UPedidoModel, uItemPedidoModel,
  uProdutosModel, uClientesModel, uDadosVendaModel, Vcl.Samples.Spin, Datasnap.DBClient,
  Vcl.Mask, System.StrUtils, Vcl.Grids, Winapi.Messages;

type
  TImageCarregada = (Img1, Img2, Img3);
  TOperacao = (opNovo, opAlterar, opNavegar);

  TfrmPedidos = class(TForm)
    cdsitensVendas: TClientDataSet;
    cdsitensVendascod: TIntegerField;
    cdsitensVendasdescricao: TStringField;
    cdsitensVendasqtd: TIntegerField;
    cdsitensVendasvl_item: TCurrencyField;
    cdsitensVendasTotal_Item: TCurrencyField;
    cdsitensVendasvl_unitario: TCurrencyField;
    cdsitensVendasTotal: TAggregateField;
    cds_itensVendas: TDataSource;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    pnlFiltro: TPanel;
    btnPesquisar: TSpeedButton;
    edtPesquisar: TLabeledEdit;
    pnlBtnsPesq: TPanel;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    dbgPesquisar: TDBGrid;
    tbDados: TTabSheet;
    pnlBtnsCad: TPanel;
    btnListar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlDados: TPanel;
    shpGridProdutosVenda: TShape;
    shpDescricaoProduto: TShape;
    Shape13: TShape;
    Shape5: TShape;
    shapeSatatusCaixa: TShape;
    Shape10: TShape;
    lbPedido: TLabel;
    lblAvisosPedido: TLabel;
    lbStatusCaixa: TLabel;
    lblTotalPedido: TLabel;
    lblProduto: TLabel;
    lblAvisos: TLabel;
    lblCupom: TLabel;
    shpPrecoTotal: TShape;
    shpPrecoUnit: TShape;
    lblPrecoUnitario: TLabel;
    lblPrecoTotal: TLabel;
    shpQuantidade: TShape;
    lblQuantidade: TLabel;
    shpCodProduto: TShape;
    lblCodProduto: TLabel;
    ShpNome: TShape;
    lblNomeCliente: TLabel;
    lblCodCliente: TLabel;
    shpCodCliente: TShape;
    grdVendas: TDBGrid;
    btnAdicionarProduto: TButton;
    editPrecoTotalItem: TEdit;
    editPrecoUnitario: TEdit;
    spnQuantidade: TSpinEdit;
    editCodProduto: TEdit;
    editNomeCliente: TEdit;
    editCodCliente: TEdit;
    btnInicioVenda: TSpeedButton;
    Shape6: TShape;
    dsPesq: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInicioVendaClick(Sender: TObject);
    procedure btnCancelaVendaClick(Sender: TObject);
    procedure editCodClienteExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure editCodProdutoExit(Sender: TObject);
    procedure spnQuantidadeExit(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure edtEntrando(Sender: TObject);
    procedure edtSaindo(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure editPrecoUnitarioExit(Sender: TObject);
    procedure grdVendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdVendasCellClick(Column: TColumn);
  private
    { Private declarations }
    FImageCarregada: TImageCarregada;
    procedure GeraCodigoPedido;
    procedure CarregarPedido;
    function ValidaCampos: Boolean;
    procedure limpaDataSetPedido;
    procedure LocalizaProduto;
    procedure AtualizaTotalItem(oProduto: TProdutos);
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure FinalizaVenda;
    procedure LocalizaCliente;
    procedure CancelaVenda;
    procedure ConfigTela;
    procedure Novo;
    procedure Detalhar;
    procedure Pesquisar;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
  public
    { Public declarations }
    FOperacao: TOperacao;
    procedure HabilitarControles(aOperacao: TOperacao);
  end;

var
  frmPedidos  : TfrmPedidos;
  oPedido     : TPedido;

implementation

{$R *.dfm}

procedure TfrmPedidos.Alterar;
begin

end;

procedure TfrmPedidos.AtualizaTotalItem(oProduto: TProdutos);
begin
  if oProduto.PrecoVenda > 0 then
  begin
    editPrecoTotalItem.Text := formatfloat( '##,###,##0.00', oProduto.PrecoVenda * spnQuantidade.Value);
  end;
end;

procedure TfrmPedidos.btnAdicionarProdutoClick(Sender: TObject);
var
  dPrecoUnitario : Double;
begin
  try
    if ValidaCampos then
    begin
      dPrecoUnitario :=  StrToFloat(StringReplace(editPrecoUnitario.Text, '.', '', [rfReplaceAll]));

      cdsitensVendas.Append;
      cdsitensVendascod.Value         := StrToInt(editCodProduto.Text);
      cdsitensVendasdescricao.Value   := lblProduto.Caption;
      cdsitensVendasqtd.Value         := spnQuantidade.Value;
      cdsitensVendasvl_item.Value     := dPrecoUnitario;
      cdsitensVendasTotal_Item.Value  := dPrecoUnitario * spnQuantidade.Value;
      cdsitensVendas.Post;
      lblTotalPedido.Caption          := formatfloat( '##,###,##0.00', cdsitensVendasTotal.Value);
      oPedido.Vlr_Total               := StrToFloat(StringReplace(lblTotalPedido.Caption, '.', '', [rfReplaceAll]));
      spnQuantidade.MinValue          := 0;
      spnQuantidade.MaxValue          := 0;
      editCodProduto.SetFocus;
    end else
    begin
       Application.MessageBox('Preencha os dados do produto!','Campos inválidos', MB_OK+MB_ICONERROR);
    end;
  finally
     LimpaCampos;
  end;
end;

procedure TfrmPedidos.btnCancelarClick(Sender: TObject);
begin
  CancelaVenda;
end;

procedure TfrmPedidos.btnCancelaVendaClick(Sender: TObject);
begin
  CancelaVenda;
end;

procedure TfrmPedidos.btnDetalheClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmPedidos.btnGravarClick(Sender: TObject);
begin
  FinalizaVenda;
end;

procedure TfrmPedidos.btnInicioVendaClick(Sender: TObject);
begin
  FOperacao := opNovo;
  HabilitarControles(FOperacao);
  oPedido := TPedido.Create;

  try
    lbStatusCaixa.Caption := 'OCUPADO';
    shapeSatatusCaixa.Brush.Color := $004949FC;
    cds_itensVendas.DataSet.Open;
    btnInicioVenda.Enabled := False;
    GeraCodigoPedido;
    editCodCliente.SetFocus;
  finally

  end;
end;

procedure TfrmPedidos.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfrmPedidos.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TfrmPedidos.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPedidos.CancelaVenda;
begin
  if MessageDlg('Deseja cancelar a venda?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    limpaDataSetPedido;
    btnGravar.Enabled             := False;
    lbStatusCaixa.Caption         := 'CAIXA LIVRE';
    shapeSatatusCaixa.Brush.Color := $0000DD00;
    DesabilitaCampos;
    lbPedido.Caption              := '00000';
    editCodCliente.Text           := '';
    editNomeCliente.Text          := '';
    LimpaCampos;
    lblTotalPedido.Caption        := '0,00';
   end;
  FOperacao := opNavegar;
  HabilitarControles(opNavegar);
end;

procedure TfrmPedidos.CarregarPedido;
var
  oPedido            : TPedido;
  oPedidoController  : TPedidoController;
begin
  oPedido            := TPedido.Create;
  oPedidoController  := TPedidoController.Create;

  try
//    oPedidoController.CarregarPedido(oPedido, dsPesq.DataSet.FieldByName('Cod_Pedido').AsInteger);
    with oPedido do
    begin
//      EdtCodigo.Text        := IntToStr(Id_Pedido);
//      edtNome.Text          := Nome;
//      edtPreco.Text         := formatfloat('R$ ###,##0.00', PrecoPedido);
//      edtEstoque.Text       := IntToStr(Estoque);


      HabilitarControles(opNavegar);
    end;
  finally
    FreeAndNil(oPedidoController);
    FreeAndNil(oPedido);
  end;

end;

procedure TfrmPedidos.ConfigTela;
begin
  tbPesq.TabVisible       := False;
  tbDados.TabVisible      := False;
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TfrmPedidos.DesabilitaCampos;
begin
  LimpaCampos;
  editCodProduto.Enabled      := False;
  editCodCliente.Enabled      := False;
  editNomeCliente.Enabled     := False;
  editPrecoUnitario.Enabled   := False;
  editPrecoTotalItem.Enabled  := False;
  spnQuantidade.Enabled       := False;
  btnAdicionarProduto.Enabled := False;
  btnGravar.Enabled           := False;
  btnCancelar.Enabled         := False;
  btnInicioVenda.Enabled      := True;
end;

procedure TfrmPedidos.Detalhar;
begin
  FOperacao               := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
  CarregarPedido;
end;

procedure TfrmPedidos.editCodClienteExit(Sender: TObject);
begin
  edtSaindo(Sender);
  if(editCodCliente.Text <> '') then
  begin
    LocalizaCliente;
  end
  else
  begin
    LimpaCampos;
  end;
end;

procedure TfrmPedidos.editCodProdutoExit(Sender: TObject);
begin
  if editCodProduto.Text <> '' then
    LocalizaProduto;

  if lblProduto.Width > (shpDescricaoProduto.Width -40) then
  begin
    lblProduto.Font.Size := 14;
  end;

end;

procedure TfrmPedidos.editPrecoUnitarioExit(Sender: TObject);
begin
  edtSaindo(Sender);
  editPrecoTotalItem.Text := FormatFloat('##,###,##0.00', StrToFloatDef(editPrecoUnitario.Text, 0) * spnQuantidade.Value);
end;

procedure TfrmPedidos.edtEntrando(Sender: TObject);
begin
 TEdit(Sender).Font.Color := clWhite;
 TEdit(Sender).Color      := $00876B23;
end;

procedure TfrmPedidos.edtSaindo(Sender: TObject);
begin
  TEdit(Sender).Font.Color := clBlack;
  TEdit(Sender).Color      := clWindow;
end;

procedure TfrmPedidos.Excluir;
begin

end;

procedure TfrmPedidos.FinalizaVenda;
var
  item              : TItemPedido;
  oPedidoController : TPedidoController;
  oDadosVenda       : TVenda;
  I                 : Integer;
begin
  oPedidoController := TPedidoController.Create;
  oDadosVenda       := TVenda.Create;
  try
    if(grdVendas.DataSource.DataSet.RecordCount <> 0) then
    begin
      oDadosVenda.IDVenda     := oPedido.Cod_Pedido;
      oDadosVenda.CodCliente  := oPedido.Cod_Cliente;
      oDadosVenda.VlrTotal    := oPedido.Vlr_Total;
      oPedido.Vlr_Total := cdsitensVendasTotal.Value;
      cdsitensVendas.First;
      while not cdsitensVendas.Eof do
      begin
        item              := TItemPedido.Create;
        item.Cod_Pedido   := oPedido.Cod_Pedido;
        item.Cod_Produto  := cdsitensVendascod.Value;
        item.QUANTIDADE   := cdsitensVendasqtd.Value;
        item.VLR_UNITARIO := cdsitensVendasvl_item.Value;
        item.VLR_TOTAL    := cdsitensVendasTotal_Item.Value;
        oDadosVenda.AdicionarVendaItem(item);
        cdsitensVendas.Next;
        FreeAndNil(item);
      end;
      oPedidoController.FinalizaVenda(oDadosVenda);
      limpaDataSetPedido;
      DesabilitaCampos;
      lbStatusCaixa.Caption := 'CAIXA LIVRE';
      shapeSatatusCaixa.Brush.Color := $0000DD00;
      lbPedido.Caption := '00000';
      editCodCliente.Text := '';
      editNomeCliente.Text := '';
      LimpaCampos;
      Application.MessageBox('Pedido realizado com sucesso!', 'Informação', mb_ok + MB_ICONINFORMATION);
    end else
    begin
      Application.MessageBox('Sem pedido para processar!','Teste', MB_OK+MB_ICONERROR);
    end;
    FreeAndNil(oPedido);
    lblTotalPedido.Caption := '0,00';
    HabilitarControles(opNavegar);
  finally
    FreeAndNil(oPedidoController);
    FreeAndNil(oDadosVenda);
  end;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  cdsitensVendas.CreateDataSet;
  dmPedido := TdmPedido.Create(nil);
end;

procedure TfrmPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  ConfigTela;
end;

procedure TfrmPedidos.GeraCodigoPedido;
var
  oPedidoController : TPedidoController;
begin
  oPedidoController := TPedidoController.Create;

  try
    oPedidoController.GeraCodigoPedido(oPedido);

    lbPedido.Caption := Format('%5.5d', [oPedido.Cod_Pedido]);

  finally
    FreeAndNil(oPedidoController);
  end;
end;

procedure TfrmPedidos.Gravar;
begin

end;

procedure TfrmPedidos.grdVendasCellClick(Column: TColumn);
begin
  if (grdVendas.SelectedIndex = 2) or (grdVendas.SelectedIndex = 3) then
  begin
    cdsitensVendas.Edit;
    grdVendas.Columns[2].ReadOnly   := False;
    grdVendas.Columns[3].ReadOnly   := False;
    grdVendas.Fields[4].Value       := grdVendas.Fields[2].Value * grdVendas.Fields[3].Value;

    cdsitensVendasqtd.Value         := grdVendas.Fields[2].Value;
    cdsitensVendasvl_item.Value     := grdVendas.Fields[3].Value;
    cdsitensVendasTotal_Item.Value  := grdVendas.Fields[4].Value;

    cdsitensVendas.Post;
  end
  else
  begin
    grdVendas.Columns[0].ReadOnly := True;
    grdVendas.Columns[1].ReadOnly := True;
    grdVendas.Columns[4].ReadOnly := True;
  end;
end;

procedure TfrmPedidos.grdVendasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_DELETE : begin
      if Application.MessageBox('Deseja excluir este item?','Pedido em andamento', MB_YESNO + MB_ICONERROR) = mrYes then
        cdsitensVendas.Delete
    end;
  end;

end;

procedure TfrmPedidos.HabilitarControles(aOperacao: TOperacao);
var
 I, X : Integer;
begin
  case aoperacao of
    opNovo, opAlterar:
    begin
      for I := 0 to ComponentCount - 1 do
      begin
        case AnsiIndexStr(Components[I].ClassName, ['TEdit', 'TImage', 'TMaskEdit', 'TShape', 'TSpeedButton']) of
           0: TEdit(Components[I]).Enabled      := True;
           1: TImage(Components[I]).Enabled     := True;
           2: TMaskEdit(Components[I]).Enabled  := True;
           3: TShape(Components[I]).Enabled     := True;
           4: begin
                if (TSpeedButton(Components[I]).Hint = 'Cancelar') or (TSpeedButton(Components[I]).Hint = 'Gravar') or (TSpeedButton(Components[I]).Hint = 'Fechar') then begin
                     TSpeedButton(Components[I]).Enabled := True;
                end else if (TSpeedButton(Components[I]).Hint = 'Iniciar') then begin
                   TSpeedButton(Components[I]).Enabled := True;
                   TSpeedButton(Components[I]).Visible := True;
                   btnAlterar.Enabled := False;
                end else begin
                   TSpeedButton(Components[I]).Enabled := False;
                end;
           end;
        end;
      end;
    end;
    opNavegar:
    begin
      for I := 0 to ComponentCount - 1 do
      begin
        case AnsiIndexStr(Components[I].ClassName, ['TEdit', 'TImage', 'TMaskEdit', 'TShape', 'TSpeedButton']) of
           0: TEdit(Components[I]).Enabled      := False;
           1: TImage(Components[I]).Enabled     := False;
           2: TMaskEdit(Components[I]).Enabled  := True;
           3: TShape(Components[I]).Enabled     := True;
           4: begin
                if (TSpeedButton(Components[I]).Hint = 'Cancelar') or (TSpeedButton(Components[I]).Hint = 'Gravar') then begin
                     TSpeedButton(Components[I]).Enabled := False;
                end else if (TSpeedButton(Components[I]).Hint = 'Iniciar') then begin
                   TSpeedButton(Components[I]).Enabled := True;
                   TSpeedButton(Components[I]).Visible := True;
                   btnAlterar.Enabled := False;
                end else begin
                   TSpeedButton(Components[I]).Enabled := True;
                end;
           end;
        end;
      end;
    end;
  end;
end;

procedure TfrmPedidos.Inserir;
begin

end;

procedure TfrmPedidos.LimpaCampos;
begin
  spnQuantidade.Value     := 0;
  editCodProduto.Text     := '';
  editPrecoUnitario.Clear;
  editPrecoTotalItem.Clear;
  lblproduto.Caption      := '';
end;

procedure TfrmPedidos.limpaDataSetPedido;
begin
  with cdsitensVendas do
  begin
    Open;
    EmptyDataSet;
    Close;
  end;
  cdsitensVendas.Open;
end;

procedure TfrmPedidos.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TfrmPedidos.LocalizaCliente;
var
  oCliente          : TCliente;
  oPedidoController : TPedidoController;
begin
  oCliente          := TCliente.Create;
  oPedidoController := TPedidoController.Create;

  try
    oPedidoController.LocalizaCliente(oCliente, StrToIntDef(editCodCliente.Text, 0));

    if oCliente.Nome <> '' then
    begin
      oPedido.Cod_Cliente   := oCliente.Id_Cliente;
      editNomeCliente.Text  := oCliente.Nome;
    end
    else
    begin
      editNomeCliente.Text := 'CLIENTE NÃO CADASTRADO...'
    end;

    editCodProduto.SetFocus;

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oPedidoController);
  end;
end;

procedure TfrmPedidos.LocalizaProduto;
var
  oProduto          : TProdutos;
  oPedidoController : TPedidoController;
begin
  oProduto          := TProdutos.Create;
  oPedidoController := TPedidoController.Create;

  try
    oPedidoController.LocalizaProduto(oProduto, StrToIntDef(editCodProduto.Text, 0));

    if oProduto.DESCRICAO <> '' then
    begin
      spnQuantidade.Value     := 0;
      lblProduto.Caption       := oProduto.DESCRICAO;
      editPrecoUnitario.Text  := formatfloat( '##,###,##0.00', oProduto.PrecoVenda);
      AtualizaTotalItem(oProduto);
      spnQuantidade.SetFocus;
    end
    else
    begin
      LimpaCampos;
      lblProduto.Caption := 'PRODUTO NÃO ENCONTRADO...';
      editCodProduto.SetFocus;
    end;

  finally
    FreeAndNil(oProduto);
    FreeAndNil(oPedidoController);
  end;
end;

procedure TfrmPedidos.Novo;
begin
  FOperacao               := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
  HabilitarControles(FOperacao);
end;

procedure TfrmPedidos.Pesquisar;
var
  oPedidoController : TPedidoController;
begin
  oPedidoController := TPedidoController.Create;
  try
    oPedidoController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oPedidoController);
  end;
end;

procedure TfrmPedidos.spnQuantidadeExit(Sender: TObject);
var
  dPrecoUnitario : Double;
begin
  dPrecoUnitario :=  StrToFloat(StringReplace(editPrecoUnitario.Text, '.', '', [rfReplaceAll]));
  edtSaindo(Sender);
  editPrecoTotalItem.Text := FormatFloat('##,###,##0.00', dPrecoUnitario * spnQuantidade.Value);
end;

function TfrmPedidos.ValidaCampos: Boolean;
begin
  if(editCodProduto.Text = '')
    or (editCodProduto.GetTextLen < 1)
      or (spnQuantidade.Value = 0)
        or (editPrecoUnitario.Text = '') then
  begin
    Result := False;
  end else
  begin
    Result := True;
  end;
end;

end.
