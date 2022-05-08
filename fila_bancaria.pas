program fila_bancaria;

uses crt, SysUtils, Filas;

const bank_work_time_in_minutes = 360;

var F : Fila; 
var cannot_be_attended, sortedNumber, clientIndex, i : integer; 
var hasOperationDone : boolean;

begin
  Qinit(F);
  Randomize;
  cannot_be_attended := 0;
  hasOperationDone := false;

  for i := 1 to bank_work_time_in_minutes do
    begin
      sortedNumber := random(3);
      writeln('Numero sorteado: ', sortedNumber);
      if (sortedNumber = 0) then
        begin
          if not QisFull(F) then
            begin
              clientIndex := i;
              if (QisEmpty(F) or hasOperationDone = true) then
                begin
                  writeln('Caixa livre');
                  F.memo[1] := clientIndex;
                  hasOperationDone := false;
                end
              else 
                begin
                  writeln('Caixa ocupado, mas tem lugar na fila');
                  Enqueue(F, clientIndex);
                end;
            end
              else 
              begin
                writeln('O banco esta lotado!');
                inc(cannot_be_attended);
              end;

         if (random(3) = 1) then
          begin
            writeln('O cliente que estava no caixa saiu. Caixa disponivel');
            Dequeue(F);
            hasOperationDone := true;
          end;
        end;
    end;

    writeln('Durante o horario de funcionamento do banco, ', cannot_be_attended, ' clientes nao puderam entrar no estabelecimento por causa da lotacao.');

end.