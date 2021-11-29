#/usr/bin/env bash
#Author: 
#Date: 2020-08-19 08:50:24
#Version: 
#Description: 

for i in `ls -a`; do
  # ??? why -eq is  not ok ???
  if [[ ! ${i} == ".git" ]]; then
    echo ${i}
    # rm -ri "${i}"
  fi
done
