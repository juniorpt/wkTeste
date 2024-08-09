unit uProcutosController;

interface

uses
  uProdutosModel, uDMProduto,  System.SysUtils;

type
  TProdutosController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    function Inserir(oProduto: TProdutos; var sErro: string): Boolean;
    function Alterar(oProduto: TProdutos; var sErro: string): Boolean;
    procedure CarregarProduto(oProduto: TProdutos; iCodigo: Integer);
    function Excluir(iCodigo: Integer; var sErro: string): Boolean;
    procedure Pesquisar(sNome: string);
  published
    { published declarations }
  end;


implementation





{ TProdutosController }

function TProdutosController.Alterar(oProduto: TProdutos;
  var sErro: string): Boolean;
begin
  Result := dmProdutos.Alterar(oProduto, sErro);
end;

procedure TProdutosController.CarregarProduto(oProduto: TProdutos;
  iCodigo: Integer);
begin
  dmProdutos.CarregarProduto(oProduto, iCodigo);
end;

constructor TProdutosController.Create;
begin
//  dmProdutos := TdmProdutos.Create(nil);
end;

destructor TProdutosController.Destroy;
begin
//  FreeAndNil(dmProdutos);
  inherited;
end;

function TProdutosController.Excluir(iCodigo: Integer; var sErro : string): Boolean;
begin
  Result := dmProdutos.Excluir(iCodigo, sErro);
end;

function TProdutosController.Inserir(oProduto: TProdutos;
  var sErro: string): Boolean;
begin
  Result := dmProdutos.Inserir(oProduto, sErro);
end;

procedure TProdutosController.Pesquisar(sNome: string);
begin
  dmProdutos.Pesquisar(sNome);
end;

end.
