#!/usr/bin/env bash
#Author: sYc
#Date: 2021-02-10 11:50:00
#Version: 0.1
#Description: 

source render.sh

SWAP=`blkid -t TYPE=swap | awk '{print $2}'`
SWAP_C="UUID=${SWAP:6:0-1}"

msg(){
  echo -e "${F_GREEN}append to ${BRIGHT}${1}${RESET_ALL}"
}

append() {
  cat >> ${1} <<EOF
options resume=${SWAP_C}
options pcie_port_pm=off
EOF
}

for i in `ls /boot/loader/entries/ | grep -E "manjarolinux[0-9\.]+.conf$"`; do
  append /boot/loader/entries/${i}
  msg ${i}
done
