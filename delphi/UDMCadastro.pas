unit UDMCadastro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMCadastro = class(TDataModule)
    QProduto: TFDQuery;
    QProdutoID_PRODUTO: TFDAutoIncField;
    QProdutoDESCRICAO: TStringField;
    QProdutoPR_VENDA: TFloatField;
    QCliente: TFDQuery;
    QClienteID_CLIENTE: TFDAutoIncField;
    QClienteNOME_CLIENTE: TStringField;
    QClienteCIDADE_CLIENTE: TStringField;
    QClienteUF_CLIENTE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastro: TDMCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UPedido, UDMCon;

{$R *.dfm}

end.
