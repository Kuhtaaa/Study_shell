#!/bin/bash

divider=$((1024*1024))

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

