global _main
extern _printf
extern _scanf

section .data
	prompt db "Enter your name: ", 0
	msg db "Welcome, %s", 10, 0
	input_format db "%s", 0
	your_name dd 0
	
section .text
_main:
	push prompt
	call _printf
	add esp, 4
	
	push your_name
	push input_format
	call _scanf
	add esp, 8
	
	push your_name
	push msg
	call _printf
	add esp, 8
	ret