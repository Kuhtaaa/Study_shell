#!/bin/bash

divider=$((1024*1024))

function comparison {
   if [ $# -eq 2 ]; then
      if [[ $1 == *"."* ]]; then
         echo "$2 = 0$temp_result GB"
      else
         echo "$2 = $temp_result GB"
      fi
   else
      echo "wrong arguments"
   fi
}

function space_root {
   if [ $# -eq 2 ]; then
      temp_var=$(echo "scale=2; $1/($divider/1024)" | bc)
      if [[ $temp_var == *"."* && (($temp_var<0))]]; then
         echo "$2 = 0$temp_var MB"
      else
         echo "$2 = $temp_var MB"
      fi
   else
      echo "wrong arguments"
   fi
}

function save_text {
   NAME="$(date +"%d_%m_%Y_%H_%M_%S")"
   touch $NAME.status
   echo $hostname >> $NAME.status
   echo $TIMEZONE >> $NAME.status
   echo $USER >> $NAME.status
   echo $OS >> $NAME.status
   echo $DATE >> $NAME.status
   echo $UPTIME >> $NAME.status
   echo $uptime_sec >> $NAME.status
   echo $IP >> $NAME.status
   echo $MASK >> $NAME.status
   echo $GATEWAY >> $NAME.status
   echo $RAM_TOTAL_PRINT >> $NAME.status
   echo $RAM_USED_PRINT >> $NAME.status
   echo $RAM_FREE_PRINT >> $NAME.status
   echo $SPACE_ROOT >> $NAME.status
   echo $SPACE_ROOT_USED >> $NAME.status
   echo $SPACE_ROOT_FREE >> $NAME.status
}