global _main
extern _printf

section .data
	msg db "The sum of the numbers is: %d", 10, 0
	
section .text
_main:
	mov ecx, 0
	mov ebx, 0
	
sum:
	add edx, ecx
	inc ecx
	cmp ecx, 10
	jl sum
	
terminate:
	push edx
	push msg
	call _printf
	add esp, 8
	ret