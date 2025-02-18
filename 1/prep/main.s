bits 64

section .data

section .text
global  _first
global  _second
global  _third
global  _fourth

_first:
	mov byte [rdi + 4], '!'

	ret

_second:
	mov rax, qword [rdi + 8]
	mov rbx, qword [rdi + 16]
	mov qword [rdi + 8], rbx
	mov qword [rdi + 16], rax

	ret

_third:
	mov eax, dword [rdi + 24]
	mov ebx, dword [rdi + 28]

	mov dword [rsi], eax
	mov dword [rdx], ebx

	ret

_fourth:
	mov qword [rsi], rdi
	mov byte [rsi + 8], 0

	ret
