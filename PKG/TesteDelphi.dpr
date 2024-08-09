program TesteDelphi;

uses
  Vcl.Forms,
  uFrmPrincipal in '..\View\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroProduto in '..\View\uFrmCadastroProduto.pas' {frmCadastroProduto},
  uProcutosController in '..\Controller\uProcutosController.pas',
  uProdutosModel in '..\Model\uProdutosModel.pas',
  uDMProduto in '..\DAO\uDMProduto.pas' {dmProdutos: TDataModule},
  uDMConexao in '..\DAO\uDMConexao.pas' {dmConexao: TDataModule},
  uDMPedido in '..\DAO\uDMPedido.pas' {dmPedido: TDataModule},
  uPedidoController in '..\Controller\uPedidoController.pas',
  uFrmPedidos in '..\View\uFrmPedidos.pas',
  UPedidoModel in '..\Model\UPedidoModel.pas',
  uClientesModel in '..\Model\uClientesModel.pas',
  uDadosVendaModel in '..\Model\uDadosVendaModel.pas',
  uItemPedidoModel in '..\Model\uItemPedidoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
