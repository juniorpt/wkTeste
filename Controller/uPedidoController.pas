unit uPedidoController;

interface

uses
  UPedidoModel, uDMPedido, uClientesModel, uProdutosModel, uDadosVendaModel;


type
  TPedidoController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    procedure GeraCodigoPedido(oPedido: TPedido);
    procedure LocalizaCliente(oCliente: TCliente; iCodCliente: Integer);
    procedure LocalizaProduto(oProduto: TProdutos; iCodProduto: Integer);
    procedure FinalizaVenda(oDadosVenda: TVenda);
    procedure Pesquisar(pPedido: string);
  published
    { published declarations }
  end;


implementation


{ TPedidoController }

procedure TPedidoController.FinalizaVenda(oDadosVenda: TVenda);
begin
  dmPedido.FinalizaVenda(oDadosVenda);
end;

procedure TPedidoController.GeraCodigoPedido(oPedido: TPedido);
begin
  dmPedido.GeraCodigoPedido(oPedido);
end;

procedure TPedidoController.LocalizaCliente(oCliente: TCliente; iCodCliente: Integer);
begin
  dmPedido.LocalizaCliente(oCliente, iCodCliente);
end;

procedure TPedidoController.LocalizaProduto(oProduto: TProdutos;
  iCodProduto: Integer);
begin
  dmPedido.LocalizaProduto(oProduto, iCodProduto);
end;

procedure TPedidoController.Pesquisar(pPedido: string);
begin
  dmPedido.Pesquisar(pPedido);
end;

end.
