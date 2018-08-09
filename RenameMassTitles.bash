#!/bin/bash

clear
regex='^[0-9]+$'
cowsay -f tux UPLOAD UR TITLE
echo ''

echo ' Cut title part , start from current repository'
echo ''

echo " What the Part you want Kut ?"
echo ''

# Ask and Stock part to $Kut
read Kut
touch ghostPremier.i ghostTampon.i
clear

# Looking for matched files & make list of files
find . | grep -F "$Kut" > ghostPremier.i

cat ghostPremier.i > ghostTampon.i

# Kut title's part
if [[ $Kut =~ $regex ]] ; then
  sed -i "s/$Kut//g" ghostTampon.i
else
  sed -i "s/\\$Kut//g" ghostTampon.i
fi

sleep 1

# Function for rename files from list
reNameFile ()
{
  i=1
  lineNb=$(wc -l ghostPremier.i | cut -d ' ' -f1)

  while ((i <= lineNb))
    do
      src=$(sed -n "$i p" ghostPremier.i)
      new=$(sed -n "$i p" ghostTampon.i)

      mv "$src" "$new"
      echo $src "Renamed to" $new
      echo "_________________________________"

      ((i+=1))
    done

  # clear
  rm ghost*

  echo "___________________________________________"
  echo "-----------" $i " file(s) renamed -----------"
  echo "___________________________________________"
}

reNameFile