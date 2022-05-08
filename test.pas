program fila_bancaria;

uses SysUtils, Filas;

const bank_work_time_in_minutes = 360;

var F : Fila; 
var cannot_be_attended, sortedNumber, i : integer; 
var hasOperationDone : boolean;

begin
  Qinit(F);
  Randomize;
  cannot_be_attended := 0;
  hasOperationDone := false;
  
  for i := 1 to bank_work_time_in_minutes do
    begin
      if random(3) = 0 then
        begin
           writeln('Chegou um cliente');
          if not QisFull(F) then
            begin
              if QisEmpty(F) or hasOperationDone = true then
                begin
                  writeln('caixa disponivel, o cliente pode usar');
                  F.memo[1] := i;
                  hasOperationDone := false;
                  inc(F.total);
                end
              else
              begin
                writeln('caixa esta ocupado, pode entrar na fila');
                Enqueue(F, i)
              end; 
            end
          else 
            begin
              writeln('banco cheio');
              inc(cannot_be_attended);
            end;

          writeln('quantidade atual da fila ', F.total  - 1);
          
          if random(2) = 1 then
            begin
              writeln('cliente saiu do caixa. Agora o caixa esta disponivel');
              Dequeue(F);
              hasOperationDone := true;
            end; 
        end;
    end;

    writeln(cannot_be_attended, ' pessoas nao puderam entrar no banco por causa da super lotacao.')
     
end.