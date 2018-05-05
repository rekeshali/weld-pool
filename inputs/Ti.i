TIME
factor  dtout   tend
0.9     0.012   1
SPACE
MM  a   b
100 0   1
MATERIAL
rho     L       Tm      h       Tinf
4500    440000  1953    5       298
Cs      Cl      ks      kl
536     592     21      30
INITIAL CONDITIONS
T0      Q0      Tmax    BCType(0=Temp, 1=Flux)  FType(0=Gaussian, 1=Uniform)
298     2200    2200    0                       1
