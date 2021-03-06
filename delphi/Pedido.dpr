program Pedido;

uses
  Vcl.Forms,
  UPedido in 'UPedido.pas' {FPedido},
  UDMPedido in 'UDMPedido.pas' {DMPedido: TDataModule},
  UDMCadastro in 'UDMCadastro.pas' {DMCadastro: TDataModule},
  UDMCon in 'UDMCon.pas' {DMCon: TDataModule},
  ULib in 'ULib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMCon, DMCon);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TFPedido, FPedido);
  Application.Run;
end.
