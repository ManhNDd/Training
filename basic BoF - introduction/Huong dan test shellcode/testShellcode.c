#include <stdio.h>
#include <stdlib.h>

// 32bit: gcc testShellcode.c -o testShellcode32 -m32 -zexecstack
// 64bit: gcc testShellcode.c -o testShellcode64 -m64 -zexecstack

int main(int argc, char** argv)
{
	if (argc != 2) {
		printf("Usage: %s shellcode_file\n", argv[0]);
	}
	FILE *f = fopen(argv[1], "rb");
	if (f == NULL) {
		printf("Cannot open file %s", argv[1]);
		exit(0);
	}
	// read in shellcode
	fseek(f, 0, SEEK_END);
	long fsize = ftell(f);
	fseek(f, 0, SEEK_SET);

	char *string = malloc(fsize);
	fread(string, fsize, 1, f);
	fclose(f);
	
	// execute shellcode
	void (*callShell)() = (void(*)())string;
	callShell();
	
	return 0;
}

