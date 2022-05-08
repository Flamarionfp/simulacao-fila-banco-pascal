program fila_bancaria;

uses crt, SysUtils, Filas;

const bank_work_time_in_minutes = 15;

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
      if not QisFull(F) then
        begin
           if QisEmpty(F) then
            begin
              writeln('caixa livre para uso');
              F.memo[1] := i;
              hasOperationDone := true;
              inc(F.total)
            end
          else
          begin
            writeln('caixa ocupado, mas tem espaco na fila');
            Enqueue(F, i)
          end; 
        end
      else 
        begin
          writeln('banco cheio!');
          inc(cannot_be_attended);
        end;
      
      if random(3) = 1 then
        begin
          writeln('cliente terminou a operação, caixa disponivel');
          Dequeue(F);
        end; 
    end;

    writeln(cannot_be_attended, ' pessoas nao puderam entrar no banco por causa da super lotacao.')
     
end.