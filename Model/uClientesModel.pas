unit uClientesModel;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FId_Cliente : Integer;
    FNome       : string;
    FCEP        : string;
    FLogradouro : string;
    FNumero     : string;
    FBairro     : string;
    FCidade     : string;
    FUF         : String;
    FTelefone   : string;
    FCelular    : string;
    FImagem1    : String;
    FImagem2    : String;
    FImagem3    : String;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property Id_Cliente: 	          Integer read FId_Cliente  	write FId_Cliente;
    property Nome:                  String  read FNome          write FNome;
    property CEP:                   String  read FCEP           write FCEP;
    property Logradouro:            String  read FLogradouro    write FLogradouro;
    property Numero:                String  read FNumero        write FNumero;
    property Bairro:                String  read FBairro        write FBairro;
    property Cidade:                String  read FCidade        write FCidade;
    property UF:                    String  read FUF            write FUF;
    property Telefone:              string  read FTelefone      write FTelefone;
    property Celular:               string  read FCelular       write FCelular;
    property Imagem1:               String  read FImagem1       write FImagem1;
    property Imagem2:               string  read FImagem2       write FImagem2;
    property Imagem3:               string  read FImagem3       write FImagem3;
  published
    { published declarations }
  end;


implementation

end.
