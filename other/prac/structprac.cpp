#include <iostream>
using namespace std;

struct dim{
    int k;
    int j;
}dim;

struct mat{
    double rho;
    int M;
}mat;

double mesh;


double *r = &mat.rho;
int *k = &dim.k;

void prinny(){
    int * M ;
      M  = &mat.M;
      mat.M = 122;
      dim.k = 34;

    cout << mat.rho <<endl;
    cout << *M << endl;
    cout << &r << endl;
    cout << r << endl;
    cout << *r << endl;
    cout << dim.j << endl;
    cout << *k << endl;
    cout << mesh << endl;

}

int main(){
  //  mat mat;

    mat.rho = 23;
    mat.M = 5;
    dim.k = 12;
    dim.j = 100;
    mesh = 1333;
    prinny();
    mesh = 1222;
    prinny();

  return 0;
}
