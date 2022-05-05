const minutosFuncionamentoBanco = 30;
const quantidadeMaximaFila = 3;
const filaClientes = [];
let clientesNaoAtendidos = 0;

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
      if (isEmpty()) {
        console.log("vazio, o cliente pode usar o caixa");
        filaClientes[0] = `Cliente ${i}`;
      } else {
        console.log("caixa está ocupado, pode entrar na fila");
        filaClientes.push(`Cliente ${i}`);
      }
    } else {
      console.log("banco cheio");
      clientesNaoAtendidos++;
    }
    console.log("quantidade atual da fila", filaClientes.length);
  }
}

console.log(`Clientes não atendidos: ${clientesNaoAtendidos}`);
