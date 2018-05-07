//================================== CREATE INITIAL PROFILE
#include "global.h"
#include <stdio.h>
void init(const int W, double T[W+1][W+2], double E[W+1][W+1], double p[W+1][W+1]){
	// for nodes and boundaries
	for(int i = 0; i <= M+1; i++){
		for(int j = 0; j<= M+1; j++){
			// Temperatures
			T[i][j] = T0; // IC's
			// Energies and liquid fractions
			if(i > 0 && j > 0 && i < M+1 && j < M+1){ // NODES ONLY
				E[i][j] = rho*Cs*(T[i][j] - Tm);
				p[i][j] = 0;
			}
		}
	}
}
