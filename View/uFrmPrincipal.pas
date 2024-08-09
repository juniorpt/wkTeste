unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uFrmCadastroProduto, uFrmPedidos;

type
  TfrmPrincipal = class(TForm)
    pnlSuperior: TPanel;
    btnProdutos: TBitBtn;
    btnPedidos: TBitBtn;
    pnlCentro: TPanel;
    pnlBotton: TPanel;
    lbl2: TLabel;
    statInformacao: TStatusBar;
    statConsulta: TStatusBar;
    pb1: TProgressBar;
    btnFechar1: TBitBtn;
    procedure btnProdutosClick(Sender: TObject);
    procedure btnFechar1Click(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirProdutos;
    procedure AbrirPedidos;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.AbrirPedidos;
begin
  frmPedidos := TfrmPedidos.Create(nil);
  try
    frmPedidos.ShowModal;
  finally
    FreeAndNil(frmPedidos);
  end;


end;

procedure TfrmPrincipal.AbrirProdutos;
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(nil);
  try
    frmCadastroProduto.ShowModal;

  finally
    FreeAndNil(frmCadastroProduto);
  end;
end;

procedure TfrmPrincipal.btnFechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnPedidosClick(Sender: TObject);
begin
  AbrirPedidos;
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  AbrirProdutos;
end;

end.
