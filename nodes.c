#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i = 1;
	float nodos [argc -1];

	for ( ; i < argc ; i++) {
		nodos[i - 1] = atof(argv[i]);
	}
	/*
	for ( i = 0 ; i < (argc - 1) ; i += 2) {
		printf ("%f , %f\n",nodos[i],nodos[i + 1]);
	}*/
//////////////////////////////////////////
	for ( i = 2 ; i < (argc - 1) ; i++) {
		nodos[i] += nodos[i - 2];
	}
//////////////////////////////////////////
	printf ("%i,",argc - 1);


	for ( i = 0 ; i < (argc - 1) ; i++) {


		if (i == (argc - 2)) {
			printf ("%.1f",nodos[i]);
		} else {
			printf ("%.1f,",nodos[i]);
		}
	}

	return 0;
}