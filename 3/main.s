bits 64

section .data

section .text
global uprav_pole
global hledej_max_msb
global pocet_cislic
global nahrada_mezer

uprav_pole:
    ; rdi holds arr*
    mov ecx, esi ; Len
uprav_pole_loop:
    test ecx, ecx
    je uprav_pole_loop_end

    mov eax, dword [rdi] ; Element
    test eax, eax
    js uprav_pole_negative

    ; Positive
    and eax, 0xFFFFFFFE

    jmp uprav_pole_positive_end

uprav_pole_negative:
    or eax, 1

uprav_pole_positive_end:
    mov dword [rdi], eax

    add rdi, 4
    dec ecx
    jmp uprav_pole_loop

uprav_pole_loop_end:

    ret


hledej_max_msb:
    mov eax, -1 ; Result index
    xor r8, r8  ; Max val

    ; rdi holds arr*
    xor ecx, ecx
hledej_max_msb_loop:
    cmp ecx, esi ; i <= len
    jge hledej_max_msb_loop_end

    movzx rbx, byte [rdi + 7] ; Element, MSB
    cmp rbx, r8
    jbe hledej_max_msb_next

    ; Found max
    mov r8b, bl     ; Update max
    mov eax, ecx    ; Update index (Result)

hledej_max_msb_next:

    add rdi, 8
    inc ecx
    jmp hledej_max_msb_loop

hledej_max_msb_loop_end:

    ret


pocet_cislic:
    xor eax, eax ; Result

    ; rdi holds str
pocet_cislic_loop:
    mov bh, byte [rdi] ; Char

    test bh, bh
    jz pocet_cislic_loop_end

    cmp bh, '0'
    jl pocet_cislic_next
    cmp bh, '9'
    jg pocet_cislic_next

    ; Is number
    inc eax

pocet_cislic_next:

    inc rdi
    jmp pocet_cislic_loop

pocet_cislic_loop_end:

    ret


nahrada_mezer:
    ; rdi holds str
    ; sil holds char
nahrada_mezer_loop:
    mov ah, byte [rdi]

    test ah, ah
    jz nahrada_mezer_loop_end

    cmp ah, ' '
    jne nahrada_mezer_loop_next

    ; Replace ' ' with char
    mov byte [rdi], sil

nahrada_mezer_loop_next:

    inc rdi
    jmp nahrada_mezer_loop

nahrada_mezer_loop_end:

    ret
