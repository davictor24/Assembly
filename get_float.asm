global _main
extern _printf
extern _scanf

section .data
	prompt db "Enter float: ", 0
	input_format db "%f", 0
	msg db "You entered: %f", 10, 0
	number dd 0
	
section .text
_main:
	push prompt
	call _printf
	add esp, 4
	
	push number
	push input_format
	call _scanf
	add esp, 8
	
	sub esp, 8
    fld dword [number]
    fstp qword [esp]
    push msg
    call _printf
    add esp, 12
    ret