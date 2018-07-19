#!/bin/bash

cowsay -f tux UPLOAD UR TITLE
echo ''

echo 'Cut title part , start from current repository'
echo ''

echo "What the Part you want Kut ?"
echo ''

read Kut

find . | grep $Kut > ghost1.i
cat ghost1.i > ghost2.i
sed -i "s/$Kut//g" ghost2.i
clear

reNameFile ()
{
  i=1
  lineNb=$(wc -l ghost1.i | cut -d ' ' -f1)

  clear


  while ((i <= lineNb))
  do
    src=$(sed -n "$i p" ghost1.i)
    new=$(sed -n "$i p" ghost2.i)

    mv $src $new
    echo $new "writed !"

    ((i+=1))
  done

  sleep 1
  rm ghost*
  echo '-----------' $i " file(s) renamed -----------"
}

reNameFile