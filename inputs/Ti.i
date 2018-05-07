TIME
factor  dtout   tend
1.0     0.0001  10
SPACE
MM  a   b
5000 0   0.04
MATERIAL
rho     L       Tm      h       Tinf
4500    440000  1953    500       298
Cs      Cl      ks      kl
536     592     21      30
INITIAL CONDITIONS
T0      Q0      BCType(0=Temp, 1=Flux)  FType(0=Gaussian, 1=Uniform)
298     8000    1                       0
