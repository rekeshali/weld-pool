TIME
factor  dtout   tend
1.0     0.001       1
SPACE
MM  a   b
5000  0   0.04
MATERIAL
rho     L       Tm      h       Tinf
7870    272000     1810    500       298
Cs      Cl      ks      kl
.447    .654    80.2    32.1
INITIAL CONDITIONS
T0      Tl      BCType(0=Temp, 1=Flux)  Ftype(0=Gaussian, 1=Uniform)
298     8000    1                       0
