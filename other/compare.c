#include "output2.cpp"
// compare to exact solution for debugging purposes
double compare(double X[], double U[], int M, double D, double time){
	double uEXACT[M+2], ERR = 0.0, ERRi, arg;

	for(int i = 0; i <= M+1; i++){
		arg = 0.5 * X[i] / sqrt(D * time);
		uEXACT[i] = erfc(arg); // exact solution

		ERRi = abs(U[i] - uEXACT[i]); // error calculation
		ERR = fmax(ERRi, ERR);
	}
	output2(X, uEXACT, M);
	return ERR;
}

