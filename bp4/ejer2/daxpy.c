#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>

int main (int argc, char **argv){

    struct timespec cgt1, cgt2; double ncgt;

    if(argc < 3){
        printf("Faltan nº componentes del vector y la constante\n");
        exit(-1);
    }
    
    unsigned n = atoi(argv[1]);
    int a = atoi(argv[2]);

    double *x, *y;
    x = (double*)malloc(n*sizeof(double));
    y = (double*)malloc(n*sizeof(double));

    for(int i=0; i<n; i++){
        x[i] = i + 9;
        y[i] = i + 2;
    }

    clock_gettime(CLOCK_REALTIME,&cgt1);

    for(int i=0; i<n; i++)
        y[i] += a*x[i];

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("Tamaño= %d\t Tiempo= %11.9f\t y[0]= %f\t y[%d]= %f\n",n,ncgt,y[0],n-1,y[n-1]);

    free(x);
    free(y);
    return 0;
}