unit uDMProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, uProdutosModel, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmProdutos = class(TDataModule)
    fdqryPesquisar: TFDQuery;
    cdsPesquisar: TClientDataSet;
    dspPesquisar: TDataSetProvider;
    fdqryInserir: TFDQuery;
    fdqryAlterar: TFDQuery;
    fdqryExcluir: TFDQuery;
    cdsPesquisarCOD_PRODUTO: TAutoIncField;
    cdsPesquisarDESCRICAO: TStringField;
    cdsPesquisarPRECOVENDA: TFMTBCDField;
    cdsPesquisarIMAGEM1: TStringField;
    cdsPesquisarIMAGEM2: TStringField;
    cdsPesquisarIMAGEM3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome: string);
    procedure CarregarProduto(oProduto: TProdutos; iCodigo: Integer);
    function Inserir(oProduto: TProdutos; out sErro: string): Boolean;
    function Alterar(oProduto: TProdutos; out sErro: string): Boolean;
    function Excluir(iCodigo: Integer; out sErro: string): Boolean;
  end;

var
  dmProdutos: TdmProdutos;

implementation

uses
  uDMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmProdutos.Alterar(oProduto: TProdutos; out sErro: string): Boolean;
begin
  with fdqryAlterar, oProduto do
  begin
    Params.ParamByName('DESCRICAO').AsString      := DESCRICAO;
    Params.ParamByName('PRECOVENDA').AsFloat      := PRECOVENDA;
    Params.ParamByName('COD_PRODUTO').AsInteger   := COD_PRODUTO;
    Params.ParamByName('Imagem1').AsString        := Imagem1;
    Params.ParamByName('Imagem2').AsString        := Imagem2;
    Params.ParamByName('Imagem3').AsString        := Imagem3;
    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar o produto: ' + sLineBreak + e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TdmProdutos.CarregarProduto(oProduto: TProdutos; iCodigo: Integer);
var
  sqlProduto : TFDQuery;
begin
  sqlProduto := TFDQuery.Create(nil);
  try
    with sqlProduto do
    begin
      Connection := dmConexao.con1;
      SQL.Add('SELECT COD_PRODUTO, DESCRICAO, PRECOVENDA, Imagem1, Imagem2, Imagem3');
      SQL.Add('  FROM PRODUTOS ');
      if iCodigo > 0 then
      begin
        SQL.Add('        WHERE (COD_Produto =  ' + IntToStr(iCodigo) + ')');
      end;
      Open;
      with oProduto do
      begin
        COD_PRODUTO		:= FieldByName('COD_PRODUTO').AsInteger;
        DESCRICAO	    := FieldByName('DESCRICAO').AsString;
        PRECOVENDA  	:= FieldByName('PRECOVENDA').AsFloat;
        Imagem1       := FieldByName('Imagem1').AsString;
        Imagem2       := FieldByName('Imagem2').AsString;
        Imagem3       := FieldByName('Imagem3').AsString;
      end;
    end;
  finally

  end;

end;

function TdmProdutos.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
  with fdqryExcluir do
  begin
    Params.ParamByName('COD_Produto').AsInteger := iCodigo;
    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir o produto: ' + sLineBreak + e.Message;
        Result := False;
      end;
    end;
  end;
end;


function TdmProdutos.Inserir(oProduto: TProdutos; out sErro: string): Boolean;
begin
  with fdqryInserir, oProduto do
  begin
    Params.ParamByName('DESCRICAO').AsString    := DESCRICAO;
    Params.ParamByName('PRECOVENDA').AsFloat    := PRECOVENDA;
    Params.ParamByName('Imagem1').AsString      := Imagem1;
    Params.ParamByName('Imagem2').AsString      := Imagem2;
    Params.ParamByName('Imagem3').AsString      := Imagem2;

    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir produto: ' + sLineBreak + e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TdmProdutos.Pesquisar(sNome: string);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.Params.ParamByName('DESCRICAO').AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
