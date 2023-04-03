#!/bin/bash -eu

SOURCE=${1}
LINKS=${2}

#1. sprawdz czy podano parametry 

if [[ $# -eq 0 ]] ; then
    echo "Nie podano parametow"
    exit 1
fi

#2. sprawdz czy katalogi istnieja
if [[ ! -d ${SOURCE} ]] ; then
    echo "Nie istnieje katalog ${SOURCE}"
    exit 2
fi
if [[ ! -d ${LINKS} ]] ; then
    echo "Nie istnieje katalog ${LINKS}"
    exit 2
fi


#3. wypisz pliki z 1
#wczytaj zawartosc katalogu do listy
ITEMS=$(echo $(ls ${SOURCE}))

for FILE in ${ITEMS}; do
#iteracja po plikach w source
    echo -n "${SOURCE}/${FILE}"
    if [[ -L ${SOURCE}/${FILE} ]] ; then
        echo " to dowiazanie symboliczne"
       
    else
        if [[ -d ${SOURCE}/${FILE} ]] ; then
            echo " to katalog"

        elif [[ -f ${SOURCE}/${FILE} ]] ; then
            echo " to plik regularny"
        fi
#4. utworz dowiazania symboliczne
        TEMP=${FILE##*.}
        LINK=${FILE%%.*}_LN.${TEMP}
        ln -s ../${SOURCE}/${FILE} ${LINKS}/${LINK}
    fi

done



