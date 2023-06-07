#!/bin/bash

divider=$((1024*1024))

function check_color {
   tmp=${1:0:18}
   echo $tmp
}

function find_color {
   tmp=${1:19}
   if [ "$tmp" = "" ]; then
      tmp="default"
   fi
   echo $tmp
}

function comparison {
   if [ $# -eq 1 ]; then
      if [[ $1 == *"."* ]]; then
         echo "0$temp_result GB"
      else
         echo "$temp_result GB"
      fi
   else
      echo "wrong arguments"
   fi
}

function space_root {
   if [ $# -eq 1 ]; then
      temp_var=$(echo "scale=2; $1/($divider/1024)" | bc)
      if [[ $temp_var == *"."* && (($temp_var<0))]]; then
         echo "0$temp_var MB"
      else
         echo "$temp_var MB"
      fi
   else
      echo "wrong arguments"
   fi
}

function check_dublicate {
   if [[ $1 -eq $2 || $3 -eq $4 ]]; then
      echo -e "Цвета шрифта и фона одного столбца не\nдолжны совпадать, запустите повторно скрипт"
      exit 1
   fi
   
   check_adecvatnost $1
   check_adecvatnost $2
   check_adecvatnost $3
   check_adecvatnost $4
}

function check_adecvatnost {
   if [[ $1 -lt 1 || $1 -gt 6 ]]; then
      echo -e "Нет такого цвета найди другой"
      exit 1
   fi
}

function check_default {
if [[ $1 -eq "default" && $2 -ne "default" ]]; then
  if [[ $2 -eq "4" ]]; then
    echo 2
  else
    echo 4
  fi
elif [[ $1 -eq "default" && $2 -eq "default" ]]; then
  echo 2
else
   echo $1
fi
}

function set_color {
   if [[ $2 -eq "1" ]]; then
      case "$1" in
      [1]   ) echo "37";;
      [2]   ) echo "31";;
      [3]   ) echo "32";;
      [4]   ) echo "36";;
      [5]   ) echo "35";;
      [6]   ) echo "30";;
      esac
   else
      case "$1" in
      [1]   ) echo "47";;
      [2]   ) echo "41";;
      [3]   ) echo "42";;
      [4]   ) echo "46";;
      [5]   ) echo "45";;
      [6]   ) echo "40";;
      esac
   fi
}

function print_color_setting {
   if [ "${1:8:1}" = "b" ]; then
      tmp="background"
   else
      tmp="font color"
   fi
   echo "C${1:1:5} ${1:6:1} $tmp = $2 "
}

function check_color_setting {
   case "$1" in
   [1]   ) echo "(white)";;
   [2]   ) echo "(red)";;
   [3]   ) echo "(green)";;
   [4]   ) echo "(blue)";;
   [5]   ) echo "(purple)";;
   [6]   ) echo "(black)";;
   esac
}
