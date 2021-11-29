#/usr/bin/env bash
#Author: syc
#Date: 2020-08-15 21:33
#Version: 0.1
#Description: function to create border & print phrase

# get ${COLUMNS} & ${LINES}
# create a child shell
(:)
COL=${COLUMNS}
LIN=${LINES}

# print border part
function BORDER() {
  X=$((${COL} - 2))
  Y=$((${LIN} - 2))
  case $1 in
  h | head)
    echo -n '╔'
    for ((i = 0; i < ${X}; i++)); do
      echo -n '═'
    done
    echo '╗'
    ;;
  b | body)
    # 嵌套结构注意内外循环控制变量命名
    for ((i = 0; i < ${Y}; i++)); do
      echo -n '║'
      for ((j = 0; j < ${X}; j++)); do
        echo -n ' '
      done
      echo '║'
    done
    ;;
  f | foot)
    echo -n '╚'
    for ((i = 0; i < ${X}; i++)); do
      echo -n "═"
    done
    echo -n '╝'
    ;;
  *)
    echo default
    ;;
  esac
}

# print border of screen
function SCREEN() {
  BORDER h
  BORDER b
  BORDER f
}

# print phrase in center of screen
INPUT() {
  STEP_Y=$((${LIN} / 2 + 1))
  STEP_X=$((${COL} - ${#1}))
  STEP_X2=$((${STEP_X} / 2))

  echo -en "\n\033[${STEP_Y}A"
  echo -n '║'
  for ((i = 0; i < ${STEP_X2}; i++)); do
    echo -ne " "
  done
  echo -n "${1}"
}
