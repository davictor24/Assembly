global _WinMain@16
extern _printf
extern _scanf

section .data
	intro db "This program uses binary search to scan a sorted array in O(log n) time. ", 10, "For this, n = 10. ", 10, 10, 0
	msg1 db "Enter the values in the sorted integer array. ", 10, "Hit enter after every entry. ", 10, 0
	msg2 db 10, "Enter the key to find in array: ", 0
	key_not_found db "Key not found!", 10, 0
	
	prompt db "%d => ", 0
	f_in db "%d", 0
	key_found db "Found %d at index %d", 10, 0
	
	array times 10 dd 0
	value dd 0
	key dd 0

section .text
_WinMain@16:
    push intro
	call _printf
	add esp, 4
	
	push msg1
	call _printf
	add esp, 4
	
	mov ebx, array
	mov ecx, 0
	
get_value:
	push ebx
	push ecx
	push prompt
	call _printf
	add esp, 4
	pop ecx
	pop ebx
	
	push ebx
	push ecx
	push value
	push f_in
	call _scanf
	add esp, 8
	pop ecx
	pop ebx
	mov eax, dword [value]
	mov dword [ebx], eax
	
	add ebx, 4
	inc ecx
	cmp ecx, 10
	jl get_value
	
	mov ebx, array
	mov ecx, 1
	
	push msg2
	call _printf
	add esp, 4
	push key
	push f_in
	call _scanf
	add esp, 8
	
	mov ebx, array
	mov ecx, ebx
	add ecx, 36
	mov edx, dword [key]
	
binary_search:
	cmp ebx, ecx
	jg not_found

	mov eax, ecx
	sub eax, ebx
	shr eax, 3

	cmp dword [ebx + 4*eax], edx
	je found
	jl right_array
	jg left_array
	
left_array:
	dec eax
	shl eax, 2
	add eax, ebx
	mov ecx, eax
	jmp binary_search

right_array:
	inc eax
	shl eax, 2
	add eax, ebx
	mov ebx, eax
	jmp binary_search
	
found:
	shl eax, 2
	add eax, ebx
	sub eax, array
	shr eax, 2
	push eax
	push edx
	push key_found
	call _printf
	add esp, 12
	jmp end_program

not_found:
	push key_not_found
	call _printf
	add esp, 4
	jmp end_program
	
end_program:
	ret
	