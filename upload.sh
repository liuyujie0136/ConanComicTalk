#!/bin/bash

for i in *; do mv $i N$i; done

idx=1; sum=0; for i in N*; do mkdir -p $idx; mv $i $idx; sum=$((sum+1)); if [ $sum -gt 19 ]; then idx=$((idx+1)); sum=0; fi; done

cat ../tmp_links.txt | while read line; do old="images\\/"${line%,*}; new=${line#*,}; cat 32.html | sed "s/$old/$new/g" > tmp; mv tmp 32.html; done
