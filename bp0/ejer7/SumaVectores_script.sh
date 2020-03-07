#!/bin/bash

# autor: Miguel Ángel Campos Cubillas

# Este script se ha creado para ejecutar con los tamaños especificados en el cuadernillo el
# programa de la suma de vectores. Genera un archivo csv (SumaVectores.csv) con los tiempos y el tamaño
# de los vectores.

# Si aparecen campos vacíos en el csv, seguramente sea por un segmentation fault (sobre todo en vectores locales),
# Para comprobar que sea el caso, ejecutadlo por separado

if (( $# != 3 )); then
	echo "Uso: ./SumaVectores_script.sh SumaVectores_local SumaVectores_global SumaVectores_dinamico"
	exit 1
fi

first_pow=16
last_pow=26

echo "Tamaño del vector, bytes, tiempo_local, tiempo_global, tiempo_dinamico" > SumaVectores.csv

for ((index=first_pow;index<=last_pow;index++)) ; do
	tam=$((2**$index))
	echo "Tamaño: $tam"

	echo -n "$tam, $(( tam * 4 )), " | tee -a SumaVectores.csv
	./$1 $tam | tr -d '\n' | sed -E "s/.*Tiempo:([^\s\t]*).*/\1/g" | tee -a SumaVectores.csv
	echo -n ',' | tee -a SumaVectores.csv
	./$2 $tam | tr -d '\n' | sed -E "s/.*Tiempo:([^\s\t]*).*/\1/g" | tee -a SumaVectores.csv
	echo -n ',' | tee -a SumaVectores.csv
	./$3 $tam | tr -d '\n' | sed -E "s/.*Tiempo:([^\s\t]*).*/\1/g" | tee -a SumaVectores.csv
	echo ',' | tee -a SumaVectores.csv
done
