void phasefront(double p[], double tn){
	int n;
	double X;

	for(n = 1; n <= M; n++){
		if(p[n] != 0 && p[n] != 1){
			break;
		}
	}

	X = (n-1 + p[n])*dx;


	FILE * OUT;
	if(tn < 0.008){
		OUT = fopen("phase.out", "w");
		fprintf(OUT, "#Time	Phase Front\n");
		fprintf(OUT, "0.00 0.00\n");
	}else{
		OUT = fopen("phase.out", "a");
	}
	fprintf(OUT, "%f %f\n", tn, X);
	fclose(OUT);
}
