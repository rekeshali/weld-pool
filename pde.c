//========================================== Forward Euler (explicit)
void pde(const int W, double E[][W+1], double Fx[][W+1], double Fy[][W+1]){
    // Energy is conserved within nodes only..
	for(int i = 1; i <= M; i++){
		for(int j = 1; j <= M; j++){
			E[i][j] = E[i][j] + (dt/dx)*(Fx[i-1][j] - Fx[i][j]) + (dt/dy)*(Fy[i][j-1] - Fy[i][j]);
			// Ei + dt/dx(sum fluxes)
		}
	}
}
