// declare functions to get rid of compiler warnings
void readfile(char filename[], double *factor, double *dtout, double *tend, int *MM);
void mesh(double X[], double Y[]);
void init(const int W, double T[][W+2], double E[][W+1], double p[][W+1]);
void BCFlux(double F0[]);
void output(const int W, double X[], double Y[], double T[][W+2], double Fx[][W+1], double Fy[][W+1],
            double E[][W+1], double p[][W+1], double time, int nsteps, double tend);
void flux(const int W, double Fx[][W+1], double Fy[][W+1], double T[][W+2], double p[][W+1], double F0[]);
void pde(const int W, double E[][W+1], double Fx[][W+1], double Fy[][W+1]);
void eos(const int W, double E[][W+1], double T[][W+2], double p[][W+1], double Fx[][W+1], double Fy[][W+1]);
