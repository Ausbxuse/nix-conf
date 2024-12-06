#!/bin/bash

list=(     )
list1=(    )
list2=(   )
list3=(  )
list4=( )
for bat in /sys/class/power_supply/BAT?
do
	cap=$(cat "$bat"/capacity 2>/dev/null) || break
    status=$(sed "s/[Dd]ischarging/1/;s/[Nn]ot charging/2/;s/[Cc]harging/3/;s/[Uu]nknown/4/;s/[Ff]ull/5/" "$bat"/status)
    [ $status == "3" ] && [ $cap -gt -1 ] && [ $cap -lt 20 ] && a=$(( $(date +%s)%6 )) && echo ${list[$a]}
    [ $status == "3" ] && [ $cap -gt 20 ] && [ $cap -lt 40 ] && a=$(( $(date +%s)%5 )) && echo ${list1[$a]}
    [ $status == "3" ] && [ $cap -gt 40 ] && [ $cap -lt 60 ] && a=$(( $(date +%s)%4 )) && echo ${list2[$a]}
    [ $status == "3" ] && [ $cap -gt 60 ] && [ $cap -lt 80 ] && a=$(( $(date +%s)%3 )) && echo ${list3[$a]}
    [ $status == "3" ] && [ $cap -gt 80 ] && [ $cap -lt 100 ] && a=$(( $(date +%s)%2 )) && echo ${list4[$a]}
    [ $status == "3" ] && [ $cap -gt 100 ] && echo ${list[5]}
done
