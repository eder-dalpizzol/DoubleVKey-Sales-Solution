unit UDMPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMPedido = class(TDataModule)
    QPedido: TFDQuery;
    QPedidoID_PEDIDO: TFDAutoIncField;
    QPedidoID_CLIENTE: TIntegerField;
    QPedidoPEDIDO_VALOR: TFloatField;
    QPedidoDATA_EMISSAO: TDateField;
    QPedidoNOME_CLIENTE: TStringField;
    DSPedido: TDataSource;
    QPedidoItem: TFDQuery;
    DSPedidoItem: TDataSource;
    QPedidoItemITEM: TIntegerField;
    QPedidoItemID_PEDIDO: TIntegerField;
    QPedidoItemCOD_PRODUTO: TIntegerField;
    QPedidoItemQUANTIDADE: TFloatField;
    QPedidoItemVALOR_UNITARIO: TFloatField;
    QPedidoItemVALOR_TOTAL: TFloatField;
    QPedidoTotais: TFDQuery;
    QPedidoTotaisTOTAL: TFloatField;
    DSQPedidoTotais: TDataSource;
    QPedidoItemDESCRICAO: TStringField;
    procedure QPedidoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPedido: TDMPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UPedido, UDMCon;

{$R *.dfm}

procedure TDMPedido.QPedidoAfterScroll(DataSet: TDataSet);
begin
   QPedidoItem.Close;
  QPedidoItem.ParamByName('pedido').AsString := QPedidoID_PEDIDO.AsString;
  QPedidoItem.Open;

  QPedidoTotais.Close;
  QPedidoTotais.ParamByName('pedido').AsString := QPedidoID_PEDIDO.AsString;
  QPedidoTotais.Open;
end;

end.
