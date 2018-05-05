TIME
factor  dtout   tend
1.0     0.004       1
SPACE
MM  a   b
100  0    1
MATERIAL
rho     L       Tm      h       Tinf
1       0.2     1       25      0
Cs      Cl      ks      kl
1       1       1      1
INITIAL CONDITIONS
T0      Tl      Tmax    BCType(0=Temp, 1=Flux)  FType(0=Gaussian, 1=Uniform)
0       2       10      0                       0
