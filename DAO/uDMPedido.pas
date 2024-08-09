unit uDMPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, UPedidoModel,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClientesModel, uProdutosModel,
  uDadosVendaModel, uItemPedidoModel, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmPedido = class(TDataModule)
    qryGeraPedido: TFDQuery;
    qryGeraPedidoCOUNT: TLargeintField;
    qryFechaPedido: TFDQuery;
    qryItemVenda: TFDQuery;
    qryProdutos: TFDQuery;
    qryClientes: TFDQuery;
    fdqryPesquisar: TFDQuery;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisarCod_Pedido: TIntegerField;
    cdsPesquisarNome: TStringField;
    cdsPesquisarData_Emissao: TDateField;
    cdsPesquisarVlr_Total: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigoPedido(oPedido: TPedido);
    procedure LocalizaCliente(oCliente: TCliente; iCodCliente: Integer);
    procedure LocalizaProduto(oProduto: TProdutos; iCodProduto: Integer);
    procedure FinalizaVenda(oDadosVenda: TVenda);
    procedure Pesquisar(pPedido: string);
  end;

var
  dmPedido: TdmPedido;

implementation

uses
  uDMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


{ TDataModule1 }

procedure TdmPedido.FinalizaVenda(oDadosVenda: TVenda);
var
  I : Integer;
begin
  with qryFechaPedido do
  begin
    Close;
    ParamByName('Cod_Pedido').Value   := oDadosVenda.IDVenda;
    ParamByName('Cod_Cliente').Value  := oDadosVenda.CodCliente;
    ParamByName('Valor_Total').Value  := oDadosVenda.VlrTotal;
    ExecSQL;
  end;

  for I := 0 to oDadosVenda.ListaVendaItem.Count - 1 do
  begin

    with qryItemVenda do
    begin
      Close;
      ParamByName('Cod_Pedido').Value   := oDadosVenda.IDVenda;
      ParamByName('Cod_Produto').Value  := oDadosVenda.ListaVendaItem.Items[I].Cod_Produto;
      ParamByName('Quantidade').Value   := oDadosVenda.ListaVendaItem.Items[I].Quantidade;
      ParamByName('Vlr_Unitario').Value := oDadosVenda.ListaVendaItem.Items[I].Vlr_Unitario;
      ParamByName('Vlr_Total').Value    := oDadosVenda.ListaVendaItem.Items[I].Vlr_Total;
      ExecSQL;
    end;

  end;

end;

procedure TdmPedido.GeraCodigoPedido(oPedido: TPedido);
begin
  with qryGeraPedido do
  begin
    Close;
    Open;
    FetchAll;
    oPedido.Cod_Pedido := qryGeraPedidoCOUNT.Value + 1;
  end;

end;

procedure TdmPedido.LocalizaCliente(oCliente: TCliente; iCodCliente: Integer);
begin

  with qryClientes do
  begin
    Close;
    ParamByName('cod').Value := iCodCliente;
    Open;
    FetchAll;
    if (RecordCount > 0) then
    begin
      oCliente.Id_Cliente := iCodCliente;
      oCliente.Nome       := FieldByName('NOME').AsString;
    end;
  end;

end;

procedure TdmPedido.LocalizaProduto(oProduto: TProdutos; iCodProduto: Integer);
begin

  with qryProdutos, oProduto do
  begin
    Close;
    ParamByName('cod').Value := iCodProduto;
    Open;
    FetchAll;
    if (RecordCount > 0) then
    begin
      COD_PRODUTO   := iCodProduto;
      DESCRICAO     := FieldByName('DESCRICAO').AsString;
      PRECOVENDA    := FieldByName('PrecoVenda').AsFloat;
    end;
  end;
end;

procedure TdmPedido.Pesquisar(pPedido: string);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.Params.ParamByName('cod_pedido').AsString := '%' + pPedido + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
