program fila_bancaria;

uses Filas;

const bank_work_time_in_minutes = 360;

var people_in_bank : Fila; 
var cannot_be_attended, sortedNumber, i : integer; 
var hasOperationDone : boolean;

begin
  Qinit(people_in_bank);
  Randomize;
  cannot_be_attended := 0;
  hasOperationDone := false;
  
  for i := 1 to bank_work_time_in_minutes do
    begin
      if random(3) = 0 then
        begin
          // writeln('Chegou um cliente');
          if not QisFull(people_in_bank) then
            begin
              if QisEmpty(people_in_bank) or hasOperationDone = true then
                begin
                  // writeln('caixa disponivel, o cliente pode usar');
                  people_in_bank.memo[1] := i;
                  hasOperationDone := false;
                  inc(people_in_bank.total);
                end
              else
              begin
                // writeln('caixa esta ocupado, pode entrar na fila');
                Enqueue(people_in_bank, i)
              end; 
            end
          else 
            begin
              // writeln('banco cheio');
              inc(cannot_be_attended);
            end;

          // writeln('quantidade de clientes na fila ', people_in_bank.total  - 1);
          
          if random(4) = 1 then
            begin
              // writeln('cliente saiu do caixa. Agora o caixa esta disponivel');
              Dequeue(people_in_bank);
              hasOperationDone := true;
            end; 
        end;
    end;

    writeln(cannot_be_attended, ' pessoas nao puderam entrar no banco por causa da super lotacao.')
     
end.