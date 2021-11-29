#!/usr/bin/env bash
#Author: syc
#Date: 2020-08-15 22:31:39
#Version: 0.2
#Description: test "echo -e" & "\033[front;backm"

function PRINT_X_AXLE() {
  # print first column
  case $1 in
  0)
    echo -ne "  ${Y_AXLE}m \033[;${Y_AXLE}m   gYw  \033[0m"
    ;;
  1)
    echo -ne "1;${Y_AXLE}m \033[;${Y_AXLE};1m   gYw  \033[0m"
    ;;
  f)
    echo -ne "    m \033[;${Y_AXLE}m   gYw  \033[0m"
    ;;
  s)
    echo -ne "   1m \033[;${Y_AXLE}m   gYw  \033[0m"
    ;;
  *)
    echo ''
    ;;
  esac

  # print subscenquent
  for ((X_AXLE = 0; X_AXLE < 8; X_AXLE++)); do
    if [[ $1 == 0 ]]; then
      echo -ne "\033[${Y_AXLE};4${X_AXLE}m  gYw  \033[0m "
    else
      echo -ne "\033[${Y_AXLE};4${X_AXLE};1m  gYw  \033[0m "
    fi
  done
  echo ''
}

echo -e "\t\t40m\t41m\t42m\t43m\t44m\t45m\t46m\t47m"
for ((Y_AXLE = 0; Y_AXLE < 10; Y_AXLE++)); do
  if [[ ${Y_AXLE} == 0 ]]; then
    PRINT_X_AXLE f
  elif [[ ${Y_AXLE} == 1 ]]; then
    PRINT_X_AXLE s
  else
    Y_AXLE=$((${Y_AXLE} + 28))
    PRINT_X_AXLE 0
    PRINT_X_AXLE 1
    Y_AXLE=$((${Y_AXLE} - 28))
  fi
done
