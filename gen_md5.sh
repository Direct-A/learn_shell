#!/usr/bin/env bash
#Author: sYc
#Date: 2021-04-08 23:08:54
#Version: 0.1
#Description: generate md5 into file

[[ ! -f "md5_new.txt" ]] && touch md5_new.txt

for folder in `ls -l | egrep "^d" | awk '{print $9}'`; do
  for file in `ls ${folder}`; do
    echo -n ${file}; md5sum ${file} >> md5_new.txt
  done
done
