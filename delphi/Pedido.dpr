program Pedido;

uses
  Vcl.Forms,
  UPedido in 'UPedido.pas' {FPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPedido, FPedido);
  Application.Run;
end.
