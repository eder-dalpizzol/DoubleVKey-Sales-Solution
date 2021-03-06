unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TFPedido = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BtNovo: TSpeedButton;
    BtExcluir: TSpeedButton;
    BtImprimir: TSpeedButton;
    BtConfirmar: TSpeedButton;
    BtCancelar: TSpeedButton;
    BtFechar: TSpeedButton;
    PTotaisPedido: TFlowPanel;
    PDados: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BtLocalizar: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    EProdNome: TEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtIncluir: TSpeedButton;
    BtLimpar: TSpeedButton;
    ECod: TEdit;
    EQtde: TEdit;
    EVlr: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    ECodCli: TDBEdit;
    DBText2: TDBText;
    procedure BtNovoClick(Sender: TObject);
    procedure ScreenCrontrol(Operacao: Integer);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure BtIncluirClick(Sender: TObject);
    procedure BtLimparClick(Sender: TObject);
    procedure ECodExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodCliExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedido: TFPedido;

implementation

{$R *.dfm}

uses UDMPedido, UDMCadastro;


procedure TFPedido.BtCancelarClick(Sender: TObject);
begin
   ScreenCrontrol(2);
   DMPedido.QPedido.Cancel;
   DMPedido.QPedido.Refresh;
   DMPedido.QPedido.Last;
end;

procedure TFPedido.BtConfirmarClick(Sender: TObject);
begin
  if DMPedido.QPedidoID_CLIENTE.Value < 1 then
  begin
    ShowMessage('Informar o cliente')
  end
  else
  if DMPedido.QPedidoPEDIDO_VALOR.Value = 0 then
  begin
    ShowMessage('Pedido com valor zerado')
  end
  else
  begin
  DMPedido.QPedido.ApplyUpdates;
  DMPedido.QPedidoItem.ApplyUpdates;

   ScreenCrontrol(2);
  end;



end;

procedure TFPedido.BtExcluirClick(Sender: TObject);
begin
  DMPedido.QPedidoItem.first;
  while not DMPedido.QPedidoItem.eof do
  begin
    DMPedido.QPedidoItem.Delete;
  end;
  DMPedido.QPedido.Delete;

end;

procedure TFPedido.BtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPedido.BtNovoClick(Sender: TObject);
begin
  ScreenCrontrol(1);
  PDados.Enabled := True;

  DMPedido.QPedido.Append;
  ECodCli.SetFocus;

end;

procedure TFPedido.DBGrid1CellClick(Column: TColumn);
begin
DMPedido.QPedidoItem.Edit;
end;

procedure TFPedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
       if MessageDlg('Deseja excluir o produto do pedido?',mtConfirmation,[mbYes,mbNo],0)=mrYes
       then begin
            DMPedido.QPedidoItem.Delete;
       end;
  end;
end;

procedure TFPedido.ECodCliExit(Sender: TObject);
begin
  if ECodCli.Text <> '' then
  begin


    DMCadastro.QCliente.Close;
    DMCadastro.QCliente.ParamByName('id').AsString := ECodCli.Text;
    DMCadastro.QCliente.Open;

    if DMCadastro.QCliente.RecordCount > 0 then
    begin

      DMPedido.QPedidoNOME_CLIENTE.Value := DMCadastro.QClienteNOME_CLIENTE.Value;
      

    end
    else
    begin
      ShowMessage('Cliente n?o localizado');
    end;

  end;

end;

procedure TFPedido.ECodExit(Sender: TObject);
begin
  if ECod.Text <> '' then
  begin


    DMCadastro.QProduto.Close;
    DMCadastro.QProduto.ParamByName('id_produto').AsString := ECod.Text;
    DMCadastro.QProduto.Open;

    if DMCadastro.QProduto.RecordCount > 0 then
    begin

      EProdNome.Text := DMCadastro.QProdutoDESCRICAO.Value;
      EVlr.Text := FloatToStr(DMCadastro.QProdutoPR_VENDA.Value);
      BtIncluir.Enabled := true;

    end
    else
    begin
      ShowMessage('Produto n?o localizado');
      BtIncluir.Enabled := false;
    end;

  end;



end;

procedure TFPedido.FormShow(Sender: TObject);
begin
   DMPedido.QPedido.Open;
   DMPedido.QPedido.Last;
end;

procedure TFPedido.ScreenCrontrol( Operacao: Integer);
begin

   if Operacao = 1 then
   begin
      BtCancelar.Enabled := true;
      BtConfirmar.Enabled := true;
      BtNovo.Enabled := False;
      BtExcluir.Enabled := False;
      BtImprimir.Enabled := False;
      BtFechar.Enabled := False;
      BtLocalizar.Enabled := False;
   end
   else
   begin
      BtCancelar.Enabled := false;
      BtConfirmar.Enabled := false;
      BtNovo.Enabled := true;
      BtExcluir.Enabled := true;
      BtImprimir.Enabled := true;
      BtFechar.Enabled := true;
   end;


end;

procedure TFPedido.BtIncluirClick(Sender: TObject);
begin
  with DMPedido do
  begin
    QPedidoItem.Append;
    QPedidoItemCOD_PRODUTO.Value := Strtoint(ECOd.Text);
    QPedidoItemVALOR_UNITARIO.Value := Strtofloat(EVlr.Text);
    QPedidoItemQUANTIDADE.Value := Strtoint(EQtde.Text);
    QPedidoItemVALOR_TOTAL.Value := QPedidoItemQUANTIDADE.Value * QPedidoItemVALOR_UNITARIO.Value;

    BtLimparClick(sender);
  end;
end;

procedure TFPedido.BtLimparClick(Sender: TObject);
begin
  ECod.Text := '';
  EQtde.Text := '';
  EVlr.Text := '';
  EProdNome.Text := '';
  ECod.SetFocus;
end;

procedure TFPedido.BtLocalizarClick(Sender: TObject);
var numero: String;
begin
  numero := '';
  InputBox('Localizar', 'Informe o numero do pedido', numero);

  DMPedido.QPedido.Locate('ID_PEDIDO', numero, [loCaseInsensitive]);
end;

end.
