#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>

struct{
    int a;
    int b;
} s[5000];

int main (int argc, char **argv){
    int ii, i, X1, X2;
    int R[40000];

    struct timespec cgt1, cgt2; double ncgt;

    clock_gettime(CLOCK_REALTIME,&cgt1);

    for(ii=0; ii<40000; ii++){
        X1 = 0;
        X2 = 0;
        for(i=0; i<5000; i+=8){
            X1 += 2*s[i].a+ii;
            X2 += 3*s[i].b-ii;
            X1 += 2*s[i+1].a+ii;
            X2 += 3*s[i+1].b-ii;
            X1 += 2*s[i+2].a+ii;
            X2 += 3*s[i+2].b-ii;
            X1 += 2*s[i+3].a+ii;
            X2 += 3*s[i+3].b-ii;
            X1 += 2*s[i+4].a+ii;
            X2 += 3*s[i+4].b-ii;
            X1 += 2*s[i+5].a+ii;
            X2 += 3*s[i+5].b-ii;
            X1 += 2*s[i+6].a+ii;
            X2 += 3*s[i+6].b-ii;
            X1 += 2*s[i+7].a+ii;
            X2 += 3*s[i+7].b-ii;
        } 

        if(X1<X2) R[ii]=X1;else R[ii]=X2;
    }

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("Tiempo= %11.9f\t R[0] = %i\t R[39999]= %i\n",ncgt,R[0],R[39999]);

    return 0;
}