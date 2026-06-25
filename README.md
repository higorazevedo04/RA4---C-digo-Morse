# Compilador RPN → Assembly ARMv7

Compilador completo para uma linguagem de programação em **notação polonesa reversa (RPN)**, desenvolvido como projeto acadêmico. O compilador realiza análise léxica, sintática e semântica, e gera código Assembly ARMv7 pronto para execução no simulador **CPUlator (DE1-SoC)**.

---

## Autor

**Higor Leonardo da Silva Azevedo** — `higorazevedo04`  
Grupo no Canvas: **RA4_5**

---

## Visão Geral

A linguagem-fonte é baseada em **RPN (Reverse Polish Notation)**: os operandos vêm antes do operador, e toda instrução é delimitada por parênteses. O compilador traduz programas escritos nessa linguagem para Assembly ARMv7, que pode ser simulado diretamente no [CPUlator](https://cpulator.01xz.net/?sys=arm-de1soc).

### Exemplo de código-fonte

```
(START)
( 3000 UNIDADE_MS MEM )
( ( 300 UNIDADE_MS * ) T_PONTO MEM )
( 1 LEDR MEM )
( T_PONTO CNT MEM )
( CNT 0 > { ( ( CNT 1 - ) CNT MEM ) } WHILE )
(END)
```

---

## Funcionalidades do Compilador

### Fase 1 — Análise Léxica
- Tokenização completa da linguagem RPN
- Reconhecimento de identificadores (`ID`), números (`NUM`), comandos (`MEM`, `IF`, `WHILE`) e operadores

### Fase 2 — Análise Sintática
- Parser **LL(1)** com tabela construída a partir dos conjuntos FIRST e FOLLOW
- Geração de **CST** (Árvore de Derivação Concreta) e **AST** (Árvore Sintática Abstrata)
- Detecção e reporte de erros sintáticos

### Fase 3 — Análise Semântica
- Construção da **tabela de símbolos**
- Verificação de tipos (inteiros, booleanos, operações aritméticas e lógicas)
- Suporte a operadores unários (`NOT`) e binários (`AND`, `OR`, `+`, `-`, `*`, `/`, `%`, `^`, `>`, `<`, `==`, `|`)
- Geração de **árvore atribuída** com tipos inferidos
- Relatório de erros e avisos semânticos

### Geração de Código — Assembly ARMv7
- Saída compatível com o simulador **CPUlator DE1-SoC**
- Uso de instruções VFP/NEON (`VLDR`, `VSTR`, `VMUL.F64`, `VPUSH`, `VPOP`) para operações em ponto flutuante de 64 bits
- Controle de periféricos via mapeamento de memória (ex.: LEDs em `0xFF200000`)
- Loops de delay em inteiros (`SUBS` + `BNE`) calibrados por `UNIDADE_MS`
- Gerenciamento automático de `literal pool` (diretivas `.ltorg` + `B skip_pool_N`) para evitar erros de limite de 4 KB

---

## Arquivos do Projeto

| Arquivo | Descrição |
|---|---|
| `Compilador.py` | Código-fonte do compilador (léxico + sintático + semântico + geração de código) |
| `morse_higor_azevedo.txt` | Programa de exemplo: transmissão de "HIGOR AZEVEDO" em Morse via LED |
| `saida_assembly.s` | Assembly ARMv7 gerado pelo compilador para o exemplo Morse |

### Arquivos gerados pelo compilador

| Arquivo gerado | Descrição |
|---|---|
| `saida_lexica.txt` | Tokens reconhecidos pelo analisador léxico |
| `arvore_cst.json` | Árvore de derivação concreta (CST) |
| `arvore_ast.json` | Árvore sintática abstrata (AST) |
| `arvore_atribuida.json` | AST com tipos inferidos |
| `arvore_atribuida.md` | Árvore atribuída em Markdown |
| `tabela_simbolos.json` | Tabela de símbolos |
| `tabela_simbolos.md` | Tabela de símbolos em Markdown |
| `erros_semanticos.md` | Relatório de erros semânticos |
| `saida_assembly.s` | Código Assembly ARMv7 gerado |
| `gramatica.md` | Gramática EBNF aumentada da linguagem |
| `sequentes.md` | Regras de tipos em cálculo de sequentes |
| `relatorio_validacao_ll1.txt` | Relatório de validação teórica LL(1) |

---

## Como Usar

### Pré-requisitos

- Python 3.8 ou superior
- Sem dependências externas (apenas biblioteca padrão)

### Compilando um programa

```bash
python Compilador.py nome_do_arquivo.txt
```

O compilador irá:
1. Executar a validação teórica LL(1) e gerar os relatórios
2. Realizar análise léxica, sintática e semântica
3. Gerar todos os arquivos de saída na pasta atual
4. Exibir no terminal o resultado de cada etapa

### Exemplo com o programa Morse

```bash
python Compilador.py morse_higor_azevedo.txt
```

Em caso de sucesso, o arquivo `saida_assembly.s` conterá o código ARMv7 pronto para ser carregado no CPUlator.

---

## Programa de Exemplo — Morse "HIGOR AZEVEDO"

O arquivo `morse_higor_azevedo.txt` demonstra a transmissão do nome **HIGOR AZEVEDO** em código Morse através do LED vermelho (LEDR) da placa DE1-SoC simulada.

### Tabela Morse utilizada

| Letra | Código | Letra | Código |
|---|---|---|---|
| H | `....` | A | `.-` |
| I | `..` | Z | `--..` |
| G | `--.` | E | `.` |
| O | `---` | V | `...-` |
| R | `.-.` | D | `-..` |

### Temporização

| Constante | Valor | Significado |
|---|---|---|
| `UNIDADE_MS` | 3000 iterações | Base de tempo (≈ 1 ms no CPUlator) |
| `T_PONTO` | 300 × UNIDADE_MS | Duração de um ponto |
| `T_TRACO` | 600 × UNIDADE_MS | Duração de um traço |
| `T_GAPL` | 450 × UNIDADE_MS | Espaço entre sinais da mesma letra |
| `T_GAPP` | 900 × UNIDADE_MS | Espaço entre letras |
| `T_GAPF` | 2000 × UNIDADE_MS | Espaço entre palavras |

### Como simular no CPUlator

1. Acesse [cpulator.01xz.net](https://cpulator.01xz.net/?sys=arm-de1soc)
2. No menu, selecione **File → Open** e carregue o arquivo `saida_assembly.s`
3. Clique em **Compile and Load**
4. Pressione **Run** — o LED vermelho (LEDR0) piscará transmitindo "HIGOR AZEVEDO" em Morse

---

## Gramática da Linguagem (resumo)

```
programa       → (START) laco_principal
laco_principal → (END) | (instrução) laco_principal
instrução      → valor operador? (estrutura_controle | COMMAND)?
valor          → ID | NUM | (instrução)
estrutura      → { lista_instrucoes } IF | WHILE
operador       → + | - | * | / | % | ^ | > | < | == | AND | OR | NOT | |
```

A gramática completa no formato EBNF aumentado é gerada automaticamente em `gramatica.md` a cada execução do compilador.

---

## Licença

Projeto acadêmico — uso educacional.
