#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ ! -d ${TARGET_DIR} ]]; then
    mkdir ${TARGET_DIR}
    echo "stworzylem ${TARGET_DIR}"
fi

ITEMS=$(cat ${RM_LIST})

for FILE in ${ITEMS}; do
#iteracja po pliku rm list
    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        echo "usuwanie ${FILE}"
        rm -rf ${SOURCE_DIR}/${FILE}
    else
        echo "nie znaleziono ${FILE}"
    fi
 
done


