#include <stdio.h>
int g=12;

void parray(const int h, double T[][h+2]){
	printf("%f\n", T[0][g-1]);
	printf("%i\n", g);
}

int main(){
	const int h = g;
	double T[g+2][g+2];

parray( h,T);
}
