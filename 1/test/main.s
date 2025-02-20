bits 64

section .data
extern  g_char2
extern  g_short_merged
extern  g_extended

extern enc_string
extern g_decoded

section .text
global  merge_and_extend
global  decode

merge_and_extend:
	enter 0, 0

	mov   ah, byte [g_char2]
	mov   al, byte [g_char2 + 1]
	movzx eax, ax

	mov word [g_short_merged], ax
	mov dword [g_extended], eax

	leave
	ret

decode:
	enter 0, 0

	mov eax, dword [enc_string]
	mov dword [g_decoded], eax

	mov bh, byte [g_decoded]
	mov bl, byte [g_decoded + 2]

	mov byte [g_decoded], bl
	mov byte [g_decoded + 2], bh

	leave
	ret
