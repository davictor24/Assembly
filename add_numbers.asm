global _main
extern _printf
extern _scanf

section .data
	prompt1 db "Enter a: ", 0
	prompt2 db "Enter b: ", 0
	input_format db "%d", 0
	msg db "%d + %d = %d", 10, 0
	a dd 0
	b dd 0
	
section .text
_main:
	push prompt1
	call _printf
	add esp, 4
	push a
	push input_format
	call _scanf
	add esp, 8
	
	push prompt2
	call _printf
	add esp, 4
	push b
	push input_format
	call _scanf
	add esp, 8
	
	mov eax, dword [a]
	add eax, dword [b]
	
	push eax
	push dword [b]
	push dword [a]
	push msg
	call _printf
	add esp, 16
	ret