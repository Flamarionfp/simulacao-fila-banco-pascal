const minutosFuncionamentoBanco = 30;
const quantidadeMaximaFila = 3;
const filaClientes = [];
let clientesNaoAtendidos = 0;
let terminouOperacao = false;

function gerarNumeroAleatorio() {
  return Math.floor(Math.random() * 2);
}

function filaEstaLivreParaEntrar() {
  return filaClientes.length + 1 <= quantidadeMaximaFila;
}

function isFull() {
  return filaClientes.length === quantidadeMaximaFila + 1;
}

function isEmpty() {
  return filaClientes.length === 0;
}

for (let i = 1; i <= minutosFuncionamentoBanco; i++) {
  let numeroSorteado = gerarNumeroAleatorio();
  if (numeroSorteado === 0) {
    if (!isFull()) {
      if (isEmpty() || terminouOperacao) {
        console.log("caixa disponivel, o cliente pode usar");
        filaClientes[0] = `Cliente ${i}`;
        terminouOperacao = false;
      } else {
        console.log("caixa está ocupado, pode entrar na fila");
        filaClientes.push(`Cliente ${i}`);
      }
    } else {
      console.log("banco cheio");
      clientesNaoAtendidos++;
    }
    console.log("quantidade atual da fila", filaClientes.length - 1);

    if (gerarNumeroAleatorio() === 1) {
      console.log("cliente terminou a operação, caixa disponivel");
      filaClientes.shift();
      terminouOperacao = true;
    }
  }
}

console.log(`Clientes não atendidos: ${clientesNaoAtendidos}`);
