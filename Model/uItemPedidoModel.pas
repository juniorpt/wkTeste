unit uItemPedidoModel;

interface

uses
  System.SysUtils;

type
  TItemPedido = class
  private
	  FId_PedidosProdutos : Integer;
    FCod_Pedido         : Integer;
    FCod_Produto        : Integer;
	  FQuantidade         : Integer;
    FVlr_Unitario       : Currency;
    FVlr_Total          : Currency;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property	Id_PedidosProdutos	: Integer	 read	FId_PedidosProdutos	write	FId_PedidosProdutos;
    property	Cod_Pedido			    : Integer	 read	FCod_Pedido			    write	FCod_Pedido;
    property	Cod_Produto			    : Integer	 read	FCod_Produto		    write	FCod_Produto;
    property	Quantidade			    : Integer	 read	FQuantidade			    write	FQuantidade;
    property	Vlr_Unitario		    : Currency read	FVlr_Unitario		    write	FVlr_Unitario;
    property	Vlr_Total			      : Currency read	FVlr_Total			    write	FVlr_Total;
  published
    { published declarations }
  end;


implementation

end.
