#!/bin/bash

clear
regex='^[0-9]+$'
cowsay -f tux Make Mass Files
echo ''

echo 'Make mass files for test RenameMassTitles.bash '
echo ''

echo "How many files you want make ? "
echo ''
read Nb
echo ''

if ! [[ $Nb =~ $regex ]] ; then
   echo "error: Need a number" >&2; exit 1
fi

echo "What title of files ? "
echo " 'Exemple' = Exemple1 , Exemple2 ... Exemple$Nb"
read Title
echo ''

echo ''
echo "what extension of files ? (without '.') "
echo "'test' = $Title1.test , $Title2.test , $Title3.test ..."
read Extension
echo ''

clear

i=1

while ((i <= Nb))
  do
        touch "$Title$i.$Extension"
        echo "$Title$i.$Extension Created !"
        ((i+=1))
  done

echo "$Nb files created"