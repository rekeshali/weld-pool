#include "global.h"
#include <math.h>
#include <stdio.h>
void BCFlux(double F0[]){
	// creates a flux vector that holds value at each node 
	// corresponding to gaussian distribution
	FILE * OUT;
	OUT = fopen("outputs/flxdst.o", "w"); // output flux distribution

	double x;
	double center = 0.5*(b-a); // location of peak
	double scale = 5/(b); // will look like gaussian of 5 max
	double stddev = 1/(scale*sqrt(2*pi)); // width of flux
	for(int i = 1; i <= M; i++){ // for every node
		x = a + ((double)i - 0.5)*dx; // location of current node
		if(!FType){ // Gaussian distribution
			F0[i] = Q0*exp( -(x - center)*(x - center)/(2*stddev*stddev)); // flux at node
		}else{ // Uniform distribution
			F0[i] = Q0; // all flxues same
		}
		fprintf(OUT, "%.6f %11.4f\n", x, F0[i]); // keeping track
	}
	fclose(OUT);
}
