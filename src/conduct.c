//=================================== Compute conductivities
#include "global.h"
double conduct(double p){
    // check liquid fraction of node
    if(p == 0){
        return ks;
    }else if(p == 1){
        return kl;
    }else{
        double kinv =  p/kl + (1-p)/ks; // mushy
        return 1/kinv;
    }
}
