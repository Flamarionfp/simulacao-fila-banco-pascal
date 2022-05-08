unit Filas;

interface

  const MAX = 11;
  type Elem = integer;
       Fila = record
                total : integer;
                comeco : integer;
                final : integer;
                memo : array[1..MAX] of elem;
              end;

  procedure Qinit(var F:Fila);
  function QisEmpty(var F:Fila) : boolean;
  function QisFull(var F:Fila) : boolean;
  procedure Enqueue(var F:Fila; x:Elem);
  function Dequeue(var F:Fila) : Elem;

implementation

  procedure Qinit(var F:Fila);
  begin
    F.total := 0;
    F.comeco := 1;
    F.final := 1;
  end;

  function QisEmpty(var F:Fila) : boolean;
  begin
    QisEmpty := (F.total = 0);
  end;

  function QisFull(var F:Fila) : boolean;
  begin
    QisFull := (F.total = MAX);
  end;

  procedure adc(var i: integer);
  begin
    i := i+1;
    if i>MAX then i := 1;
  end;

  procedure Enqueue(var F:Fila; x:Elem);
  begin
    if not QisFull(F) then
      begin
        F.memo[F.final] := x;
        adc(F.final);
        inc(F.total);
      end
    else
      writeln('Queue Overflow');
  end;

  function Dequeue(var F:Fila) : Elem;
  begin
    if not QisEmpty(F) then
      begin
        Dequeue := F.memo[F.comeco];
        adc(F.comeco);
        dec(F.total);
      end
    else
      writeln('Queue Underflow');
  end;

begin

  writeln('Unit Filas importada...');

end.
