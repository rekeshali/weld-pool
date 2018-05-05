//========================== READ INPUTS
#include "global.h"
#include <stdio.h>
void readfile(char filename[], double *factor, double *dtout, double *tend, int *MM){
	FILE *IN;
    int n = 255;
    char buff[n];
    IN = fopen(filename, "r");

    // TIME
    fgets(buff, n, IN); // section
    fgets(buff, n, IN); // labels
    fscanf(IN, "%lf %lf %lf\n", factor, dtout, tend); // values

    // SPACE
    fgets(buff, n, IN);
    fgets(buff, n, IN);
    fscanf(IN, "%i %lf %lf\n", MM, &a, &b);

    // MATERIAL
    fgets(buff, n, IN);
    fgets(buff, n, IN);
    fscanf(IN, "%lf %lf %lf %lf %lf\n", &rho, &L, &Tm, &h, &Tinf);
    fgets(buff, n, IN);
    fscanf(IN, "%lf %lf %lf %lf\n", &Cs, &Cl, &ks, &kl);

    // IBCs
    fgets(buff, n, IN);
    fgets(buff, n, IN);
    fscanf(IN, "%lf %lf %lf %i %i\n", &T0, &Q0, &Tmax, &BCType, &FType);

    // printf("%i, %f, %f, %f, %f\n", MM, Cs, b, Q0, T0);
    fclose(IN);
}
