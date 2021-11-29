#!/usr/bin/env bash
#Author: sYc
#Date: 2021-06-14 16:06:00
#Version: 0.1
#Description: add num to specify duplicated text

# usage:
# commen use:
# input_file must be arranged by line
# file=$PWD/test_input
input_file=$1
output_file=$2

function specify_duplicate() {
  declare -A DICT

  for string in `cat ${input_file} | xargs -d "\t"`; do
    if [[ ! ${!DICT[@]} =~ ${string} ]]; then
      DICT[${string}]=1
    else
      (( DICT[$string]+=1 ))
      string=${string}_${DICT[${string}]}
    fi
    ARRAY=(${ARRAY[@]} ${string})
  done

  for i in ${!ARRAY[@]}; do
    string=${ARRAY[${i}]}
    if [[ ${!DICT[@]} =~ ${string} && ${DICT[${string}]} > 1 ]]; then
      ARRAY[${i}]=${ARRAY[${i}]}_1
    fi
    echo ${ARRAY[${i}]} >> ${output_file}
  done
}

if [[ -z ${input_file} ]]; then
  echo "GIVE ME A FILE, PLZ!!!"
  exit 1
else
  if [[ -z ${output_file} ]]; then
    echo "TELL ME WHERE TO THROW OUT, PLZ!!!"
  else
    specify_duplicate
  fi
fi
