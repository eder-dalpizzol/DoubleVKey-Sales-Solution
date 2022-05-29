unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

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
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    Label2: TLabel;
    procedure BtNovoClick(Sender: TObject);
    procedure ScreenCrontrol(Operacao: Boolean);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedido: TFPedido;

implementation

{$R *.dfm}

procedure TFPedido.BtCancelarClick(Sender: TObject);
begin
   ScreenCrontrol(False);
end;

procedure TFPedido.BtNovoClick(Sender: TObject);
begin
  ScreenCrontrol(True);
end;

procedure TFPedido.FormShow(Sender: TObject);
begin
   ScreenCrontrol(False);
end;

procedure TFPedido.ScreenCrontrol( Operacao: Boolean);
begin

   if Operacao then
   begin
      BtCancelar.Enabled := true;
      BtConfirmar.Enabled := true;
      BtNovo.Enabled := False;
      BtExcluir.Enabled := False;
      BtImprimir.Enabled := False;
      BtFechar.Enabled := False;
   end
   else
      BtCancelar.Enabled := false;
      BtConfirmar.Enabled := false;
      BtNovo.Enabled := true;
      BtExcluir.Enabled := true;
      BtImprimir.Enabled := true;
      BtFechar.Enabled := true;
   begin

   end;


end;

end.
