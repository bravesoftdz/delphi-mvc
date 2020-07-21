unit Cliente.dao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Cliente.model;

type
  TDmCliente = class(TDataModule)
    sqlExcluir: TSQLDataSet;
    sqlPesquisar: TSQLDataSet;
    sqlInserir: TSQLDataSet;
    sqlAlterar: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarID: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarTELEFONE: TStringField;
  private
    { Private declarations }
  public
    function  GerarId: Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: integer);
    function  Inserir(oCliente: TCliente; out sErro: string): Boolean;
    function  Alterar(oCliente: TCliente; out sErro: string): Boolean;
    function  Excluir(iCodigo: Integer; out sErro: string): Boolean;
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Conexao.dao;

{$R *.dfm}

{ TDataModule1 }

function TDmCliente.Alterar(oCliente: TCliente; out sErro: string): Boolean;
begin
   with sqlAlterar, oCliente do
   begin
     Params[0].AsString  := Nome;
     Params[1].AsString  := Tipo;
     Params[2].AsString  := Documento;
     Params[3].AsString  := Telefone;
     Params[4].AsInteger := ID;
     try
       ExecSQL();
       Result := True;
     except on E: Exception do
       begin
          sErro  := 'Ocorreu um erro ao alterar o cliente: ' + sLineBreak + E.Message;
          Result := False;
       end;
     end;
   end;
end;

procedure TDmCliente.CarregarCliente(oCliente: TCliente; iCodigo: integer);
var
   sqlCliente: TSQLDataSet;
begin
   sqlCliente := TSQLDataSet.Create(nil);
   try
   with sqlCliente do
   begin
      SQLConnection := DmConexao.sqlConexao;
      CommandText := 'SELECT * FROM cliente where (id = ' + IntToStr(iCodigo) + ')';
      Open;
      with oCliente do
      begin
        ID        := FieldByName('id').AsInteger;
        Nome      := FieldByName('nome').AsString;
        Tipo      := FieldByName('tipo').AsString;
        Documento := FieldByName('documento').AsString;
        Telefone  := FieldByName('telefone').AsString;
      end;
   end;

   finally
     FreeAndNil(sqlCliente);
   end;

end;

function TDmCliente.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
   with sqlExcluir do
   begin
     Params[0].AsInteger := iCodigo;
     try
       ExecSQL();
       Result := True;
     except on E: Exception do
       Begin
          sErro  := 'Ocorreu um erro ao excluir o cliente: ' + sLineBreak + E.Message;
          Result := False;
       End;
     end;
   end;
end;

function TDmCliente.GerarId: Integer;
var
   sqlSequencial: TSQLDataSet;
begin
   sqlSequencial := TSQLDataSet.Create(nil);
   try
     with sqlSequencial do
     begin
       SQLConnection := DmConexao.sqlConexao;
       CommandText   := 'SELECT Coalesce(max(id), 0) + 1 as seq FROM cliente';
       Open;
     end;

     Result := sqlSequencial.FieldByName('seq').AsInteger;
   finally
     FreeAndNil(sqlSequencial);
   end;

end;

function TDmCliente.Inserir(oCliente: TCliente; out sErro: string): Boolean;
begin
   with sqlInserir, oCliente do
   begin
     Params[0].AsInteger := GerarId;
     Params[1].AsString  := Nome;
     params[2].AsString  := Tipo;
     params[3].AsString  := Documento;
     params[4].AsString  := Telefone;
     try
        ExecSQL();
        Result := True;
     except on E: Exception do
        begin
          sErro := 'Ocorreu um erro ao inserir cliente: ' + sLineBreak + E.Message;
          Result := False;
        end;

     end;
   end;
end;

procedure TDmCliente.Pesquisar(sNome: string);
begin
   if cdsPesquisar.Active then
      cdsPesquisar.Close;

   cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
   cdsPesquisar.Open;
   cdsPesquisar.First;
end;

end.
