#!/bin/bash

#echo "jestem"

DIRECTORY=${1:-kataloczek} 
#pobierz 1wszy parametr
FILE=${2}

rm -rf ${DIRECTORY}
mkdir ${DIRECTORY}

ITEMS=$(cat ${FILE})

echo "${ITEMS}"
COUNTER=0

set -x
for ITEM in ${ITEMS}; do

    if [[ $((COUNTER % 2)) -eq 0 ]]; then
        echo "Creating ${ITEM} as file"
        touch ${DIRECTORY}/${ITEM}
    else
        echo "Creating ${ITEM} as directory"
        mkdir ${DIRECTORY}/${ITEM}
    fi
    COUNTER=$((COUNTER+1))

   

done
