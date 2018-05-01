//======================== print solution profile to text file at certain times
#include "global.h"
#include <stdio.h>
void output(const int W, double X[], double Y[], double T[][W+2], double Fx[][W+1], double Fy[][W+1], double E[][W+1], double p[][W+1], double time, int nsteps, double ERR){
//	double flux, energy, phase;
	FILE *OUT;
	FILE *TEMP;
	FILE *PHASE;
	FILE *ENTH; // initialize file var
	if(!nsteps){ // if haven't begun time stepping 
		OUT = fopen("outputs/values.o", "w"); // new file
		fprintf(OUT,"#nstep time\n");
		TEMP = fopen("outputs/temp.o", "w"); // new file
		//fprintf(TEMP,"#Temperatures by timesteps\n");
		PHASE = fopen("outputs/phase.o", "w"); // new file
		//fprintf(PHASE,"#Liquid fraction by timestep\n");
		ENTH = fopen("outputs/enth.o", "w"); // new file
		//fprintf(ENTH,"#Enthalpies by timestep\n");
	}
	else{
		OUT = fopen("outputs/values.o", "a"); // old file
		TEMP = fopen("outputs/temp.o", "a"); // old file
		PHASE = fopen("outputs/phase.o", "a"); // old file
		ENTH = fopen("outputs/enth.o", "a"); // old file
	}
	// hidden time, steps, error
	// position and profile in columns
	//================================================= TEMPERATURES
	// inside temperatures only, walls not necessary
	for(int j = 1; j <= M; j++){
		for(int i = 1; i <= M; i++){
			fprintf(TEMP, "%22.15e ", T[i][j]);
		}
		fprintf(TEMP, "\n");
	}
	fprintf(TEMP, "\n");
	fclose(TEMP);
	//================================================= PHASES
		for(int j = 1; j <= M; j++){
			for(int i = 1; i <= M; i++){
				fprintf(PHASE, "%22.15e ", p[i][j]);
			}
		fprintf(PHASE, "\n");
	}
	fprintf(PHASE, "\n");
	fclose(PHASE);
	//================================================= ENTHALPIES
	// just for funsies
	for(int j = 1; j <= M; j++){
		for(int i = 1; i <= M; i++){
			fprintf(ENTH, "%22.15e ", E[i][j]);
		}
		fprintf(ENTH, "\n");
	}
	fprintf(ENTH, "\n");
	fclose(ENTH);
	//================================================= TIMESTAMPS/ETC
	fprintf(OUT, "%i %9.4f\n", nsteps, time);
	//fprintf(OUT, "# Error up to this time: %.15e\n\n", ERR);

	/*for(int j = M+1; j >= 0; j--){
		for(int i = 0; i <= M+1; i++){
			fprintf(OUT, "%22.15e ", T[i][j]);
		}
		fprintf(OUT, "\n");
	}*/


	/*for(int i = 0; i <= M+1; i++){
		if(i == 0){
			fprintf(OUT, "%18.15e %18.15e %18.15e\n", X[i], T[i], F[i]);
		}
		if(i > 0 && i <= M){
			fprintf(OUT, "%18.15e %18.15e %18.15e %18.15e %.3f\n", X[i], T[i], F[i], E[i], p[i]);
		}else if(i > M){
			fprintf(OUT, "%.15e %.15e\n", X[i], T[i]);
		}
	}*/
	//fprintf(OUT, "\n"); // new line to separate times of printing
	fclose(OUT);
}
