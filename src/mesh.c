// create 2D mesh array
#include "global.h"
void mesh(double X[], double Y[]){
	X[0] = a; // boundaries
	X[M+1] = b;
	Y[0] = a;
	Y[M+1] = b;
	for(int i = 1; i <= M; i++){
		X[i] = a + ((double)i - 0.5)*dx; // within space
		Y[i] = a + ((double)i - 0.5)*dy; // within space
	}
}
