TIME
factor  dtout   tend
1.0       0.004       1
SPACE
MM  a   b
100 0   1.0
MATERIAL
rho     L       Tm      h       Tinf
2702    398     933     5       298
Cs      Cl      ks      kl
.903    1.146   237     218
INITIAL CONDITIONS
T0      Q0      Tmax    BCType(0=Temp, 1=Flux)  FType(0=Gaussian, 1=Uniform)
298     90000    1300    1                       0
