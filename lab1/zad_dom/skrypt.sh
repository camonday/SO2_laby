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

#wczytaj zawartosc katalogu do listy
ITEMS=$(echo $(ls ${SOURCE_DIR}))

for FILE in ${ITEMS}; do
#iteracja po pozostalych plikach w source
    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        echo "przenosze ${SOURCE_DIR}/${FILE} do ${TARGET_DIR}"
        mv ${SOURCE_DIR}/${FILE} ${TARGET_DIR}
    elif [[ -d ${SOURCE_DIR}/${FILE} ]]; then
        echo "kopiuje directory ${SOURCE_DIR}/${FILE} wraz z zawartoscia do ${TARGET_DIR}"
        cp -r ${SOURCE_DIR}/${FILE} ${TARGET_DIR}
    fi
done



