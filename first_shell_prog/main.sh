#/usr/bin/env bash
#Author: syc
#Date: 2020-08-19 09:29:53
#Version: 0.1
#Description: main program, to print phrase with border

# import functions
# to run by ./main.sh, "./" should be added to source
source ./screen_border.sh

clear
SCREEN
sleep 3
clear

SCREEN
INPUT "what's your name: "
read USER_NAME
clear

SCREEN
INPUT "HELLO! ${USER_NAME}"
sleep 5
clear

exit 0
