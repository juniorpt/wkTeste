unit uProdutosModel;

interface

uses
  System.SysUtils;

type
  TProdutos = class
  private
    FCOD_PRODUTO: Integer;
    FPRECOVENDA: Double;
    FDESCRICAO: String;
    FImagem1: String;
    FImagem2: String;
    FImagem3: String;
    procedure SetDESCRICAO(const Value: String);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property COD_PRODUTO: 	        Integer read FCOD_PRODUTO  	write FCOD_PRODUTO;
    property DESCRICAO:             String  read FDESCRICAO     write SetDESCRICAO;
    property PRECOVENDA:            Double  read FPRECOVENDA    write FPRECOVENDA;
    property Imagem1:               String  read FImagem1       write FImagem1;
    property Imagem2:               string  read FImagem2       write FImagem2;
    property Imagem3:               string  read FImagem3       write FImagem3;
  published
    { published declarations }
  end;



implementation

{ TProdutos }

procedure TProdutos.SetDESCRICAO(const Value: String);
begin
  if Value = EmptyStr then
     raise EArgumentException .Create('''DESCRICAO'' precisa UserName preenchido!');
  FDESCRICAO := Value;
end;

end.
