
Responsáveis: 
**Guilherme Augusto de Oliveira**
**Pedro Veloso Inacio de Oliveira** 

O presente repositório se trata de um projeto desenvolvido como componente obrigatório para o curso de Laboratório de Arquitetura e Organização de Computaodores I do CEFETMG.

Seu objetivo foi desenvolver um processador de 8 bits do tipo RISC. Tal projeto passou pelas seguintes etapas:

 1. Definição das instruções a serem executadas pelo processador
 2. Criação de um programa embarcado de teste, escrito com as próprias instruções em binário definidas anteriormente. No caso, o programa se tratou de uma função que calculo o fatorial de números de 0 a 5, tendo em vista a limitação de 8 bits.
 3. Desenvolvimento de um caminho de dados, similar à solução adotada para o MIPS 32 bits, mas com modificações para atender às instruções específicas do processador.
 4. Programação de todos os componentes do caminho de dados em Verilog e seus respectivos módulos de teste. Por fim, também foi necessário criar um módulo que conecta todos esses componentes.

Como resultado, é possível obervar o seguinte *data path*, além de todos os arquivos Verilog presentes no repositório.

![Caminho de dados](https://i.imgur.com/MFUMyjH.jpg)

> Written with [StackEdit](https://stackedit.io/).
