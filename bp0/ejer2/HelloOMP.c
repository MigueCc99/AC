/* Compilar con:
 * gcc -O2 -fopenmp -o HelloOMP HelloOMP.c
 */
 #include <stdio.h>
 #include <omp.h>

int main (void) {
#pragma omp parallel
  printf("(%d:!!!HelloWorld!!!)",omp_get_thread_num());
  return 0;
}
