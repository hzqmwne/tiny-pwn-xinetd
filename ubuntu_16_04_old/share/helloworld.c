#include <stdio.h>
#include <stdlib.h>

int main(void) {
	char buf[100];
	printf("input your command:\n");
	fflush(stdout);
	fgets(buf, 100, stdin);
	system(buf);
	return 0;
}

