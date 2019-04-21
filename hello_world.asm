global _WinMain@16
extern _printf

section .data
	msg db "Hello, world!", 10, 0

section .text
_WinMain@16:
    push msg
    call _printf
    add esp, 4
    ret