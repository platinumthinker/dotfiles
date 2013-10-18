#!/bin/bash

if [ $"$1" == "on" ];
then modprobe r8169;
else modprobe -r r8169;
fi
