unit uDadosVendaModel;

interface

uses
  System.Generics.Collections, System.SysUtils, uItemPedidoModel;

type
  TVenda = class
   private
     FIDVenda     : Integer;
     FData        : TDateTime;
     FCodCliente  : Integer;
     FVlrTotal    : Currency;
     FListaVendaItem: TObjectList<TItemPedido>;
     { private declarations }
   protected
     { protected declarations }
   public
     { public declarations }
     constructor Create;
     destructor Destroy; override;
     procedure AdicionarVendaItem(itemVenda: TItemPedido);
     property IDVenda         : Integer                   read FIDVenda         write FIDVenda;
     property Data            : TDateTime                 read FData            write FData;
     property CodCliente      : Integer                   read FCodCliente      write FCodCliente;
     property VlrTotal        : Currency                  read FVlrTotal        write FVlrTotal;
     property ListaVendaItem  : TObjectList<TItemPedido>  read FListaVendaItem  write FListaVendaItem;
   published
     { published declarations }
  end;


implementation


procedure TVenda.AdicionarVendaItem(itemVenda: TItemPedido);
var
 I: Integer;
begin
   FListaVendaItem.Add(TItemPedido.Create);
   I := FListaVendaItem.Count -1;
   FListaVendaItem[I].Id_PedidosProdutos  := I;
   FListaVendaItem[I].Cod_Pedido          := FIDVenda;
   FListaVendaItem[I].Cod_Produto         := itemVenda.Cod_Produto;
   FListaVendaItem[I].Quantidade          := itemVenda.Quantidade;
   FListaVendaItem[I].Vlr_Unitario        := itemVenda.Vlr_Unitario;
   FListaVendaItem[I].Vlr_Total           := itemVenda.Vlr_Total;
end;

constructor TVenda.Create;
begin
  inherited;
  FIDVenda  := 0;
  FData     := EncodeDate(1900,1,1);
  FListaVendaItem := TObjectList<TItemPedido>.Create;
end;

destructor TVenda.Destroy;
begin
  FreeAndNil(FListaVendaItem);
  inherited;
end;

end.
