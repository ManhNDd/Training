BITS 32
xor eax, eax; eax = 0
mov al, 1 ; eax = 1 ; ma cua system call exit
xor ebx, ebx; tham so cho ngat exit
mov bl, 3
int 0x80