#include <stdio.h>
using namespace std;

const int * M;

int main(){
	int j = 12;
	M = &j;
	const int p = *M;
	printf("%i\n", p);


}
