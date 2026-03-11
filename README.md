# Atividade Prática: Calculadora de IMC (Índice de Massa Corpórea)

Projeto desenvolvido como atividade de presença para a disciplina de **Desenvolvimento Mobile**.

## 📝 Descrição da Atividade

O objetivo foi criar um aplicativo em Flutter que calcula o **Índice de Massa Corporal (IMC)** de um adulto e informa sua classificação de saúde com base nos parâmetros oficiais.

* **Entrada de Dados:** Campos para inserção de Peso (kg) e Altura (m).
* **Tratamento de Erros:** Lógica preparada para aceitar tanto o uso de ponto quanto de vírgula, evitando erros de execução.
* **Cálculo:** Aplicação da fórmula matemática:  
    $$IMC = \frac{peso}{altura^2}$$
* **Lógica de Classificação:** Ao clicar no botão "Calcular", o app exibe o valor do IMC e a categoria correspondente (Peso Normal, Sobrepeso, Obesidade, etc).
* **Interface Dinâmica:** O resultado altera a cor do texto de acordo com a gravidade (Verde para peso normal, Amarelo para atenção e Vermelho para obesidade).
* **Funcionalidade Extra:** Ícone de "Refresh" no topo para limpar os campos instantaneamente.

---

## 👨‍🏫 Informações Acadêmicas

* **Professor:** Bruno Luis Soares de Lima
* **Curso:** Análise e Desenvolvimento de Sistemas (ADS)
* **Polo/Unidade:** Leopoldina
* **Turma:** ADS 2026 - 3º Semestre
* **Aluno:** Julyana Silva da Rocha

---

## 🚀 Tecnologias Utilizadas

* **Flutter** (Framework UI)
* **Dart** (Linguagem de Programação)
* **Material Design:** Uso de componentes modernos como `ElevatedButton`, `OutlineInputBorder` e `SingleChildScrollView`.

---

## 📸 Como rodar o projeto

1. Certifique-se de ter o Flutter instalado em sua máquina.
2. Clone este repositório.
3. Certifique-se de que a imagem `imc.jpg` esteja na pasta `lib/img/`.
4. Execute o comando `flutter pub get` no terminal.
5. Rode o projeto com `flutter run`.
