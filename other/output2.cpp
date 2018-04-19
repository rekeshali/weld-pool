// outputting profile of exact solution
//#include <stdio.h>
void output2(double X[], double U[], int M) {
	FILE * exact;
	exact = fopen("exact", "a");
	for(int i = 0; i <= M+1; i++) {
		fprintf(exact, "%.15e %.15e\n", X[i], U[i]);
	}
	fprintf(exact, "\n");
	fclose(exact);
}
