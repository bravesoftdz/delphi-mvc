program MillMVC;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrarCliente in 'view\uFrmCadastrarCliente.pas' {FrmCadastrarCliente},
  Cliente.model in 'model\Cliente.model.pas',
  Cliente.controller in 'controller\Cliente.controller.pas',
  Conexao.dao in 'dao\Conexao.dao.pas' {DmConexao: TDataModule},
  Cliente.dao in 'dao\Cliente.dao.pas' {DmCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
