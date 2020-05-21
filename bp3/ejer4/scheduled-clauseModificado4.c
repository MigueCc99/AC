#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num()0
#endif


int main (int argc, char **argv){

    int i,n=200,chunk,a[n],suma=0,modif;
    omp_sched_t tipo;

    if(argc<3){
      fprintf(stderr,"[ERROR]-Falta nº interacciones o chunk\n");
      exit(-1);
    }

    n = atoi(argv[1]);
    if(n>200)n=200;
    chunk=atoi(argv[2]);

    int dyn_var = omp_get_dynamic();
    int nthreads_var = omp_get_max_threads();
    int thread_limit_var = omp_get_thread_limit();
    omp_get_schedule(&tipo,&modif);

    for(i=0;i<n;i++)a[i]=1;

    #pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
      for(i=0;i<n;i++){
        suma = suma+a[i];
        printf("thread %d suma a[%d] suma=%d\n",omp_get_thread_num(),i,suma);
        printf("omp_get_num_threads() =%d\n",omp_get_num_threads());
      }
        printf("Dentro de la región parallel\n");
        printf("omp_get_num_threads()=%d\n",omp_get_num_threads());
        printf("omp_get_num_procs()=%d\n",omp_get_num_procs());
        printf("omp_in_parallel()=%d\n",omp_in_parallel());

printf("\nFuera de la región parallel\n");
printf("omp_get_num_threads()=%d\n",omp_get_num_threads());
printf("omp_get_num_procs()=%d\n",omp_get_num_procs());
printf("omp_in_parallel()=%d\n",omp_in_parallel());

}
