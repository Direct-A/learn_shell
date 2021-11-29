#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author: sYc
# Date: 2021-06-15 22:33:09
# Version: 0.1
# Description: add num at end to specify duplicate

inputFilePath = "test_input"
outputFilePath = "test_output"
dict = {}
array = []

with open(inputFilePath, "r") as file:
    for line in file:
        line = str(line).strip("\n")
        if line not in dict.keys():
            dict[line] = 1
        else:
            dict[line] += 1
            sufix = str(dict[line])
            line = line + "_" + sufix
        array.append(line)

    for counter in range(len(array)):
        item = array[counter]
        if item in dict.keys() and dict[item] > 1:
            array[counter] = str(item) + "_1"

    with open(outputFilePath, "a+") as out:
        for item in array:
            out.write(str(item) + "\n")
