#!/bin/bash -eu

# znajdz 10 unikalnych adresow IP
#grep -Eo '[0-9]{1,3}(\.[0-9]{1,3}){3}' access_log | sort -u | head -n 10

# znajdz zapytania ktore maja fraze denied w linku
#grep -E '/[^ ]*denied[^ ]*' access_log

# zapytanie wyslane z konkretnego adresu ip
#grep -E '64.242.88.10 ' access_log

# zapytania typu delete
grep -E 'DELETE' access_log | sort -u
