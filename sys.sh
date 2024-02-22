#!/bin/sh

tstamp=`date +%s`
cpu=`grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}'`
mem=$((100 - (`grep 'MemFree' /proc/meminfo | awk '{print $2}'`/ (`grep 'MemAvailable' /proc/meminfo | awk '{print $2}'`/100))))
swap=$((100 - (`grep 'SwapFree' /proc/meminfo | awk '{print $2}'`/ (`grep 'SwapTotal' /proc/meminfo | awk '{print $2}'`/100))))

#echo "timestamp ; cpu usage % ; memory usage % ; swap usage %"
echo "$tstamp;$cpu;$mem;$swap"

