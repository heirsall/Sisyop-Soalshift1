#!/bin/bash
unzip /home/zahrul/praktikum1/nature.zip -d /home/zahrul/praktikum1/
mkdir /home/zahrul/praktikum1/nature/hasil
iter = 0

for gambar in /home/zahrul/praktikum1/nature/*.jpg

do 

base64 -d $gambar | xxd -r > /home/zahrul/praktikum1/nature/hasil/$iter.jpg

iter=$((iter+1))

done
