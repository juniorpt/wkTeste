unit UPedidoModel;
interface
uses
  System.SysUtils;
type TPedido = class
  private
    FCod_Pedido         : Integer;
    FCod_Cliente        : Integer;
    FVlr_Total          : Currency;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property	Cod_Pedido			    : Integer	 read	FCod_Pedido			    write	FCod_Pedido;
    property	Cod_Cliente			    : Integer	 read	FCod_Cliente		    write	FCod_Cliente;
    property	Vlr_Total			      : Currency read	FVlr_Total			    write	FVlr_Total;
  published
    { published declarations }
  end;
implementation
{ TPedido }
{ TPedido }
end.
