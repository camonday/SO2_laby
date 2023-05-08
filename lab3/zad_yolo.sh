#!/bin/bash -eu

# wszyscy, ktorych id jest liczba nieparzysta
#cut -d, -f1 yolo.csv | grep -n '^[0-9]*[13579]$' | cut -d: -f1 | xargs -I{} sed '{}q;d' yolo.csv 1>&2

# kazdy numer ip, ktory w pierwszym i drugim oktecie ma tylko jedna cyfre
cut -d, -f6 yolo.csv | grep -E '^[0-9]\.[0-9]\.' 1>&2
