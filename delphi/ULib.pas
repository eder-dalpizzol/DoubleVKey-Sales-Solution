unit ULib;

interface

implementation

uses UDMCon;

procedure ExecSQL(SQL: String);
  begin
  with DMCon.ExecSQL do begin
    SQLScripts.Clear;
    SQLScripts.Add;
    with SQLScripts[0].SQL do begin
      Add(SQL);
    end;
    ValidateAll;
    ExecuteAll;
  end;
end;


end.
