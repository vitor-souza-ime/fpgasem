# Semáforo Digital para FPGA

Este repositório contém uma implementação de um **semáforo digital de três estados** utilizando **Verilog HDL**, projetado para ser sintetizado em FPGA. O projeto é direcionado à placa **Tang Nano 1K** (FPGA GW1NZ-LV1) e demonstra uma máquina de estados finitos que controla três LEDs simulando as fases do semáforo: verde, amarelo e vermelho.

Os arquivos principais do projeto são:
- `sem.v`: código Verilog que implementa a lógica sequencial da máquina de estados.
- `fpga.cst`: arquivo de restrições de pinos para a placa alvo.
- `main.py`: arquivo principal para referência (conforme nome pedido).

## Descrição do Sistema

O módulo Verilog descrito em `sem.v` implementa uma máquina de estados finita de três estados que controla LEDs representando as fases do semáforo. Cada estado é mantido por um intervalo de tempo configurável com base no clock de 27 MHz da placa Tang Nano 1K.  

A máquina de estados transita sequencialmente entre:
1. **Verde** – LED verde aceso por tempo configurado.
2. **Amarelo** – LED amarelo aceso por tempo configurado.
3. **Vermelho** – LED vermelho aceso por tempo configurado.

As temporizações podem ser ajustadas por parâmetros no código Verilog, permitindo flexibilidade para diferentes requisitos de projeto.

## Arquivos e Estrutura

```

fpgasem/
├── sem.v           # Descrição da máquina de estados semáforo em Verilog
├── fpga.cst        # Arquivo de restrições de pinos para a Tang Nano 1K
├── main.py         # Arquivo principal indicado (pode conter notas ou scripts auxiliares)
└── README.md       # Este arquivo

````

## Requisitos

Para sintetizar e programar o projeto na placa Tang Nano 1K você precisa:

- **Gowin FPGA Designer – Education Edition**, ferramenta de síntese e implementação para dispositivos Gowin.
- **Placa Tang Nano 1K**, com clock de 27 MHz integrado.
- Cabo USB-C com interface de programação (BL702 na placa).

## Síntese e Programação

Para gerar um bitstream e programar a FPGA:

1. Clone o repositório:
   ```bash
   git clone https://github.com/vitor-souza-ime/fpgasem.git
   cd fpgasem
````

2. Abra o **Gowin FPGA Designer** e crie um novo projeto.
3. Selecione o dispositivo alvo **GW1NZ-LV1QN48C6/I5** (Tang Nano 1K).
4. Adicione os arquivos `sem.v` e `fpga.cst` ao projeto.
5. Configure os pinos conforme o `fpga.cst`.
6. Execute **Synthesis**, **Place & Route** e **Generate Bitstream**.
7. Programe a placa com o bitstream gerado e observe o semáforo funcionando.

## Funcionamento

Ao energizar a placa, a lógica de semáforo entra em operação com as fases configuradas.
O LED correspondente a cada estado acenderá conforme a temporização definida no código, percorrendo repetidamente:

* Verde → Amarelo → Vermelho → Verde → …

## Licença

Este projeto está aberto ao uso educacional e pode ser adaptado para fins de aprendizado e prototipagem com FPGAs de baixo custo.

