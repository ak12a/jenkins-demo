#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do 
 let counter=counter+1

name=$(nl people.txt | grep -w $counter | awk '{print $2}')
lastname=$(nl people.txt | grep -w $counter | awk '{print $3}') 
age=$(shuf -i 20-50 -n 1)
#echo " Name with person id  $counter is $name $lastname"
mysql -u root -predhat people -e "insert into users values  ($counter, '$name', '$lastname', $age);"

echo "$counter, $name, $lastname, $age was imported successfully"
done
