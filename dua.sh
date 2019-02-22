#!/bin/bash

echo "---(A)---"
#(a)
awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

echo "---(B)---"
#(b)
awk -F ',' '{if($7 == '2012' && $1 == "United States") p[$4]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'

echo "---(C)---"
#(c)

echo "Outdoor Protection"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$$
echo "Camping Equipment"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3$
echo "Personal Accessories"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") p[$6]+=$10} END {for(hasil in c) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2$
