#!/usr/bin/env bash
#Author: sYc
#Date: 2021-03-04 11:19:24
#Version: 0.1
#Description: add bom to csv file gene by R

source ~/.Scripts/render.sh

while true ; do
  echo -e "${BRIGHT}Give Me ${F_RED}${B_YELLOW}FULL PATH ${RESET_ALL}:"
  read FILE

  printf '\xEF\xBB\xBF' > /tmp/test.csv
  cat ${FILE} >> /tmp/test.csv
  mv /tmp/test.csv ${FILE}
done
