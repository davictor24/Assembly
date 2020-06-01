global _main
extern _printf
extern _scanf

section .data
	intro db "This program finds the average of five floating-point numbers.", 10, "The numbers are saved in an array, in order to demonstrate how to use arrays", 10, 0
	prompt db "%d => ", 0
	input_format db "%f", 0
	msg db "Average: %f", 10, 0
	n dd 5
	n_float dd 5.0
	number dd 0
	numbers times 5 dd 0
	avg dd 0
	
section .text
_main:
	push intro
	call _printf
	add esp, 4
	
	mov ebx, numbers
	mov ecx, 1
	
get_value:
	push ebx
	push ecx
	push prompt
	call _printf
	add esp, 4
	
	push number
	push input_format
	call _scanf
	add esp, 8
	pop ecx
	pop ebx
	mov eax, dword [number]
	mov dword [ebx + 4*(ecx-1)], eax

	inc ecx
	cmp ecx, dword [n]
	jle get_value
	
	finit
	mov ebx, numbers
	mov ecx, 0
	
load_value:
	fld dword [ebx + 4*ecx]
	cmp ecx, 0
	je first_time
	fadd
first_time:
	inc ecx
	cmp ecx, dword [n]
	jl load_value

	fld dword [n_float]
	fdiv
	fstp dword [avg]
	
	sub esp, 8
    fld dword [avg]
    fstp qword [esp]
	push msg
	call _printf
	add esp, 12
    ret