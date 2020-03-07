#!/bin/bash

gcc -O2 SumaVectores_local.c -o SumaVectores_local -lrt
gcc -O2 SumaVectores_global.c -o SumaVectores_global -lrt
gcc -O2 SumaVectores_dinamico.c -o SumaVectores_dinamico -lrt
