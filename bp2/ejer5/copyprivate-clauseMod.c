#include <stdio.h>
#include <omp.h>

int main() {
    int n = 9, i, b[n];
    
    for (i=0; i<n; i++) 
        b[i] = -1;

    #pragma omp parallel
    { 
        int a;
        
        #pragma omp single //copyprivate(a)
        {
            printf("\nIntroduce valor de inicializaciÃŗn a: ");
            scanf("%d", &a );
            printf("\nSingle ejecutada por el thread %d\n", omp_get_thread_num());
        }

        #pragma omp for
            for (i=0; i<n; i++)
                b[i] = a;
    }

    printf("DepuÃŠs de la regiÃŗn parallel:\n");

    for (i=0; i<n; i++) 
        printf("b[%d] = %d\t",i,b[i]);

    printf("\n");
}
