global _main
extern _printf
extern _scanf

section .data
	prompt1 db "Enter a: ", 0
	prompt2 db "Enter b: ", 0
	input_format db "%f", 0
	msg_add db "%f + %f = %f", 10, 0
	msg_sub db "%f - %f = %f", 10, 0
	msg_mul db "%f * %f = %f", 10, 0
	msg_div db "%f / %f = %f", 10, 0
	a dd 0
	b dd 0
	c_add dd 0
	c_sub dd 0
	c_mul dd 0
	c_div dd 0
	
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
	
	; addition
	finit
	fld dword [a]
	fld dword [b]
	fadd
	fstp dword [c_add]
	sub esp, 8
    fld dword [c_add]
    fstp qword [esp]
	sub esp, 8
    fld dword [b]
    fstp qword [esp]
	sub esp, 8
    fld dword [a]
    fstp qword [esp]
	push msg_add
	call _printf
	add esp, 28
	
	; subtraction
	finit
	fld dword [a]
	fld dword [b]
	fsub
	fstp dword [c_sub]
	sub esp, 8
    fld dword [c_sub]
    fstp qword [esp]
	sub esp, 8
    fld dword [b]
    fstp qword [esp]
	sub esp, 8
    fld dword [a]
    fstp qword [esp]
	push msg_sub
	call _printf
	add esp, 28
	
	; multiplication
	finit
	fld dword [a]
	fld dword [b]
	fmul
	fstp dword [c_mul]
	sub esp, 8
    fld dword [c_mul]
    fstp qword [esp]
	sub esp, 8
    fld dword [b]
    fstp qword [esp]
	sub esp, 8
    fld dword [a]
    fstp qword [esp]
	push msg_mul
	call _printf
	add esp, 28
	
	; division
	finit
	fld dword [a]
	fld dword [b]
	fdiv
	fstp dword [c_div]
	sub esp, 8
    fld dword [c_div]
    fstp qword [esp]
	sub esp, 8
    fld dword [b]
    fstp qword [esp]
	sub esp, 8
    fld dword [a]
    fstp qword [esp]
	push msg_div
	call _printf
	add esp, 28
	
	ret