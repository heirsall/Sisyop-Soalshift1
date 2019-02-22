
#!/bin/bash

a=1
iter=1

while [ $a -ne 0 ]
do

if [[ -f /home/zahrul/praktikum1/password$iter.txt ]] ; then

    iter=$((iter + 1))

else
 cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/zahrul/praktikum1/password$iter.txt
a=0

fi



done

echo $password
