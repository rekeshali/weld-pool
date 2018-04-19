//=============== Structures for housing commonly passed variables
// dim holds mesh and temporal
// mat holds material properties
struct dim{ // dimensional
    int M;
    double dt, dx;
} dim;

struct phase{ //phase dependent
    double l, s; // liquid or solid
} C, k; // specific heat and thermal conductivity

struct mat{ // material
    double rho, L, Tm; // density, latent heat, melting temp
    phase C, k; // mat.C.l = material.CapacityOfHeat.Liquid
} mat;

struct ibc{ // initial and boundary conditions
    double T0;
    double Q0;
} ibc;

//============= NOT USED IN FINAL VERSION
