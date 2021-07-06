#/bin/bash

name=$1
surname=$2
show=$3

if [ "$show" = "true" ];  then 
echo "Hello, $name $surname"

else 
  echo  "if you want to print the name, Then Please choose the show parameter"
fi
