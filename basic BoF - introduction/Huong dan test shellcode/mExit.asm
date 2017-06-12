
; bien dich
; nasm -felf mExit.asm
; ld -m elf_i386 mExit.o -o mExit

global _start

section .text

_start:
	mov ebx, 0x3
	mov eax, 0x1
	int 0x80
	
