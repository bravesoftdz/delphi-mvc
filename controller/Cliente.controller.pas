unit Cliente.controller;

interface

uses
 Cliente.model, Cliente.dao, System.SysUtils;

type
   TClienteController = class
     public
        constructor Create;
        destructor  Destroy; override;
        function    Inserir(oCliente: TCliente; var sErro: string): Boolean;
        function    Alterar(oCliente: TCliente; var sErro: string): Boolean;
        function    Excluir(iCodigo: Integer; var sErro: String): Boolean;
        procedure   CarregarCliente(oCliente: TCliente; iCodigo: Integer);
        procedure   Pesquisar(sNome: string);
   end;

implementation

{ TClienteController }

function TClienteController.Alterar(oCliente: TCliente;
  var sErro: string): Boolean;
begin
  Result := DmCliente.Alterar(oCliente, sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: TCliente;
  iCodigo: Integer);
begin
   DmCliente.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteController.Create;
begin
   //DmCliente := TDmCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  //FreeAndNil(DmCliente);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer;
  var sErro: String): Boolean;
begin
   Result := DmCliente.Excluir(iCodigo, sErro);
end;

function TClienteController.Inserir(oCliente: TCliente;
  var sErro: string): Boolean;
begin
   Result := DmCliente.Inserir(oCliente, sErro);
end;

procedure TClienteController.Pesquisar(sNome: string);
begin
   DmCliente.Pesquisar(sNome);
end;

end.
