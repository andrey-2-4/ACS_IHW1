#include "stdio.h"

static int ARRAY1[10000];
static int ARRAY2[10000];

int min(int a, int b) {
	if (a < b) {
		return a;
	}
	return b;
}

int main() {
	int n = 0;
	int a = 0;
	scanf("%d", &n);
	if (n <= 0 || n > 10000) {
		return 0;
	}
	for (int i = 0; i < n; ++i) {
		ARRAY1[i] = i;
		a += ARRAY1[i];
		printf("%d", ARRAY1[i]);
		printf(" ");
	}
	printf("\n");
	a /= n;
	for (int i = 0; i < n; ++i) {
		ARRAY2[i] = min(a, ARRAY1[i]);
		printf("%d", ARRAY2[i]);
		printf(" ");
	}
	printf("\n");
	return 0;
}
