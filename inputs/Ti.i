TIME
factor  dtout   tend
1.0     0.0001  1
SPACE
MM  a   b
10000 0   0.04
MATERIAL
rho     L       Tm      h       Tinf
4500    440000  1953    500       298
Cs      Cl      ks      kl
536     592     21      30
INITIAL CONDITIONS
T0      Q0      Tmax    BCType(0=Temp, 1=Flux)  FType(0=Gaussian, 1=Uniform)
298     8000    2200    0                       1
