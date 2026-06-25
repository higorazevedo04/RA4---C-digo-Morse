.global _start

.data
    .align 3
    array_res: .space 8000
    ptr_res:   .word 0

    .align 3
    const_0: .double 0.0
    .align 3
    const_1: .double 1.0
    .align 3
    const_2: .double 3000
    .align 3
    const_3: .double 300
    .align 3
    const_4: .double 600
    .align 3
    const_5: .double 450
    .align 3
    const_6: .double 900
    .align 3
    const_7: .double 2000
    .align 3
    CNT: .double 0.0
    .align 3
    T_GAPF: .double 0.0
    .align 3
    T_GAPL: .double 0.0
    .align 3
    T_GAPP: .double 0.0
    .align 3
    T_PONTO: .double 0.0
    .align 3
    T_TRACO: .double 0.0
    .align 3
    UNIDADE_MS: .double 0.0

.text
_start:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_0
    .ltorg
skip_pool_0:
    LDR R0, =const_2
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_1
    .ltorg
skip_pool_1:
    LDR R0, =const_3
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VLDR D0, [R0]
    VPUSH {D0}

    @ operacao *
    VPOP {D1}
    VPOP {D0}
    VMUL.F64 D0, D0, D1
    VPUSH {D0}
    LDR R0, =T_PONTO
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_2
    .ltorg
skip_pool_2:
    LDR R0, =const_4
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VLDR D0, [R0]
    VPUSH {D0}

    @ operacao *
    VPOP {D1}
    VPOP {D0}
    VMUL.F64 D0, D0, D1
    VPUSH {D0}
    LDR R0, =T_TRACO
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_3
    .ltorg
skip_pool_3:
    LDR R0, =const_5
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VLDR D0, [R0]
    VPUSH {D0}

    @ operacao *
    VPOP {D1}
    VPOP {D0}
    VMUL.F64 D0, D0, D1
    VPUSH {D0}
    LDR R0, =T_GAPL
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_4
    .ltorg
skip_pool_4:
    LDR R0, =const_6
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VLDR D0, [R0]
    VPUSH {D0}

    @ operacao *
    VPOP {D1}
    VPOP {D0}
    VMUL.F64 D0, D0, D1
    VPUSH {D0}
    LDR R0, =T_GAPP
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_5
    .ltorg
skip_pool_5:
    LDR R0, =const_7
    VLDR D0, [R0]
    VPUSH {D0}
    LDR R0, =UNIDADE_MS
    VLDR D0, [R0]
    VPUSH {D0}

    @ operacao *
    VPOP {D1}
    VPOP {D0}
    VMUL.F64 D0, D0, D1
    VPUSH {D0}
    LDR R0, =T_GAPF
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_6
    .ltorg
skip_pool_6:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_7
    .ltorg
skip_pool_7:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_8
    .ltorg
skip_pool_8:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_0:
    SUBS R4, R4, #1
    BNE  dly_0
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_9
    .ltorg
skip_pool_9:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_10
    .ltorg
skip_pool_10:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_11
    .ltorg
skip_pool_11:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_1:
    SUBS R4, R4, #1
    BNE  dly_1
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_12
    .ltorg
skip_pool_12:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_13
    .ltorg
skip_pool_13:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_14
    .ltorg
skip_pool_14:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_2:
    SUBS R4, R4, #1
    BNE  dly_2
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_15
    .ltorg
skip_pool_15:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_16
    .ltorg
skip_pool_16:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_17
    .ltorg
skip_pool_17:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_3:
    SUBS R4, R4, #1
    BNE  dly_3
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_18
    .ltorg
skip_pool_18:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_19
    .ltorg
skip_pool_19:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_20
    .ltorg
skip_pool_20:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_4:
    SUBS R4, R4, #1
    BNE  dly_4
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_21
    .ltorg
skip_pool_21:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_22
    .ltorg
skip_pool_22:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_23
    .ltorg
skip_pool_23:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_5:
    SUBS R4, R4, #1
    BNE  dly_5
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_24
    .ltorg
skip_pool_24:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_25
    .ltorg
skip_pool_25:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_26
    .ltorg
skip_pool_26:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_6:
    SUBS R4, R4, #1
    BNE  dly_6
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_27
    .ltorg
skip_pool_27:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_28
    .ltorg
skip_pool_28:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_29
    .ltorg
skip_pool_29:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_7:
    SUBS R4, R4, #1
    BNE  dly_7
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_30
    .ltorg
skip_pool_30:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_31
    .ltorg
skip_pool_31:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_32
    .ltorg
skip_pool_32:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_8:
    SUBS R4, R4, #1
    BNE  dly_8
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_33
    .ltorg
skip_pool_33:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_34
    .ltorg
skip_pool_34:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_35
    .ltorg
skip_pool_35:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_9:
    SUBS R4, R4, #1
    BNE  dly_9
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_36
    .ltorg
skip_pool_36:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_37
    .ltorg
skip_pool_37:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_38
    .ltorg
skip_pool_38:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_10:
    SUBS R4, R4, #1
    BNE  dly_10
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_39
    .ltorg
skip_pool_39:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_40
    .ltorg
skip_pool_40:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_41
    .ltorg
skip_pool_41:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_11:
    SUBS R4, R4, #1
    BNE  dly_11
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_42
    .ltorg
skip_pool_42:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_43
    .ltorg
skip_pool_43:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_44
    .ltorg
skip_pool_44:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_12:
    SUBS R4, R4, #1
    BNE  dly_12
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_45
    .ltorg
skip_pool_45:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_46
    .ltorg
skip_pool_46:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_47
    .ltorg
skip_pool_47:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_13:
    SUBS R4, R4, #1
    BNE  dly_13
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_48
    .ltorg
skip_pool_48:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_49
    .ltorg
skip_pool_49:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_50
    .ltorg
skip_pool_50:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_14:
    SUBS R4, R4, #1
    BNE  dly_14
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_51
    .ltorg
skip_pool_51:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_52
    .ltorg
skip_pool_52:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_53
    .ltorg
skip_pool_53:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_15:
    SUBS R4, R4, #1
    BNE  dly_15
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_54
    .ltorg
skip_pool_54:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_55
    .ltorg
skip_pool_55:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_56
    .ltorg
skip_pool_56:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_16:
    SUBS R4, R4, #1
    BNE  dly_16
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_57
    .ltorg
skip_pool_57:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_58
    .ltorg
skip_pool_58:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_59
    .ltorg
skip_pool_59:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_17:
    SUBS R4, R4, #1
    BNE  dly_17
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_60
    .ltorg
skip_pool_60:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_61
    .ltorg
skip_pool_61:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_62
    .ltorg
skip_pool_62:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_18:
    SUBS R4, R4, #1
    BNE  dly_18
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_63
    .ltorg
skip_pool_63:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_64
    .ltorg
skip_pool_64:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_65
    .ltorg
skip_pool_65:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_19:
    SUBS R4, R4, #1
    BNE  dly_19
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_66
    .ltorg
skip_pool_66:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_67
    .ltorg
skip_pool_67:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_68
    .ltorg
skip_pool_68:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_20:
    SUBS R4, R4, #1
    BNE  dly_20
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_69
    .ltorg
skip_pool_69:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_70
    .ltorg
skip_pool_70:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_71
    .ltorg
skip_pool_71:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_21:
    SUBS R4, R4, #1
    BNE  dly_21
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_72
    .ltorg
skip_pool_72:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_73
    .ltorg
skip_pool_73:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_74
    .ltorg
skip_pool_74:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_22:
    SUBS R4, R4, #1
    BNE  dly_22
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_75
    .ltorg
skip_pool_75:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_76
    .ltorg
skip_pool_76:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_77
    .ltorg
skip_pool_77:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_23:
    SUBS R4, R4, #1
    BNE  dly_23
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_78
    .ltorg
skip_pool_78:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_79
    .ltorg
skip_pool_79:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_80
    .ltorg
skip_pool_80:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_24:
    SUBS R4, R4, #1
    BNE  dly_24
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_81
    .ltorg
skip_pool_81:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_82
    .ltorg
skip_pool_82:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_83
    .ltorg
skip_pool_83:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_25:
    SUBS R4, R4, #1
    BNE  dly_25
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_84
    .ltorg
skip_pool_84:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_85
    .ltorg
skip_pool_85:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_86
    .ltorg
skip_pool_86:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_26:
    SUBS R4, R4, #1
    BNE  dly_26
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_87
    .ltorg
skip_pool_87:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_88
    .ltorg
skip_pool_88:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_89
    .ltorg
skip_pool_89:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_27:
    SUBS R4, R4, #1
    BNE  dly_27
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_90
    .ltorg
skip_pool_90:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_91
    .ltorg
skip_pool_91:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_92
    .ltorg
skip_pool_92:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_28:
    SUBS R4, R4, #1
    BNE  dly_28
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_93
    .ltorg
skip_pool_93:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_94
    .ltorg
skip_pool_94:
    LDR R0, =T_GAPF
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 6000000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_95
    .ltorg
skip_pool_95:

    @ delay inteiro: 6000000 iteracoes (CNT=6000000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x005B8D80
dly_29:
    SUBS R4, R4, #1
    BNE  dly_29
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_96
    .ltorg
skip_pool_96:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_97
    .ltorg
skip_pool_97:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_98
    .ltorg
skip_pool_98:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_30:
    SUBS R4, R4, #1
    BNE  dly_30
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_99
    .ltorg
skip_pool_99:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_100
    .ltorg
skip_pool_100:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_101
    .ltorg
skip_pool_101:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_31:
    SUBS R4, R4, #1
    BNE  dly_31
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_102
    .ltorg
skip_pool_102:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_103
    .ltorg
skip_pool_103:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_104
    .ltorg
skip_pool_104:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_32:
    SUBS R4, R4, #1
    BNE  dly_32
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_105
    .ltorg
skip_pool_105:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_106
    .ltorg
skip_pool_106:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_107
    .ltorg
skip_pool_107:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_33:
    SUBS R4, R4, #1
    BNE  dly_33
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_108
    .ltorg
skip_pool_108:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_109
    .ltorg
skip_pool_109:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_110
    .ltorg
skip_pool_110:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_34:
    SUBS R4, R4, #1
    BNE  dly_34
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_111
    .ltorg
skip_pool_111:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_112
    .ltorg
skip_pool_112:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_113
    .ltorg
skip_pool_113:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_35:
    SUBS R4, R4, #1
    BNE  dly_35
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_114
    .ltorg
skip_pool_114:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_115
    .ltorg
skip_pool_115:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_116
    .ltorg
skip_pool_116:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_36:
    SUBS R4, R4, #1
    BNE  dly_36
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_117
    .ltorg
skip_pool_117:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_118
    .ltorg
skip_pool_118:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_119
    .ltorg
skip_pool_119:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_37:
    SUBS R4, R4, #1
    BNE  dly_37
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_120
    .ltorg
skip_pool_120:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_121
    .ltorg
skip_pool_121:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_122
    .ltorg
skip_pool_122:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_38:
    SUBS R4, R4, #1
    BNE  dly_38
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_123
    .ltorg
skip_pool_123:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_124
    .ltorg
skip_pool_124:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_125
    .ltorg
skip_pool_125:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_39:
    SUBS R4, R4, #1
    BNE  dly_39
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_126
    .ltorg
skip_pool_126:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_127
    .ltorg
skip_pool_127:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_128
    .ltorg
skip_pool_128:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_40:
    SUBS R4, R4, #1
    BNE  dly_40
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_129
    .ltorg
skip_pool_129:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_130
    .ltorg
skip_pool_130:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_131
    .ltorg
skip_pool_131:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_41:
    SUBS R4, R4, #1
    BNE  dly_41
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_132
    .ltorg
skip_pool_132:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_133
    .ltorg
skip_pool_133:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_134
    .ltorg
skip_pool_134:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_42:
    SUBS R4, R4, #1
    BNE  dly_42
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_135
    .ltorg
skip_pool_135:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_136
    .ltorg
skip_pool_136:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_137
    .ltorg
skip_pool_137:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_43:
    SUBS R4, R4, #1
    BNE  dly_43
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_138
    .ltorg
skip_pool_138:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_139
    .ltorg
skip_pool_139:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_140
    .ltorg
skip_pool_140:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_44:
    SUBS R4, R4, #1
    BNE  dly_44
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_141
    .ltorg
skip_pool_141:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_142
    .ltorg
skip_pool_142:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_143
    .ltorg
skip_pool_143:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_45:
    SUBS R4, R4, #1
    BNE  dly_45
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_144
    .ltorg
skip_pool_144:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_145
    .ltorg
skip_pool_145:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_146
    .ltorg
skip_pool_146:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_46:
    SUBS R4, R4, #1
    BNE  dly_46
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_147
    .ltorg
skip_pool_147:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_148
    .ltorg
skip_pool_148:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_149
    .ltorg
skip_pool_149:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_47:
    SUBS R4, R4, #1
    BNE  dly_47
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_150
    .ltorg
skip_pool_150:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_151
    .ltorg
skip_pool_151:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_152
    .ltorg
skip_pool_152:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_48:
    SUBS R4, R4, #1
    BNE  dly_48
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_153
    .ltorg
skip_pool_153:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_154
    .ltorg
skip_pool_154:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_155
    .ltorg
skip_pool_155:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_49:
    SUBS R4, R4, #1
    BNE  dly_49
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_156
    .ltorg
skip_pool_156:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_157
    .ltorg
skip_pool_157:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_158
    .ltorg
skip_pool_158:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_50:
    SUBS R4, R4, #1
    BNE  dly_50
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_159
    .ltorg
skip_pool_159:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_160
    .ltorg
skip_pool_160:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_161
    .ltorg
skip_pool_161:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_51:
    SUBS R4, R4, #1
    BNE  dly_51
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_162
    .ltorg
skip_pool_162:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_163
    .ltorg
skip_pool_163:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_164
    .ltorg
skip_pool_164:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_52:
    SUBS R4, R4, #1
    BNE  dly_52
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_165
    .ltorg
skip_pool_165:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_166
    .ltorg
skip_pool_166:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_167
    .ltorg
skip_pool_167:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_53:
    SUBS R4, R4, #1
    BNE  dly_53
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_168
    .ltorg
skip_pool_168:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_169
    .ltorg
skip_pool_169:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_170
    .ltorg
skip_pool_170:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_54:
    SUBS R4, R4, #1
    BNE  dly_54
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_171
    .ltorg
skip_pool_171:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_172
    .ltorg
skip_pool_172:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_173
    .ltorg
skip_pool_173:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_55:
    SUBS R4, R4, #1
    BNE  dly_55
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_174
    .ltorg
skip_pool_174:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_175
    .ltorg
skip_pool_175:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_176
    .ltorg
skip_pool_176:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_56:
    SUBS R4, R4, #1
    BNE  dly_56
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_177
    .ltorg
skip_pool_177:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_178
    .ltorg
skip_pool_178:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_179
    .ltorg
skip_pool_179:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_57:
    SUBS R4, R4, #1
    BNE  dly_57
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_180
    .ltorg
skip_pool_180:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_181
    .ltorg
skip_pool_181:
    LDR R0, =T_PONTO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 900000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_182
    .ltorg
skip_pool_182:

    @ delay inteiro: 900000 iteracoes (CNT=900000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x000DBBA0
dly_58:
    SUBS R4, R4, #1
    BNE  dly_58
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_183
    .ltorg
skip_pool_183:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_184
    .ltorg
skip_pool_184:
    LDR R0, =T_GAPP
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 2700000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_185
    .ltorg
skip_pool_185:

    @ delay inteiro: 2700000 iteracoes (CNT=2700000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x002932E0
dly_59:
    SUBS R4, R4, #1
    BNE  dly_59
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_186
    .ltorg
skip_pool_186:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_187
    .ltorg
skip_pool_187:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_188
    .ltorg
skip_pool_188:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_60:
    SUBS R4, R4, #1
    BNE  dly_60
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_189
    .ltorg
skip_pool_189:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_190
    .ltorg
skip_pool_190:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_191
    .ltorg
skip_pool_191:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_61:
    SUBS R4, R4, #1
    BNE  dly_61
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_192
    .ltorg
skip_pool_192:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_193
    .ltorg
skip_pool_193:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_194
    .ltorg
skip_pool_194:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_62:
    SUBS R4, R4, #1
    BNE  dly_62
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_195
    .ltorg
skip_pool_195:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_196
    .ltorg
skip_pool_196:
    LDR R0, =T_GAPL
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1350000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_197
    .ltorg
skip_pool_197:

    @ delay inteiro: 1350000 iteracoes (CNT=1350000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x00149970
dly_63:
    SUBS R4, R4, #1
    BNE  dly_63
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_198
    .ltorg
skip_pool_198:

    @ LEDR MEM = 1 (porta 0xFF200000)
    MOV  R3, #0x001
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_1
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_199
    .ltorg
skip_pool_199:
    LDR R0, =T_TRACO
    VLDR D0, [R0]
    VPUSH {D0}

    @ CNT MEM (delay_var = 1800000)
    LDR R0, =CNT
    VPOP {D0}
    VSTR.F64 D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_200
    .ltorg
skip_pool_200:

    @ delay inteiro: 1800000 iteracoes (CNT=1800000 iters)
    PUSH {R4, LR}
    LDR  R4, =0x001B7740
dly_64:
    SUBS R4, R4, #1
    BNE  dly_64
    POP  {R4, LR}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_201
    .ltorg
skip_pool_201:

    @ LEDR MEM = 0 (porta 0xFF200000)
    MOV  R3, #0x000
    LDR  R4, =0xFF200000
    STR  R3, [R4]
    LDR  R0, =const_0
    VLDR D0, [R0]
    VPUSH {D0}

    @ salva no historico
    VPOP {D0}
    LDR R0, =array_res
    LDR R1, =ptr_res
    LDR R2, [R1]
    ADD R3, R0, R2, LSL #3
    VSTR.F64 D0, [R3]
    ADD R2, R2, #1
    STR R2, [R1]
    VPUSH {D0}

    @ Despeja literal pool para evitar erro de limite de 4KB
    B skip_pool_202
    .ltorg
skip_pool_202:

    @ fim do programa (sem SO no CPUlator: nao usar SWI/syscall Linux)
    @ BKPT para o simulador automaticamente, sem precisar clicar em Stop
fim_programa:
    BKPT #0

@ ---- subrotina de delay em inteiros (2 ciclos/iteracao) ----
__delay_int:
    SUBS R0, R0, #1
    BNE  __delay_int
    MOV  PC, LR
