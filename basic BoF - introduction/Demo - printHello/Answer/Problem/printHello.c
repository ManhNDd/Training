#include <stdio.h>

// gcc -fno-stack-protector -z execstack printHello.c -o printHello

int main() {
    char buf[20];
	puts("Input your name:");
    gets(buf);
    printf("Hello %s\n", buf);
    return 0;
}
