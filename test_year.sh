#!/usr/bin/env bash
#Author: syc
#Date: 2020-08-12 17:42:30
#Version: 0.2
#Description: determine leap year

# get & judge the YEAR
function GET_YEAR() {
  # infrmation & get a input to defined YEAR
  echo -e "Use q | Q | quit | e | E to quit program.\nInput YEAR:"
  read YEAR
  if [[ ${YEAR} =~ q|Q|quit|e|E ]]; then
    exit 0
  elif [[ ${YEAR} -lt 0 ]]; then
    # to get a right YEAR
    echo -e "Give me a right YEAR, pls.\n"
    GET_YEAR
  else
    return ${YEAR}
  fi
}

function DETERM_YEAR() {
  if [[ $((${YEAR} % 100)) == 0 ]]; then
    # for year end with 00
    if [[ $((${YEAR} % 400)) == 0 ]]; then
      echo -e "${YEAR} is\033[32m a leap year\033[0m!\n"
    else
      echo -e "${YEAR} is\033[31m NOT a leap year\033[0m!\n"
    fi
  else
    # normal way to confirm a leap year
    if [[ $((${YEAR} % 4)) == 0 ]]; then
      echo -e "${YEAR} is\033[32m a leap year\033[0m!\n"
    else
      echo -e "${YEAR} is\033[31m NOT a leap year\033[0m!\n"
    fi
  fi
}

TRIGGER=1
while [[ ${TRIGGER} ]]; do
  GET_YEAR
  DETERM_YEAR
  echo -e "\n=========================\n\tIt is the ${TRIGGER}\n=========================\n\n"
  TRIGGER=$(( ${TRIGGER} + 1 ))
done
