# Gramática da Linguagem — EBNF Aumentada (LL(1))

> **Notação:** letras minúsculas = não-terminais; MAIÚSCULAS = terminais.  
> O separador de alternativas é `/` (e não `|`), pois `|` é também um
> operador da linguagem (divisão real). O operador `|` da linguagem
> aparece sempre entre aspas simples: `'|'`.

---

## Produções

```ebnf
programa          ::= '(' START ')' laco_principal

laco_principal    ::= '(' linha_ou_fim

linha_ou_fim      ::= END ')'
                   /  conteudo_rpn ')' laco_principal

lista_instrucoes  ::= instrucao continua_lista

continua_lista    ::= instrucao continua_lista
                   /  epsilon

instrucao         ::= '(' conteudo_rpn ')'

conteudo_rpn      ::= valor elementos

elementos         ::= COMMAND
                   /  valor acao_final
                   /  estrutura_controle
                   /  NOT    (* NOT eh unario: (valor NOT), sem segundo operando *)
                   /  epsilon (* permite (ID) como leitura isolada de variavel *)

acao_final        ::= operador acao_pos_op
                   /  estrutura_controle
                   /  COMMAND
                   /  NOT    (* NOT eh unario *)

acao_pos_op       ::= estrutura_controle
                   /  epsilon

estrutura_controle ::= bloco_codigo tipo_controle

tipo_controle     ::= IF
                   /  WHILE

bloco_codigo      ::= '{' lista_instrucoes '}'

valor             ::= ID
                   /  NUM
                   /  instrucao

operador          ::= '+'
                   /  '-'
                   /  '*'
                   /  '|'    (* divisao real *)
                   /  '/'    (* divisao inteira *)
                   /  '%'    (* resto inteiro *)
                   /  '^'    (* potenciacao *)
                   /  '>'
                   /  '<'
                   /  '=='
                   /  AND    (* conjuncao logica: (e1 e2 AND) *)
                   /  OR     (* disjuncao logica: (e1 e2 OR) *)
(* NOT nao aparece em 'operador': e unario, tratado diretamente em 'elementos'/'acao_final' *)
```

---

## Terminais

| Terminal | Descrição |
|----------|-----------|
| `START` | Marca o início do programa |
| `END` | Marca o fim do programa |
| `IF` | Estrutura de decisão |
| `WHILE` | Estrutura de repetição |
| `RES` | Comando: retorna resultado de N linhas atrás |
| `MEM` | Comando: armazena valor em variável |
| `TRUE` | Literal lógico verdadeiro |
| `FALSE` | Literal lógico falso |
| `AND` | Operador lógico: conjunção (e1 e2 AND), resultado bool |
| `OR` | Operador lógico: disjunção (e1 e2 OR), resultado bool |
| `NOT` | Operador lógico: negação (e1 NOT), operando unário bool |
| `COMMAND` | Metavariável: `RES` ou `MEM` |
| `NUM` | Metavariável: literal inteiro, real, `TRUE` ou `FALSE` |
| `ID` | Metavariável: identificador de variável (letras latinas maiúsculas) |

> **Nota sobre `(MEM)` como leitura de variável (Seção 2.1):** A instrução
> `(MEM)` que "retorna o valor armazenado em MEM" é implementada como
> `(ID)` na gramática, onde `ID` é o nome da variável (ex: `(X)`, `(CONTADOR)`).
> O nome da variável é sempre um conjunto de letras latinas maiúsculas —
> portanto cai na categoria `ID` (não `COMMAND`). Isso está totalmente correto
> pois a produção `valor ::= ID` e `conteudo_rpn ::= valor elementos` com
> `elementos ::= epsilon` permitem exatamente a construção `(NOME_VAR)`.

---

## Regras Semânticas Associadas (Gramática Aumentada)

Cada produção carrega ações semânticas executadas durante o parsing:

| Produção | Ação Semântica |
|----------|----------------|
| `instrucao ::= '(' conteudo_rpn ')'` | Empilha o nó semântico resultante |
| `operador` | Desempilha dois operandos, cria nó `operacao{op, esq, dir}` |
| `tipo_controle ::= IF / WHILE` | Desempilha bloco e condição, cria nó `controle` |
| `COMMAND = MEM` | Desempilha nome_var e val_expr, cria nó `comando{MEM}` |
| `COMMAND = RES` | Desempilha alvo, cria nó `comando{RES}` |
| `NUM` (literal) | Empilha nó `numero{valor, tipo_dado}` |
| `ID` (variável) | Empilha nó `variavel{nome, tipo_dado=None}` |
| `END` | Coleta instrucoes do programa, fecha nó `programa_ast` |
| `'{'` / `'}'` | Delimita bloco; `'}'` fecha nó `bloco{instrucoes}` |
