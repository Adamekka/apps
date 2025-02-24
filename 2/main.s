bits 64

section .data
extern g_int_array
extern g_int_array_len
extern g_int_outup
extern g_neg_val_array

extern g_char_array
extern g_vowel_count

section .text
global first
global second
global third
global fourth

first:
    enter 0, 0

    xor ebx, ebx ; Result

    mov esi, g_int_array                ; Arr pointer
    mov ecx, dword [g_int_array_len]    ; Counter
first_loop:
    cmp ecx, 0
    je first_loop_end

    mov eax, dword [esi] ; Current element

    test eax, 1     ; Odd  => Z = 0
                    ; Even => Z = 1
    jnz first_odd

    ; Even
    add ebx, eax    ; Add to Result

first_odd:

    add esi, 4      ; Arr pointer += 4
    dec ecx         ; Counter--
    jmp first_loop

first_loop_end:
    xor edx, edx    ; Clear          upper Dividend
    mov eax, ebx    ; Move Result to lower Dividend
    mov ecx, 4      ; Divisor

    div ecx         ; edx:eax / ecx
                    ; eax - Quotient
                    ; edx - Remainder

    neg edx
    mov dword [g_int_outup], edx

    leave
    ret


second:
    enter 0, 0

    mov esi, g_int_array                ; Source      arr pointer
    mov edi, g_neg_val_array            ; Destination arr pointer
    mov ecx, dword [g_int_array_len]    ; Counter
second_loop:
    cmp ecx, 0
    je second_loop_end

    mov eax, dword [esi] ; Current element

    cmp eax, 0      ; Positive => S = 0
                    ; Negative => S = 1
    jns second_positive

    ; Negative
    mov dword [edi], eax

second_positive:

    add esi, 4      ; Source      arr pointer += 4
    add edi, 4      ; Destination arr pointer += 4
    dec ecx         ; Counter--
    jmp second_loop

second_loop_end:

    leave
    ret


third:
    enter 0, 0

    xor ebx, ebx ; Result

    mov esi, g_char_array
third_loop:
    mov ah, byte [esi]

    test ah, ah
    jz third_loop_end

    cmp ah, 'a'
    je third_is_vowel
    cmp ah, 'e'
    je third_is_vowel
    cmp ah, 'i'
    je third_is_vowel
    cmp ah, 'y'
    je third_is_vowel
    cmp ah, 'o'
    je third_is_vowel
    cmp ah, 'u'
    je third_is_vowel

    jmp third_not_vowel

third_is_vowel:
    inc ebx

third_not_vowel:

    inc esi
    jmp third_loop

third_loop_end:

    mov dword [g_vowel_count], ebx

    leave
    ret


fourth:
    enter 0, 0

    mov ebx, 1 ; Counter for every 3. vowel

    mov esi, g_char_array
fourth_loop:
    mov ah, byte [esi]

    test ah, ah
    jz fourth_loop_end

    cmp ah, 'a'
    je fourth_is_vowel
    cmp ah, 'e'
    je fourth_is_vowel
    cmp ah, 'i'
    je fourth_is_vowel
    cmp ah, 'y'
    je fourth_is_vowel
    cmp ah, 'o'
    je fourth_is_vowel
    cmp ah, 'u'
    je fourth_is_vowel

    jmp fourth_not_vowel

fourth_is_vowel:

    cmp ebx, 3
    jne fourth_not_replacing

    ; Replacing
    mov byte [esi], '3'
    xor ebx, ebx

fourth_not_replacing:
    inc ebx

fourth_not_vowel:

    inc esi
    jmp fourth_loop

fourth_loop_end:

    leave
    ret
