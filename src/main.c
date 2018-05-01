// REKESH ALI
// M475 TEAM F
// Conservation PDE

#include <stdio.h>
#include <math.h>
#include "global.h" // includes all subroutines
#include "declarations.h"  // to get rid of compiler warnings

int main(int argc, char * argv[]){
	//============================ Initialize I/O
	char inp[20];
//	char out[20];
	if(argc == 1){
		sprintf(inp, "input");
	}else{
		sprintf(inp, "%s.i", argv[1]);
	}

	//============================ READ INPUTS
	int MM;
	double tend, dtout, factor;
	readfile(inp, &factor, &dtout, &tend, &MM); // reads from filename inp

	//============================ CREATE MESH
	M = MM*(int)(b-a); // number of CV's
	const int W = M;
	dx = 1./((double)(MM)), dy = 1./((double)(MM)); // spacing between nodes
	double X[M+2], Y[M+2]; // nodal array
	mesh(X, Y); // fills array with positions of nodes

	//============================ SET TIMESTEP
	double t0 = 0.0; // start time
	double kmax = fmax(kl, ks);
	double Cmin = fmin(Cl, Cs);
	double dtEXPL = dx*dx*Cmin*rho/(2.*kmax*Q0); // CFL number
	dt = factor*dtEXPL; // dt fraction of CFL for stability purposes
	int Nend = (int)((tend - t0)/dt) + 1; // number of timesteps
	int nsteps = 0; // initialize timestep
	double time = t0; // initialize time
	double tout = fmax(dtout, dt); //tout2 = 0.004; // time for printing to file

	//============================ INITIALIZE PROFILE
	double T[M+2][M+2], E[M+1][M+1], p[M+1][M+1], ERR = 0.0; // solution array and max error
	init(W, T, E, p); // fills solution array
//    output(X, T, time, nsteps, ERR); // prints to file

	//============================ BEGIN TIMESTEPPING
	double Fx[M+1][M+1], Fy[M+1][M+1]; // initialize flux array
	output(W, X, Y, T, Fx, Fy, E, p, time, nsteps, ERR); // print to file

	for(nsteps = 1; nsteps <= Nend; nsteps++){
		time = nsteps*dt; // current time
		flux(W, Fx, Fy, T, p); // current flux at walls
		pde(W, E, Fx, Fy); // updates energy with forward euler
		eos(W, E, T, p, Fx, Fy); // updates temperatures and phases
		/*if(time > tout2)
			phasefront(p, time);
			tout2 = tout2 + .004;
		}*/
		if(time > tout){ // when time to print
			//ERR = compare(X, T, M, k, time); // find max error
			output(W, X, Y, T, Fx, Fy, E, p, time, nsteps, ERR); // print to file
			tout = tout + dtout; // next print time
        }
	}
	//ERR = compare(X, T, M, k, time); // max error for final
	//output(X, T, time, nsteps, ERR, F); // final solution output to file 
}
