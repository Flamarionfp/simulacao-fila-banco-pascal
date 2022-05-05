const minutosFuncionamentoBanco = 30;
const quantidadeMaximaFila = 3;
const filaClientes = [];
let clientesNaoAtendidos = 0;
let caixaEstaEmUso = false;

function gerarNumeroAleatorio() {
  return Math.floor(Math.random() * 2);
}

function filaEstaLivreParaEntrar() {
  return filaClientes.length + 1 <= quantidadeMaximaFila;
}

for (let i = 1; i <= minutosFuncionamentoBanco; i++) {
  let numeroSorteado = gerarNumeroAleatorio();
  console.log(numeroSorteado);
  if (numeroSorteado === 0) {
    console.log("cliente chegou");
    if (!caixaEstaEmUso) {
      console.log("cliente pode usar");
      caixaEstaEmUso = true;
    } else if (caixaEstaEmUso && filaEstaLivreParaEntrar()) {
      console.log("pode adicionar o cliente na fila");
      filaClientes.push(`cliente ${i}`);
    } else {
      console.log("banco está lotado");
      clientesNaoAtendidos = clientesNaoAtendidos + 1;
    }
  }
  console.log("quantidade atual da fila", filaClientes.length);
}

console.log(`Clientes não atendidos: ${clientesNaoAtendidos}`);
