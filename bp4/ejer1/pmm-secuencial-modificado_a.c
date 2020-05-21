#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>  // biblioteca que incluye func. printf()
#include <time.h>   // biblioteca que incluye funcionalidad para controlar tiempo de ejecución

int main (int argc, char *argv[]){
    
    int i,j,k;
    struct timespec cgt1, cgt2; double ncgt; // Tiempo de ejecución

    // Leer argumento de entrada (nº de componentes del vector)
    if (argc < 2){
        printf("Faltan nº componentes del vector \n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N = 2^32-1 = 4294967295 (sizeof(unsigned int) = 4B)

    int **mr, **m1, **m2;
    mr = (int **) malloc(N*sizeof(int *));
    m1 = (int **) malloc(N*sizeof(int *));
    m2 = (int **) malloc(N*sizeof(int *));    

    // Comprobamos que no se haya cometido algún error en la reserva de espacio
    if (mr == NULL || m1 == NULL || m2 == NULL){
        printf("Error en la reserva de espacio para las matrices\n");
        exit(-2);
    }

    for(i=0; i<N; i++){
        mr[i] = (int *) malloc(N*sizeof(int));
        m1[i] = (int *) malloc(N*sizeof(int));
        m2[i] = (int *) malloc(N*sizeof(int));    
    }

    // inicializamos las matrices
    for (i=0; i<N; i++){
        for (j=0; j<N; j++){
            mr[i][j] = 0;
            m1[i][j] = 28+i;
            m2[i][j] = 2+i;
        }
    }

    // tiempo inicial
    clock_gettime(CLOCK_REALTIME,&cgt1); // tiempo ini

    // Calculamos la multiplicación de la matriz por el vector
    for (i=0; i<N; i++){
        for (k=0; k<N; k++){
            for(j=0; j<N; j++){
                mr[i][j] += m1[i][k] * m2[k][j];
            }
        }
    }

    clock_gettime(CLOCK_REALTIME,&cgt2); // tiempo fin

    // Guardamos en la variable ncgt el tiempo que ha tardado en calcular la multiplicación
    ncgt = (double)(cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Visualizamos la primera y la última línea de la matriz mr
    printf("Tamaño= %d\t Tiempo= %11.9f\t Primera línea= %d\t Última línea= %d\n",N,ncgt,mr[0][0],mr[N-1][N-1]);
    
    for (i=0; i<N; i++){
        free(mr[i]);
        free(m1[i]);
        free(m2[i]);
    }

        free(mr);
        free(m1);
        free(m2);

        return 0;
}