# Árvore Sintática Atribuída

**Arquivo analisado:** `morse_higor_azevedo.txt`

## Tabela de Símbolos

| Variável | Escopo | Tipo | Linha Def | Linhas Uso |
|----------|--------|------|-----------|------------|
| `CNT` | `global` | `int` | 130 | 23, 23, 24, 24, 26, 26, 27, 27, 29, 29, 30, 30, 32, 32, 33, 33, 36, 36, 37, 37, 39, 39, 40, 40, 43, 43, 44, 44, 46, 46, 47, 47, 49, 49, 50, 50, 53, 53, 54, 54, 56, 56, 57, 57, 59, 59, 60, 60, 63, 63, 64, 64, 66, 66, 67, 67, 69, 69, 70, 70, 73, 73, 74, 74, 76, 76, 77, 77, 80, 80, 81, 81, 83, 83, 84, 84, 86, 86, 87, 87, 89, 89, 90, 90, 93, 93, 94, 94, 97, 97, 98, 98, 100, 100, 101, 101, 103, 103, 104, 104, 106, 106, 107, 107, 110, 110, 111, 111, 114, 114, 115, 115, 117, 117, 118, 118, 120, 120, 121, 121, 124, 124, 125, 125, 127, 127, 128, 128, 130, 130 |
| `LEDR` | `global` | `int` | 131 | — |
| `T_GAPF` | `global` | `int` | 20 | 70 |
| `T_GAPL` | `global` | `int` | 18 | 24, 27, 30, 37, 44, 47, 54, 57, 64, 67, 74, 81, 84, 87, 98, 101, 104, 115, 118, 125, 128 |
| `T_GAPP` | `global` | `int` | 19 | 33, 40, 50, 60, 77, 90, 94, 107, 111, 121 |
| `T_PONTO` | `global` | `int` | 16 | 23, 26, 29, 32, 36, 39, 49, 63, 69, 73, 86, 89, 93, 97, 100, 103, 110, 117, 120 |
| `T_TRACO` | `global` | `int` | 17 | 43, 46, 53, 56, 59, 66, 76, 80, 83, 106, 114, 124, 127, 130 |
| `UNIDADE_MS` | `global` | `int` | 13 | 16, 17, 18, 19, 20 |

## Erros Semânticos

_Nenhum erro semântico detectado._

## Regras de Tipo (Cálculo de Sequentes)

> Consulte também o arquivo `sequentes.md` para a versão completa e detalhada.

> **Nota sobre inferência de tipos (Seção 2.3):** o sistema é estático e forte.
> O tipo de cada variável é determinado no momento de sua definição via `(V MEM)`.
> Usos posteriores em contexto incompatível geram erro semântico — não há
> redefinição implícita de tipo pelo contexto de uso.

```
[INT-LIT]   ⊢ n : int             (n literal inteiro)
[REAL-LIT]  ⊢ r : real            (r literal real)
[BOOL-LIT]  ⊢ b : bool            (b ∈ {TRUE, FALSE})

[VAR]       x:T ∈ Γ
            ────────
            Γ ⊢ x : T

[ARIT-INT]  Γ ⊢ e1:int, Γ ⊢ e2:int, op ∈ {+,-,*,^}  ⊢  (e1 e2 op) : int
[ARIT-REAL] Γ ⊢ e1:T1, Γ ⊢ e2:T2, op ∈ {+,-,*,^}, T1∨T2=real  ⊢  (e1 e2 op) : real
[DIV-INT]   Γ ⊢ e1:int, Γ ⊢ e2:int  ⊢  (e1 e2 /) : int
[MOD-INT]   Γ ⊢ e1:int, Γ ⊢ e2:int  ⊢  (e1 e2 %) : int
[DIV-REAL]  Γ ⊢ e1:T1, Γ ⊢ e2:T2, T1,T2 ∈ {int,real}  ⊢  (e1 e2 '|') : real
[REL-NUM]   Γ ⊢ e1:T, Γ ⊢ e2:T, T ∈ {int,real}, op ∈ {>,<}  ⊢  (e1 e2 op) : bool
[EQ]        Γ ⊢ e1:T, Γ ⊢ e2:T, T ∈ {int,real,bool}  ⊢  (e1 e2 ==) : bool
[AND]       Γ ⊢ e1:bool, Γ ⊢ e2:bool  ⊢  (e1 e2 AND) : bool
[OR]        Γ ⊢ e1:bool, Γ ⊢ e2:bool  ⊢  (e1 e2 OR)  : bool
[NOT]       Γ ⊢ e1:bool  ⊢  (e1 NOT) : bool   [unario]
[IF]        Γ ⊢ cond:bool, Γ ⊢ bloco:ok  ⊢  IF(cond,bloco) : ok
[WHILE]     Γ ⊢ cond:bool, Γ ⊢ bloco:ok  ⊢  WHILE(cond,bloco) : ok
[MEM-DEF]   Γ ⊢ v:T  ⊢  (v MEM):ok,  Γ'=Γ[MEM↦T]
[MEM-REDEF] Γ ⊢ v:T, MEM:T ∈ Γ  ⊢  (v MEM):ok  (reatribuição compatível)
[MEM-ERR]   Γ ⊢ v:T', MEM:T ∈ Γ, T'≠T  ⊢  ERRO SEMÂNTICO
[MEM-USO]   MEM:T ∈ Γ  ⊢  (MEM):T  — leitura via instrução (ID) na gramática
[RES]       Γ ⊢ n:int, n≥0  ⊢  (n RES):any
```

## Nós da Árvore Atribuída

```json
{
  "tipo": "programa_ast",
  "instrucoes": [
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 12
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 12
      },
      "linha": 12,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "UNIDADE_MS",
        "tipo_dado": "int",
        "linha": 13
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 3000,
        "tipo_dado": "int",
        "linha": 13
      },
      "linha": 13,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 16
      },
      "val_expr": {
        "tipo": "operacao",
        "operador": "*",
        "esquerda": {
          "tipo": "numero",
          "valor": 300,
          "tipo_dado": "int",
          "linha": 16
        },
        "direita": {
          "tipo": "variavel",
          "nome": "UNIDADE_MS",
          "tipo_dado": "int",
          "linha": 16
        },
        "linha": 16,
        "tipo_dado": "int"
      },
      "linha": 16,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 17
      },
      "val_expr": {
        "tipo": "operacao",
        "operador": "*",
        "esquerda": {
          "tipo": "numero",
          "valor": 600,
          "tipo_dado": "int",
          "linha": 17
        },
        "direita": {
          "tipo": "variavel",
          "nome": "UNIDADE_MS",
          "tipo_dado": "int",
          "linha": 17
        },
        "linha": 17,
        "tipo_dado": "int"
      },
      "linha": 17,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 18
      },
      "val_expr": {
        "tipo": "operacao",
        "operador": "*",
        "esquerda": {
          "tipo": "numero",
          "valor": 450,
          "tipo_dado": "int",
          "linha": 18
        },
        "direita": {
          "tipo": "variavel",
          "nome": "UNIDADE_MS",
          "tipo_dado": "int",
          "linha": 18
        },
        "linha": 18,
        "tipo_dado": "int"
      },
      "linha": 18,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 19
      },
      "val_expr": {
        "tipo": "operacao",
        "operador": "*",
        "esquerda": {
          "tipo": "numero",
          "valor": 900,
          "tipo_dado": "int",
          "linha": 19
        },
        "direita": {
          "tipo": "variavel",
          "nome": "UNIDADE_MS",
          "tipo_dado": "int",
          "linha": 19
        },
        "linha": 19,
        "tipo_dado": "int"
      },
      "linha": 19,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "T_GAPF",
        "tipo_dado": "int",
        "linha": 20
      },
      "val_expr": {
        "tipo": "operacao",
        "operador": "*",
        "esquerda": {
          "tipo": "numero",
          "valor": 2000,
          "tipo_dado": "int",
          "linha": 20
        },
        "direita": {
          "tipo": "variavel",
          "nome": "UNIDADE_MS",
          "tipo_dado": "int",
          "linha": 20
        },
        "linha": 20,
        "tipo_dado": "int"
      },
      "linha": 20,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 23
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 23
      },
      "linha": 23,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 23
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 23
      },
      "linha": 23,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 23
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 23
        },
        "linha": 23,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 23
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 23
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 23
              },
              "linha": 23,
              "tipo_dado": "int"
            },
            "linha": 23,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 23,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 24
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 24
      },
      "linha": 24,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 24
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 24
      },
      "linha": 24,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 24
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 24
        },
        "linha": 24,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 24
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 24
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 24
              },
              "linha": 24,
              "tipo_dado": "int"
            },
            "linha": 24,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 24,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 26
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 26
      },
      "linha": 26,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 26
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 26
      },
      "linha": 26,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 26
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 26
        },
        "linha": 26,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 26
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 26
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 26
              },
              "linha": 26,
              "tipo_dado": "int"
            },
            "linha": 26,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 26,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 27
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 27
      },
      "linha": 27,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 27
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 27
      },
      "linha": 27,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 27
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 27
        },
        "linha": 27,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 27
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 27
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 27
              },
              "linha": 27,
              "tipo_dado": "int"
            },
            "linha": 27,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 27,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 29
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 29
      },
      "linha": 29,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 29
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 29
      },
      "linha": 29,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 29
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 29
        },
        "linha": 29,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 29
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 29
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 29
              },
              "linha": 29,
              "tipo_dado": "int"
            },
            "linha": 29,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 29,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 30
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 30
      },
      "linha": 30,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 30
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 30
      },
      "linha": 30,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 30
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 30
        },
        "linha": 30,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 30
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 30
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 30
              },
              "linha": 30,
              "tipo_dado": "int"
            },
            "linha": 30,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 30,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 32
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 32
      },
      "linha": 32,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 32
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 32
      },
      "linha": 32,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 32
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 32
        },
        "linha": 32,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 32
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 32
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 32
              },
              "linha": 32,
              "tipo_dado": "int"
            },
            "linha": 32,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 32,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 33
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 33
      },
      "linha": 33,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 33
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 33
      },
      "linha": 33,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 33
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 33
        },
        "linha": 33,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 33
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 33
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 33
              },
              "linha": 33,
              "tipo_dado": "int"
            },
            "linha": 33,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 33,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 36
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 36
      },
      "linha": 36,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 36
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 36
      },
      "linha": 36,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 36
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 36
        },
        "linha": 36,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 36
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 36
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 36
              },
              "linha": 36,
              "tipo_dado": "int"
            },
            "linha": 36,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 36,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 37
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 37
      },
      "linha": 37,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 37
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 37
      },
      "linha": 37,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 37
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 37
        },
        "linha": 37,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 37
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 37
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 37
              },
              "linha": 37,
              "tipo_dado": "int"
            },
            "linha": 37,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 37,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 39
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 39
      },
      "linha": 39,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 39
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 39
      },
      "linha": 39,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 39
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 39
        },
        "linha": 39,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 39
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 39
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 39
              },
              "linha": 39,
              "tipo_dado": "int"
            },
            "linha": 39,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 39,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 40
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 40
      },
      "linha": 40,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 40
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 40
      },
      "linha": 40,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 40
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 40
        },
        "linha": 40,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 40
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 40
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 40
              },
              "linha": 40,
              "tipo_dado": "int"
            },
            "linha": 40,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 40,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 43
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 43
      },
      "linha": 43,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 43
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 43
      },
      "linha": 43,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 43
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 43
        },
        "linha": 43,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 43
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 43
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 43
              },
              "linha": 43,
              "tipo_dado": "int"
            },
            "linha": 43,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 43,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 44
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 44
      },
      "linha": 44,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 44
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 44
      },
      "linha": 44,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 44
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 44
        },
        "linha": 44,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 44
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 44
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 44
              },
              "linha": 44,
              "tipo_dado": "int"
            },
            "linha": 44,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 44,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 46
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 46
      },
      "linha": 46,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 46
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 46
      },
      "linha": 46,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 46
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 46
        },
        "linha": 46,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 46
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 46
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 46
              },
              "linha": 46,
              "tipo_dado": "int"
            },
            "linha": 46,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 46,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 47
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 47
      },
      "linha": 47,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 47
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 47
      },
      "linha": 47,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 47
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 47
        },
        "linha": 47,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 47
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 47
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 47
              },
              "linha": 47,
              "tipo_dado": "int"
            },
            "linha": 47,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 47,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 49
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 49
      },
      "linha": 49,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 49
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 49
      },
      "linha": 49,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 49
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 49
        },
        "linha": 49,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 49
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 49
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 49
              },
              "linha": 49,
              "tipo_dado": "int"
            },
            "linha": 49,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 49,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 50
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 50
      },
      "linha": 50,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 50
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 50
      },
      "linha": 50,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 50
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 50
        },
        "linha": 50,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 50
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 50
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 50
              },
              "linha": 50,
              "tipo_dado": "int"
            },
            "linha": 50,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 50,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 53
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 53
      },
      "linha": 53,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 53
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 53
      },
      "linha": 53,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 53
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 53
        },
        "linha": 53,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 53
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 53
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 53
              },
              "linha": 53,
              "tipo_dado": "int"
            },
            "linha": 53,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 53,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 54
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 54
      },
      "linha": 54,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 54
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 54
      },
      "linha": 54,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 54
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 54
        },
        "linha": 54,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 54
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 54
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 54
              },
              "linha": 54,
              "tipo_dado": "int"
            },
            "linha": 54,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 54,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 56
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 56
      },
      "linha": 56,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 56
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 56
      },
      "linha": 56,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 56
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 56
        },
        "linha": 56,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 56
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 56
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 56
              },
              "linha": 56,
              "tipo_dado": "int"
            },
            "linha": 56,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 56,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 57
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 57
      },
      "linha": 57,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 57
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 57
      },
      "linha": 57,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 57
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 57
        },
        "linha": 57,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 57
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 57
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 57
              },
              "linha": 57,
              "tipo_dado": "int"
            },
            "linha": 57,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 57,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 59
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 59
      },
      "linha": 59,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 59
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 59
      },
      "linha": 59,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 59
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 59
        },
        "linha": 59,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 59
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 59
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 59
              },
              "linha": 59,
              "tipo_dado": "int"
            },
            "linha": 59,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 59,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 60
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 60
      },
      "linha": 60,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 60
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 60
      },
      "linha": 60,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 60
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 60
        },
        "linha": 60,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 60
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 60
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 60
              },
              "linha": 60,
              "tipo_dado": "int"
            },
            "linha": 60,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 60,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 63
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 63
      },
      "linha": 63,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 63
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 63
      },
      "linha": 63,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 63
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 63
        },
        "linha": 63,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 63
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 63
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 63
              },
              "linha": 63,
              "tipo_dado": "int"
            },
            "linha": 63,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 63,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 64
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 64
      },
      "linha": 64,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 64
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 64
      },
      "linha": 64,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 64
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 64
        },
        "linha": 64,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 64
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 64
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 64
              },
              "linha": 64,
              "tipo_dado": "int"
            },
            "linha": 64,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 64,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 66
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 66
      },
      "linha": 66,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 66
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 66
      },
      "linha": 66,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 66
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 66
        },
        "linha": 66,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 66
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 66
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 66
              },
              "linha": 66,
              "tipo_dado": "int"
            },
            "linha": 66,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 66,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 67
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 67
      },
      "linha": 67,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 67
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 67
      },
      "linha": 67,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 67
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 67
        },
        "linha": 67,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 67
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 67
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 67
              },
              "linha": 67,
              "tipo_dado": "int"
            },
            "linha": 67,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 67,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 69
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 69
      },
      "linha": 69,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 69
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 69
      },
      "linha": 69,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 69
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 69
        },
        "linha": 69,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 69
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 69
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 69
              },
              "linha": 69,
              "tipo_dado": "int"
            },
            "linha": 69,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 69,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 70
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 70
      },
      "linha": 70,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 70
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPF",
        "tipo_dado": "int",
        "linha": 70
      },
      "linha": 70,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 70
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 70
        },
        "linha": 70,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 70
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 70
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 70
              },
              "linha": 70,
              "tipo_dado": "int"
            },
            "linha": 70,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 70,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 73
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 73
      },
      "linha": 73,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 73
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 73
      },
      "linha": 73,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 73
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 73
        },
        "linha": 73,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 73
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 73
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 73
              },
              "linha": 73,
              "tipo_dado": "int"
            },
            "linha": 73,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 73,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 74
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 74
      },
      "linha": 74,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 74
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 74
      },
      "linha": 74,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 74
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 74
        },
        "linha": 74,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 74
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 74
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 74
              },
              "linha": 74,
              "tipo_dado": "int"
            },
            "linha": 74,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 74,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 76
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 76
      },
      "linha": 76,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 76
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 76
      },
      "linha": 76,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 76
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 76
        },
        "linha": 76,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 76
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 76
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 76
              },
              "linha": 76,
              "tipo_dado": "int"
            },
            "linha": 76,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 76,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 77
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 77
      },
      "linha": 77,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 77
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 77
      },
      "linha": 77,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 77
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 77
        },
        "linha": 77,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 77
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 77
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 77
              },
              "linha": 77,
              "tipo_dado": "int"
            },
            "linha": 77,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 77,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 80
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 80
      },
      "linha": 80,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 80
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 80
      },
      "linha": 80,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 80
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 80
        },
        "linha": 80,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 80
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 80
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 80
              },
              "linha": 80,
              "tipo_dado": "int"
            },
            "linha": 80,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 80,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 81
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 81
      },
      "linha": 81,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 81
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 81
      },
      "linha": 81,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 81
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 81
        },
        "linha": 81,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 81
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 81
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 81
              },
              "linha": 81,
              "tipo_dado": "int"
            },
            "linha": 81,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 81,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 83
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 83
      },
      "linha": 83,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 83
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 83
      },
      "linha": 83,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 83
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 83
        },
        "linha": 83,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 83
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 83
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 83
              },
              "linha": 83,
              "tipo_dado": "int"
            },
            "linha": 83,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 83,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 84
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 84
      },
      "linha": 84,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 84
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 84
      },
      "linha": 84,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 84
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 84
        },
        "linha": 84,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 84
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 84
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 84
              },
              "linha": 84,
              "tipo_dado": "int"
            },
            "linha": 84,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 84,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 86
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 86
      },
      "linha": 86,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 86
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 86
      },
      "linha": 86,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 86
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 86
        },
        "linha": 86,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 86
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 86
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 86
              },
              "linha": 86,
              "tipo_dado": "int"
            },
            "linha": 86,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 86,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 87
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 87
      },
      "linha": 87,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 87
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 87
      },
      "linha": 87,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 87
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 87
        },
        "linha": 87,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 87
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 87
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 87
              },
              "linha": 87,
              "tipo_dado": "int"
            },
            "linha": 87,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 87,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 89
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 89
      },
      "linha": 89,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 89
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 89
      },
      "linha": 89,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 89
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 89
        },
        "linha": 89,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 89
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 89
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 89
              },
              "linha": 89,
              "tipo_dado": "int"
            },
            "linha": 89,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 89,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 90
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 90
      },
      "linha": 90,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 90
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 90
      },
      "linha": 90,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 90
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 90
        },
        "linha": 90,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 90
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 90
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 90
              },
              "linha": 90,
              "tipo_dado": "int"
            },
            "linha": 90,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 90,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 93
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 93
      },
      "linha": 93,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 93
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 93
      },
      "linha": 93,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 93
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 93
        },
        "linha": 93,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 93
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 93
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 93
              },
              "linha": 93,
              "tipo_dado": "int"
            },
            "linha": 93,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 93,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 94
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 94
      },
      "linha": 94,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 94
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 94
      },
      "linha": 94,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 94
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 94
        },
        "linha": 94,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 94
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 94
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 94
              },
              "linha": 94,
              "tipo_dado": "int"
            },
            "linha": 94,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 94,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 97
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 97
      },
      "linha": 97,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 97
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 97
      },
      "linha": 97,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 97
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 97
        },
        "linha": 97,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 97
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 97
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 97
              },
              "linha": 97,
              "tipo_dado": "int"
            },
            "linha": 97,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 97,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 98
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 98
      },
      "linha": 98,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 98
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 98
      },
      "linha": 98,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 98
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 98
        },
        "linha": 98,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 98
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 98
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 98
              },
              "linha": 98,
              "tipo_dado": "int"
            },
            "linha": 98,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 98,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 100
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 100
      },
      "linha": 100,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 100
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 100
      },
      "linha": 100,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 100
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 100
        },
        "linha": 100,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 100
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 100
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 100
              },
              "linha": 100,
              "tipo_dado": "int"
            },
            "linha": 100,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 100,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 101
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 101
      },
      "linha": 101,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 101
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 101
      },
      "linha": 101,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 101
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 101
        },
        "linha": 101,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 101
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 101
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 101
              },
              "linha": 101,
              "tipo_dado": "int"
            },
            "linha": 101,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 101,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 103
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 103
      },
      "linha": 103,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 103
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 103
      },
      "linha": 103,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 103
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 103
        },
        "linha": 103,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 103
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 103
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 103
              },
              "linha": 103,
              "tipo_dado": "int"
            },
            "linha": 103,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 103,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 104
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 104
      },
      "linha": 104,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 104
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 104
      },
      "linha": 104,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 104
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 104
        },
        "linha": 104,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 104
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 104
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 104
              },
              "linha": 104,
              "tipo_dado": "int"
            },
            "linha": 104,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 104,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 106
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 106
      },
      "linha": 106,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 106
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 106
      },
      "linha": 106,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 106
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 106
        },
        "linha": 106,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 106
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 106
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 106
              },
              "linha": 106,
              "tipo_dado": "int"
            },
            "linha": 106,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 106,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 107
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 107
      },
      "linha": 107,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 107
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 107
      },
      "linha": 107,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 107
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 107
        },
        "linha": 107,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 107
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 107
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 107
              },
              "linha": 107,
              "tipo_dado": "int"
            },
            "linha": 107,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 107,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 110
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 110
      },
      "linha": 110,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 110
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 110
      },
      "linha": 110,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 110
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 110
        },
        "linha": 110,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 110
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 110
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 110
              },
              "linha": 110,
              "tipo_dado": "int"
            },
            "linha": 110,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 110,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 111
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 111
      },
      "linha": 111,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 111
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 111
      },
      "linha": 111,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 111
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 111
        },
        "linha": 111,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 111
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 111
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 111
              },
              "linha": 111,
              "tipo_dado": "int"
            },
            "linha": 111,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 111,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 114
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 114
      },
      "linha": 114,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 114
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 114
      },
      "linha": 114,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 114
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 114
        },
        "linha": 114,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 114
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 114
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 114
              },
              "linha": 114,
              "tipo_dado": "int"
            },
            "linha": 114,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 114,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 115
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 115
      },
      "linha": 115,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 115
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 115
      },
      "linha": 115,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 115
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 115
        },
        "linha": 115,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 115
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 115
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 115
              },
              "linha": 115,
              "tipo_dado": "int"
            },
            "linha": 115,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 115,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 117
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 117
      },
      "linha": 117,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 117
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 117
      },
      "linha": 117,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 117
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 117
        },
        "linha": 117,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 117
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 117
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 117
              },
              "linha": 117,
              "tipo_dado": "int"
            },
            "linha": 117,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 117,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 118
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 118
      },
      "linha": 118,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 118
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 118
      },
      "linha": 118,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 118
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 118
        },
        "linha": 118,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 118
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 118
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 118
              },
              "linha": 118,
              "tipo_dado": "int"
            },
            "linha": 118,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 118,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 120
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 120
      },
      "linha": 120,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 120
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_PONTO",
        "tipo_dado": "int",
        "linha": 120
      },
      "linha": 120,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 120
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 120
        },
        "linha": 120,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 120
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 120
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 120
              },
              "linha": 120,
              "tipo_dado": "int"
            },
            "linha": 120,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 120,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 121
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 121
      },
      "linha": 121,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 121
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPP",
        "tipo_dado": "int",
        "linha": 121
      },
      "linha": 121,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 121
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 121
        },
        "linha": 121,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 121
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 121
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 121
              },
              "linha": 121,
              "tipo_dado": "int"
            },
            "linha": 121,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 121,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 124
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 124
      },
      "linha": 124,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 124
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 124
      },
      "linha": 124,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 124
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 124
        },
        "linha": 124,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 124
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 124
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 124
              },
              "linha": 124,
              "tipo_dado": "int"
            },
            "linha": 124,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 124,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 125
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 125
      },
      "linha": 125,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 125
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 125
      },
      "linha": 125,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 125
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 125
        },
        "linha": 125,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 125
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 125
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 125
              },
              "linha": 125,
              "tipo_dado": "int"
            },
            "linha": 125,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 125,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 127
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 127
      },
      "linha": 127,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 127
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 127
      },
      "linha": 127,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 127
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 127
        },
        "linha": 127,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 127
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 127
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 127
              },
              "linha": 127,
              "tipo_dado": "int"
            },
            "linha": 127,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 127,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 128
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 128
      },
      "linha": 128,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 128
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_GAPL",
        "tipo_dado": "int",
        "linha": 128
      },
      "linha": 128,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 128
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 128
        },
        "linha": 128,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 128
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 128
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 128
              },
              "linha": 128,
              "tipo_dado": "int"
            },
            "linha": 128,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 128,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 130
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 1,
        "tipo_dado": "int",
        "linha": 130
      },
      "linha": 130,
      "tipo_dado": "int"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "CNT",
        "tipo_dado": "int",
        "linha": 130
      },
      "val_expr": {
        "tipo": "variavel",
        "nome": "T_TRACO",
        "tipo_dado": "int",
        "linha": 130
      },
      "linha": 130,
      "tipo_dado": "int"
    },
    {
      "tipo": "controle",
      "estrutura": "WHILE",
      "condicao": {
        "tipo": "operacao",
        "operador": ">",
        "esquerda": {
          "tipo": "variavel",
          "nome": "CNT",
          "tipo_dado": "int",
          "linha": 130
        },
        "direita": {
          "tipo": "numero",
          "valor": 0,
          "tipo_dado": "int",
          "linha": 130
        },
        "linha": 130,
        "tipo_dado": "bool"
      },
      "bloco": {
        "tipo": "bloco",
        "instrucoes": [
          {
            "tipo": "comando",
            "comando": "MEM",
            "nome_var": {
              "tipo": "variavel",
              "nome": "CNT",
              "tipo_dado": "int",
              "linha": 130
            },
            "val_expr": {
              "tipo": "operacao",
              "operador": "-",
              "esquerda": {
                "tipo": "variavel",
                "nome": "CNT",
                "tipo_dado": "int",
                "linha": 130
              },
              "direita": {
                "tipo": "numero",
                "valor": 1,
                "tipo_dado": "int",
                "linha": 130
              },
              "linha": 130,
              "tipo_dado": "int"
            },
            "linha": 130,
            "tipo_dado": "int"
          }
        ],
        "tipo_dado": "ok"
      },
      "linha": 130,
      "tipo_dado": "ok"
    },
    {
      "tipo": "comando",
      "comando": "MEM",
      "nome_var": {
        "tipo": "variavel",
        "nome": "LEDR",
        "tipo_dado": "int",
        "linha": 131
      },
      "val_expr": {
        "tipo": "numero",
        "valor": 0,
        "tipo_dado": "int",
        "linha": 131
      },
      "linha": 131,
      "tipo_dado": "int"
    }
  ],
  "tipo_dado": "ok"
}
```