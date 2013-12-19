#!/bin/bash

for file in *.bin; 
do 
    echo Convert $file to "${file%.*}" 
    binarylog2text ./$file >> "${file%.*}"; 
    rm $file
done
