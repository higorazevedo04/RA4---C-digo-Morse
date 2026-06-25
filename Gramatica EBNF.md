# Gramática da Linguagem RPN — Documentação EBNF

## Notação utilizada

| Símbolo     | Significado                           |
| ----------- | ------------------------------------- |
| `::=`       | Definição de regra                    |
| `/`         | Alternativa (ou) — **não confundir com `\|` que é operador da linguagem** |
| `{ X }`     | Zero ou mais repetições de X          |
| `[ X ]`     | X é opcional (zero ou uma ocorrência) |
| `'texto'`   | Terminal literal                      |
| `MAIÚSCULO` | Terminal simbólico (token)            |
| `minúsculo` | Não-terminal                          |

> **Nota sobre `|`:** O separador de alternativas é `/` (barra) e **não** `|`, pois `|` é também um operador da linguagem (divisão real) e aparece sempre entre aspas simples: `'|'`.

---

## Gramática Completa em EBNF

```ebnf
(* ============================================================ *)
(*  ESTRUTURA DO PROGRAMA                                        *)
(* ============================================================ *)

programa
    ::= '(' START ')' laco_principal

laco_principal
    ::= '(' linha_ou_fim

linha_ou_fim
    ::= END ')'
      / conteudo_rpn ')' laco_principal


(* ============================================================ *)
(*  INSTRUCAO E CONTEUDO RPN                                     *)
(* ============================================================ *)

lista_instrucoes
    ::= instrucao continua_lista

continua_lista
    ::= instrucao continua_lista
      / epsilon

instrucao
    ::= '(' conteudo_rpn ')'

conteudo_rpn
    ::= valor elementos

elementos
    ::= COMMAND
      / valor acao_final
      / estrutura_controle
      / NOT          (* NOT é unário: (valor NOT) — sem segundo operando *)
      / epsilon      (* permite (ID) como leitura isolada de variável *)

acao_final
    ::= operador acao_pos_op
      / estrutura_controle
      / COMMAND
      / NOT          (* NOT é unário *)

acao_pos_op
    ::= estrutura_controle
      / epsilon


(* ============================================================ *)
(*  ESTRUTURAS DE CONTROLE                                       *)
(* ============================================================ *)

estrutura_controle
    ::= bloco_codigo tipo_controle

tipo_controle
    ::= IF
      / WHILE

bloco_codigo
    ::= '{' lista_instrucoes '}'


(* ============================================================ *)
(*  VALORES, OPERADORES E COMANDOS                               *)
(* ============================================================ *)

valor
    ::= ID
      / NUM
      / instrucao

operador
    ::= '+'    (* adição              *)
      / '-'    (* subtração           *)
      / '*'    (* multiplicação       *)
      / '^'    (* potenciação         *)
      / '/'    (* divisão inteira     *)
      / '%'    (* módulo (resto)      *)
      / '|'    (* divisão real        *)
      / '>'    (* maior que           *)
      / '<'    (* menor que           *)
      / '=='   (* igual a             *)
      / AND    (* conjunção lógica: (e1 e2 AND) *)
      / OR     (* disjunção lógica: (e1 e2 OR)  *)
(* NOT não aparece em 'operador': é unário, tratado em 'elementos'/'acao_final' *)

COMMAND
    ::= RES
      / MEM


(* ============================================================ *)
(*  TOKENS TERMINAIS                                             *)
(* ============================================================ *)

NUM
    ::= inteiro
      / real
      / TRUE
      / FALSE

inteiro
    ::= [ '-' ] digito { digito }

real
    ::= [ '-' ] digito { digito } '.' digito { digito }

ID
    ::= ( letra / '_' ) { letra / digito / '_' }

letra
    ::= 'a' .. 'z' / 'A' .. 'Z'

digito
    ::= '0' .. '9'


(* ============================================================ *)
(*  COMENTARIOS (pré-processados antes da análise léxica)       *)
(* ============================================================ *)

comentario
    ::= '*{' qualquer_texto '}*'

qualquer_texto
    ::= { qualquer_caractere_exceto_fechamento }
```

---

## Terminais

| Terminal  | Descrição |
|-----------|-----------|
| `START`   | Marca o início do programa |
| `END`     | Marca o fim do programa |
| `IF`      | Estrutura de decisão |
| `WHILE`   | Estrutura de repetição |
| `RES`     | Comando: retorna resultado de N linhas atrás |
| `MEM`     | Comando: armazena valor em variável |
| `TRUE`    | Literal lógico verdadeiro |
| `FALSE`   | Literal lógico falso |
| `AND`     | Operador lógico: conjunção `(e1 e2 AND)`, resultado `bool` |
| `OR`      | Operador lógico: disjunção `(e1 e2 OR)`, resultado `bool` |
| `NOT`     | Operador lógico: negação `(e1 NOT)`, operador **unário**, resultado `bool` |
| `COMMAND` | Metavariável: `RES` ou `MEM` |
| `NUM`     | Metavariável: literal inteiro, real, `TRUE` ou `FALSE` |
| `ID`      | Metavariável: identificador de variável |

> **Nota sobre `(MEM)` como leitura de variável (Seção 2.1):** A instrução
> `(MEM)` que "retorna o valor armazenado em MEM" é implementada como `(ID)` na gramática, onde `ID` é o nome da variável (ex: `(X)`, `(CONTADOR)`).
> O nome da variável é um identificador de letras latinas — cai na categoria `ID` (não `COMMAND`). A produção `valor ::= ID` com `elementos ::= epsilon` permite exatamente a construção `(NOME_VAR)`.

---

## Conjuntos FIRST e FOLLOW

Os conjuntos abaixo são computados automaticamente pelo compilador e verificados no arquivo `relatorio_validacao_ll1.txt`.

### FIRST

| Não-terminal         | FIRST |
| -------------------- | ----- |
| `programa`           | `{ ( }` |
| `laco_principal`     | `{ ( }` |
| `linha_ou_fim`       | `{ END, ID, NUM, (, TRUE, FALSE }` |
| `lista_instrucoes`   | `{ ( }` |
| `continua_lista`     | `{ (, EPSILON }` |
| `instrucao`          | `{ ( }` |
| `conteudo_rpn`       | `{ ID, NUM, (, TRUE, FALSE }` |
| `elementos`          | `{ COMMAND, ID, NUM, (, TRUE, FALSE, NOT, {, EPSILON }` |
| `acao_final`         | `{ +, -, *, \|, /, %, ^, >, <, ==, AND, OR, COMMAND, NOT, { }` |
| `acao_pos_op`        | `{ {, EPSILON }` |
| `estrutura_controle` | `{ { }` |
| `tipo_controle`      | `{ IF, WHILE }` |
| `bloco_codigo`       | `{ { }` |
| `valor`              | `{ ID, NUM, (, TRUE, FALSE }` |
| `operador`           | `{ +, -, *, \|, /, %, ^, >, <, ==, AND, OR }` |

### FOLLOW

| Não-terminal         | FOLLOW |
| -------------------- | ------ |
| `programa`           | `{ $ }` |
| `laco_principal`     | `{ $ }` |
| `linha_ou_fim`       | `{ $ }` |
| `lista_instrucoes`   | `{ } }` |
| `continua_lista`     | `{ } }` |
| `instrucao`          | `{ ID, NUM, (, TRUE, FALSE, +, -, *, \|, /, %, ^, >, <, ==, AND, OR, COMMAND, NOT, {, }, ) }` |
| `conteudo_rpn`       | `{ ) }` |
| `elementos`          | `{ ) }` |
| `acao_final`         | `{ ) }` |
| `acao_pos_op`        | `{ ) }` |
| `estrutura_controle` | `{ ), IF, WHILE }` |
| `tipo_controle`      | `{ ) }` |
| `bloco_codigo`       | `{ IF, WHILE }` |
| `valor`              | `{ +, -, *, \|, /, %, ^, >, <, ==, AND, OR, COMMAND, NOT, {, }, ) }` |
| `operador`           | `{ {, ) }` |

---

## Propriedade LL(1)

A gramática é **estritamente LL(1)**, verificada por:

1. **Ausência de conflitos FIRST/FIRST:** Para cada não-terminal, as produções alternativas têm conjuntos FIRST disjuntos.
2. **Ausência de conflitos FIRST/FOLLOW:** Para produções que derivam EPSILON, os conjuntos FIRST e FOLLOW correspondentes são disjuntos.
3. **Ausência de recursão à esquerda:** A gramática não possui recursão direta ou indireta à esquerda.

A verificação é executada automaticamente e o resultado é salvo em `relatorio_validacao_ll1.txt`.

---

## Regras Semânticas Associadas (Gramática Aumentada)

Cada produção carrega ações semânticas executadas durante o parsing:

| Produção | Ação Semântica |
|----------|----------------|
| `instrucao ::= '(' conteudo_rpn ')'` | Empilha o nó semântico resultante |
| `operador` (binário) | Desempilha dois operandos, cria nó `operacao{op, esq, dir}` |
| `NOT` (unário) | Desempilha **um** operando, cria nó `operacao{NOT, esq, None}` |
| `tipo_controle ::= IF / WHILE` | Desempilha bloco e condição, cria nó `controle` |
| `COMMAND = MEM` | Desempilha nome_var e val_expr, cria nó `comando{MEM}` |
| `COMMAND = RES` | Desempilha alvo, cria nó `comando{RES}` |
| `NUM` (literal) | Empilha nó `numero{valor, tipo_dado}` |
| `ID` (variável) | Empilha nó `variavel{nome, tipo_dado=None}` |
| `END` | Coleta instrucoes do programa, fecha nó `programa_ast` |
| `'{'` / `'}'` | Delimita bloco; `'}'` fecha nó `bloco{instrucoes}` |

---

## Diagrama de Precedência dos Operadores

> Em RPN, a precedência é determinada pela ordem de empilhamento — não há ambiguidade de precedência na gramática.

| Operador           | Categoria        | Tipo de entrada             | Tipo de saída |
| ------------------ | ---------------- | --------------------------- | ------------- |
| `+` `-` `*` `^`    | Aritmético       | `int×int` ou com `real`     | `int` ou `real` |
| `/`                | Divisão inteira  | `int×int`                   | `int` |
| `%`                | Módulo           | `int×int`                   | `int` |
| `\|`               | Divisão real     | numérico × numérico         | `real` |
| `>` `<` `==`       | Relacional       | numérico × numérico         | `bool` |
| `AND` `OR`         | Lógico Binário   | `bool × bool`               | `bool` |
| `NOT`              | Lógico Unário    | `bool` (um operando)        | `bool` |
