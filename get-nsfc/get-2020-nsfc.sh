#!/usr/bin/env bash
#Author: sYc
#Date: 2021-02-04 12:48:06
#Version: 0.1
#Description: use nsfc.py to get 2020 nsfc
#Dependence: 
#            pip install nsfc
#            yay -S tesseract tesseract-data

# HOWTO
# nsfc search [-cytoO]
# nsfc search -c 指定申请代码
# nsfc search -y 指定批准年度
# nsfc search -t 指定项目类型
# nsfc search -o 指定输出名
# nsfc search -O 指定输出类型

# 1 运行时选择申请代码和批准年度
# - nsfc search

# 2 指定申请代码和批准年度，多个值之间可用逗号分隔
# - nsfc search -c C05,C06 -y 2018,2019,2020

# 3 指定查询类型(Z: 资助项目[默认]，J: 结题项目)
# - nsfc search -c C05,C06 -y 2018,2019,2020 -t J

# 4 指定输出文件和格式(html, xlsx, txt/tsv, json, jl, pkl)
# - nsfc search -c C05 -y 2019 -o out [默认 -O xlsx]
# - nsfc search -c C05 -y 2019 -o out -O html
# - nsfc search -c C05 -y 2019 -o out -O tsv
# - nsfc search -c C05 -y 2019 -o out -O json
# - nsfc search -c C05 -y 2019 -o out -O jl

H_PART=(H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31)
B_PART=(C01 C05 C06 C07 C08 C09 C10 C11 C12 C21)

H_CODE=`printf ${H_PART[0]}; printf ',%s' ${H_PART[@]:1}`
B_CODE=`printf ${B_PART[0]}; printf ',%s' ${B_PART[@]:1}`

echo $H_CODE
echo $B_CODE

echo "Which YEAR ?"
read YEAR

$(nsfc search -c ${H_CODE} -y ${YEAR} -t Z -o h-part -O xlsx)
$(nsfc search -c ${B_CODE} -y ${YEAR} -t Z -o b-part -O xlsx)
